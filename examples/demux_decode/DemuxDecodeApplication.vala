/***********************************************************
Copyright (c) 2012 Stefano Sabatini

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
@file libavformat and libavcodec demuxing and decoding API usage example
@example demux_decode.c

Show how to use the libavformat and libavcodec API to demux and decode audio
and video data. Write the output as raw audio and input files to be played by
ffplay.
***********************************************************/

//#include <libavutil/imgutils.h>
//#include <libavutil/samplefmt.h>
//#include <libavutil/timestamp.h>
//#include <libavcodec/avcodec.h>
//#include <libavformat/avformat.h>

private class DemuxDecodeApplication : GLib.Application {

    private static AVFormatContext? fmt_ctx = null;
    private static AVCodecContext? video_dec_ctx = null;
    private static AVCodecContext? audio_dec_ctx;
    private static int width;
    private static int height;
    private static AVPixelFormat pix_fmt;
    private static AVStream? video_stream = null;
    private static AVStream? audio_stream = null;
    private static string src_filename = null;
    private static string video_dst_filename = null;
    private static string audio_dst_filename = null;
    private static FILE? video_dst_file = null;
    private static FILE? audio_dst_file = null;

    private static uint8[] video_dst_data[4] = {null};
    private static int video_dst_linesize[4];
    private static int video_dst_bufsize;

    private static int video_stream_idx = -1;
    private static int audio_stream_idx = -1;
    private static AVFrame? frame = null;
    private static AVPacket? pkt = null;
    private static int video_frame_count = 0;
    private static int audio_frame_count = 0;

    private static int output_video_frame (
        AVFrame? frame
    ) {
        if (
            frame.width != width ||
            frame.height != height ||
            frame.format != pix_fmt
        ) {
            /***********************************************************
            To handle this change, one could call av_image_alloc again and
            decode the following frames into another rawvideo file.
            ***********************************************************/
            fprintf (
                stderr,
                "Error: Width, height and pixel format have to be " +
                "constant in a rawvideo file, but the width, height or " +
                "pixel format of the input video changed:\n" +
                "old: width = %d, height = %d, format = %s\n" +
                "new: width = %d, height = %d, format = %s\n",
                width, height,
                av_get_pix_fmt_name (
                    pix_fmt
                ),
                frame.width,
                frame.height,
                av_get_pix_fmt_name (
                    frame.format
                )
            );

            return -1;
        }

        printf (
            "video_frame n:%d\n",
            video_frame_count++
        );

        /***********************************************************
        copy decoded frame to destination buffer:
        this is required since rawvideo expects non aligned data
        ***********************************************************/
        av_image_copy2 (
            video_dst_data, video_dst_linesize,
                    frame.data, frame.linesize,
                    pix_fmt, width, height
        );

        /***********************************************************
        write to rawvideo file
        ***********************************************************/
        fwrite (
            video_dst_data[0], 1, video_dst_bufsize, video_dst_file
        );

        return 0;
    }

    private static int output_audio_frame (
        AVFrame? frame
    ) {
        size_t unpadded_linesize = frame.nb_samples * av_get_bytes_per_sample (
            frame.format
        );

        printf (
            "audio_frame n:%d nb_samples:%d pts:%s\n",
            audio_frame_count++, frame.nb_samples,
            av_ts2timestr (
                frame.pts, &audio_dec_ctx.time_base)
        );

        /***********************************************************
        Write the raw audio data samples of the first plane. This works
        fine for packed formats (
            e.g. LibAVUtil.SampleFormat.SIGNED_16_BIT). However,
        most audio decoders output planar audio, which uses a separate
        plane of audio samples for each channel (
            e.g. LibAVUtil.SampleFormat.SIGNED_16_BIT_PLANAR).
        In other words, this code will write only the first audio channel
        in these cases.
        You should use libswresample or libavfilter to convert the frame
        to packed data.
        ***********************************************************/
        fwrite (
            frame.extended_data[0], 1, unpadded_linesize, audio_dst_file
        );

        return 0;
    }

    private static int decode_packet (
        AVCodecContext? dec,
        AVPacket? pkt
    ) {
        int ret = 0;


        /***********************************************************
        submit the packet to the decoder
        ***********************************************************/
        ret = avcodec_send_packet (
            dec, pkt
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Error submitting a packet for decoding (
                    %s)\n",
                av_err2str (
                    ret)
            );

            return ret;
        }


        /***********************************************************
        get all the available frames from the decoder
        ***********************************************************/
        while (
            ret >= 0
        ) {
            ret = avcodec_receive_frame (
            dec, frame
            );

            if (
                ret < 0
            ) {
                /***********************************************************
                those two return values are special and mean there is no output
                frame available, but there were no errors during decoding
                ***********************************************************/
                if (
                    ret == AVERROR_EOF ||
                    ret == AVERROR (
                        EAGAIN
                    )
                ) {
                    return 0;
                }

                fprintf (
                    stderr,
                    "Error during decoding (%s)\n",
                    av_err2str (
                        ret)
                );

                return ret;
            }


            /***********************************************************
            write the frame data to output file
            ***********************************************************/
            if (
                dec.codec.type == AVMEDIA_TYPE_VIDEO
            ) {
                ret = output_video_frame (
                frame
                );

            } else {
                ret = output_audio_frame (
                frame
                );

            }

            av_frame_unref (
                frame
            );

        }

        return ret;
    }

    private static int open_codec_context (
        out int stream_idx_out,
        out AVCodecContext dec_ctx_out,
        AVFormatContext? fmt_ctx,
        AVMediaType type
    ) {
        int ret, stream_index;
        AVStream? st;
        AVCodec? dec = null;

        ret = av_find_best_stream (
            fmt_ctx, type, -1, -1, null, 0
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Could not find %s stream in input file '%s'\n",
                    av_get_media_type_string (
                        type), src_filename
            );

            return ret;
        } else {
            stream_index = ret;
            st = fmt_ctx.streams[stream_index];

            /***********************************************************
            find decoder for the stream
            ***********************************************************/
            dec = avcodec_find_decoder (
                st.codecpar.codec_id
            );

            if (
                !dec
            ) {
                fprintf (
                    stderr,
                    "Failed to find %s codec\n",
                        av_get_media_type_string (
                            type)
                );

                return AVERROR (
                    EINVAL
                );

            }

            /***********************************************************
            Allocate a codec context for the decoder
            ***********************************************************/
            dec_ctx_out = avcodec_alloc_context3 (
                dec
            );

            if (
                !dec_ctx_out
            ) {
                fprintf (
                    stderr,
                    "Failed to allocate the %s codec context\n",
                        av_get_media_type_string (
                            type)
                );

                return AVERROR (
                    ENOMEM
                );

            }

            /***********************************************************
            Copy codec parameters from input stream to output codec context
            ***********************************************************/
            ret = avcodec_parameters_to_context (
                dec_ctx_out, st.codecpar
            );

            if (
                ret < 0
            ) {
                fprintf (
                    stderr,
                    "Failed to copy %s codec parameters to decoder context\n",
                        av_get_media_type_string (
                            type)
                );

                return ret;
            }

            /***********************************************************
            Init the decoders
            ***********************************************************/
            ret = avcodec_open2 (
                dec_ctx_out, dec, null
            );

            if (
                ret < 0
            ) {
                fprintf (
                    stderr,
                    "Failed to open %s codec\n",
                        av_get_media_type_string (
                            type)
                );

                return ret;
            }

            stream_idx_out = stream_index;
        }

        return 0;
    }

    private struct SampleFormatEntry {
        LibAVUtil.SampleFormat sample_fmt;
        string fmt_be;
        string fmt_le;
    }

    private static SampleFormatEntry sample_fmt_entries[] = {
        { LibAVUtil.SampleFormat.UNSIGNED_8_BIT, "u8", "u8"    },
        { LibAVUtil.SampleFormat.SIGNED_16_BIT, "s16be", "s16le" },
        { LibAVUtil.SampleFormat.SIGNED_32_BIT, "s32be", "s32le" },
        { LibAVUtil.SampleFormat.FLOAT, "f32be", "f32le" },
        { LibAVUtil.SampleFormat.DOUBLE, "f64be", "f64le" },
    };

    private static int get_format_from_sample_fmt (
        out string fmt_out,
        LibAVUtil.SampleFormat sample_fmt
    ) {
        int i;
        fmt_out = null;

        for (
            i = 0;
            i < FF_ARRAY_ELEMS (
                sample_fmt_entries
            );

            i++
        ) {
            SampleFormatEntry? entry = &sample_fmt_entries[i];
            if (
                sample_fmt == entry.sample_fmt
            ) {
                fmt_out = AV_NE (
                entry.fmt_be, entry.fmt_le
                );

                return 0;
            }

        }

        fprintf (
            stderr,
                "sample format %s is not supported as output format\n",
                av_get_sample_fmt_name (
                    sample_fmt)
        );

        return -1;
    }

    private static int main (
        int argc,
        string[] argv
    ) {
        int ret = 0;

        if (
            argc != 4
        ) {
            fprintf (
                stderr,
                "usage: %s  input_file video_output_file audio_output_file\n" +
                    "API example program to show how to read frames from an input file.\n" +
                    "This program reads frames from a file, decodes them, and writes decoded\n" +
                    "video frames to a rawvideo file named video_output_file, and decoded\n" +
                    "audio frames to a rawaudio file named audio_output_file.\n",
                    argv[0]
            );

            exit (
                1
            );

        }

        src_filename = argv[1];
        video_dst_filename = argv[2];
        audio_dst_filename = argv[3];

        /***********************************************************
        open input file, and allocate format context
        ***********************************************************/
        if (
            avformat_open_input (
                &fmt_ctx, src_filename, null, null
            ) < 0
        ) {
            fprintf (
                stderr,
                "Could not open source file %s\n",
                src_filename
            );

            exit (
                1
            );

        }

        /***********************************************************
        retrieve stream information
        ***********************************************************/
        if (
            avformat_find_stream_info (
                fmt_ctx, null
            ) < 0
        ) {
            fprintf (
                stderr,
                "Could not find stream information\n"
            );

            exit (
                1
            );

        }

        if (
            open_codec_context (
                &video_stream_idx, &video_dec_ctx, fmt_ctx, AVMEDIA_TYPE_VIDEO
            ) >= 0
        ) {
            video_stream = fmt_ctx.streams[video_stream_idx];

            video_dst_file = fopen (
            video_dst_filename, "wb"
            );

            if (
                !video_dst_file
            ) {
                fprintf (
                    stderr,
                    "Could not open destination file %s\n",
                    video_dst_filename
                );

                ret = 1;
                throw new Goto.END (
                    "");
            }

            /***********************************************************
            allocate image where the decoded image will be put
            ***********************************************************/
            width = video_dec_ctx.width;
            height = video_dec_ctx.height;
            pix_fmt = video_dec_ctx.pix_fmt;
            ret = av_image_alloc (
                video_dst_data, video_dst_linesize,
                                width, height, pix_fmt, 1
            );

            if (
                ret < 0
            ) {
                fprintf (
                    stderr,
                    "Could not allocate raw video buffer\n"
                );

                throw new Goto.END (
                    "");
            }

            video_dst_bufsize = ret;
        }

        if (
            open_codec_context (
                &audio_stream_idx, &audio_dec_ctx, fmt_ctx, AVMEDIA_TYPE_AUDIO
            ) >= 0
        ) {
            audio_stream = fmt_ctx.streams[audio_stream_idx];
            audio_dst_file = fopen (
            audio_dst_filename, "wb"
            );

            if (
                !audio_dst_file
            ) {
                fprintf (
                    stderr,
                    "Could not open destination file %s\n",
                    audio_dst_filename
                );

                ret = 1;
                throw new Goto.END (
                    "");
            }

        }

        /***********************************************************
        dump input information to stderr
        ***********************************************************/
        av_dump_format (
            fmt_ctx, 0, src_filename, 0
        );

        if (
            !audio_stream &&
            !video_stream
        ) {
            fprintf (
                stderr,
                "Could not find audio or video stream in the input, aborting\n"
            );

            ret = 1;
            throw new Goto.END (
                "");
        }

        frame = av_frame_alloc ();
        if (
            !frame
        ) {
            fprintf (
                stderr,
                "Could not allocate frame\n"
            );

            ret = AVERROR (
                ENOMEM
            );

            throw new Goto.END (
                "");
        }

        pkt = av_packet_alloc ();
        if (
            !pkt
        ) {
            fprintf (
                stderr,
                "Could not allocate packet\n"
            );

            ret = AVERROR (
                ENOMEM
            );

            throw new Goto.END (
                "");
        }

        if (
            video_stream
        ) {
            printf (
                "Demuxing video from file '%s' into '%s'\n",
                src_filename, video_dst_filename
            );

        }

        if (
            audio_stream
        ) {
            printf (
                "Demuxing audio from file '%s' into '%s'\n",
                src_filename, audio_dst_filename
            );

        }

        /***********************************************************
        read frames from the file
        ***********************************************************/
        while (
            av_read_frame (
                fmt_ctx, pkt
            ) >= 0
        ) {
            /***********************************************************
            Check if the packet belongs to a stream we are interested in;
            otherwise skip it.
            ***********************************************************/
            if (
                pkt.stream_index == video_stream_idx
            ) {
                ret = decode_packet (
                video_dec_ctx, pkt
                );

            } else if (
                pkt.stream_index == audio_stream_idx
            ) {
                ret = decode_packet (
                audio_dec_ctx, pkt
                );

            }

            av_packet_unref (
                pkt
            );

            if (
                ret < 0
            ) {
                break;
            }

        }

        /***********************************************************
        flush the decoders
        ***********************************************************/
        if (
            video_dec_ctx
        ) {
            decode_packet (
                video_dec_ctx, null
            );

        }

        if (
            audio_dec_ctx
        ) {
            decode_packet (
                audio_dec_ctx, null
            );

        }

        printf (
            "Demuxing succeeded.\n"
        );

        if (
            video_stream
        ) {
            printf (
                "Play the output video file with the command:\n" +
                "ffplay -f rawvideo -pix_fmt %s -video_size %dx%d %s\n",
                av_get_pix_fmt_name (
                    pix_fmt), width, height,
                video_dst_filename
            );

        }

        if (
            audio_stream
        ) {
            LibAVUtil.SampleFormat sfmt = audio_dec_ctx.sample_fmt;
            int n_channels = audio_dec_ctx.ch_layout.nb_channels;
            string fmt;

            if (
                av_sample_fmt_is_planar (
                    sfmt)
            ) {
                string packed = av_get_sample_fmt_name (
                sfmt
                );

                printf (
                    "Warning: the sample format the decoder produced is planar " +
                    "(%s). This example will output the first channel only.\n",
                    packed ? packed : "?"
                );

                sfmt = av_get_packed_sample_fmt (
                    sfmt
                );

                n_channels = 1;
            }

            ret = get_format_from_sample_fmt (
                &fmt, sfmt
            );

            if (
                ret < 0
            ) {
                throw new Goto.END (
                "");
            }

            printf (
                "Play the output audio file with the command:\n" +
                "ffplay -f %s -ac %d -ar %d %s\n",
                fmt, n_channels, audio_dec_ctx.sample_rate,
                audio_dst_filename
            );

        }

    //  end:
        avcodec_free_context (
            &video_dec_ctx
        );

        avcodec_free_context (
            &audio_dec_ctx
        );

        avformat_close_input (
            &fmt_ctx
        );

        if (
            video_dst_file
        ) {
            fclose (
                video_dst_file
            );

        }

        if (
            audio_dst_file
        ) {
            fclose (
                audio_dst_file
            );

        }

        av_packet_free (
            &pkt
        );

        av_frame_free (
            &frame
        );

        av_free (
            video_dst_data[0]
        );

        return ret < 0;
    }

}
