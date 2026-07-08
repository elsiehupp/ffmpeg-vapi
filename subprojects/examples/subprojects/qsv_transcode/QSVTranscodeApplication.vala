/***********************************************************
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
@file Intel QSV-accelerated video transcoding API usage example
@example qsv_transcode.c

Perform QSV-accelerated transcoding and show to dynamically change
encoder's options.

Usage: qsv_transcode input_stream codec output_stream initial option
                     { frame_number new_option }
e.g: - qsv_transcode input.mp4 h264_qsv output_h264.mp4 "g 60"
     - qsv_transcode input.mp4 hevc_qsv output_hevc.mp4 "g 60 async_depth 1"
                     100 "g 120"
        (initialize codec with gop_size 60 and change it to 120 after 100
         frames)
***********************************************************/

//#include <stdio.h>
//#include <errno.h>

//#include <libavutil/hwcontext.h>
//#include <libavutil/mem.h>
//#include <libavcodec/avcodec.h>
//#include <libavformat/avformat.h>
//#include <libavutil/opt.h>

private class QSVTranscodeApplication : GLib.Application {

    private static LibAVFormat.FormatContext? ifmt_ctx = null;
    private static LibAVFormat.FormatContext? ofmt_ctx = null;
    private static AVBufferRef? hw_device_ctx = null;
    private static LibAVCodec.CodecContext? decoder_ctx = null;
    private static LibAVCodec.CodecContext? encoder_ctx = null;
    private static int video_stream = -1;

    [Compact]
    private class DynamicSetting {
        public int frame_number;
        public string optstr;
    }

    private static DynamicSetting? dynamic_setting;
    private static int setting_number;
    private static int current_setting_number;

    private static int str_to_dict (
        string optstr,
        LibAVUtil.Dictionary? opt
    ) {
        string key;
        string value;
        if (
            strlen (
                optstr
            ) == 0
        ) {
            return 0;
        }

        key = strtok (
            optstr,
            " "
        );

        if (
            key == null
        ) {
            return AVERROR (
            EINVAL
            );

        }

        value = strtok (
            null,
            " "
        );

        if (
            value == null
        ) {
            return AVERROR (
            EINVAL
            );

        }

        av_dict_set (
            opt,
            key,
            value,
            0
        );

        do {
            key = strtok (
            null,
            " "
            );

            if (
                key == null
            ) {
                return 0;
            }

            value = strtok (
                null,
                " "
            );

            if (
                value == null
            ) {
                return AVERROR (
                EINVAL
                );

            }

            av_dict_set (
                opt,
                key,
                value,
                0
            );

        } while (
            1
        );

    }

    private static int frame_number = 0;

    private static int dynamic_set_parameter (
        LibAVCodec.CodecContext? avctx
    ) {
        LibAVUtil.Dictionary? opts = null;
        int ret = 0;
        frame_number++;
        if (
            current_setting_number < setting_number &&
            frame_number == dynamic_setting[current_setting_number].frame_number
        ) {
            AVDictionaryEntry? dictionary_entry = null;
            ret = str_to_dict (
            dynamic_setting[current_setting_number++].optstr,
            &opts
            );

            if (
                ret < 0
            ) {
                fprintf (
                    stderr,
                    "The dynamic parameter is wrong\n"
                );

                throw new Goto.FAIL (
                    ""
                );

            }

            /***********************************************************
            Set common option. The dictionary will be freed and replaced
            by a new one containing all options not found in common option list.
            Then this new dictionary is used to set private option.
            ***********************************************************/
            ret = av_opt_set_dict (
                avctx,
                &opts
            );

            if (
                ret < 0
            ) {
                throw new Goto.FAIL (
                    ""
                );

            }

            /***********************************************************
            Set codec specific option
            ***********************************************************/
            ret = av_opt_set_dict (
                avctx.priv_data,
                &opts
            );

            if (
                ret < 0
            ) {
                throw new Goto.FAIL (
                    ""
                );

            }

            /***********************************************************
            There is no "framerate" option in common option list. Use "-r" to set
            framerate,
            which is compatible with ffmpeg commandline. The video is
            assumed to be average frame rate, so set time_base to 1/framerate.
            ***********************************************************/
            dictionary_entry = av_dict_get (
                opts,
                "r",
                null,
                0
            );

            if (
                dictionary_entry
            ) {
                avctx.framerate = av_d2q (
                atof (
                    dictionary_entry.value),
                    INT_MAX
                );

                encoder_ctx.time_base = av_inv_q (
                    encoder_ctx.framerate
                );

            }

        }

    //  fail:
        av_dict_free (
            &opts
        );

        return ret;
    }

    private static int get_format (
        LibAVCodec.CodecContext? avctx,
        AVPixelFormat[] pix_fmts
    ) {
        while (
            *pix_fmts != LibAVUtil.PixelFormat.NONE
        ) {
            if (
                *pix_fmts == LibAVUtil.PixelFormat.QSV
            ) {
                return LibAVUtil.PixelFormat.QSV;
            }

            pix_fmts++;
        }

        fprintf (
            stderr,
            "The QSV pixel format not offered in get_format ()\n"
        );

        return LibAVUtil.PixelFormat.NONE;
    }

    private static int open_input_file (
        string filename
    ) {
        int ret;
        AVCodec? decoder = null;
        LibAVFormat.Stream? video = null;

        ret = avformat_open_input (
            &ifmt_ctx,
            filename,
            null,
            null
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Cannot open input file '%s', Error code: %s\n",
                filename,
                av_err2str (
                    ret
                )
            );

            return ret;
        }

        ret = avformat_find_stream_info (
            ifmt_ctx,
            null
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Cannot find input stream information. Error code: %s\n",
                av_err2str (
                    ret)
            );

            return ret;
        }

        ret = av_find_best_stream (
            ifmt_ctx,
            LibAVUtil.MediaType.VIDEO,
            -1,
            -1,
            null,
            0
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Cannot find a video stream in the input file. Error code: %s\n",
                av_err2str (
                    ret)
            );

            return ret;
        }

        video_stream = ret;
        video = ifmt_ctx.streams[video_stream];

        switch (
            video.codecpar.codec_id
        ) {
            case LibAVCodec.CodecID.H264: {
                decoder = avcodec_find_decoder_by_name (
                    "h264_qsv"
                );

                break;
            }

            case LibAVCodec.CodecID.HEVC: {
                decoder = avcodec_find_decoder_by_name (
                    "hevc_qsv"
                );

                break;
            }

            case LibAVCodec.CodecID.VP9: {
                decoder = avcodec_find_decoder_by_name (
                    "vp9_qsv"
                );

                break;
            }

            case LibAVCodec.CodecID.VP8: {
                decoder = avcodec_find_decoder_by_name (
                    "vp8_qsv"
                );

                break;
            }

            case LibAVCodec.CodecID.AV1: {
                decoder = avcodec_find_decoder_by_name (
                    "av1_qsv"
                );

                break;
            }

            case LibAVCodec.CodecID.MPEG2VIDEO: {
                decoder = avcodec_find_decoder_by_name (
                    "mpeg2_qsv"
                );

                break;
            }

            case LibAVCodec.CodecID.MJPEG: {
                decoder = avcodec_find_decoder_by_name (
                    "mjpeg_qsv"
                );

                break;
            }

            default: {
                fprintf (
                    stderr,
                    "Codec is not supported by qsv\n"
                );

                return AVERROR (
                    EINVAL
                );

            }

        }

        decoder_ctx = avcodec_alloc_context3 (
            decoder
        );

        if (
            !decoder_ctx
        ) {
            return AVERROR (
                ENOMEM
            );

        }

        ret = avcodec_parameters_to_context (
            decoder_ctx,
            video.codecpar
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "avcodec_parameters_to_context error. Error code: %s\n",
                av_err2str (
                    ret)
            );

            return ret;
        }

        decoder_ctx.framerate = av_guess_frame_rate (
            ifmt_ctx,
            video,
            null
        );

        decoder_ctx.hw_device_ctx = av_buffer_ref (
            hw_device_ctx
        );

        if (
            !decoder_ctx.hw_device_ctx
        ) {
            fprintf (
                stderr,
                "A hardware device reference create failed.\n"
            );

            return AVERROR (
                ENOMEM
            );

        }

        decoder_ctx.get_format = get_format;
        decoder_ctx.pkt_timebase = video.time_base;
        ret = avcodec_open2 (
            decoder_ctx,
            decoder,
            null
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Failed to open codec for decoding. Error code: %s\n",
                av_err2str (
                    ret)
            );

        }

        return ret;
    }

    private static int encode_write (
        LibAVCodec.Packet? enc_pkt,
        LibAVFormat.Frame? frame
    ) {
        int ret = 0;

        av_packet_unref (
            enc_pkt
        );

        ret = dynamic_set_parameter (
            encoder_ctx
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Failed to set dynamic parameter. Error code: %s\n",
                av_err2str (
                    ret)
            );

            throw new Goto.END (
                ""
            );

        }

        ret = avcodec_send_frame (
            encoder_ctx,
            frame
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Error during encoding. Error code: %s\n",
                av_err2str (
                    ret)
            );

            throw new Goto.END (
                ""
            );

        }

        while (
            true
        ) {
            ret = avcodec_receive_packet (
            encoder_ctx,
            enc_pkt
            );

            if (
                ret != 0
            ) {
                break;
            }

            enc_pkt.stream_index = 0;
            av_packet_rescale_ts (
                enc_pkt,
                encoder_ctx.time_base,
                ofmt_ctx.streams[0].time_base
            );

            ret = av_interleaved_write_frame (
                ofmt_ctx,
                enc_pkt
            );

            if (
                ret < 0
            ) {
                fprintf (
                    stderr,
                    "Error during writing data to output file. Error code: %s\n",
                    av_err2str (
                        ret)
                );

                return ret;
            }

        }

    //  end:
        if (
            ret == AVERROR_EOF
        ) {
            return 0;
        }

        ret = (
            ret == AVERROR (
                EAGAIN)
            ? 0
            : -1
        );

        return ret;
    }

    private static int dec_enc (
        LibAVCodec.Packet? pkt,
        AVCodec? enc_codec,
        string optstr
    ) {
        LibAVFormat.Frame? frame;
        int ret = 0;

        ret = avcodec_send_packet (
            decoder_ctx,
            pkt
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Error during decoding. Error code: %s\n",
                av_err2str (
                    ret)
            );

            return ret;
        }

        while (
            ret >= 0
        ) {
            frame = av_frame_alloc ();
            if (
                !frame
            ) {
                return AVERROR (
                ENOMEM
                );

            }

            ret = avcodec_receive_frame (
                decoder_ctx,
                frame
            );

            if (
                ret == AVERROR (
                    EAGAIN) ||
                ret == AVERROR_EOF
            ) {
                av_frame_free (
                    &frame
                );

                return 0;
            } else if (
                ret < 0
            ) {
                fprintf (
                    stderr,
                    "Error while decoding. Error code: %s\n",
                    av_err2str (
                        ret)
                );

                throw new Goto.FAIL (
                    ""
                );

            }

            if (
                !encoder_ctx.hw_frames_ctx
            ) {
                AVDictionaryEntry? dictionary_entry = null;
                LibAVUtil.Dictionary? opts = null;
                LibAVFormat.Stream? ost;
                /***********************************************************
                we need to ref hw_frames_ctx of decoder to initialize encoder's codec.
                Only after we get a decoded frame, can we obtain its hw_frames_ctx
                ***********************************************************/
                encoder_ctx.hw_frames_ctx = av_buffer_ref (
                    decoder_ctx.hw_frames_ctx
                );

                if (
                    !encoder_ctx.hw_frames_ctx
                ) {
                    ret = AVERROR (
                        ENOMEM
                    );

                    throw new Goto.FAIL (
                        ""
                    );

                }

                /***********************************************************
                set LibAVCodec.CodecContext Parameters for encoder, here we keep them stay
                the same as decoder.

                ***********************************************************/
                encoder_ctx.time_base = av_inv_q (
                    decoder_ctx.framerate
                );

                encoder_ctx.pix_fmt = LibAVUtil.PixelFormat.QSV;
                encoder_ctx.width = decoder_ctx.width;
                encoder_ctx.height = decoder_ctx.height;
                ret = str_to_dict (
                    optstr,
                    &opts
                );

                if (
                    ret < 0
                ) {
                    fprintf (
                        stderr,
                        "Failed to set encoding parameter.\n"
                    );

                    throw new Goto.FAIL (
                        ""
                    );

                }

                /***********************************************************
                There is no "framerate" option in common option list. Use "-r" to
                set framerate, which is compatible with ffmpeg commandline. The
                video is assumed to be average frame rate, so set time_base to
                1/framerate.
                ***********************************************************/
                dictionary_entry = av_dict_get (
                    opts,
                    "r",
                    null,
                    0
                );

                if (
                    dictionary_entry
                ) {
                    encoder_ctx.framerate = av_d2q (
                        atof (
                            dictionary_entry.value
                        ),
                        INT_MAX
                    );

                    encoder_ctx.time_base = av_inv_q (
                        encoder_ctx.framerate
                    );

                }

                ret = avcodec_open2 (
                    encoder_ctx,
                    enc_codec,
                    &opts
                );

                if (
                    ret < 0
                ) {
                    fprintf (
                        stderr,
                        "Failed to open encode codec. Error code: %s\n",
                        av_err2str (
                            ret)
                    );

                    av_dict_free (
                        &opts
                    );

                    throw new Goto.FAIL (
                        ""
                    );

                }

                av_dict_free (
                    &opts
                );

                ost = avformat_new_stream (
                    ofmt_ctx,
                    enc_codec
                );

                if (
                    !ost
                ) {
                    fprintf (
                        stderr,
                        "Failed to allocate stream for output format.\n"
                    );

                    ret = AVERROR (
                        ENOMEM
                    );

                    throw new Goto.FAIL (
                        ""
                    );

                }

                ost.time_base = encoder_ctx.time_base;
                ret = avcodec_parameters_from_context (
                    ost.codecpar,
                    encoder_ctx
                );

                if (
                    ret < 0
                ) {
                    fprintf (
                        stderr,
                        "Failed to copy the stream parameters. " +
                        "Error code: %s\n",
                        av_err2str (
                            ret
                        )
                    );

                    throw new Goto.FAIL (
                        ""
                    );

                }

                /***********************************************************
                write the stream header
                ***********************************************************/
                ret = avformat_write_header (
                    ofmt_ctx,
                    null
                );

                if (
                    ret < 0
                ) {
                    fprintf (
                        stderr,
                        "Error while writing stream header. " +
                        "Error code: %s\n",
                        av_err2str (
                            ret
                        )
                    );

                    throw new Goto.FAIL (
                        ""
                    );

                }

            }

            frame.pts = av_rescale_q (
                frame.pts,
                decoder_ctx.pkt_timebase,
                encoder_ctx.time_base
            );

            ret = encode_write (
                pkt,
                frame
            );

            if (
                ret < 0
            ) {
                fprintf (
                    stderr,
                    "Error during encoding and writing.\n"
            );

            }

    //  fail:
            av_frame_free (
                &frame
            );

        }

        return ret;
    }

    private static int main (
        int argc,
        string[] argv
    ) {
        AVCodec? enc_codec;
        int ret = 0;
        LibAVCodec.Packet? dec_pkt = null;

        if (
            argc < 5 ||
            (
                argc - 5) % 2
        ) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Usage: %s <input file> <encoder> <output file>" +
                " <\"encoding option set 0\"> [<frame_number> <\"encoding options set 1\">]...\n",
                argv[0]
            );

            return 1;
        }

        setting_number = (
            argc - 5) / 2;
        dynamic_setting = av_malloc (
            setting_number * sizeof (
                dynamic_setting)
        );

        if (
            !dynamic_setting
        ) {
            ret = AVERROR (
                ENOMEM
            );

            throw new Goto.END (
                ""
            );

        }

        current_setting_number = 0;
        for (
            int i = 0;
            i < setting_number;
            i++
        ) {
            dynamic_setting[i].frame_number = atoi (
                argv[i*2 + 5]
            );

            dynamic_setting[i].optstr = argv[i*2 + 6];
        }

        ret = av_hwdevice_ctx_create (
            &hw_device_ctx,
            AV_HWDEVICE_TYPE_QSV,
            null,
            null,
            0
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Failed to create a QSV device. Error code: %s\n",
                av_err2str (
                    ret)
            );

            throw new Goto.END (
                ""
            );

        }

        dec_pkt = av_packet_alloc ();
        if (
            !dec_pkt
        ) {
            fprintf (
                stderr,
                "Failed to allocate decode packet\n"
            );

            throw new Goto.END (
                ""
            );

        }

        ret = open_input_file (
            argv[1]
        );

        if (
            ret < 0
        ) {
            throw new Goto.END (
                ""
            );

        }

        enc_codec = avcodec_find_encoder_by_name (
            argv[2]
        );

        if (
            !enc_codec
        ) {
            fprintf (
                stderr,
                "Could not find encoder '%s'\n",
                argv[2]
            );

            ret = -1;
            throw new Goto.END (
                ""
            );

        }

        ret = avformat_alloc_output_context2 (
            &ofmt_ctx,
            null,
            null,
            argv[3]
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Failed to deduce output format from file extension. Error code: %s\n",
                av_err2str (
                    ret)
            );

            throw new Goto.END (
                ""
            );

        }

        encoder_ctx = avcodec_alloc_context3 (
            enc_codec
        );

        if (
            !encoder_ctx
        ) {
            ret = AVERROR (
                ENOMEM
            );

            throw new Goto.END (
                ""
            );

        }

        ret = avio_open (
            &ofmt_ctx.pb,
            argv[3],
            LibAVFormat.IOOpenFlags.WRITE
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Cannot open output file. Error code: %s\n",
                av_err2str (
                    ret)
            );

            throw new Goto.END (
                ""
            );

        }

        /***********************************************************
        read all packets and only transcoding video
        ***********************************************************/
        while (
            ret >= 0
        ) {
            ret = av_read_frame (
            ifmt_ctx,
            dec_pkt
            );

            if (
                ret < 0
            ) {
                break;
            }

            if (
                video_stream == dec_pkt.stream_index
            ) {
                ret = dec_enc (
                dec_pkt,
                enc_codec,
                argv[4]
                );

            }

            av_packet_unref (
                dec_pkt
            );

        }

        /***********************************************************
        flush decoder
        ***********************************************************/
        av_packet_unref (
            dec_pkt
        );

        ret = dec_enc (
            dec_pkt,
            enc_codec,
            argv[4]
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Failed to flush decoder %s\n",
                av_err2str (
                    ret)
            );

            throw new Goto.END (
                ""
            );

        }

        /***********************************************************
        flush encoder
        ***********************************************************/
        ret = encode_write (
            dec_pkt,
            null
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Failed to flush encoder %s\n",
                av_err2str (
                    ret)
            );

            throw new Goto.END (
                ""
            );

        }

        /***********************************************************
        write the trailer for output stream
        ***********************************************************/
        ret = av_write_trailer (
            ofmt_ctx
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Failed to write trailer %s\n",
                av_err2str (
                    ret)
            );

        }

    //  end:
        avformat_close_input (
            &ifmt_ctx
        );

        avformat_close_input (
            &ofmt_ctx
        );

        avcodec_free_context (
            &decoder_ctx
        );

        avcodec_free_context (
            &encoder_ctx
        );

        av_buffer_unref (
            &hw_device_ctx
        );

        av_packet_free (
            &dec_pkt
        );

        av_freep (
            &dynamic_setting
        );

        return ret;
    }

}
