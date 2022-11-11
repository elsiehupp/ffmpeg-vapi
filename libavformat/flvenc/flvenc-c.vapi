/***********************************************************
FLV muxer
@copyright 2003 The FFmpeg Project
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

//  static const AVOption options[] = {
//      { "flvflags", "FLV muxer flags", offsetof(FLVContext, flags), AV_OPT_TYPE_FLAGS, {.i64 = 0}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "flvflags" },
//      { "aac_seq_header_detect", "Put AAC sequence header based on stream data", 0, AV_OPT_TYPE_CONST, {.i64 = FLV_AAC_SEQ_HEADER_DETECT}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "flvflags" },
//      { "no_sequence_end", "disable sequence end for FLV", 0, AV_OPT_TYPE_CONST, {.i64 = FLV_NO_SEQUENCE_END}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "flvflags" },
//      { "no_metadata", "disable metadata for FLV", 0, AV_OPT_TYPE_CONST, {.i64 = FLV_NO_METADATA}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "flvflags" },
//      { "no_duration_filesize", "disable duration and filesize zero value metadata for FLV", 0, AV_OPT_TYPE_CONST, {.i64 = FLV_NO_DURATION_FILESIZE}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "flvflags" },
//      { "add_keyframe_index", "Add keyframe index metadata", 0, AV_OPT_TYPE_CONST, {.i64 = FLV_ADD_KEYFRAME_INDEX}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "flvflags" },
//      { NULL },
//  }

[CCode (cname="flv_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "flv muxer";
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

[CCode (cname="ff_flv_muxer", cheader="")]
public class FLVOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "flv";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "FLV (Flash Video)";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "video/x-flv";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "flv";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FLVContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBMP3LAME ? LibAVCodec.CodecID.MP3 : LibAVCodec.CodecID.ADPCM_SWF;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.FLV1;
        }
    }
    [CCode (cname="flv_init", cheader="")]
    public override int init (
        AVFormatContext format_context
    );
    [CCode (cname="flv_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="flv_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="flv_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="flv_check_bitstream", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .codec_tag = (const AVCodecTag* const []) {
                    //        flv_video_codec_ids, flv_audio_codec_ids, 0
                    //    },
    //  .flags = AVFMT_GLOBALHEADER | AVFMT_VARIABLE_FPS | AVFMT_TS_NONSTRICT,
    //  .priv_class = flv_muxer_class,
}
