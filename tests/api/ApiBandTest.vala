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

public class ApiBandTest : GLib.TestCase {

    /***********************************************************
    draw_horiz_band test.
    ***********************************************************/

    static uint8 *slice_byte_buffer;
    static uint8 slice_byte_buffer_size;
    static uint draw_horiz_band_called;

    static void draw_horiz_band (
        LibAVCodec.CodecContext codec_context,
        LibAVUtil.Frame frame,
        uint offset[4],
        uint slice_position,
        uint type,
        uint height_2
    ) {
        LibAVUtil.PixelFormatDescriptor pixel_format_descriptor;
        uint chroma_w;
        uint chroma_h;
        uint shift_slice_position;
        uint shift_height;

        draw_horiz_band_called = 1;

        pixel_format_descriptor = av_pix_fmt_desc_get (codec_context.pix_fmt);
        chroma_w = -((-codec_context.width) >> pixel_format_descriptor.log2_chroma_w);
        chroma_h = -((-height_2) >> pixel_format_descriptor.log2_chroma_h);
        shift_slice_position = -((-slice_position) >> pixel_format_descriptor.log2_chroma_h);
        shift_height = -((-codec_context.height) >> pixel_format_descriptor.log2_chroma_h);

        for (uint i = 0; i < height_2; i++) {
            Posix.memcpy (slice_byte_buffer + codec_context.width * slice_position + i * codec_context.width,
                frame.data[0] + offset[0] + i * frame.linesize[0], codec_context.width);
        }
        for (uint i = 0; i < chroma_h; i++) {
            Posix.memcpy (slice_byte_buffer + codec_context.width * codec_context.height + chroma_w * shift_slice_position + i * chroma_w,
                frame.data[1] + offset[1] + i * frame.linesize[1], chroma_w);
        }
        for (uint i = 0; i < chroma_h; i++) {
            Posix.memcpy (slice_byte_buffer + codec_context.width * codec_context.height + chroma_w * shift_height + chroma_w * shift_slice_position + i * chroma_w,
                frame.data[2] + offset[2] + i * frame.linesize[2], chroma_w);
        }
    }

    static uint video_decode (string input_filename) {
        LibAVCodec.Codec codec = null;
        LibAVCodec.CodecContext codec_context= null;
        LibAVCodec.CodecParameters origin_par = null;
        uint8[] byte_buffer = null;
        LibAVUtil.Frame frame = null;
        LibAVCodec.Packet packet;
        AVFormatContext format_context = null;
        uint number_of_written_bytes;
        uint video_stream;
        bool got_frame = false;
        uint byte_buffer_size;
        uint result;
        bool end_of_stream = false;

        draw_horiz_band_called = 0;

        result = avformat_open_input (out format_context, input_filename, null, null);
        if (result < 0) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Can't open file\n"
            );
            return result;
        }

        result = avformat_find_stream_info (format_context, null);
        if (result < 0) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Can't get stream info\n"
            );
            return result;
        }

        video_stream = av_find_best_stream (
            format_context,
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

        origin_par = format_context.streams[video_stream].codecpar;

        codec = avcodec_find_decoder (origin_par.codec_id);
        if (codec == null) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Can't find decoder\n"
            );
            return -1;
        }

        codec_context = avcodec_alloc_context3 (codec);
        if (codec_context == null) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Can't allocate decoder context\n"
            );
            return AVERROR (ENOMEM);
        }

        result = avcodec_parameters_to_context (codec_context, origin_par);
        if (result) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Can't copy decoder context\n"
            );
            return result;
        }

        codec_context.draw_horiz_band = draw_horiz_band;
        codec_context.thread_count = 1;

        result = avcodec_open2 (codec_context, codec, null);
        if (result < 0) {
            av_log (
                codec_context,
                AV_LOG_ERROR,
                "Can't open decoder\n"
            );
            return result;
        }

        frame = av_frame_alloc ();
        if (frame == null) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Can't allocate frame\n"
            );
            return AVERROR (ENOMEM);
        }

        if (codec.name != "flv" && codec.name != "mpeg4" && codec.name != "huffyuv") {
            av_log (
                null,
                AV_LOG_ERROR,
                "Wrong codec\n"
            );
            return -1;
        }

        byte_buffer_size = av_image_get_buffer_size (codec_context.pix_fmt, codec_context.width, codec_context.height, 32);
        byte_buffer = av_malloc (byte_buffer_size);
        if (byte_buffer == null) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Can't allocate buffer\n"
            );
            return AVERROR (ENOMEM);
        }

        slice_byte_buffer = av_malloc (byte_buffer_size);
        if (slice_byte_buffer == null) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Can't allocate buffer\n"
            );
            return AVERROR (ENOMEM);
        }
        memset (slice_byte_buffer, 0, byte_buffer_size);
        slice_byte_buffer_size = byte_buffer_size;

        av_init_packet (out packet);
        do {
            if (!end_of_stream) {
                if (av_read_frame (format_context, out packet) < 0) {
                    end_of_stream = true;
                }
            }
            if (end_of_stream) {
                packet.data = null;
                packet.size = 0;
            }
            if (packet.stream_index == video_stream || end_of_stream) {
                got_frame = false;
                result = avcodec_decode_video2 (codec_context, frame, out got_frame, out packet);
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
                                            (uint8[])frame.data, (uint[]) frame.linesize,
                                            codec_context.pix_fmt, codec_context.width, codec_context.height, 1);
                    if (number_of_written_bytes < 0) {
                        av_log (
                            null,
                            AV_LOG_ERROR,
                            "Can't copy image to buffer\n"
                        );
                        return number_of_written_bytes;
                    }
                    if (draw_horiz_band_called == 0) {
                        av_log (
                            null,
                            AV_LOG_ERROR,
                            "draw_horiz_band haven't been called!\n"
                        );
                        return -1;
                    }
                    if (av_adler32_update (0, (uint8[])byte_buffer, number_of_written_bytes) !=
                        av_adler32_update (0, (uint8[])slice_byte_buffer, number_of_written_bytes)) {
                        av_log (
                            null,
                            AV_LOG_ERROR,
                            "Decoded frames with and without draw_horiz_band are not the same!\n"
                        );
                        return -1;
                    }
                }
                av_packet_unref (out packet);
                av_init_packet (out packet);
            }
        } while (!end_of_stream || got_frame);

        av_packet_unref (out packet);
        av_frame_free (out frame);
        avcodec_close (codec_context);
        avformat_close_input (out format_context);
        avcodec_free_context (out codec_context);
        av_freep (out byte_buffer);
        av_freep (out slice_byte_buffer);
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
                "Incorrect input: expected %s <name of a video file>\nNote that test works only for huffyuv, flv and mpeg4 decoders\n",
                argv[0]
            );
            return 1;
        }

        if (video_decode (argv[1]) != 0)
            return 1;

        return 0;
    }

}
