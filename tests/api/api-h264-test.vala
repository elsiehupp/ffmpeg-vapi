/***********************************************************
@copyright 2015 Ludmila Glinskih

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


/***********************************************************
H264 codec test.
***********************************************************/


static uint video_decode_example (string input_filename) {
    AVCodec *codec = null;
    AVCodecContext *ctx= null;
    AVCodecParameters *origin_par = null;
    AVFrame *fr = null;
    uint8[] byte_buffer = null;
    AVPacket pkt;
    AVFormatContext *fmt_ctx = null;
    uint number_of_written_bytes;
    uint video_stream;
    uint got_frame = 0;
    uint byte_buffer_size;
    uint result;
    uint end_of_stream = 0;

    result = avformat_open_input (out fmt_ctx, input_filename, null, null);
    if (result < 0) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't open file\n"
        );
        return result;
    }

    result = avformat_find_stream_info (fmt_ctx, null);
    if (result < 0) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't get stream info\n"
        );
        return result;
    }

    video_stream = av_find_best_stream (
        fmt_ctx,
        AVMEDIA_TYPE_VIDEO,
        -1,
        -1,
        null,
        0
    );
    if (video_stream < 0) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't find video stream in input file\n"
        );
        return -1;
    }

    origin_par = fmt_ctx.streams[video_stream].codecpar;

    codec = avcodec_find_decoder (origin_par.codec_id);
    if (!codec) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't find decoder\n"
        );
        return -1;
    }

    ctx = avcodec_alloc_context3 (codec);
    if (!ctx) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't allocate decoder context\n"
        );
        return AVERROR (ENOMEM);
    }

    result = avcodec_parameters_to_context (ctx, origin_par);
    if (result) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't copy decoder context\n"
        );
        return result;
    }

    result = avcodec_open2 (ctx, codec, null);
    if (result < 0) {
        av_log (
            ctx,
            AV_LOG_ERROR,
            "Can't open decoder\n"
        );
        return result;
    }

    fr = av_frame_alloc ();
    if (!fr) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't allocate frame\n"
        );
        return AVERROR (ENOMEM);
    }

    byte_buffer_size = av_image_get_buffer_size (ctx.pix_fmt, ctx.width, ctx.height, 16);
    byte_buffer = av_malloc (byte_buffer_size);
    if (!byte_buffer) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't allocate buffer\n"
        );
        return AVERROR (ENOMEM);
    }

    GLib.print ("#tb %d: %d/%d\n", video_stream, fmt_ctx.streams[video_stream].time_base.num, fmt_ctx.streams[video_stream].time_base.den);
    i = 0;
    av_init_packet (out pkt);
    do {
        if (!end_of_stream)
            if (av_read_frame (fmt_ctx, out pkt) < 0)
                end_of_stream = 1;
        if (end_of_stream) {
            pkt.data = null;
            pkt.size = 0;
        }
        if (pkt.stream_index == video_stream || end_of_stream) {
            got_frame = 0;
            if (pkt.pts == AV_NOPTS_VALUE)
                pkt.pts = pkt.dts = i;
            result = avcodec_decode_video2 (ctx, fr, out got_frame, out pkt);
            if (result < 0) {
                av_log (
                    null,
                    AV_LOG_ERROR,
                    "Error decoding frame\n"
                );
                return result;
            }
            if (got_frame) {
                number_of_written_bytes = av_image_copy_to_buffer (byte_buffer, byte_buffer_size,
                                        (uint8[])fr.data, (uint[]) fr.linesize,
                                        ctx.pix_fmt, ctx.width, ctx.height, 1);
                if (number_of_written_bytes < 0) {
                    av_log (
                        null,
                        AV_LOG_ERROR,
                        "Can't copy image to buffer\n"
                    );
                    return number_of_written_bytes;
                }
                GLib.print ("%d, %s, %s, %8ll, %8d, 0x%08lx\n", video_stream,
                       av_ts2str (fr.pts), av_ts2str (fr.pkt_dts), fr.pkt_duration,
                       number_of_written_bytes, av_adler32_update (0, (uint8[])byte_buffer, number_of_written_bytes));
            }
            av_packet_unref (out pkt);
            av_init_packet (out pkt);
        }
        i++;
    } while (!end_of_stream || got_frame);

    av_packet_unref (out pkt);
    av_frame_free (out fr);
    avcodec_close (ctx);
    avformat_close_input (out fmt_ctx);
    avcodec_free_context (out ctx);
    av_freep (out byte_buffer);
    return 0;
}

uint main (
    uint argc,
    string[] argv
) {
    if (argc < 2) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Incorrect input\n"
        );
        return 1;
    }

    if (video_decode_example (argv[1]) != 0)
        return 1;

    return 0;
}
