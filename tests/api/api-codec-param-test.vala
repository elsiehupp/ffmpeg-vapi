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


static uint try_decode_video_frame (
    AVCodecContext *codec_ctx,
    AVPacket *pkt,
    uint decode
) {
    try {
        uint ret = 0;
        uint got_frame = 0;
        AVFrame *frame = null;
        uint skip_frame = codec_ctx.skip_frame;

        if (!avcodec_is_open (codec_ctx)) {
            AVCodec *codec = avcodec_find_decoder (codec_ctx.codec_id);

            ret = avcodec_open2 (codec_ctx, codec, null);
            if (ret < 0) {
                av_log (
                    codec_ctx,
                    AV_LOG_ERROR,
                    "Failed to open codec\n"
                );
                throw new Goto.END ("");
            }
        }

        frame = av_frame_alloc ();
        if (!frame) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Failed to allocate frame\n"
            );
            throw new Goto.END ("");
        }

        if (!decode && avpriv_codec_get_cap_skip_frame_fill_param (codec_ctx.codec)) {
            codec_ctx.skip_frame = AVDISCARD_ALL;
        }

        do {
            ret = avcodec_decode_video2 (codec_ctx, frame, out got_frame, pkt);
            av_assert0 (decode || (!decode && !got_frame));
            if (ret < 0)
                break;
            pkt.data += ret;
            pkt.size -= ret;

            if (got_frame) {
                break;
            }
        } while (pkt.size > 0);
    } catch (Goto end) { }

    codec_ctx.skip_frame = skip_frame;

    av_frame_free (out frame);
    return ret;
}

static uint find_video_stream_info (
    AVFormatContext *fmt_ctx,
    uint decode
) {
    try {
        uint ret = 0;
        uint done = 0;
        AVPacket pkt;

        av_init_packet (out pkt);

        while (!done) {
            AVCodecContext *codec_ctx = null;
            AVStream *st;

            if ((ret = av_read_frame (fmt_ctx, out pkt)) < 0) {
                av_log (
                    fmt_ctx,
                    AV_LOG_ERROR,
                    "Failed to read frame\n"
                );
                throw new Goto.END ("");
            }

            st = fmt_ctx.streams[pkt.stream_index];
            codec_ctx = st.codec;

            /***********************************************************
            Writing to AVStream.codec_info_nb_frames must not be done by
            user applications. It is done here for testing purposing as
            find_video_stream_info tries to mimic avformat_find_stream_info
            which writes to this field.
            ***********************************************************/

            if (codec_ctx.codec_type != AVMEDIA_TYPE_VIDEO ||
                st.codec_info_nb_frames++ > 0) {
                av_packet_unref (out pkt);
                continue;
            }

            ret = try_decode_video_frame (codec_ctx, out pkt, decode);
            if (ret < 0) {
                av_log (
                    fmt_ctx,
                    AV_LOG_ERROR,
                    "Failed to decode video frame\n"
                );
                throw new Goto.END ("");
            }

            av_packet_unref (out pkt);

            /***********************************************************
            Check if all video streams have demuxed a packet
            ***********************************************************/

            done = 1;
            for (uint i = 0; i < fmt_ctx.nb_streams; i++) {
                st = fmt_ctx.streams[i];
                codec_ctx = st.codec;

                if (codec_ctx.codec_type != AVMEDIA_TYPE_VIDEO)
                    continue;

                done &= st.codec_info_nb_frames > 0;
            }
        }
    } catch (Goto end) { }

    av_packet_unref (out pkt);

    /***********************************************************
    Close all codecs opened in try_decode_video_frame
    ***********************************************************/

    for (uint i = 0; i < fmt_ctx.nb_streams; i++) {
        AVStream *st = fmt_ctx.streams[i];
        avcodec_close (st.codec);
    }

    return ret < 0;
}

static void dump_video_streams (AVFormatContext *fmt_ctx, uint decode) {

    for (uint i = 0; i < fmt_ctx.nb_streams; i++) {
        AVOption *opt = null;
        AVStream *st = fmt_ctx.streams[i];
        AVCodecContext *codec_ctx = st.codec;

        GLib.print ("stream=%d, decode=%d\n", i, decode);
        while (opt = av_opt_next (codec_ctx, opt)) {
            uint8[] str;

            if (opt.type == AV_OPT_TYPE_CONST)
                continue;

            if (!strcmp (opt.name, "frame_number"))
                continue;

            if (av_opt_get (codec_ctx, opt.name, 0, out str) >= 0) {
                GLib.print ("    %s=%s\n", opt.name, str);
                av_free (str);
            }
        }
    }
}

static uint open_and_probe_video_streams (AVFormatContext **fmt_ctx, string filename, uint decode) {
    try {
        uint ret = 0;

        ret = avformat_open_input (fmt_ctx, filename, null, null);
        if (ret < 0) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Failed to open input '%s'",
                filename
            );
            throw new Goto.END ("");
        }

        ret = find_video_stream_info (*fmt_ctx, decode);
        if (ret < 0) {
            throw new Goto.END ("");
        }

        dump_video_streams (*fmt_ctx, decode);
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
        AVOption *opt = null;
        AVStream *st1 = fmt_ctx1.streams[i];
        AVStream *st2 = fmt_ctx2.streams[i];
        AVCodecContext *codec_ctx1 = st1.codec;
        AVCodecContext *codec_ctx2 = st2.codec;

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
        AVFormatContext *fmt_ctx = null;
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

        if ((ret = open_and_probe_video_streams (out fmt_ctx, argv[1], 1)) < 0) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Failed to probe '%s' with frame decoding\n",
                argv[1]
            );
            throw new Goto.END ("");
        }

        ret = check_video_streams (fmt_ctx, fmt_ctx_no_decode);
    } catch (Goto end) { }

    avformat_close_input (out fmt_ctx);
    avformat_close_input (out fmt_ctx_no_decode);

    return ret;
}
