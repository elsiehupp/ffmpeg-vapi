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
@file libavcodec encoding audio API usage examples
@example encode_audio.c

Generate a synthetic audio signal and encode it to an output MP2 file.
***********************************************************/

//#include <stdint.h>
//#include <stdio.h>
//#include <stdlib.h>

//#include <libavcodec/avcodec.h>

//#include <libavutil/channel_layout.h>
//#include <libavutil/common.h>
//#include <libavutil/frame.h>
//#include <libavutil/samplefmt.h>

private class EncodeAudioApplication : GLib.Application {

    /***********************************************************
    check that a given sample format is supported by the encoder
    ***********************************************************/
    private static bool check_sample_fmt (
        AVCodec? codec,
        LibAVUtil.SampleFormat sample_fmt
    ) {
        LibAVUtil.SampleFormat? p = codec.sample_fmts;

        while (
            *p != LibAVUtil.SampleFormat.NONE
        ) {
            if (
                *p == sample_fmt
            ) {
                return true;
            }

            p++;
        }

        return false;
    }

    /***********************************************************
    just pick the highest supported samplerate
    ***********************************************************/
    private static int select_sample_rate (
        AVCodec? codec
    ) {
        int[] p;
        int best_samplerate = 0;

        if (
            !codec.supported_samplerates
        ) {
            return 44100;
        }

        p = codec.supported_samplerates;
        while (
            *p
        ) {
            if (
                !best_samplerate ||
                abs (
                    44100 - *p
                ) < abs (
                    44100 - best_samplerate
                )
            ) {
                best_samplerate = *p;
            }

            p++;
        }

        return best_samplerate;
    }

    /***********************************************************
    select layout with the highest channel count
    ***********************************************************/
    private static int select_channel_layout (
        AVCodec? codec,
        AVChannelLayout? dst
    ) {
        AVChannelLayout? p;
        AVChannelLayout? best_ch_layout;
        int best_nb_channels = 0;

        if (
            !codec.ch_layouts
        ) {
            return av_channel_layout_copy (
                dst,
                &(AVChannelLayout)AV_CHANNEL_LAYOUT_STEREO
            );

        }

        p = codec.ch_layouts;
        while (
            p.nb_channels
        ) {
            int nb_channels = p.nb_channels;

            if (
                nb_channels > best_nb_channels
            ) {
                best_ch_layout = p;
                best_nb_channels = nb_channels;
            }

            p++;
        }

        return av_channel_layout_copy (
            dst,
            best_ch_layout
        );

    }

    private static void encode (
        LibAVCodec.CodecContext? ctx,
        LibAVFormat.Frame? frame,
        LibAVCodec.Packet? pkt,
        FILE? output
    ) {
        int ret;

        /***********************************************************
        send the frame for encoding
        ***********************************************************/
        ret = avcodec_send_frame (
            ctx,
            frame
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Error sending the frame to the encoder\n"
            );

            exit (
                1
            );

        }

        /***********************************************************
        read all the available output packets (
            in general there may be any
        number of them
        ***********************************************************/
        while (
            ret >= 0
        ) {
            ret = avcodec_receive_packet (
            ctx,
            pkt
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
                    "Error encoding audio frame\n"
                );

                exit (
                    1
                );

            }

            fwrite (
                pkt.data,
                1,
                pkt.size,
                output
            );

            av_packet_unref (
                pkt
            );

        }

    }

    private static int main (
        int argc,
        string[] argv
    ) {
        string filename;
        AVCodec? codec;
        LibAVCodec.CodecContext? codec_context= null;
        LibAVFormat.Frame? frame;
        LibAVCodec.Packet? pkt;
        int i;
        int j;
        int k;
        int ret;
        FILE? file;
        uint16[] samples;
        float t;
        float tincr;

        if (
            argc <= 1
        ) {
            fprintf (
                stderr,
                "Usage: %s <output file>\n",
                argv[0]
            );

            return 0;
        }

        filename = argv[1];

        /***********************************************************
        find the MP2 encoder
        ***********************************************************/
        codec = avcodec_find_encoder (
            LibAVCodec.CodecID.MP2
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
        put sample parameters
        ***********************************************************/
        codec_context.bit_rate = 64000;

        /***********************************************************
        check that the encoder supports s16 pcm input
        ***********************************************************/
        codec_context.sample_fmt = LibAVUtil.SampleFormat.SIGNED_16_BIT;
        if (
            !check_sample_fmt (
                codec,
                codec_context.sample_fmt)
        ) {
            fprintf (
                stderr,
                "Encoder does not support sample format %s",
                    av_get_sample_fmt_name (
                        codec_context.sample_fmt)
            );

            exit (
                1
            );

        }

        /***********************************************************
        select other audio parameters supported by the encoder
        ***********************************************************/
        codec_context.sample_rate = select_sample_rate (
            codec
        );

        ret = select_channel_layout (
            codec,
            &codec_context.ch_layout
        );

        if (
            ret < 0
        ) {
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
            "wb"
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

        /***********************************************************
        packet for holding encoded output
        ***********************************************************/
        pkt = av_packet_alloc ();
        if (
            !pkt
        ) {
            fprintf (
                stderr,
                "could not allocate the packet\n"
            );

            exit (
                1
            );

        }

        /***********************************************************
        frame containing input raw audio
        ***********************************************************/
        frame = av_frame_alloc ();
        if (
            !frame
        ) {
            fprintf (
                stderr,
                "Could not allocate audio frame\n"
            );

            exit (
                1
            );

        }

        frame.nb_samples = codec_context.frame_size;
        frame.format = codec_context.sample_fmt;
        ret = av_channel_layout_copy (
            &frame.ch_layout,
            &codec_context.ch_layout
        );

        if (
            ret < 0
        ) {
            exit (
                1
            );

        }

        /***********************************************************
        allocate the data buffers
        ***********************************************************/
        ret = av_frame_get_buffer (
            frame,
            0
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Could not allocate audio data buffers\n"
            );

            exit (
                1
            );

        }

        /***********************************************************
        encode a single tone sound
        ***********************************************************/
        t = 0;
        tincr = 2 * M_PI * 440.0 / codec_context.sample_rate;
        for (
            i = 0;
            i < 200;
            i++
        ) {
            /***********************************************************
            make sure the frame is writable -- makes a copy if the encoder
            kept a reference internally
            ***********************************************************/
            ret = av_frame_make_writable (
                frame
            );

            if (
                ret < 0
            ) {
                exit (
                    1
                );

            }

            samples = (
                uint16[])frame.data[0];

            for (
                j = 0;
                j < codec_context.frame_size;
                j++
            ) {
                samples[2 * j] = (int)(
                    sin (
                        t
                    ) * 10000
                );

                for (
                    k = 1;
                    k < codec_context.ch_layout.nb_channels;
                    k++
                ) {
                    samples[2*j + k] = samples[2*j];
                }

                t += tincr;
            }

            encode (
                codec_context,
                frame,
                pkt,
                file
            );

        }

        /***********************************************************
        flush the encoder
        ***********************************************************/
        encode (
            codec_context,
            null,
            pkt,
            file
        );

        fclose (
            file
        );

        av_frame_free (
            &frame
        );

        av_packet_free (
            &pkt
        );

        avcodec_free_context (
            &codec_context
        );

        return 0;
    }

}
