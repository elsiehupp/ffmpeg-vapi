/***********************************************************
Matroska muxer
@copyright 2007 David Conrad
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

//  static const AVCodecTag additional_audio_tags[] = {
//      { LibAVCodec.CodecID.ALAC,      0XFFFFFFFF },
//      { LibAVCodec.CodecID.MLP,       0xFFFFFFFF },
//      { LibAVCodec.CodecID.OPUS,      0xFFFFFFFF },
//      { LibAVCodec.CodecID.PCM_S16BE, 0xFFFFFFFF },
//      { LibAVCodec.CodecID.PCM_S24BE, 0xFFFFFFFF },
//      { LibAVCodec.CodecID.PCM_S32BE, 0xFFFFFFFF },
//      { LibAVCodec.CodecID.QDMC,      0xFFFFFFFF },
//      { LibAVCodec.CodecID.QDM2,      0xFFFFFFFF },
//      { LibAVCodec.CodecID.RA_144,    0xFFFFFFFF },
//      { LibAVCodec.CodecID.RA_288,    0xFFFFFFFF },
//      { LibAVCodec.CodecID.COOK,      0xFFFFFFFF },
//      { LibAVCodec.CodecID.TRUEHD,    0xFFFFFFFF },
//      { LibAVCodec.CodecID.NONE,      0xFFFFFFFF }
//  }

//  static const AVCodecTag additional_video_tags[] = {
//      { LibAVCodec.CodecID.RV10,      0xFFFFFFFF },
//      { LibAVCodec.CodecID.RV20,      0xFFFFFFFF },
//      { LibAVCodec.CodecID.RV30,      0xFFFFFFFF },
//      { LibAVCodec.CodecID.NONE,      0xFFFFFFFF }
//  }

//  static const AVCodecTag additional_subtitle_tags[] = {
//      { LibAVCodec.CodecID.DVB_SUBTITLE,      0xFFFFFFFF },
//      { LibAVCodec.CodecID.DVD_SUBTITLE,      0xFFFFFFFF },
//      { LibAVCodec.CodecID.HDMV_PGS_SUBTITLE, 0xFFFFFFFF },
//      { LibAVCodec.CodecID.NONE,              0xFFFFFFFF }
//  }

//  #define OFFSET(x) offsetof(MatroskaMuxContext, x)
//  #define FLAGS AV_OPT_FLAG_ENCODING_PARAM
//  static const AVOption options[] = {
//      { "reserve_index_space", "Reserve a given amount of space (in bytes) at the beginning of the file for the index (cues).", OFFSET(reserve_cues_space), AV_OPT_TYPE_INT,   { .i64 = 0 },   0, INT_MAX,   FLAGS },
//      { "cluster_size_limit",  "Store at most the provided amount of bytes in a cluster. ",                                     OFFSET(cluster_size_limit), AV_OPT_TYPE_INT  , { .i64 = -1 }, -1, INT_MAX,   FLAGS },
//      { "cluster_time_limit",  "Store at most the provided number of milliseconds in a cluster.",                               OFFSET(cluster_time_limit), AV_OPT_TYPE_INT64, { .i64 = -1 }, -1, INT64_MAX, FLAGS },
//      { "dash", "Create a WebM file conforming to WebM DASH specification", OFFSET(is_dash), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, FLAGS },
//      { "dash_track_number", "Track number for the DASH stream", OFFSET(dash_track_number), AV_OPT_TYPE_INT, { .i64 = 1 }, 0, 127, FLAGS },
//      { "live", "Write files assuming it is a live stream.", OFFSET(is_live), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, FLAGS },
//      { "allow_raw_vfw", "allow RAW VFW mode", OFFSET(allow_raw_vfw), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, FLAGS },
//      { "write_crc32", "write a CRC32 element inside every Level 1 element", OFFSET(write_crc), AV_OPT_TYPE_BOOL, { .i64 = 1 }, 0, 1, FLAGS },
//      { NULL },
//  }

#if CONFIG_MATROSKA_MUXER
[CCode (cname="matroska_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "matroska muxer"
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_matroska_muxer", cheader="")]
public class MatroskaOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "matroska"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "Matroska"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "video/x-matroska"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "mkv"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MatroskaMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBVORBIS_ENCODER ? LibAVCodec.CodecID.VORBIS : LibAVCodec.CodecID.AC3;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return CONFIG_LIBX264_ENCODER ? LibAVCodec.CodecID.H264 : LibAVCodec.CodecID.MPEG4;
        }
    }
    [CCode (cname="", cheader="")]
    public override int init (
        AVFormatContext format_context
    ); // = mkv_init,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = mkv_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = mkv_write_flush_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = mkv_write_trailer,
    //  .flags = AVFMT_GLOBALHEADER | AVFMT_VARIABLE_FPS |
    //                       AVFMT_TS_NONSTRICT | AVFMT_ALLOW_FLUSH,
    //  .codec_tag = (const AVCodecTag* const []){
    //       ff_codec_bmp_tags, ff_codec_wav_tags,
    //       additional_audio_tags, additional_video_tags, additional_subtitle_tags, 0
    //  },
    //  .subtitle_codec = LibAVCodec.CodecID.ASS,
    [CCode (cname="", cheader="")]
    public override int query_codec (
        LibAVCodec.CodecID id,
        int std_compliance
    ); // = mkv_query_codec,
    [CCode (cname="", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = mkv_check_bitstream,
    //  .priv_class = matroska_class,
}
#endif

#if CONFIG_WEBM_MUXER
[CCode (cname="webm_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "webm muxer"
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_webm_muxer", cheader="")]
public class WebMOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "webm"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "WebM"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "video/webm"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "webm"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MatroskaMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBOPUS_ENCODER ? LibAVCodec.CodecID.OPUS : LibAVCodec.CodecID.VORBIS;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return CONFIG_LIBVPX_VP9_ENCODER ? LibAVCodec.CodecID.VP9 : LibAVCodec.CodecID.VP8;
        }
    }
    //  .subtitle_codec = LibAVCodec.CodecID.WEBVTT,
    [CCode (cname="", cheader="")]
    public override int init (
        AVFormatContext format_context
    ); // = mkv_init,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = mkv_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = mkv_write_flush_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = mkv_write_trailer,
    [CCode (cname="", cheader="")]
    public override int query_codec (
        LibAVCodec.CodecID id,
        int std_compliance
    ); // = webm_query_codec,
    [CCode (cname="", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = mkv_check_bitstream,
    //  .flags = AVFMT_GLOBALHEADER | AVFMT_VARIABLE_FPS |
                         AVFMT_TS_NONSTRICT | AVFMT_ALLOW_FLUSH,
    //  .priv_class = webm_class,
}
#endif

#if CONFIG_MATROSKA_AUDIO_MUXER
[CCode (cname="mka_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "matroska audio muxer"
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}
public class OutputMuxer : AVOutputFormat ff_matroska_audio_muxer = {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "matroska"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "Matroska Audio"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "audio/x-matroska"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "mka"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MatroskaMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBVORBIS_ENCODER ?
                         LibAVCodec.CodecID.VORBIS : LibAVCodec.CodecID.AC3;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int init (
        AVFormatContext format_context
    ); // = mkv_init,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = mkv_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = mkv_write_flush_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = mkv_write_trailer,
    [CCode (cname="", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = mkv_check_bitstream,
    //  .flags = AVFMT_GLOBALHEADER | AVFMT_TS_NONSTRICT |
                         AVFMT_ALLOW_FLUSH,
    //  .codec_tag = (const AVCodecTag* const []){
        ff_codec_wav_tags, additional_audio_tags, 0
    },
    //  .priv_class = mka_class,
}
#endif
