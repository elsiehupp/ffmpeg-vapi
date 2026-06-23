/***********************************************************
@brief MPEG-2 transport stream (aka DVB) muxer
@copyright 2003 Fabrice Bellard
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
    new LibAVUtil.IntOption () {
        name = "mpegts_transport_stream_id",
        short_help_text = "Set transport_stream_id field.",
        offsetof (
            MpegTSWrite,
            transport_stream_id
        ),
        {
            .i64 = 0x0001
        },
        0x0001,
        0xffff,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "mpegts_original_network_id",
        short_help_text = "Set original_network_id field.",
        offsetof (
            MpegTSWrite,
            original_network_id
        ),
        {
            .i64 = DVB_PRIVATE_NETWORK_START
        },
        0x0001,
        0xffff,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "mpegts_service_id",
        short_help_text = "Set service_id field.",
        offsetof (
            MpegTSWrite,
            service_id
        ),
        {
            .i64 = 0x0001
        },
        0x0001,
        0xffff,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "mpegts_service_type",
        short_help_text = "Set service_type field.",
        offsetof (
            MpegTSWrite,
            service_type
        ),
        {
            .i64 = 0x01
        },
        0x01,
        0xff,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "mpegts_service_type"
    },
    new LibAVUtil.ConstOption () {
        name = "digital_tv",
        short_help_text = "Digital Television.",
        0,
        {
            .i64 = MPEGTS_SERVICE_TYPE_DIGITAL_TV
        },
        0x01,
        0xff,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "mpegts_service_type"
    },
    new LibAVUtil.ConstOption () {
        name = "digital_radio",
        short_help_text = "Digital Radio.",
        0,
        {
            .i64 = MPEGTS_SERVICE_TYPE_DIGITAL_RADIO
        },
        0x01,
        0xff,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "mpegts_service_type"
    },
    new LibAVUtil.ConstOption () {
        name = "teletext",
        short_help_text = "Teletext.",
        0,
        {
            .i64 = MPEGTS_SERVICE_TYPE_TELETEXT
        },
        0x01,
        0xff,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "mpegts_service_type"
    },
    new LibAVUtil.ConstOption () {
        name = "advanced_codec_digital_radio",
        short_help_text = "Advanced Codec Digital Radio.",
        0,
        {
            .i64 = MPEGTS_SERVICE_TYPE_ADVANCED_CODEC_DIGITAL_RADIO
        },
        0x01,
        0xff,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "mpegts_service_type"
    },
    new LibAVUtil.ConstOption () {
        name = "mpeg2_digital_hdtv",
        short_help_text = "MPEG2 Digital HDTV.",
        0,
        {
            .i64 = MPEGTS_SERVICE_TYPE_MPEG2_DIGITAL_HDTV
        },
        0x01,
        0xff,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "mpegts_service_type"
    },
    new LibAVUtil.ConstOption () {
        name = "advanced_codec_digital_sdtv",
        short_help_text = "Advanced Codec Digital SDTV.",
        0,
        {
            .i64 = MPEGTS_SERVICE_TYPE_ADVANCED_CODEC_DIGITAL_SDTV
        },
        0x01,
        0xff,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "mpegts_service_type"
    },
    new LibAVUtil.ConstOption () {
        name = "advanced_codec_digital_hdtv",
        short_help_text = "Advanced Codec Digital HDTV.",
        0,
        {
            .i64 = MPEGTS_SERVICE_TYPE_ADVANCED_CODEC_DIGITAL_HDTV
        },
        0x01,
        0xff,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "mpegts_service_type"
    },
    new LibAVUtil.ConstOption () {
        name = "hevc_digital_hdtv",
        short_help_text = "HEVC Digital Television Service.",
        0,
        {
            .i64 = MPEGTS_SERVICE_TYPE_HEVC_DIGITAL_HDTV
        },
        0x01,
        0xff,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "mpegts_service_type"
    },
    new LibAVUtil.IntOption () {
        name = "mpegts_pmt_start_pid",
        short_help_text = "Set the first pid of the PMT.",
        offsetof (
            MpegTSWrite,
            pmt_start_pid
        ),
        {
            .i64 = 0x1000
        },
        0x0010,
        0x1f00,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "mpegts_start_pid",
        short_help_text = "Set the first pid.",
        offsetof (
            MpegTSWrite,
            start_pid
        ),
        {
            .i64 = 0x0100
        },
        0x0010,
        0x0f00,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "mpegts_m2ts_mode",
        short_help_text = "Enable m2ts mode.",
        offsetof (
            MpegTSWrite,
            m2ts_mode
        ),
        {
            .i64 = -1
        },
        -1,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "muxrate",
        NULL,
        offsetof (
            MpegTSWrite,
            mux_rate
        ),
        {
            .i64 = 1
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "pes_payload_size",
        short_help_text = "Minimum PES packet payload in bytes",
        offsetof (
            MpegTSWrite,
            pes_payload_size
        ),
        {
            .i64 = DEFAULT_PES_PAYLOAD_SIZE
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.FlagsOption () {
        name = "mpegts_flags",
        short_help_text = "MPEG-TS muxing flags",
        offsetof (
            MpegTSWrite,
            flags
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "mpegts_flags"
    },
    new LibAVUtil.ConstOption () {
        name = "resend_headers",
        short_help_text = "Reemit PAT/PMT before writing the next packet",
        0,
        {
            .i64 = MPEGTS_FLAG_REEMIT_PAT_PMT
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "mpegts_flags"
    },
    new LibAVUtil.ConstOption () {
        name = "latm",
        short_help_text = "Use LATM packetization for AAC",
        0,
        {
            .i64 = MPEGTS_FLAG_AAC_LATM
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "mpegts_flags"
    },
    new LibAVUtil.ConstOption () {
        name = "pat_pmt_at_frames",
        short_help_text = "Reemit PAT and PMT at each video frame",
        0,
        {
            .i64 = MPEGTS_FLAG_PAT_PMT_AT_FRAMES
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "mpegts_flags"
    },
    new LibAVUtil.ConstOption () {
        name = "system_b",
        short_help_text = "Conform to System B (DVB) instead of System A (ATSC)",
        0,
        {
            .i64 = MPEGTS_FLAG_SYSTEM_B
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "mpegts_flags"
    },
    new LibAVUtil.ConstOption () {
        name = "initial_discontinuity",
        short_help_text = "Mark initial packets as discontinuous",
        0,
        {
            .i64 = MPEGTS_FLAG_DISCONT
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "mpegts_flags"
    },
    // backward compatibility
    new LibAVUtil.IntOption () {
        name = "resend_headers",
        short_help_text = "Reemit PAT/PMT before writing the next packet",
        offsetof (
            MpegTSWrite,
            reemit_pat_pmt
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "mpegts_copyts",
        short_help_text = "don't offset dts/pts",
        offsetof (
            MpegTSWrite,
            copyts
        ),
        {
            .i64 = -1
        },
        -1,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "tables_version",
        short_help_text = "set PAT, PMT and SDT version",
        offsetof (
            MpegTSWrite,
            tables_version
        ),
        {
            .i64 = 0
        },
        0,
        31,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "omit_video_pes_length",
        short_help_text = "Omit the PES packet length for video packets",
        offsetof (
            MpegTSWrite,
            omit_video_pes_length
        ),
        {
            .i64 = 1
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "pcr_period",
        short_help_text = "PCR retransmission time in milliseconds",
        offsetof (
            MpegTSWrite,
            pcr_period
        ),
        {
            .i64 = PCR_RETRANS_TIME
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.DoubleOption () {
        name = "pat_period",
        short_help_text = "PAT/PMT retransmission time limit in seconds",
        offsetof (
            MpegTSWrite,
            pat_period
        ),
        {
            .dbl = int.MAX
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.DoubleOption () {
        name = "sdt_period",
        short_help_text = "SDT retransmission time limit in seconds",
        offsetof (
            MpegTSWrite,
            sdt_period
        ),
        {
            .dbl = int.MAX
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="mpegts_muxer_class",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
public class MpegTSMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override string class_name {
        public get {
            return "MPEGTS muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct MpegTSWrite",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
[Compact]
public class MpegTSMuxerPrivateData { }

[CCode (cname="ff_mpegts_muxer",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
public class MpegTSMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override string name {
        public get {
            return "mpegts";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override string long_name {
        public get {
            return "MPEG-TS (MPEG-2 Transport Stream)";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override string mime_type {
        public get {
            return "video/MP2T";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override string extensions {
        public get {
            return "ts,m2t,m2ts,mts";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MpegTSMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.MP2;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG2VIDEO;

        }

    }

    [CCode (cname="mpegts_init",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="mpegts_write_packet",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="mpegts_write_end",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="mpegts_deinit",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="mpegts_check_bitstream",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/mpegtsenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_ALLOW_FLUSH | AVFMT_VARIABLE_FPS | AVFMT_NODIMENSIONS;

        }

    }
    //  .priv_class = mpegts_muxer_class;
}

} // namespace LibAVFormat
