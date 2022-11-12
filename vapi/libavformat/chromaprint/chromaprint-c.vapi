/***********************************************************
@brief Chromaprint fingerprinting muxer
@copyright 2015 Rodger Combs
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

namespace LibAVFormat {

//  #define OFFSET (x) offsetof (ChromaprintMuxContext, x)
//  #define FLAGS AV_OPT_FLAG_ENCODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      { "silence_threshold", "threshold for detecting silence", OFFSET (silence_threshold), AV_OPT_TYPE_INT, { .i64 = -1 }, -1, 32767, FLAGS },
//      { "algorithm", "version of the fingerprint algorithm", OFFSET (algorithm), AV_OPT_TYPE_INT, { .i64 = CHROMAPRINT_ALGORITHM_DEFAULT }, CHROMAPRINT_ALGORITHM_TEST1, INT_MAX, FLAGS },
//      { "fp_format", "fingerprint format to write", OFFSET (fp_format), AV_OPT_TYPE_INT, { .i64 = FINGERPRINT_BASE64 }, FINGERPRINT_RAW, FINGERPRINT_BASE64, FLAGS },
//      { "raw", "binary raw fingerprint", 0, AV_OPT_TYPE_CONST, {.i64 = FINGERPRINT_RAW }, INT_MIN, INT_MAX, FLAGS, "fp_format"},
//      { "compressed", "binary compressed fingerprint", 0, AV_OPT_TYPE_CONST, {.i64 = FINGERPRINT_COMPRESSED }, INT_MIN, INT_MAX, FLAGS, "fp_format"},
//      { "base64", "Base64 compressed fingerprint", 0, AV_OPT_TYPE_CONST, {.i64 = FINGERPRINT_BASE64 }, INT_MIN, INT_MAX, FLAGS, "fp_format"},
//      { NULL },
//  }

[CCode (cname="chromaprint_class", cheader_filename="")]
public class ChromaPrintMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "chromaprint muxer";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="struct ChromaprintMuxContext", cheader_filename="")]
public struct ChromaPrintMuxerPrivateData { }

[CCode (cname="ff_chromaprint_muxer", cheader_filename="")]
public class ChromaPrintMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "chromaprint";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Chromaprint";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ChromaPrintMuxerPrivateData);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
        #if AV_HAVE_BIGENDIAN
            return LibAVCodec.CodecID.PCM_S16BE;
        #else
            return LibAVCodec.CodecID.PCM_S16LE;
        #endif
        }
    }

    [CCode (cname="write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="write_packet", cheader_filename="")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOTIMESTAMPS;
        }
    }
    //  .priv_class = chromaprint_class,
}

} // namespace LibAVFormat
