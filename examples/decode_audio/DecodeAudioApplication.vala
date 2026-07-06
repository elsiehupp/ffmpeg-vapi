/***********************************************************
Copyright (c) 2001 Fabrice Bellard

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
@file libavcodec audio decoding API usage example
@example decode_audio.c

Decode data from an MP2 input file and generate a raw audio file to
be played with ffplay.
***********************************************************/

//#include <stdio.h>
//#include <stdlib.h>
//#include <string.h>

//#include <libavutil/frame.h>
//#include <libavutil/mem.h>

//#include <libavcodec/avcodec.h>

private class DecodeAudioApplication : GLib.Application {

    private const size_t AUDIO_INBUF_SIZE = 20480;
    private const size_t AUDIO_REFILL_THRESH = 4096;

    private struct SampleFormatEntry {
        LibAVUtil.SampleFormat sample_fmt;
        string fmt_be;
        string fmt_le;
    }

    private static SampleFormatEntry sample_fmt_entries[] = {
        {
            LibAVUtil.SampleFormat.UNSIGNED_8_BIT,
            "u8",
            "u8"
        },
        {
            LibAVUtil.SampleFormat.SIGNED_16_BIT,
            "s16be",
            "s16le"
        },
        {
            LibAVUtil.SampleFormat.SIGNED_32_BIT,
            "s32be",
            "s32le"
        },
        {
            LibAVUtil.SampleFormat.FLOAT,
            "f32be",
            "f32le"
        },
        {
            LibAVUtil.SampleFormat.DOUBLE,
            "f64be",
            "f64le"
        },
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
                sample_fmt_entries);
            i++
        ) {
            SampleFormatEntry? entry = &sample_fmt_entries[i];
            if (
                sample_fmt == entry.sample_fmt
            ) {
                fmt_out = AV_NE (
                    entry.fmt_be,
                    entry.fmt_le
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

    private static void decode (
        AVCodecContext? dec_ctx,
        AVPacket? pkt,
        AVFrame? frame,
        FILE? outfile
    ) {
        int i;
        int ch;

        int ret;
        int data_size;

        /***********************************************************
        send the packet with the compressed data to the decoder
        ***********************************************************/
        ret = avcodec_send_packet (
            dec_ctx,
            pkt
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Error submitting the packet to the decoder\n"
            );

            exit (
                1
            );

        }

        /***********************************************************
        read all the output frames (
            in general there may be any number of them
        ***********************************************************/
        while (
            ret >= 0
        ) {
            ret = avcodec_receive_frame (
                dec_ctx,
                frame
            );

            if (
                ret == AVERROR (
                    EAGAIN) ||
                ret == AVERROR_EOF
            ) {
                return;
            } else if (
                ret < 0
            ) {
                fprintf (
                    stderr,
                    "Error during decoding\n"
                );

                exit (
                    1
                );

            }

            data_size = av_get_bytes_per_sample (
                dec_ctx.sample_fmt
            );

            if (
                data_size < 0
            ) {
                /***********************************************************
                This should not occur, checking just for paranoia
                ***********************************************************/
                fprintf (
                    stderr,
                    "Failed to calculate data size\n"
                );

                exit (
                    1
                );

            }

            for (
                i = 0;
                i < frame.nb_samples;
                i++
            ) {
                for (
                    ch = 0;
                    ch < dec_ctx.ch_layout.nb_channels;
                    ch++
                ) {
                    fwrite (
                        frame.data[ch] + data_size * i,
                        1,
                        data_size,
                        outfile
                    );

                }

            }

        }

    }

    private static int main (
        int argc,
        string[] argv
    ) {
        string outfilename;
        string filename;
        AVCodec? codec;
        AVCodecContext? codec_context = null;
        AVCodecParserContext? parser = null;
        int len;
        int ret;
        FILE? file;
        FILE? outfile;
        uint8 inbuf[AUDIO_INBUF_SIZE + AV_INPUT_BUFFER_PADDING_SIZE];
        uint8[] data;
        size_t   data_size;
        AVPacket? pkt;
        AVFrame? decoded_frame = null;
        LibAVUtil.SampleFormat sfmt;
        int n_channels = 0;
        string fmt;

        if (
            argc <= 2
        ) {
            fprintf (
                stderr,
                "Usage: %s <input file> <output file>\n",
                argv[0]
            );

            exit (
                0
            );

        }

        filename = argv[1];
        outfilename = argv[2];

        pkt = av_packet_alloc ();
        if (
            !pkt
        ) {
            fprintf (
                stderr,
                "Could not allocate AVPacket\n"
            );

            /***********************************************************
            or proper cleanup and returning
            ***********************************************************/
            exit (
                1
            );

        }

        /***********************************************************
        find the MPEG audio decoder
        ***********************************************************/
        codec = avcodec_find_decoder (
            AV_CODEC_ID_MP2
        );

        if (
            !codec
        ) {
            fprintf (
                stderr,
                "Codec not found\n"
            );

            exit (
                1
            );

        }

        parser = av_parser_init (
            codec.id
        );

        if (
            !parser
        ) {
            fprintf (
                stderr,
                "Parser not found\n"
            );

            exit (
                1
            );

        }

        codec_context = avcodec_alloc_context3 (
            codec
        );

        if (
            !codec_context
        ) {
            fprintf (
                stderr,
                "Could not allocate audio codec context\n"
            );

            exit (
                1
            );

        }

        /***********************************************************
        open it
        ***********************************************************/
        if (
            avcodec_open2 (
                codec_context,
                codec,
                null
            ) < 0
        ) {
            fprintf (
                stderr,
                "Could not open codec\n"
            );

            exit (
                1
            );

        }

        file = fopen (
            filename,
            "rb"
        );

        if (
            !file
        ) {
            fprintf (
                stderr,
                "Could not open %s\n",
                filename
            );

            exit (
                1
            );

        }

        outfile = fopen (
            outfilename,
            "wb"
        );

        if (
            !outfile
        ) {
            fprintf (
                stderr,
                "Could not open %s\n",
                outfilename
            );

            exit (
                1
            );

        }

        /***********************************************************
        decode until eof
        ***********************************************************/
        data = inbuf;
        data_size = fread (
            inbuf,
            1,
            AUDIO_INBUF_SIZE,
            file
        );

        while (
            data_size > 0
        ) {
            if (
                !decoded_frame
            ) {
                decoded_frame = av_frame_alloc ();
                if (
                    decoded_frame == null
                ) {
                    fprintf (
                        stderr,
                        "Could not allocate audio frame\n"
                    );

                    exit (
                        1
                    );

                }

            }

            ret = av_parser_parse2 (
                parser,
                codec_context,
                &pkt.data,
                &pkt.size,
                data,
                data_size,
                AV_NOPTS_VALUE,
                AV_NOPTS_VALUE,
                0
            );

            if (
                ret < 0
            ) {
                fprintf (
                    stderr,
                    "Error while parsing\n"
                );

                exit (
                    1
                );

            }

            data      += ret;
            data_size -= ret;

            if (
                pkt.size
            ) {
                decode (
                    codec_context,
                    pkt,
                    decoded_frame,
                    outfile
                );

            }

            if (
                data_size < AUDIO_REFILL_THRESH
            ) {
                memmove (
                    inbuf,
                    data,
                    data_size
                );

                data = inbuf;
                len = fread (
                    data + data_size,
                    1,
                    AUDIO_INBUF_SIZE - data_size,
                    file
                );

                if (
                    len > 0
                ) {
                    data_size += len;
                }

            }

        }

        /***********************************************************
        flush the decoder
        ***********************************************************/
        pkt.data = null;
        pkt.size = 0;
        decode (
            codec_context,
            pkt,
            decoded_frame,
            outfile
        );

        /***********************************************************
        print output pcm infomations, because there have no metadata of pcm
        ***********************************************************/
        sfmt = codec_context.sample_fmt;

        if (
            av_sample_fmt_is_planar (
                sfmt
            )
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

        }

        n_channels = codec_context.ch_layout.nb_channels;
        ret = get_format_from_sample_fmt (
            &fmt,
            sfmt
        );

        if (
            ret < 0
        ) {
            throw new Goto.END (
                ""
            );

        }

        printf (
            "Play the output audio file with the command:\n" +
            "ffplay -f %s -ac %d -ar %d %s\n",
            fmt,
            n_channels,
            codec_context.sample_rate,
            outfilename
        );

    //  end:
        fclose (
            outfile
        );

        fclose (
            file
        );

        avcodec_free_context (
            &codec_context
        );

        av_parser_close (
            parser
        );

        av_frame_free (
            &decoded_frame
        );

        av_packet_free (
            &pkt
        );

        return 0;
    }

}
