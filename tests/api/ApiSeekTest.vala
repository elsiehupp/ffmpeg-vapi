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

public class ApiSeekTest : GLib.TestCase {

    /***********************************************************
    Seek test.
    ***********************************************************/


    int64 *pts_array;
    uint32[] crc_array;
    uint size_of_array;
    uint number_of_elements;

    static uint add_crc_to_array (uint32 crc, int64 pts) {
        if (size_of_array <= number_of_elements) {
            if (size_of_array == 0)
                size_of_array = 10;
            size_of_array *= 2;
            crc_array = av_realloc_f (crc_array, size_of_array, sizeof (uint32));
            pts_array = av_realloc_f (pts_array, size_of_array, sizeof (int64));
            if ((crc_array == null) || (pts_array == null)) {
                av_log (
                    null,
                    AV_LOG_ERROR,
                    "Can't allocate array to store crcs\n"
                );
                return AVERROR (ENOMEM);
            }
        }
        crc_array[number_of_elements] = crc;
        pts_array[number_of_elements] = pts;
        number_of_elements++;
        return 0;
    }

    static uint compare_crc_in_array (uint32 crc, int64 pts) {
        for (uint i = 0; i < number_of_elements; i++) {
            if (pts_array[i] == pts) {
                if (crc_array[i] == crc) {
                    GLib.print ("Comparing 0x%08l %ll %d is OK\n", crc, pts, i);
                    return 0;
                }
                else {
                    av_log (
                        null,
                        AV_LOG_ERROR,
                        "Incorrect crc of a frame after seeking\n"
                    );
                    return -1;
                }
            }
        }
        av_log (
            null,
            AV_LOG_ERROR,
            "Incorrect pts of a frame after seeking\n"
        );
        return -1;
    }

    static uint compute_crc_of_packets (
        AVFormatContext format_context,
        uint video_stream,
        LibAVCodec.CodecContext codec_context,
        LibAVUtil.Frame frame,
        uint64 ts_start,
        uint64 ts_end,
        bool no_seeking
    ) {
        uint number_of_written_bytes;
        bool got_frame = false;
        uint result;
        bool end_of_stream = false;
        uint byte_buffer_size;
        uint8[] byte_buffer;
        uint32 crc;
        LibAVCodec.Packet packet;

        byte_buffer_size = av_image_get_buffer_size (codec_context.pix_fmt, codec_context.width, codec_context.height, 16);
        byte_buffer = av_malloc (byte_buffer_size);
        if (byte_buffer == null) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Can't allocate buffer\n"
            );
            return AVERROR (ENOMEM);
        }

        if (!no_seeking) {
            result = av_seek_frame (
                format_context,
                video_stream,
                ts_start,
                AVSEEK_FLAG_ANY
            );
            GLib.print ("Seeking to %ll, computing crc for frames with pts < %ll\n", ts_start, ts_end);
            if (result < 0) {
                av_log (
                    null,
                    AV_LOG_ERROR,
                    "Error in seeking\n"
                );
                return result;
            }
            avcodec_flush_buffers (codec_context);
        }

        av_init_packet (out packet);
        do {
            if (!end_of_stream)
                if (av_read_frame (format_context, out packet) < 0)
                    end_of_stream = 1;
            if (end_of_stream) {
                packet.data = null;
                packet.size = 0;
            }
            if (packet.stream_index == video_stream || end_of_stream) {
                got_frame = 0;
                if ((packet.pts == AV_NOPTS_VALUE) && (!end_of_stream)) {
                    av_log (
                        null,
                        AV_LOG_ERROR,
                        "Error: frames doesn't have pts values\n"
                    );
                    return -1;
                }
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
                    if ((!no_seeking) && (frame.pts > ts_end))
                        break;
                    crc = av_adler32_update (0, (uint8[])byte_buffer, number_of_written_bytes);
                    GLib.print ("%10ll, 0x%08l\n", frame.pts, crc);
                    if (no_seeking) {
                        if (add_crc_to_array (crc, frame.pts) < 0)
                            return -1;
                    }
                    else {
                        if (compare_crc_in_array (crc, frame.pts) < 0)
                            return -1;
                    }
                }
            }
            av_packet_unref (out packet);
            av_init_packet (out packet);
        } while ((!end_of_stream || got_frame) && (no_seeking || (frame.pts + frame.pkt_duration <= ts_end)));

        av_packet_unref (out packet);
        av_freep (out byte_buffer);

        return 0;
    }

    static ulong read_seek_range (string string_with_number) {
        ulong number;
        char[] end_of_string = null;
        number = strtol (string_with_number, out end_of_string, 10);
        if ((strlen (string_with_number) != end_of_string - string_with_number)  || (number < 0)) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Incorrect input ranges of seeking\n"
            );
            return -1;
        }
        else if ((number == LONG_MAX) || (number == LONG_MIN)) {
            if (errno == ERANGE) {
                av_log (
                    null,
                    AV_LOG_ERROR,
                    "Incorrect input ranges of seeking\n"
                );
                return -1;
            }
        }
        return number;
    }

    static uint seek_test (string input_filename, string start, string end) {
        try {
            LibAVCodec.Codec codec = null;
            LibAVCodec.CodecContext codec_context= null;
            LibAVCodec.CodecParameters origin_par = null;
            LibAVUtil.Frame frame = null;
            AVFormatContext format_context = null;
            uint video_stream;
            uint result;
            uint i, j;
            ulong start_ts, end_ts;

            size_of_array = 0;
            number_of_elements = 0;
            crc_array = null;
            pts_array = null;

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
                throw new Goto.END ("");
            }

            start_ts = read_seek_range (start);
            end_ts = read_seek_range (end);
            if ((start_ts < 0) || (end_ts < 0)) {
                result = -1;
                throw new Goto.END ("");
            }

            //TODO: add ability to work with audio format
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
                result = video_stream;
                throw new Goto.END ("");
            }

            origin_par = format_context.streams[video_stream].codecpar;

            codec = avcodec_find_decoder (origin_par.codec_id);
            if (codec == null) {
                av_log (
                    null,
                    AV_LOG_ERROR,
                    "Can't find decoder\n"
                );
                result = AVERROR_DECODER_NOT_FOUND;
                throw new Goto.END ("");
            }

            codec_context = avcodec_alloc_context3 (codec);
            if (codec_context == null) {
                av_log (
                    null,
                    AV_LOG_ERROR,
                    "Can't allocate decoder context\n"
                );
                result = AVERROR (ENOMEM);
                throw new Goto.END ("");
            }

            result = avcodec_parameters_to_context (codec_context, origin_par);
            if (result) {
                av_log (
                    null,
                    AV_LOG_ERROR,
                    "Can't copy decoder context\n"
                );
                throw new Goto.END ("");
            }

            result = avcodec_open2 (codec_context, codec, null);
            if (result < 0) {
                av_log (
                    codec_context,
                    AV_LOG_ERROR,
                    "Can't open decoder\n"
                );
                throw new Goto.END ("");
            }

            frame = av_frame_alloc ();
            if (frame == null) {
                av_log (
                    null,
                    AV_LOG_ERROR,
                    "Can't allocate frame\n"
                );
                result = AVERROR (ENOMEM);
                throw new Goto.END ("");
            }

            result = compute_crc_of_packets (format_context, video_stream, codec_context, frame, 0, 0, 1);
            if (result != 0)
                throw new Goto.END ("");

            for (uint i = start_ts; i < end_ts; i += 100) {
                for (uint j = i + 100; j < end_ts; j += 100) {
                    result = compute_crc_of_packets (format_context, video_stream, codec_context, frame, i, j, 0);
                    if (result != 0)
                        break;
                }
            }
        } catch (Goto foobar) { }

        av_freep (out crc_array);
        av_freep (out pts_array);
        av_frame_free (out frame);
        avcodec_close (codec_context);
        avformat_close_input (out format_context);
        avcodec_free_context (out codec_context);
        return result;
    }

    uint main (
        uint argc,
        string[] argv
    ) {
        if (argc < 4) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Incorrect input\n"
            );
            return 1;
        }

        if (seek_test (argv[1], argv[2], argv[3]) != 0)
            return 1;

        return 0;
    }

}
