/***********************************************************
Chromaprint fingerprinting muxer
@copyright 2015 Rodger Combs
***********************************************************/
/***********************************************************
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

//  #define OFFSET(x) offsetof(ChromaprintMuxContext, x)
//  #define FLAGS AV_OPT_FLAG_ENCODING_PARAM
//  static const AVOption options[] = {
//      { "silence_threshold", "threshold for detecting silence", OFFSET(silence_threshold), AV_OPT_TYPE_INT, { .i64 = -1 }, -1, 32767, FLAGS },
//      { "algorithm", "version of the fingerprint algorithm", OFFSET(algorithm), AV_OPT_TYPE_INT, { .i64 = CHROMAPRINT_ALGORITHM_DEFAULT }, CHROMAPRINT_ALGORITHM_TEST1, INT_MAX, FLAGS },
//      { "fp_format", "fingerprint format to write", OFFSET(fp_format), AV_OPT_TYPE_INT, { .i64 = FINGERPRINT_BASE64 }, FINGERPRINT_RAW, FINGERPRINT_BASE64, FLAGS },
//      { "raw", "binary raw fingerprint", 0, AV_OPT_TYPE_CONST, {.i64 = FINGERPRINT_RAW }, INT_MIN, INT_MAX, FLAGS, "fp_format"},
//      { "compressed", "binary compressed fingerprint", 0, AV_OPT_TYPE_CONST, {.i64 = FINGERPRINT_COMPRESSED }, INT_MIN, INT_MAX, FLAGS, "fp_format"},
//      { "base64", "Base64 compressed fingerprint", 0, AV_OPT_TYPE_CONST, {.i64 = FINGERPRINT_BASE64 }, INT_MIN, INT_MAX, FLAGS, "fp_format"},
//      { NULL },
//  }

[CCode (cname="chromaprint_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "chromaprint muxer";
        }
    }
    [CCode (cname="item_name", cheader="")]
    public override string item_name (
        void *class_context
    ) {
        return av_default_item_name (
            class_context
        );
    }
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_chromaprint_muxer", cheader="")]
public class ChromaPrintOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "chromaprint";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Chromaprint";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ChromaprintMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return AV_NE(LibAVCodec.CodecID.PCM_S16BE, LibAVCodec.CodecID.PCM_S16LE);
        }
    }
    [CCode (cname="write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .flags = AVFMT_NOTIMESTAMPS,
    //  .priv_class = chromaprint_class,
}
