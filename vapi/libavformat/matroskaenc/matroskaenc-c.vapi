/***********************************************************
@brief Matroska muxer
@copyright 2007 David Conrad
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

//  #define OFFSET (x) offsetof (MatroskaMuxContext, x)
//  #define FLAGS AV_OPT_FLAG_ENCODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      { "reserve_index_space", "Reserve a given amount of space (in bytes) at the beginning of the file for the index (cues).", OFFSET (reserve_cues_space), AV_OPT_TYPE_INT,   { .i64 = 0 },   0, INT_MAX,   FLAGS },
//      { "cluster_size_limit",  "Store at most the provided amount of bytes in a cluster. ",                                     OFFSET (cluster_size_limit), AV_OPT_TYPE_INT  , { .i64 = -1 }, -1, INT_MAX,   FLAGS },
//      { "cluster_time_limit",  "Store at most the provided number of milliseconds in a cluster.",                               OFFSET (cluster_time_limit), AV_OPT_TYPE_INT64, { .i64 = -1 }, -1, INT64_MAX, FLAGS },
//      { "dash", "Create a WebM file conforming to WebM DASH specification", OFFSET (is_dash), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, FLAGS },
//      { "dash_track_number", "Track number for the DASH stream", OFFSET (dash_track_number), AV_OPT_TYPE_INT, { .i64 = 1 }, 0, 127, FLAGS },
//      { "live", "Write files assuming it is a live stream.", OFFSET (is_live), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, FLAGS },
//      { "allow_raw_vfw", "allow RAW VFW mode", OFFSET (allow_raw_vfw), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, FLAGS },
//      { "write_crc32", "write a CRC32 element inside every Level 1 element", OFFSET (write_crc), AV_OPT_TYPE_BOOL, { .i64 = 1 }, 0, 1, FLAGS },
//      { NULL },
//  }

#if CONFIG_MATROSKA_MUXER
[CCode (cname="matroska_class", cheader_filename="")]
public class MatroskaMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "matroska muxer";
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

[CCode (cname="ff_matroska_muxer", cheader_filename="")]
public class MatroskaMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "matroska";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Matroska";
        }
    }

    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "video/x-matroska";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "mkv";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MatroskaMuxContext);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBVORBIS_ENCODER ? LibAVCodec.CodecID.VORBIS : LibAVCodec.CodecID.AC3;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return CONFIG_LIBX264_ENCODER ? LibAVCodec.CodecID.H264 : LibAVCodec.CodecID.MPEG4;
        }
    }

    [CCode (cname="mkv_init", cheader_filename="")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="mkv_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mkv_write_flush_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mkv_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GLOBALHEADER | AVFMT_VARIABLE_FPS | AVFMT_TS_NONSTRICT | AVFMT_ALLOW_FLUSH;
        }
    }
    //  .codec_tag = (AVCodecTag[]){
    //       ff_codec_bmp_tags, ff_codec_wav_tags,
    //       additional_audio_tags, additional_video_tags, additional_subtitle_tags, 0
    //  },
    [CCode (cname="subtitle_codec", cheader_filename="")]
    public override LibAVCodec.CodecID subtitle_codec {
        public get {
            return LibAVCodec.CodecID.ASS;
        }
    }

    [CCode (cname="mkv_query_codec", cheader_filename="")]
    public override int query_codec (
        LibAVCodec.CodecID id,
        int std_compliance
    );

    [CCode (cname="mkv_check_bitstream", cheader_filename="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = matroska_class,
}
#endif

#if CONFIG_WEBM_MUXER
[CCode (cname="webm_class", cheader_filename="")]
public class WebMMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "webm muxer";
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

[CCode (cname="ff_webm_muxer", cheader_filename="")]
public class WebMMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "webm";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "WebM";
        }
    }

    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "video/webm";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "webm";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MatroskaMuxContext);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBOPUS_ENCODER ? LibAVCodec.CodecID.OPUS : LibAVCodec.CodecID.VORBIS;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return CONFIG_LIBVPX_VP9_ENCODER ? LibAVCodec.CodecID.VP9 : LibAVCodec.CodecID.VP8;
        }
    }

    [CCode (cname="subtitle_codec", cheader_filename="")]
    public override LibAVCodec.CodecID subtitle_codec {
        public get {
            return LibAVCodec.CodecID.WEBVTT;
        }
    }

    [CCode (cname="mkv_init", cheader_filename="")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="mkv_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mkv_write_flush_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mkv_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="webm_query_codec", cheader_filename="")]
    public override int query_codec (
        LibAVCodec.CodecID id,
        int std_compliance
    );

    [CCode (cname="mkv_check_bitstream", cheader_filename="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GLOBALHEADER | AVFMT_VARIABLE_FPS | AVFMT_TS_NONSTRICT | AVFMT_ALLOW_FLUSH;
        }
    }
    //  .priv_class = webm_class,
}
#endif

#if CONFIG_MATROSKA_AUDIO_MUXER
[CCode (cname="mka_class", cheader_filename="")]
public class MatroskaAudioMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "matroska audio muxer";
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

[CCode (cname="ff_matroska_audio_muxer", cheader_filename="")]
public class MatroskaAudioMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "matroska";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Matroska Audio";
        }
    }

    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "audio/x-matroska";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "mka";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MatroskaMuxContext);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBVORBIS_ENCODER ?
                         LibAVCodec.CodecID.VORBIS : LibAVCodec.CodecID.AC3;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }

    [CCode (cname="mkv_init", cheader_filename="")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="mkv_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mkv_write_flush_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mkv_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="mkv_check_bitstream", cheader_filename="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GLOBALHEADER | AVFMT_TS_NONSTRICT | AVFMT_ALLOW_FLUSH;
        }
    }
    //  .codec_tag = (AVCodecTag[]){
    //      ff_codec_wav_tags, additional_audio_tags, 0
    //  },
    //  .priv_class = mka_class,
}
#endif

} // namespace LibAVFormat
