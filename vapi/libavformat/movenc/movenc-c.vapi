/***********************************************************
@brief MOV, 3GP, MP4 muxer
@copyright 2003 Thomas Raivio
@copyright 2004 Gildas Bazin <gbazin at videolan dot org>
@copyright 2009 Baptiste Coudurier <baptiste dot coudurier at gmail dot com>
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

static const LibAVUtil.Option options[] = {
    new LibAVUtil.FlagsOption () {
        name = "movflags",
        short_help_text = "MOV muxer flags",
        offsetof (
            MOVMuxContext,
            flags
        ),
        {
            .i64 = 0

        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "rtphint",
        short_help_text = "Add RTP hint tracks",
        0,
        {
            .i64 = FF_MOV_FLAG_RTP_HINT

        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.IntOption () {
        name = "moov_size",
        short_help_text = "maximum moov size so it can be placed at the begin",
        offsetof (
            MOVMuxContext,
            reserved_moov_size
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        0
    },
    new LibAVUtil.ConstOption () {
        name = "empty_moov",
        short_help_text = "Make the initial moov atom empty",
        0,
        {
            .i64 = FF_MOV_FLAG_EMPTY_MOOV

        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "frag_keyframe",
        short_help_text = "Fragment at video keyframes",
        0,
        {
            .i64 = FF_MOV_FLAG_FRAG_KEYFRAME

        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "frag_every_frame",
        short_help_text = "Fragment at every frame",
        0,
        {
            .i64 = FF_MOV_FLAG_FRAG_EVERY_FRAME

        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "separate_moof",
        short_help_text = "Write separate moof/mdat atoms for each track",
        0,
        {
            .i64 = FF_MOV_FLAG_SEPARATE_MOOF

        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "frag_custom",
        short_help_text = "Flush fragments on caller requests",
        0,
        {
            .i64 = FF_MOV_FLAG_FRAG_CUSTOM

        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "isml",
        short_help_text = "Create a live smooth streaming feed (for pushing to a publishing point)",
        0,
        {
            .i64 = FF_MOV_FLAG_ISML

        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "faststart",
        short_help_text = "Run a second pass to put the index (moov atom) at the beginning of the file",
        0,
        {
            .i64 = FF_MOV_FLAG_FASTSTART

        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "omit_tfhd_offset",
        short_help_text = "Omit the base data offset in tfhd atoms",
        0,
        {
            .i64 = FF_MOV_FLAG_OMIT_TFHD_OFFSET
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "disable_chpl",
        short_help_text = "Disable Nero chapter atom",
        0,
        {
            .i64 = FF_MOV_FLAG_DISABLE_CHPL
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "default_base_moof",
        short_help_text = "Set the default-base-is-moof flag in tfhd atoms",
        0,
        {
            .i64 = FF_MOV_FLAG_DEFAULT_BASE_MOOF
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "dash",
        short_help_text = "Write DASH compatible fragmented MP4",
        0,
        {
            .i64 = FF_MOV_FLAG_DASH
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "frag_discont",
        short_help_text = "Signal that the next fragment is discontinuous from earlier ones",
        0,
        {
            .i64 = FF_MOV_FLAG_FRAG_DISCONT
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "delay_moov",
        short_help_text = "Delay writing the initial moov until the first fragment is cut, or until the first fragment flush",
        0,
        {
            .i64 = FF_MOV_FLAG_DELAY_MOOV
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "global_sidx",
        short_help_text = "Write a global sidx index at the start of the file",
        0,
        {
            .i64 = FF_MOV_FLAG_GLOBAL_SIDX
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "skip_sidx",
        short_help_text = "Skip writing of sidx atom",
        0,
        {
            .i64 = FF_MOV_FLAG_SKIP_SIDX
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "write_colr",
        short_help_text = "Write colr atom (Experimental, may be renamed or changed, do not use from scripts)",
        0,
        {
            .i64 = FF_MOV_FLAG_WRITE_COLR
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "write_gama",
        short_help_text = "Write deprecated gama atom",
        0,
        {
            .i64 = FF_MOV_FLAG_WRITE_GAMA
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "use_metadata_tags",
        short_help_text = "Use mdta atom for metadata.",
        0,
        {
            .i64 = FF_MOV_FLAG_USE_MDTA
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "skip_trailer",
        short_help_text = "Skip writing the mfra/tfra/mfro trailer for fragmented files",
        0,
        {
            .i64 = FF_MOV_FLAG_SKIP_TRAILER
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    new LibAVUtil.ConstOption () {
        name = "negative_cts_offsets",
        short_help_text = "Use negative CTS offsets (reducing the need for edit lists)",
        0,
        {
            .i64 = FF_MOV_FLAG_NEGATIVE_CTS_OFFSETS
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "movflags"
    },
    FF_RTP_FLAG_OPTS (
        MOVMuxContext,
        rtp_flags
    ),
    new LibAVUtil.BoolOption () {
        name = "skip_iods",
        short_help_text = "Skip writing iods atom.",
        offsetof (
            MOVMuxContext,
            iods_skip
        ),
        {
            .i64 = 1
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "iods_audio_profile",
        short_help_text = "iods audio profile atom.",
        offsetof (
            MOVMuxContext,
            iods_audio_profile
        ),
        {
            .i64 = -1
        },
        -1,
        255,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "iods_video_profile",
        short_help_text = "iods video profile atom.",
        offsetof (
            MOVMuxContext,
            iods_video_profile
        ),
        {
            .i64 = -1
        },
        -1,
        255,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "frag_duration",
        short_help_text = "Maximum fragment duration",
        offsetof (
            MOVMuxContext,
            max_fragment_duration
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "min_frag_duration",
        short_help_text = "Minimum fragment duration",
        offsetof (
            MOVMuxContext,
            min_fragment_duration
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "frag_size",
        short_help_text = "Maximum fragment size",
        offsetof (
            MOVMuxContext,
            max_fragment_size
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "ism_lookahead",
        short_help_text = "Number of lookahead entries for ISM files",
        offsetof (
            MOVMuxContext,
            ism_lookahead
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "video_track_timescale",
        short_help_text = "set timescale of all video tracks",
        offsetof (
            MOVMuxContext,
            video_track_timescale
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "brand",
        short_help_text = "Override major brand",
        offsetof (
            MOVMuxContext,
            major_brand
        ),
        {
            .str = NULL
        },
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "use_editlist",
        short_help_text = "use edit list",
        offsetof (
            MOVMuxContext,
            use_editlist
        ),
        {
            .i64 = -1
        },
        -1,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "fragment_index",
        short_help_text = "Fragment number of the next fragment",
        offsetof (
            MOVMuxContext,
            fragments
        ),
        {
            .i64 = 1
        },
        1,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.FloatOption () {
        name = "mov_gamma",
        short_help_text = "gamma value for gama atom",
        offsetof (
            MOVMuxContext,
            gamma
        ),
        {
            .dbl = 0.0
        },
        0.0,
        10,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "frag_interleave",
        short_help_text = "Interleave samples within fragments (max number of consecutive samples, lower is tighter interleaving, but with more overhead)",
        offsetof (
            MOVMuxContext,
            frag_interleave
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "encryption_scheme",
        short_help_text = "Configures the encryption scheme, allowed values are none, cenc-aes-ctr",
        offsetof (
            MOVMuxContext,
            encryption_scheme_str
        ),
        {
            .str = NULL
        },
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BinaryOption () {
        name = "encryption_key",
        short_help_text = "The media encryption key (hex)",
        offsetof (
            MOVMuxContext,
            encryption_key
        ),
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BinaryOption () {
        name = "encryption_kid",
        short_help_text = "The media encryption key identifier (hex)",
        offsetof (
            MOVMuxContext,
            encryption_kid
        ),
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "use_stream_ids_as_track_ids",
        short_help_text = "use stream ids as track ids",
        offsetof (
            MOVMuxContext,
            use_stream_ids_as_track_ids
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "write_tmcd",
        short_help_text = "force or disable writing tmcd",
        offsetof (
            MOVMuxContext,
            write_tmcd
        ),
        {
            .i64 = -1
        },
        -1,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "write_prft",
        short_help_text = "Write producer reference time box with specified time source",
        offsetof (
            MOVMuxContext,
            write_prft
        ),
        {
            .i64 = MOV_PRFT_NONE
        },
        0,
        MOV_PRFT_NB-1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "prft"
    },
    new LibAVUtil.ConstOption () {
        name = "wallclock",
        NULL,
        0,
        {
            .i64 = MOV_PRFT_SRC_WALLCLOCK
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "prft"
    },
    new LibAVUtil.ConstOption () {
        name = "pts",
        NULL,
        0,
        {
            .i64 = MOV_PRFT_SRC_PTS
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "prft"
    },
    new LibAVUtil.BoolOption () {
        name = "empty_hdlr_name",
        short_help_text = "write zero-length name string in hdlr atoms within mdia and minf atoms",
        offsetof (
            MOVMuxContext,
            empty_hdlr_name
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

static const AVCodecTag codec_3gp_tags[] = {
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.H263,
        tag = MKTAG (
            's',
            '2',
            '6',
            '3'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.H264,
        tag = MKTAG (
            'a',
            'v',
            'c',
            '1'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.MPEG4,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'v'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.AAC,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'a'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.AMR_NB,
        tag = MKTAG (
            's',
            'a',
            'm',
            'r'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.AMR_WB,
        tag = MKTAG (
            's',
            'a',
            'w',
            'b'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.MOV_TEXT,
        tag = MKTAG (
            't',
            'x',
            '3',
            'g'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.NONE,
        tag = 0
    }

};

const AVCodecTag codec_mp4_tags[] = {
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.MPEG4,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'v'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.H264,
        tag = MKTAG (
            'a',
            'v',
            'c',
            '1'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.H264,
        tag = MKTAG (
            'a',
            'v',
            'c',
            '3'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.HEVC,
        tag = MKTAG (
            'h',
            'e',
            'v',
            '1'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.HEVC,
        tag = MKTAG (
            'h',
            'v',
            'c',
            '1'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.MPEG2VIDEO,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'v'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.MPEG1VIDEO,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'v'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.MJPEG,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'v'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.PNG,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'v'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.JPEG2000,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'v'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.VC1,
        tag = MKTAG (
            'v',
            'c',
            '-',
            '1'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.DIRAC,
        tag = MKTAG (
            'd',
            'r',
            'a',
            'c'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.TSCC2,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'v'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.VP9,
        tag = MKTAG (
            'v',
            'p',
            '0',
            '9'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.AV1,
        tag = MKTAG (
            'a',
            'v',
            '0',
            '1'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.AAC,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'a'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.MP4ALS,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'a'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.MP3,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'a'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.MP2,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'a'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.AC3,
        tag = MKTAG (
            'a',
            'c',
            '-',
            '3'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.EAC3,
        tag = MKTAG (
            'e',
            'c',
            '-',
            '3'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.DTS,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'a'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.FLAC,
        tag = MKTAG (
            'f',
            'L',
            'a',
            'C'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.OPUS,
        tag = MKTAG (
            'O',
            'p',
            'u',
            's'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.VORBIS,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'a'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.QCELP,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'a'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.EVRC,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'a'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.DVD_SUBTITLE,
        tag = MKTAG (
            'm',
            'p',
            '4',
            's'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.MOV_TEXT,
        tag = MKTAG (
            't',
            'x',
            '3',
            'g'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.BIN_DATA,
        tag = MKTAG (
            'g',
            'p',
            'm',
            'd'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.NONE,
        tag = 0
    }

};

const AVCodecTag codec_ism_tags[] = {
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.WMAPRO,
        tag = MKTAG (
            'w',
            'm',
            'a',
            ' '
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.NONE,
        0
    }

};

static const AVCodecTag codec_ipod_tags[] = {
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.H264,
        tag = MKTAG (
            'a',
            'v',
            'c',
            '1'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.MPEG4,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'v'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.AAC,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'a'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.ALAC,
        tag = MKTAG (
            'a',
            'l',
            'a',
            'c'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.AC3,
        tag = MKTAG (
            'a',
            'c',
            '-',
            '3'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.MOV_TEXT,
        tag = MKTAG (
            't',
            'x',
            '3',
            'g'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.MOV_TEXT,
        tag = MKTAG (
            't',
            'e',
            'x',
            't'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.NONE,
        tag = 0
    }

};

static const AVCodecTag codec_f4v_tags[] = {
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.MP3,
        tag = MKTAG (
            '.',
            'm',
            'p',
            '3'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.AAC,
        tag = MKTAG (
            'm',
            'p',
            '4',
            'a'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.H264,
        tag = MKTAG (
            'a',
            'v',
            'c',
            '1'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.VP6A,
        tag = MKTAG (
            'V',
            'P',
            '6',
            'A'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.VP6F,
        tag = MKTAG (
            'V',
            'P',
            '6',
            'F'
        )
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.NONE,
        tag = 0
    }

};

#if CONFIG_MOV_MUXER

[CCode (cname="mov_muxer_class",cheader_filename="ffmpeg/libformat/movenc.c")]
public class MOVMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string class_name {
        public get {
            return "mov muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_mov_muxer",cheader_filename="ffmpeg/libformat/movenc.c")]
public class MOVMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string name {
        public get {
            return "mov";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string long_name {
        public get {
            return "QuickTime / MOV";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string extensions {
        public get {
            return "mov";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return CONFIG_LIBX264_ENCODER ? LibAVCodec.CodecID.H264 : LibAVCodec.CodecID.MPEG4;

        }

    }

    [CCode (cname="mov_init",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_header",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_packet",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mov_write_trailer",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="mov_free",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE;

        }

    }

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                ff_codec_movvideo_tags,
                ff_codec_movaudio_tags,
                ff_codec_movsubtitle_tags,
                0
            };

        }

    }

    [CCode (cname="mov_check_bitstream",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = mov_muxer_class;
}
#endif

#if CONFIG_TGP_MUXER

[CCode (cname="tgp_muxer_class",cheader_filename="ffmpeg/libformat/movenc.c")]
public class TGPMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string class_name {
        public get {
            return "tgp muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_tgp_muxer",cheader_filename="ffmpeg/libformat/movenc.c")]
public class TGPMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string name {
        public get {
            return "3gp";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string long_name {
        public get {
            return "3GP (3GPP file format)";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string extensions {
        public get {
            return "3gp";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AMR_NB;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H263;

        }

    }

    [CCode (cname="mov_init",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_header",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_packet",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mov_write_trailer",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="mov_free",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE;

        }

    }

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                codec_3gp_tags,
                0
            };

        }

    }

    [CCode (cname="mov_check_bitstream",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = tgp_muxer_class;
}
#endif

#if CONFIG_MP4_MUXER

[CCode (cname="mp4_muxer_class",cheader_filename="ffmpeg/libformat/movenc.c")]
public class MP4MuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string class_name {
        public get {
            return "mp4 muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_mp4_muxer",cheader_filename="ffmpeg/libformat/movenc.c")]
public class MP4Muxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string name {
        public get {
            return "mp4";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string long_name {
        public get {
            return "MP4 (MPEG-4 Part 14)";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string mime_type {
        public get {
            return "video/mp4";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string extensions {
        public get {
            return "mp4";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return CONFIG_LIBX264_ENCODER ? LibAVCodec.CodecID.H264 : LibAVCodec.CodecID.MPEG4;

        }

    }

    [CCode (cname="mov_init",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_header",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_packet",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mov_write_trailer",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="mov_free",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE;

        }

    }

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                codec_mp4_tags,
                0
            };

        }

    }

    [CCode (cname="mov_check_bitstream",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = mp4_muxer_class;
}
#endif

#if CONFIG_PSP_MUXER

[CCode (cname="psp_muxer_class",cheader_filename="ffmpeg/libformat/movenc.c")]
public class PSPMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string class_name {
        public get {
            return "psp muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_psp_muxer",cheader_filename="ffmpeg/libformat/movenc.c")]
public class PSPMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string name {
        public get {
            return "psp";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string long_name {
        public get {
            return "PSP MP4 (MPEG-4 Part 14)";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string extensions {
        public get {
            return "mp4,psp";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return CONFIG_LIBX264_ENCODER ? LibAVCodec.CodecID.H264 : LibAVCodec.CodecID.MPEG4;

        }

    }

    [CCode (cname="mov_init",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_header",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_packet",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mov_write_trailer",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="mov_free",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE;

        }

    }

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                codec_mp4_tags,
                0
            };

        }

    }

    [CCode (cname="mov_check_bitstream",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = psp_muxer_class;
}
#endif

#if CONFIG_TG2_MUXER

[CCode (cname="tg2_muxer_class",cheader_filename="ffmpeg/libformat/movenc.c")]
public class TG2MuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string class_name {
        public get {
            return "tg2 muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_tg2_muxer",cheader_filename="ffmpeg/libformat/movenc.c")]
public class TG2Muxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string name {
        public get {
            return "3g2";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string long_name {
        public get {
            return "3GP2 (3GPP2 file format)";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string extensions {
        public get {
            return "3g2";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AMR_NB;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H263;

        }

    }

    [CCode (cname="mov_init",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_header",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_packet",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mov_write_trailer",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="mov_free",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE;

        }

    }

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                codec_3gp_tags,
                0
            };

        }

    }

    [CCode (cname="mov_check_bitstream",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = tg2_muxer_class;
}
#endif

#if CONFIG_IPOD_MUXER

[CCode (cname="ipod_muxer_class",cheader_filename="ffmpeg/libformat/movenc.c")]
public class IPodMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string class_name {
        public get {
            return "ipod muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_ipod_muxer",cheader_filename="ffmpeg/libformat/movenc.c")]
public class IPodMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string name {
        public get {
            return "ipod";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string long_name {
        public get {
            return "iPod H.264 MP4 (MPEG-4 Part 14)";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string mime_type {
        public get {
            return "video/mp4";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string extensions {
        public get {
            return "m4v,m4a,m4b";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;

        }

    }

    [CCode (cname="mov_init",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_header",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_packet",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mov_write_trailer",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="mov_free",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE;

        }

    }

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                codec_ipod_tags,
                0
            };

        }

    }

    [CCode (cname="mov_check_bitstream",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = ipod_muxer_class;
}
#endif

#if CONFIG_ISMV_MUXER

[CCode (cname="ismv_muxer_class",cheader_filename="ffmpeg/libformat/movenc.c")]
public class ISMVMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string class_name {
        public get {
            return "ismv muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_ismv_muxer",cheader_filename="ffmpeg/libformat/movenc.c")]
public class ISMVMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string name {
        public get {
            return "ismv";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string long_name {
        public get {
            return "ISMV/ISMA (Smooth Streaming)";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string mime_type {
        public get {
            return "video/mp4";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string extensions {
        public get {
            return "ismv,isma";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;

        }

    }

    [CCode (cname="mov_init",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_header",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_packet",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mov_write_trailer",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="mov_free",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE;

        }

    }

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                codec_mp4_tags,
                codec_ism_tags,
                0
            };

        }

    }

    [CCode (cname="mov_check_bitstream",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = ismv_muxer_class;
}
#endif

#if CONFIG_F4V_MUXER

[CCode (cname="f4v_muxer_class",cheader_filename="ffmpeg/libformat/movenc.c")]
public class F4VMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string class_name {
        public get {
            return "f4v muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_f4v_muxer",cheader_filename="ffmpeg/libformat/movenc.c")]
public class F4VMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string name {
        public get {
            return "f4v";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string long_name {
        public get {
            return "F4V Adobe Flash Video";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string mime_type {
        public get {
            return "application/f4v";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override string extensions {
        public get {
            return "f4v";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVMuxContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;

        }

    }

    [CCode (cname="mov_init",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_header",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mov_write_packet",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mov_write_trailer",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="mov_free",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH;

        }

    }

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                codec_f4v_tags,
                0
            };

        }

    }

    [CCode (cname="mov_check_bitstream",cheader_filename="ffmpeg/libformat/movenc.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = f4v_muxer_class;
}
#endif

} // namespace LibAVFormat
