/***********************************************************
 Chromaprint fingerprinting muxer
 @copyright 2015 Rodger Combs

 This file is part of FFmpeg.

 FFmpeg is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2.1 of the License, or (at your option) any later version.

 FFmpeg is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public
 License along with FFmpeg; if not, write to the Free Software
 Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

#define OFFSET(x) offsetof(ChromaprintMuxContext, x)
#define FLAGS AV_OPT_FLAG_ENCODING_PARAM
static const AVOption options[] = {
    { "silence_threshold", "threshold for detecting silence", OFFSET(silence_threshold), AV_OPT_TYPE_INT, { .i64 = -1 }, -1, 32767, FLAGS },
    { "algorithm", "version of the fingerprint algorithm", OFFSET(algorithm), AV_OPT_TYPE_INT, { .i64 = CHROMAPRINT_ALGORITHM_DEFAULT }, CHROMAPRINT_ALGORITHM_TEST1, INT_MAX, FLAGS },
    { "fp_format", "fingerprint format to write", OFFSET(fp_format), AV_OPT_TYPE_INT, { .i64 = FINGERPRINT_BASE64 }, FINGERPRINT_RAW, FINGERPRINT_BASE64, FLAGS },
    { "raw", "binary raw fingerprint", 0, AV_OPT_TYPE_CONST, {.i64 = FINGERPRINT_RAW }, INT_MIN, INT_MAX, FLAGS, "fp_format"},
    { "compressed", "binary compressed fingerprint", 0, AV_OPT_TYPE_CONST, {.i64 = FINGERPRINT_COMPRESSED }, INT_MIN, INT_MAX, FLAGS, "fp_format"},
    { "base64", "Base64 compressed fingerprint", 0, AV_OPT_TYPE_CONST, {.i64 = FINGERPRINT_BASE64 }, INT_MIN, INT_MAX, FLAGS, "fp_format"},
    { NULL },
}

static const AVClass chromaprint_class = {
    //  .class_name = "chromaprint muxer",
    //  .item_name  = av_default_item_name,
    //  .option     = options,
    //  .version    = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_chromaprint_muxer = {
    //  .name              = "chromaprint",
    //  .long_name         = "Chromaprint",
    //  .priv_data_size    = sizeof(ChromaprintMuxContext),
    //  .audio_codec       = AV_NE(AV_CODEC_ID_PCM_S16BE, AV_CODEC_ID_PCM_S16LE),
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );     = write_trailer,
    //  .flags             = AVFMT_NOTIMESTAMPS,
    //  .priv_class        = &chromaprint_class,
}
