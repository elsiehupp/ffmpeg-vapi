/***********************************************************
MXF muxer
@copyright 2008 GUCAS, Zhentan Feng <spyfeng at gmail dot com>
@copyright 2008 Baptiste Coudurier <baptiste dot coudurier at gmail dot com>
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

/***********************************************************
signal_standard, color_siting, store_user_comments, sample rate and klv_fill_key version
fixes sponsored by NOA GmbH
***********************************************************/

/***********************************************************
References
SMPTE 336M KLV Data Encoding Protocol Using Key-Length-Value
SMPTE 377M MXF File Format Specifications
SMPTE 379M MXF Generic Container
SMPTE 381M Mapping MPEG Streams into the MXF Generic Container
SMPTE 422M Mapping JPEG 2000 Codestreams into the MXF Generic Container
SMPTE RP210: SMPTE Metadata Dictionary
SMPTE RP224: Registry of SMPTE Universal Labels
***********************************************************/

//  #define MXF_COMMON_OPTIONS
//      { "signal_standard", "Force/set Signal Standard",
//        offsetof(MXFContext, signal_standard), AV_OPT_TYPE_INT, {.i64 = -1}, -1, 7, AV_OPT_FLAG_ENCODING_PARAM, "signal_standard"},
//      { "bt601", "ITU-R BT.601 and BT.656, also SMPTE 125M (525 and 625 line interlaced)",
//        0, AV_OPT_TYPE_CONST, {.i64 = 1}, -1, 7, AV_OPT_FLAG_ENCODING_PARAM, "signal_standard"},
//      { "bt1358", "ITU-R BT.1358 and ITU-R BT.799-3, also SMPTE 293M (525 and 625 line progressive)",
//        0, AV_OPT_TYPE_CONST, {.i64 = 2}, -1, 7, AV_OPT_FLAG_ENCODING_PARAM, "signal_standard"},
//      { "smpte347m", "SMPTE 347M (540 Mbps mappings)",
//        0, AV_OPT_TYPE_CONST, {.i64 = 3}, -1, 7, AV_OPT_FLAG_ENCODING_PARAM, "signal_standard"},
//      { "smpte274m", "SMPTE 274M (1125 line)",
//        0, AV_OPT_TYPE_CONST, {.i64 = 4}, -1, 7, AV_OPT_FLAG_ENCODING_PARAM, "signal_standard"},
//      { "smpte296m", "SMPTE 296M (750 line progressive)",
//        0, AV_OPT_TYPE_CONST, {.i64 = 5}, -1, 7, AV_OPT_FLAG_ENCODING_PARAM, "signal_standard"},
//      { "smpte349m", "SMPTE 349M (1485 Mbps mappings)",
//        0, AV_OPT_TYPE_CONST, {.i64 = 6}, -1, 7, AV_OPT_FLAG_ENCODING_PARAM, "signal_standard"},
//      { "smpte428", "SMPTE 428-1 DCDM",
//        0, AV_OPT_TYPE_CONST, {.i64 = 7}, -1, 7, AV_OPT_FLAG_ENCODING_PARAM, "signal_standard"},



//  static const AVOption mxf_options[] = {
//      MXF_COMMON_OPTIONS
//      { "store_user_comments", ""
//        offsetof(MXFContext, store_user_comments), AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},
//      { NULL },
//  }

[CCode (cname="mxf_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "MXF muxer"
    //  .item_name = av_default_item_name,
    //  .option = mxf_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

//  static const AVOption d10_options[] = {
//      { "d10_channelcount", "Force/set channelcount in generic sound essence descriptor"
//        offsetof(MXFContext, channel_count), AV_OPT_TYPE_INT, {.i64 = -1}, -1, 8, AV_OPT_FLAG_ENCODING_PARAM},
//      MXF_COMMON_OPTIONS
//      { "store_user_comments", ""
//        offsetof(MXFContext, store_user_comments), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},
//      { NULL },
//  }

[CCode (cname="mxf_d10_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "MXF-D10 muxer"
    //  .item_name = av_default_item_name,
    //  .option = d10_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

//  static const AVOption opatom_options[] = {
//      { "mxf_audio_edit_rate", "Audio edit rate for timecode"
//          offsetof(MXFContext, audio_edit_rate), AV_OPT_TYPE_RATIONAL, {.dbl=25}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      MXF_COMMON_OPTIONS
//      { "store_user_comments", ""
//        offsetof(MXFContext, store_user_comments), AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},
//      { NULL },
//  }

[CCode (cname="mxf_opatom_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "MXF-OPAtom muxer"
    //  .item_name = av_default_item_name,
    //  .option = opatom_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_mxf_muxer", cheader="")]
public class MXFOPATOMOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "mxf"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "MXF (Material eXchange Format)"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "application/mxf"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "mxf"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MXFContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG2VIDEO;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = mxf_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = mxf_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = mxf_write_footer,
    //  .flags = AVFMT_NOTIMESTAMPS,
    [CCode (cname="", cheader="")]
    public override int interleave_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet output,
        LibAVCodec.Packet input,
        int flush
    ); // = mxf_interleave,
    //  .priv_class = mxf_muxer_class,
}

[CCode (cname="ff_mxf_d10_muxer", cheader="")]
public class MXFD10OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "mxf_d10"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "MXF (Material eXchange Format) D-10 Mapping"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "application/mxf"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MXFContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG2VIDEO;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = mxf_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = mxf_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = mxf_write_footer,
    //  .flags = AVFMT_NOTIMESTAMPS,
    [CCode (cname="", cheader="")]
    public override int interleave_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet output,
        LibAVCodec.Packet input,
        int flush
    ); // = mxf_interleave,
    //  .priv_class = mxf_d10_muxer_class,
}

[CCode (cname="ff_mxf_opatom_muxer", cheader="")]
public class MXFOutputMuxer : AVOutputFormat ff_mxf_opatom_muxer = {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "mxf_opatom"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "MXF (Material eXchange Format) Operational Pattern Atom"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "application/mxf"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "mxf"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MXFContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.DNXHD;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = mxf_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = mxf_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = mxf_write_footer,
    //  .flags = AVFMT_NOTIMESTAMPS,
    [CCode (cname="", cheader="")]
    public override int interleave_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet output,
        LibAVCodec.Packet input,
        int flush
    ); // = mxf_interleave,
    //  .priv_class = mxf_opatom_muxer_class,
}
