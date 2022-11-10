/***********************************************************
MOV, 3GP, MP4 muxer
@copyright 2003 Thomas Raivio
@copyright 2004 Gildas Bazin <gbazin at videolan dot org>
@copyright 2009 Baptiste Coudurier <baptiste dot coudurier at gmail dot com>
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
//      { "movflags", "MOV muxer flags", offsetof(MOVMuxContext, flags), AV_OPT_TYPE_FLAGS, {.i64 = 0}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "rtphint", "Add RTP hint tracks", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_RTP_HINT}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "moov_size", "maximum moov size so it can be placed at the begin", offsetof(MOVMuxContext, reserved_moov_size), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, 0 },
//      { "empty_moov", "Make the initial moov atom empty", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_EMPTY_MOOV}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "frag_keyframe", "Fragment at video keyframes", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_FRAG_KEYFRAME}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "frag_every_frame", "Fragment at every frame", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_FRAG_EVERY_FRAME}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "separate_moof", "Write separate moof/mdat atoms for each track", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_SEPARATE_MOOF}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "frag_custom", "Flush fragments on caller requests", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_FRAG_CUSTOM}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "isml", "Create a live smooth streaming feed (for pushing to a publishing point)", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_ISML}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "faststart", "Run a second pass to put the index (moov atom) at the beginning of the file", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_FASTSTART}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "omit_tfhd_offset", "Omit the base data offset in tfhd atoms", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_OMIT_TFHD_OFFSET}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "disable_chpl", "Disable Nero chapter atom", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_DISABLE_CHPL}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "default_base_moof", "Set the default-base-is-moof flag in tfhd atoms", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_DEFAULT_BASE_MOOF}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "dash", "Write DASH compatible fragmented MP4", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_DASH}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "frag_discont", "Signal that the next fragment is discontinuous from earlier ones", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_FRAG_DISCONT}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "delay_moov", "Delay writing the initial moov until the first fragment is cut, or until the first fragment flush", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_DELAY_MOOV}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "global_sidx", "Write a global sidx index at the start of the file", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_GLOBAL_SIDX}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "skip_sidx", "Skip writing of sidx atom", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_SKIP_SIDX}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "write_colr", "Write colr atom (Experimental, may be renamed or changed, do not use from scripts)", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_WRITE_COLR}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "write_gama", "Write deprecated gama atom", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_WRITE_GAMA}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "use_metadata_tags", "Use mdta atom for metadata.", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_USE_MDTA}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "skip_trailer", "Skip writing the mfra/tfra/mfro trailer for fragmented files", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_SKIP_TRAILER}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      { "negative_cts_offsets", "Use negative CTS offsets (reducing the need for edit lists)", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_NEGATIVE_CTS_OFFSETS}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "movflags" },
//      FF_RTP_FLAG_OPTS(MOVMuxContext, rtp_flags),
//      { "skip_iods", "Skip writing iods atom.", offsetof(MOVMuxContext, iods_skip), AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},
//      { "iods_audio_profile", "iods audio profile atom.", offsetof(MOVMuxContext, iods_audio_profile), AV_OPT_TYPE_INT, {.i64 = -1}, -1, 255, AV_OPT_FLAG_ENCODING_PARAM},
//      { "iods_video_profile", "iods video profile atom.", offsetof(MOVMuxContext, iods_video_profile), AV_OPT_TYPE_INT, {.i64 = -1}, -1, 255, AV_OPT_FLAG_ENCODING_PARAM},
//      { "frag_duration", "Maximum fragment duration", offsetof(MOVMuxContext, max_fragment_duration), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM},
//      { "min_frag_duration", "Minimum fragment duration", offsetof(MOVMuxContext, min_fragment_duration), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM},
//      { "frag_size", "Maximum fragment size", offsetof(MOVMuxContext, max_fragment_size), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM},
//      { "ism_lookahead", "Number of lookahead entries for ISM files", offsetof(MOVMuxContext, ism_lookahead), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM},
//      { "video_track_timescale", "set timescale of all video tracks", offsetof(MOVMuxContext, video_track_timescale), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM},
//      { "brand",    "Override major brand", offsetof(MOVMuxContext, major_brand),   AV_OPT_TYPE_STRING, {.str = NULL}, .flags = AV_OPT_FLAG_ENCODING_PARAM },
//      { "use_editlist", "use edit list", offsetof(MOVMuxContext, use_editlist), AV_OPT_TYPE_BOOL, {.i64 = -1}, -1, 1, AV_OPT_FLAG_ENCODING_PARAM},
//      { "fragment_index", "Fragment number of the next fragment", offsetof(MOVMuxContext, fragments), AV_OPT_TYPE_INT, {.i64 = 1}, 1, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM},
//      { "mov_gamma", "gamma value for gama atom", offsetof(MOVMuxContext, gamma), AV_OPT_TYPE_FLOAT, {.dbl = 0.0 }, 0.0, 10, AV_OPT_FLAG_ENCODING_PARAM},
//      { "frag_interleave", "Interleave samples within fragments (max number of consecutive samples, lower is tighter interleaving, but with more overhead)", offsetof(MOVMuxContext, frag_interleave), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "encryption_scheme",    "Configures the encryption scheme, allowed values are none, cenc-aes-ctr", offsetof(MOVMuxContext, encryption_scheme_str),   AV_OPT_TYPE_STRING, {.str = NULL}, .flags = AV_OPT_FLAG_ENCODING_PARAM },
//      { "encryption_key", "The media encryption key (hex)", offsetof(MOVMuxContext, encryption_key), AV_OPT_TYPE_BINARY, .flags = AV_OPT_FLAG_ENCODING_PARAM },
//      { "encryption_kid", "The media encryption key identifier (hex)", offsetof(MOVMuxContext, encryption_kid), AV_OPT_TYPE_BINARY, .flags = AV_OPT_FLAG_ENCODING_PARAM },
//      { "use_stream_ids_as_track_ids", "use stream ids as track ids", offsetof(MOVMuxContext, use_stream_ids_as_track_ids), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},
//      { "write_tmcd", "force or disable writing tmcd", offsetof(MOVMuxContext, write_tmcd), AV_OPT_TYPE_BOOL, {.i64 = -1}, -1, 1, AV_OPT_FLAG_ENCODING_PARAM},
//      { "write_prft", "Write producer reference time box with specified time source", offsetof(MOVMuxContext, write_prft), AV_OPT_TYPE_INT, {.i64 = MOV_PRFT_NONE}, 0, MOV_PRFT_NB-1, AV_OPT_FLAG_ENCODING_PARAM, "prft"},
//      { "wallclock", NULL, 0, AV_OPT_TYPE_CONST, {.i64 = MOV_PRFT_SRC_WALLCLOCK}, 0, 0, AV_OPT_FLAG_ENCODING_PARAM, "prft"},
//      { "pts", NULL, 0, AV_OPT_TYPE_CONST, {.i64 = MOV_PRFT_SRC_PTS}, 0, 0, AV_OPT_FLAG_ENCODING_PARAM, "prft"},
//      { "empty_hdlr_name", "write zero-length name string in hdlr atoms within mdia and minf atoms", offsetof(MOVMuxContext, empty_hdlr_name), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},
//      { NULL },
//  }

//  static const AVCodecTag codec_3gp_tags[] = {
//      { LibAVCodec.CodecID.H263,     MKTAG('s','2','6','3') },
//      { LibAVCodec.CodecID.H264,     MKTAG('a','v','c','1') },
//      { LibAVCodec.CodecID.MPEG4,    MKTAG('m','p','4','v') },
//      { LibAVCodec.CodecID.AAC,      MKTAG('m','p','4','a') },
//      { LibAVCodec.CodecID.AMR_NB,   MKTAG('s','a','m','r') },
//      { LibAVCodec.CodecID.AMR_WB,   MKTAG('s','a','w','b') },
//      { LibAVCodec.CodecID.MOV_TEXT, MKTAG('t','x','3','g') },
//      { LibAVCodec.CodecID.NONE, 0 },
//  }

//  const AVCodecTag codec_mp4_tags[] = {
//      { LibAVCodec.CodecID.MPEG4       , MKTAG('m', 'p', '4', 'v') },
//      { LibAVCodec.CodecID.H264        , MKTAG('a', 'v', 'c', '1') },
//      { LibAVCodec.CodecID.H264        , MKTAG('a', 'v', 'c', '3') },
//      { LibAVCodec.CodecID.HEVC        , MKTAG('h', 'e', 'v', '1') },
//      { LibAVCodec.CodecID.HEVC        , MKTAG('h', 'v', 'c', '1') },
//      { LibAVCodec.CodecID.MPEG2VIDEO  , MKTAG('m', 'p', '4', 'v') },
//      { LibAVCodec.CodecID.MPEG1VIDEO  , MKTAG('m', 'p', '4', 'v') },
//      { LibAVCodec.CodecID.MJPEG       , MKTAG('m', 'p', '4', 'v') },
//      { LibAVCodec.CodecID.PNG         , MKTAG('m', 'p', '4', 'v') },
//      { LibAVCodec.CodecID.JPEG2000    , MKTAG('m', 'p', '4', 'v') },
//      { LibAVCodec.CodecID.VC1         , MKTAG('v', 'c', '-', '1') },
//      { LibAVCodec.CodecID.DIRAC       , MKTAG('d', 'r', 'a', 'c') },
//      { LibAVCodec.CodecID.TSCC2       , MKTAG('m', 'p', '4', 'v') },
//      { LibAVCodec.CodecID.VP9         , MKTAG('v', 'p', '0', '9') },
//      { LibAVCodec.CodecID.AV1         , MKTAG('a', 'v', '0', '1') },
//      { LibAVCodec.CodecID.AAC         , MKTAG('m', 'p', '4', 'a') },
//      { LibAVCodec.CodecID.MP4ALS      , MKTAG('m', 'p', '4', 'a') },
//      { LibAVCodec.CodecID.MP3         , MKTAG('m', 'p', '4', 'a') },
//      { LibAVCodec.CodecID.MP2         , MKTAG('m', 'p', '4', 'a') },
//      { LibAVCodec.CodecID.AC3         , MKTAG('a', 'c', '-', '3') },
//      { LibAVCodec.CodecID.EAC3        , MKTAG('e', 'c', '-', '3') },
//      { LibAVCodec.CodecID.DTS         , MKTAG('m', 'p', '4', 'a') },
//      { LibAVCodec.CodecID.FLAC        , MKTAG('f', 'L', 'a', 'C') },
//      { LibAVCodec.CodecID.OPUS        , MKTAG('O', 'p', 'u', 's') },
//      { LibAVCodec.CodecID.VORBIS      , MKTAG('m', 'p', '4', 'a') },
//      { LibAVCodec.CodecID.QCELP       , MKTAG('m', 'p', '4', 'a') },
//      { LibAVCodec.CodecID.EVRC        , MKTAG('m', 'p', '4', 'a') },
//      { LibAVCodec.CodecID.DVD_SUBTITLE, MKTAG('m', 'p', '4', 's') },
//      { LibAVCodec.CodecID.MOV_TEXT    , MKTAG('t', 'x', '3', 'g') },
//      { LibAVCodec.CodecID.BIN_DATA    , MKTAG('g', 'p', 'm', 'd') },
//      { LibAVCodec.CodecID.NONE        ,    0 },
//  }

//  const AVCodecTag codec_ism_tags[] = {
//      { LibAVCodec.CodecID.WMAPRO      , MKTAG('w', 'm', 'a', ' ') },
//      { LibAVCodec.CodecID.NONE        ,    0 },
//  }

//  static const AVCodecTag codec_ipod_tags[] = {
//      { LibAVCodec.CodecID.H264,     MKTAG('a','v','c','1') },
//      { LibAVCodec.CodecID.MPEG4,    MKTAG('m','p','4','v') },
//      { LibAVCodec.CodecID.AAC,      MKTAG('m','p','4','a') },
//      { LibAVCodec.CodecID.ALAC,     MKTAG('a','l','a','c') },
//      { LibAVCodec.CodecID.AC3,      MKTAG('a','c','-','3') },
//      { LibAVCodec.CodecID.MOV_TEXT, MKTAG('t','x','3','g') },
//      { LibAVCodec.CodecID.MOV_TEXT, MKTAG('t','e','x','t') },
//      { LibAVCodec.CodecID.NONE, 0 },
//  }

//  static const AVCodecTag codec_f4v_tags[] = {
//      { LibAVCodec.CodecID.MP3,    MKTAG('.','m','p','3') },
//      { LibAVCodec.CodecID.AAC,    MKTAG('m','p','4','a') },
//      { LibAVCodec.CodecID.H264,   MKTAG('a','v','c','1') },
//      { LibAVCodec.CodecID.VP6A,   MKTAG('V','P','6','A') },
//      { LibAVCodec.CodecID.VP6F,   MKTAG('V','P','6','F') },
//      { LibAVCodec.CodecID.NONE, 0 },
//  }

#if CONFIG_MOV_MUXER
[CCode (cname="mov_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "mov muxer";
        }
    }
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_mov_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "mov";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "QuickTime / MOV";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "mov";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return CONFIG_LIBX264_ENCODER ? LibAVCodec.CodecID.H264 : LibAVCodec.CodecID.MPEG4;
        }
    }
    [CCode (cname="mov_init", cheader="")]
    public override int init (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="mov_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="mov_free", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    );
    //  .flags = AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE,
    //  .codec_tag = (const AVCodecTag* const []){
    //      ff_codec_movvideo_tags, ff_codec_movaudio_tags, ff_codec_movsubtitle_tags, 0
    //  },
    [CCode (cname="mov_check_bitstream", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = mov_muxer_class,
}
#endif

#if CONFIG_TGP_MUXER
[CCode (cname="tgp_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "tgp muxer";
        }
    }
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_tgp_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "3gp";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "3GP (3GPP file format)";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "3gp";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AMR_NB;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H263;
        }
    }
    [CCode (cname="mov_init", cheader="")]
    public override int init (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="mov_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="mov_free", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    );
    //  .flags = AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE,
    //  .codec_tag = (const AVCodecTag* const []){ codec_3gp_tags, 0 },
    [CCode (cname="mov_check_bitstream", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = tgp_muxer_class,
}
#endif

#if CONFIG_MP4_MUXER
[CCode (cname="mp4_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "mp4 muxer";
        }
    }
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_mp4_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "mp4";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "MP4 (MPEG-4 Part 14)";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "video/mp4";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "mp4";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return CONFIG_LIBX264_ENCODER ? LibAVCodec.CodecID.H264 : LibAVCodec.CodecID.MPEG4;
        }
    }
    [CCode (cname="mov_init", cheader="")]
    public override int init (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="mov_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="mov_free", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    );
    //  .flags = AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE,
    //  .codec_tag = (const AVCodecTag* const []){ codec_mp4_tags, 0 },
    [CCode (cname="mov_check_bitstream", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = mp4_muxer_class,
}
#endif

#if CONFIG_PSP_MUXER
[CCode (cname="psp_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "psp muxer";
        }
    }
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_psp_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "psp";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "PSP MP4 (MPEG-4 Part 14)";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "mp4,psp";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return CONFIG_LIBX264_ENCODER ? LibAVCodec.CodecID.H264 : LibAVCodec.CodecID.MPEG4;
        }
    }
    [CCode (cname="mov_init", cheader="")]
    public override int init (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="mov_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="mov_free", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    );
    //  .flags = AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE,
    //  .codec_tag = (const AVCodecTag* const []){ codec_mp4_tags, 0 },
    [CCode (cname="mov_check_bitstream", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = psp_muxer_class,
}
#endif

#if CONFIG_TG2_MUXER
[CCode (cname="tg2_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "tg2 muxer";
        }
    }
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_tg2_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "3g2";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "3GP2 (3GPP2 file format)";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "3g2";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AMR_NB;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H263;
        }
    }
    [CCode (cname="mov_init", cheader="")]
    public override int init (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="mov_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="mov_free", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    );
    //  .flags = AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE,
    //  .codec_tag = (const AVCodecTag* const []){ codec_3gp_tags, 0 },
    [CCode (cname="mov_check_bitstream", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = tg2_muxer_class,
}
#endif

#if CONFIG_IPOD_MUXER
[CCode (cname="ipod_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "ipod muxer";
        }
    }
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_ipod_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "ipod";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "iPod H.264 MP4 (MPEG-4 Part 14)";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "video/mp4";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "m4v,m4a,m4b";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;
        }
    }
    [CCode (cname="mov_init", cheader="")]
    public override int init (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="mov_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="mov_free", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    );
    //  .flags = AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE,
    //  .codec_tag = (const AVCodecTag* const []){ codec_ipod_tags, 0 },
    [CCode (cname="mov_check_bitstream", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = ipod_muxer_class,
}
#endif

#if CONFIG_ISMV_MUXER
[CCode (cname="ismv_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "ismv muxer";
        }
    }
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_ismv_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "ismv";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "ISMV/ISMA (Smooth Streaming)";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "video/mp4";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "ismv,isma";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;
        }
    }
    [CCode (cname="mov_init", cheader="")]
    public override int init (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="mov_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="mov_free", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    );
    //  .flags = AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE,
    //  .codec_tag = (const AVCodecTag* const []){
    //      codec_mp4_tags, codec_ism_tags, 0 },
    [CCode (cname="mov_check_bitstream", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = ismv_muxer_class,
}
#endif

#if CONFIG_F4V_MUXER
[CCode (cname="f4v_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "f4v muxer";
        }
    }
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_f4v_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "f4v";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "F4V Adobe Flash Video";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "application/f4v";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "f4v";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;
        }
    }
    [CCode (cname="mov_init", cheader="")]
    public override int init (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="mov_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="mov_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="mov_free", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    );
    //  .flags = AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH,
    //  .codec_tag = (const AVCodecTag* const []){ codec_f4v_tags, 0 },
    [CCode (cname="mov_check_bitstream", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = f4v_muxer_class,
}
#endif
