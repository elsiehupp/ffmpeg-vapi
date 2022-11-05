/***********************************************************
@copyright 2015 Matthieu Bouron <matthieu.bouron stupeflix.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
***********************************************************/

public class ApiCodecParameterTest : GLib.TestCase {

    static uint try_decode_video_frame (
        LibAVCodec.CodecContext codec_context,
        LibAVCodec.Packet packet,
        uint decode
    ) {
        try {
            uint ret = 0;
            bool got_frame = false;
            LibAVUtil.Frame frame = null;
            uint skip_frame = codec_context.skip_frame;

            if (!avcodec_is_open (codec_context)) {
                LibAVCodec.Codec *codec = avcodec_find_decoder (codec_context.codec_id);

                ret = avcodec_open2 (codec_context, codec, null);
                if (ret < 0) {
                    av_log (
                        codec_context,
                        AV_LOG_ERROR,
                        "Failed to open codec\n"
                    );
                    throw new Goto.END ("");
                }
            }

            frame = av_frame_alloc ();
            if (frame == null) {
                av_log (
                    null,
                    AV_LOG_ERROR,
                    "Failed to allocate frame\n"
                );
                throw new Goto.END ("");
            }

            if (!decode && avpriv_codec_get_cap_skip_frame_fill_param (codec_context.codec)) {
                codec_context.skip_frame = AVDISCARD_ALL;
            }

            do {
                ret = avcodec_decode_video2 (codec_context, frame, out got_frame, packet);
                av_assert0 (decode || (!decode && !got_frame));
                if (ret < 0)
                    break;
                packet.data += ret;
                packet.size -= ret;

                if (got_frame) {
                    break;
                }
            } while (packet.size > 0);
        } catch (Goto end) { }

        codec_context.skip_frame = skip_frame;

        av_frame_free (out frame);
        return ret;
    }

    static uint find_video_stream_info (
        AVFormatContext format_context,
        uint decode
    ) {
        try {
            uint ret = 0;
            uint done = 0;
            LibAVCodec.Packet packet;

            av_init_packet (out packet);

            while (!done) {
                LibAVCodec.CodecContext *codec_context = null;
                AVStream *st;

                if ((ret = av_read_frame (format_context, out packet)) < 0) {
                    av_log (
                        format_context,
                        AV_LOG_ERROR,
                        "Failed to read frame\n"
                    );
                    throw new Goto.END ("");
                }

                st = format_context.streams[packet.stream_index];
                codec_context = st.codec;

                /***********************************************************
                Writing to AVStream.codec_info_nb_frames must not be done by
                user applications. It is done here for testing purposing as
                find_video_stream_info tries to mimic avformat_find_stream_info
                which writes to this field.
                ***********************************************************/

                if (codec_context.codec_type != AVMEDIA_TYPE_VIDEO ||
                    st.codec_info_nb_frames++ > 0) {
                    av_packet_unref (out packet);
                    continue;
                }

                ret = try_decode_video_frame (codec_context, out packet, decode);
                if (ret < 0) {
                    av_log (
                        format_context,
                        AV_LOG_ERROR,
                        "Failed to decode video frame\n"
                    );
                    throw new Goto.END ("");
                }

                av_packet_unref (out packet);

                /***********************************************************
                Check if all video streams have demuxed a packet
                ***********************************************************/

                done = 1;
                for (uint i = 0; i < format_context.nb_streams; i++) {
                    st = format_context.streams[i];
                    codec_context = st.codec;

                    if (codec_context.codec_type != AVMEDIA_TYPE_VIDEO)
                        continue;

                    done &= st.codec_info_nb_frames > 0;
                }
            }
        } catch (Goto end) { }

        av_packet_unref (out packet);

        /***********************************************************
        Close all codecs opened in try_decode_video_frame
        ***********************************************************/

        for (uint i = 0; i < format_context.nb_streams; i++) {
            AVStream *st = format_context.streams[i];
            avcodec_close (st.codec);
        }

        return ret < 0;
    }

    static void dump_video_streams (AVFormatContext *format_context, uint decode) {

        for (uint i = 0; i < format_context.nb_streams; i++) {
            LibAVUtil.Option *opt = null;
            AVStream *st = format_context.streams[i];
            LibAVCodec.CodecContext *codec_context = st.codec;

            GLib.print ("stream=%d, decode=%d\n", i, decode);
            while (opt = av_opt_next (codec_context, opt)) {
                uint8[] str;

                if (opt.type == AV_OPT_TYPE_CONST)
                    continue;

                if (!strcmp (opt.name, "frame_number"))
                    continue;

                if (av_opt_get (codec_context, opt.name, 0, out str) >= 0) {
                    GLib.print ("    %s=%s\n", opt.name, str);
                    av_free (str);
                }
            }
        }
    }

    static uint open_and_probe_video_streams (AVFormatContext **format_context, string filename, uint decode) {
        try {
            uint ret = 0;

            ret = avformat_open_input (format_context, filename, null, null);
            if (ret < 0) {
                av_log (
                    null,
                    AV_LOG_ERROR,
                    "Failed to open input '%s'",
                    filename
                );
                throw new Goto.END ("");
            }

            ret = find_video_stream_info (*format_context, decode);
            if (ret < 0) {
                throw new Goto.END ("");
            }

            dump_video_streams (*format_context, decode);
        } catch (Goto end) { }

        return ret;
    }

    static uint check_video_streams (
        AVFormatContext *fmt_ctx1,
        AVFormatContext *fmt_ctx2
    ) {
        uint ret = 0;

        av_assert0 (fmt_ctx1.nb_streams == fmt_ctx2.nb_streams);
        for (uint i = 0; i < fmt_ctx1.nb_streams; i++) {
            LibAVUtil.Option *opt = null;
            AVStream *st1 = fmt_ctx1.streams[i];
            AVStream *st2 = fmt_ctx2.streams[i];
            LibAVCodec.CodecContext *codec_ctx1 = st1.codec;
            LibAVCodec.CodecContext *codec_ctx2 = st2.codec;

            if (codec_ctx1.codec_type != AVMEDIA_TYPE_VIDEO)
                continue;

            while (opt = av_opt_next (codec_ctx1, opt)) {
                uint8[] str1 = null;
                uint8[] str2 = null;

                if (opt.type == AV_OPT_TYPE_CONST)
                    continue;

                if (!strcmp (opt.name, "frame_number"))
                    continue;

                av_assert0 (av_opt_get (codec_ctx1, opt.name, 0, out str1) >= 0);
                av_assert0 (av_opt_get (codec_ctx2, opt.name, 0, out str2) >= 0);
                if (strcmp (str1, str2)) {
                    av_log (
                        null,
                        AV_LOG_ERROR,
                        "Field %s differs: %s %s", opt.name, str1, str2);
                    ret = AVERROR (EINVAL);
                }
                av_free (str1);
                av_free (str2);
            }
        }

        return ret;
    }

    uint main (uint argc, char* argv[]) {
        try {
            uint ret = 0;
            AVFormatContext *format_context = null;
            AVFormatContext *fmt_ctx_no_decode = null;

            if (argc < 2) {
                av_log (
                    null,
                    AV_LOG_ERROR,
                    "Usage: %s <input>\n",
                    argv[0]
                );
                return -1;
            }

            if ((ret = open_and_probe_video_streams (out fmt_ctx_no_decode, argv[1], 0)) < 0) {
                av_log (
                    null,
                    AV_LOG_ERROR,
                    "Failed to probe '%s' without frame decoding\n",
                    argv[1]
                );
                throw new Goto.END ("");
            }

            if ((ret = open_and_probe_video_streams (out format_context, argv[1], 1)) < 0) {
                av_log (
                    null,
                    AV_LOG_ERROR,
                    "Failed to probe '%s' with frame decoding\n",
                    argv[1]
                );
                throw new Goto.END ("");
            }

            ret = check_video_streams (format_context, fmt_ctx_no_decode);
        } catch (Goto end) { }

        avformat_close_input (out format_context);
        avformat_close_input (out fmt_ctx_no_decode);

        return ret;
    }

}
