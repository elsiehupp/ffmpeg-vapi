/***********************************************************
@brief FLV muxer
@copyright 2003 The FFmpeg Project
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

[CCode (cname="struct FLVContext", cheader_filename="")]
public struct FLVMuxerPrivateClass { }

//  static const LibAVUtil.Option options[] = {
//      { "flvflags", "FLV muxer flags", offsetof (FLVContext, flags), AV_OPT_TYPE_FLAGS, {.i64 = 0}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "flvflags" },
//      { "aac_seq_header_detect", "Put AAC sequence header based on stream data", 0, AV_OPT_TYPE_CONST, {.i64 = FLV_AAC_SEQ_HEADER_DETECT}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "flvflags" },
//      { "no_sequence_end", "disable sequence end for FLV", 0, AV_OPT_TYPE_CONST, {.i64 = FLV_NO_SEQUENCE_END}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "flvflags" },
//      { "no_metadata", "disable metadata for FLV", 0, AV_OPT_TYPE_CONST, {.i64 = FLV_NO_METADATA}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "flvflags" },
//      { "no_duration_filesize", "disable duration and filesize zero value metadata for FLV", 0, AV_OPT_TYPE_CONST, {.i64 = FLV_NO_DURATION_FILESIZE}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "flvflags" },
//      { "add_keyframe_index", "Add keyframe index metadata", 0, AV_OPT_TYPE_CONST, {.i64 = FLV_ADD_KEYFRAME_INDEX}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "flvflags" },
//      { NULL },
//  }

[CCode (cname="flv_muxer_class", cheader_filename="")]
public class FLVMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "flv muxer";
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

[CCode (cname="ff_flv_muxer", cheader_filename="")]
public class FLVMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "flv";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "FLV (Flash Video)";
        }
    }

    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "video/x-flv";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "flv";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FLVMuxerPrivateClass);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
        #if CONFIG_LIBMP3LAME
            return LibAVCodec.CodecID.MP3;
        #else 
            return LibAVCodec.CodecID.ADPCM_SWF;
        #endif
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.FLV1;
        }
    }

    [CCode (cname="flv_init", cheader_filename="")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="flv_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="flv_write_packet", cheader_filename="")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flv_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flv_check_bitstream", cheader_filename="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .codec_tag = (AVCodecTag[]) {
                    //        flv_video_codec_ids, flv_audio_codec_ids, 0
                    //    },
    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GLOBALHEADER | AVFMT_VARIABLE_FPS | AVFMT_TS_NONSTRICT;
        }
    }
    //  .priv_class = flv_muxer_class,
}

} // namespace LibAVFormat
