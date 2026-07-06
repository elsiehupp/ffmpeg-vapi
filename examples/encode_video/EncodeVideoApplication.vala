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
@file libavcodec encoding video API usage example
@example encode_video.c

Generate synthetic video data and encode it to an output file.
***********************************************************/

//#include <stdio.h>
//#include <stdlib.h>
//#include <string.h>

//#include <libavcodec/avcodec.h>

//#include <libavutil/opt.h>
//#include <libavutil/imgutils.h>

private class EncodeVideoApplication : GLib.Application {

    private static void encode (
        AVCodecContext? enc_ctx,
        AVFrame? frame,
        AVPacket? pkt,
        FILE? outfile
    ) {
        int ret;

        /***********************************************************
        send the frame to the encoder
        ***********************************************************/
        if (
            frame
        ) {
            printf (
                "Send frame %3PRId64\n",
                frame.pts
            );

        }

        ret = avcodec_send_frame (
            enc_ctx, frame
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Error sending a frame for encoding\n"
            );

            exit (
                1
            );

        }

        while (
            ret >= 0
        ) {
            ret = avcodec_receive_packet (
            enc_ctx, pkt
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
                    "Error during encoding\n"
                );

                exit (
                    1
                );

            }

            printf (
                "Write packet %3PRId64 (
                    size=%5d)\n",
                pkt.pts,
                pkt.size
            );

            fwrite (
                pkt.data, 1, pkt.size, outfile
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
        string codec_name;
        AVCodec? codec;
        AVCodecContext? codec_context = null;
        int i, ret, x, y;
        FILE? file;
        AVFrame? frame;
        AVPacket? pkt;
        uint8 endcode[] = { 0, 0, 1, 0xb7 };

        if (
            argc <= 2
        ) {
            fprintf (
                stderr,
                "Usage: %s <output file> <codec name>\n",
                argv[0]
            );

            exit (
                0
            );

        }

        filename = argv[1];
        codec_name = argv[2];

        /***********************************************************
        find the mpeg1video encoder
        ***********************************************************/
        codec = avcodec_find_encoder_by_name (
            codec_name
        );

        if (
            !codec
        ) {
            fprintf (
                stderr,
                "Codec '%s' not found\n",
                codec_name
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
                "Could not allocate video codec context\n"
            );

            exit (
                1
            );

        }

        pkt = av_packet_alloc ();
        if (
            !pkt
        ) {
            exit (
                1
            );

        }

        /***********************************************************
        put sample parameters
        ***********************************************************/
        codec_context.bit_rate = 400000;
        /***********************************************************
        resolution must be a multiple of two
        ***********************************************************/
        codec_context.width = 352;
        codec_context.height = 288;
        /***********************************************************
        frames per second
        ***********************************************************/
        codec_context.time_base = new LibAVUtil.Rational () {numerator = 1, denominator = 25};
        codec_context.framerate = new LibAVUtil.Rational () {numerator = 25, denominator = 1};

        /***********************************************************
        emit one intra frame every ten frames
        check frame pict_type before passing frame
        to encoder, if frame.pict_type is AV_PICTURE_TYPE_I
        then gop_size is ignored and the output of encoder
        will always be I frame irrespective to gop_size
        ***********************************************************/
        codec_context.gop_size = 10;
        codec_context.max_b_frames = 1;
        codec_context.pix_fmt = LibAVUtil.PixelFormat.YUV420P;

        if (
            codec.id == AV_CODEC_ID_H264
        ) {
            av_opt_set (
                codec_context.priv_data, "preset", "slow", 0
            );

        }

        /***********************************************************
        open it
        ***********************************************************/
        ret = avcodec_open2 (
            codec_context, codec, null
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Could not open codec: %s\n",
                av_err2str (
                    ret)
            );

            exit (
                1
            );

        }

        file = fopen (
            filename, "wb"
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

        frame = av_frame_alloc ();
        if (
            !frame
        ) {
            fprintf (
                stderr,
                "Could not allocate video frame\n"
            );

            exit (
                1
            );

        }

        frame.format = codec_context.pix_fmt;
        frame.width = codec_context.width;
        frame.height = codec_context.height;

        ret = av_frame_get_buffer (
            frame, 0
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Could not allocate the video frame data\n"
            );

            exit (
                1
            );

        }

        /***********************************************************
        encode 1 second of video
        ***********************************************************/
        for (
            i = 0;
            i < 25;
            i++
        ) {
            fflush (
                stdout
            );

            /***********************************************************
            Make sure the frame data is writable.
            On the first round, the frame is fresh from av_frame_get_buffer ()
            and therefore we know it is writable.
            But on the next rounds, encode () will have called
            avcodec_send_frame (), and the codec may have kept a reference to
            the frame in its internal structures, that makes the frame
            unwritable.
            av_frame_make_writable () checks that and allocates a new buffer
            for the frame only if necessary.
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

            /***********************************************************
            Prepare a dummy image.
            In real code, this is where you would have your own logic for
            filling the frame. FFmpeg does not care what you put in the
            frame.
            ***********************************************************/
            /***********************************************************
            Y
            ***********************************************************/
            for (
                y = 0;
                y < codec_context.height;
                y++
            ) {
                for (
                    x = 0;
                    x < codec_context.width;
                    x++
                ) {
                    frame.data[0][y * frame.linesize[0] + x] = x + y + i * 3;
                }

            }

            /***********************************************************
            Cb and Cr
            ***********************************************************/
            for (
                y = 0;
                y < codec_context.height / 2;
                y++
            ) {
                for (
                    x = 0;
                    x < codec_context.width / 2;
                    x++
                ) {
                    frame.data[1][y * frame.linesize[1] + x] = 128 + y + i * 2;
                    frame.data[2][y * frame.linesize[2] + x] = 64 + x + i * 5;
                }

            }

            frame.pts = i;

            /***********************************************************
            encode the image
            ***********************************************************/
            encode (
                codec_context, frame, pkt, file
            );

        }

        /***********************************************************
        flush the encoder
        ***********************************************************/
        encode (
            codec_context, null, pkt, file
        );

        /***********************************************************
        Add sequence end code to have a real MPEG file.
        It makes only sense because this tiny examples writes packets
        directly. This is called "elementary stream" and only works for some
        codecs. To create a valid file, you usually need to write packets
        into a proper file format or protocol; see mux.c.
        ***********************************************************/
        if (
            codec.id == AV_CODEC_ID_MPEG1VIDEO ||
            codec.id == AV_CODEC_ID_MPEG2VIDEO
        ) {
            fwrite (
                endcode, 1, sizeof (
                    endcode), file
            );

        }

        fclose (
            file
        );

        avcodec_free_context (
            &codec_context
        );

        av_frame_free (
            &frame
        );

        av_packet_free (
            &pkt
        );

        return 0;
    }

}
