/***********************************************************
@copyright 2001 Fabrice Bellard

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software", to deal
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

[CCode (cname="", cheader="")]
public class ApiH264SliceTest : GLib.TestCase {

    const uint MAX_SLICES = 8;

    static uint header = 0;

    static uint64 frame_cnt = 0;

    static uint decode (
        LibAVCodec.CodecContext dec_ctx,
        LibAVUtil.Frame frame,
        LibAVCodec.Packet packet
    ) {
        uint ret = avcodec_send_packet (
            dec_ctx,
            packet
        );
        if (ret < 0) {
            fprintf (stderr, "Error sending a packet for decoding: %s\n", av_err2str (ret));
            return ret;
        }

        while (ret >= 0) {
            LibAVUtil.PixelFormatDescriptor desc;
            char sum[AV_HASH_MAX_SIZE * 2 + 1];
            LibAVUtil.Crypto.HashContext hash;

            ret = avcodec_receive_frame (dec_ctx, frame);
            if (ret == AVERROR (EAGAIN) || ret == AVERROR_EOF) {
                return 0;
            } else if (ret < 0) {
                fprintf (stderr, "Error during decoding: %s\n", av_err2str (ret));
                return ret;
            }

            if (!header) {
                GLib.print (
                    "#format: frame checksums\n" +
                    "#version: 2\n" +
                    "#hash: MD5\n" +
                    "#tb 0: 1/30\n" +
                    "#media_type 0: video\n" +
                    "#codec_id 0: rawvideo\n" +
                    "#dimensions 0: 352x288\n" +
                    "#sar 0: 128/117\n" +
                    "#stream#, dts,        pts, duration,     size, hash\n"
                );
                header = 1;
            }
            desc = av_pix_fmt_desc_get (dec_ctx.pix_fmt);
            if ((ret = av_hash_alloc (out hash, "md5")) < 0) {
                return ret;
            }
            av_hash_init (hash);

            for (uint i = 0; i < frame.height; i++)
                av_hash_update (hash, out frame.data[0][i * frame.linesize[0]], frame.width);
            for (uint i = 0; i < frame.height >> desc.log2_chroma_h; i++)
                av_hash_update (hash, out frame.data[1][i * frame.linesize[1]], frame.width >> desc.log2_chroma_w);
            for (uint i = 0; i < frame.height >> desc.log2_chroma_h; i++)
                av_hash_update (hash, out frame.data[2][i * frame.linesize[2]], frame.width >> desc.log2_chroma_w);

            av_hash_final_hex (hash, sum, av_hash_get_size (hash) * 2 + 1);
            GLib.print ("0, %10ll, %10ll,        1, %8d, %s\n",
                frame_cnt, frame_cnt,
                (frame.width * frame.height + 2 * (frame.height >> desc.log2_chroma_h) * (frame.width >> desc.log2_chroma_w)), sum);
            frame_cnt += 1;
            av_hash_freep (out hash);
        }
        return 0;
    }

    static LibAVCodec.Codec codec = null;
    static LibAVCodec.CodecContext codec_context = null;
    static LibAVUtil.Frame frame = null;
    static uint threads;
    static LibAVCodec.Packet packet;
    static GLib.File file = null;
    static char[] nal = null;
    static uint nals = 0;
    static uint ret = 0;
    static char[] p;

    static uint do_main () throws Goto {

        nal = av_malloc (MAX_SLICES * UINT16_MAX + AV_INPUT_BUFFER_PADDING_SIZE);
        if (nal == null)
            throw new Goto.ERROR ("");
        p = nal;

        if (!(codec = avcodec_find_decoder (LibAVCodec.CodecID.H264))) {
            fprintf (
                stderr,
                "Codec not found\n"
            );
            ret = -1;
            throw new Goto.ERROR ("");
        }

        if (!(codec_context = avcodec_alloc_context3 (codec))) {
            fprintf (
                stderr,
                "Could not allocate video codec context\n"
            );
            ret = -1;
            throw new Goto.ERROR ("");
        }

        codec_context.width = 352;
        codec_context.height = 288;

        codec_context.flags2 |= AV_CODEC_FLAG2_CHUNKS;
        codec_context.thread_type = FF_THREAD_SLICE;
        codec_context.thread_count = threads;

        if ((ret = avcodec_open2 (codec_context, codec, null)) < 0) {
            fprintf (
                stderr,
                "Could not open codec\n"
            );
            throw new Goto.ERROR ("");
        }

    #if HAVE_THREADS
        if (codec_context.active_thread_type != FF_THREAD_SLICE) {
            fprintf (stderr, "Couldn't activate slice threading: %d\n", codec_context.active_thread_type);
            ret = -1;
            throw new Goto.ERROR ("");
        }
    #else
        fprintf (
            stderr,
            "WARN: not using threads, only checking decoding slice NALUs\n"
        );
    #endif

        if (!(frame = av_frame_alloc ())) {
            fprintf (
                stderr,
                "Could not allocate video frame\n"
            );
            ret = -1;
            throw new Goto.ERROR ("");
        }

        if (!(file = fopen (argv[2], "rb"))) {
            fprintf (
                stderr,
                "Couldn't open NALU file: %s\n",
                argv[2]
            );
            ret = -1;
            throw new Goto.ERROR ("");
        }

        while (true) {
            uint16 size = 0;
            size_t ret = fread (out size, 1, sizeof (uint16), file);
            if (ret != sizeof (uint16))
                break;

            size = av_be2ne16 (size);
            ret = fread (p, 1, size, file);
            if (ret != size) {
                perror ("Couldn't read data");
                throw new Goto.ERROR ("");
            }
            p += ret;

            if (++nals >= threads) {
                uint decret = 0;
                packet.data = nal;
                packet.size = p - nal;
                if ((decret = decode (codec_context, frame, packet)) < 0) {
                    throw new Goto.ERROR ("");
                }
                memset (nal, 0, MAX_SLICES * UINT16_MAX + AV_INPUT_BUFFER_PADDING_SIZE);
                nals = 0;
                p = nal;
            }
        }

        if (nals) {
            packet.data = nal;
            packet.size = p - nal;
            if ((ret = decode (codec_context, frame, packet)) < 0) {
                throw new Goto.ERROR ("");
            }
        }

        return decode (codec_context, frame, null);
    }

    static uint main (
        uint argc,
        string[] argv
    ) {
        if (argc < 3) {
            fprintf (stderr, "Usage: %s <threads> <input file>\n", argv[0]);
            return -1;
        }

        if (!(threads = strtoul (argv[1], null, 0)))
            threads = 1;
        else if (threads > MAX_SLICES)
            threads = MAX_SLICES;

    #if _WIN32
        setmode (fileno (stdout), O_BINARY);
    #endif

        if (!(packet = av_packet_alloc ())) {
            return -1;
        }

        try {
            ret = do_main ();
        } catch (Goto ret) {

        }

        if (nal)
            av_free (nal);
        if (file)
            fclose (file);
        av_frame_free (out frame);
        avcodec_free_context (out codec_context);
        av_packet_free (out packet);

        return ret;
    }

}
