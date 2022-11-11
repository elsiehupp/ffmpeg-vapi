/***********************************************************
MPEG-2 transport stream (aka DVB) muxer
@copyright 2003 Fabrice Bellard
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
//      { "mpegts_transport_stream_id", "Set transport_stream_id field.",
//        offsetof(MpegTSWrite, transport_stream_id), AV_OPT_TYPE_INT,
//        { .i64 = 0x0001 }, 0x0001, 0xffff, AV_OPT_FLAG_ENCODING_PARAM },
//      { "mpegts_original_network_id", "Set original_network_id field.",
//        offsetof(MpegTSWrite, original_network_id), AV_OPT_TYPE_INT,
//        { .i64 = DVB_PRIVATE_NETWORK_START }, 0x0001, 0xffff, AV_OPT_FLAG_ENCODING_PARAM },
//      { "mpegts_service_id", "Set service_id field.",
//        offsetof(MpegTSWrite, service_id), AV_OPT_TYPE_INT,
//        { .i64 = 0x0001 }, 0x0001, 0xffff, AV_OPT_FLAG_ENCODING_PARAM },
//      { "mpegts_service_type", "Set service_type field.",
//        offsetof(MpegTSWrite, service_type), AV_OPT_TYPE_INT,
//        { .i64 = 0x01 }, 0x01, 0xff, AV_OPT_FLAG_ENCODING_PARAM, "mpegts_service_type" },
//      { "digital_tv", "Digital Television.",
//        0, AV_OPT_TYPE_CONST, { .i64 = MPEGTS_SERVICE_TYPE_DIGITAL_TV }, 0x01, 0xff,
//        AV_OPT_FLAG_ENCODING_PARAM, "mpegts_service_type" },
//      { "digital_radio", "Digital Radio.",
//        0, AV_OPT_TYPE_CONST, { .i64 = MPEGTS_SERVICE_TYPE_DIGITAL_RADIO }, 0x01, 0xff,
//        AV_OPT_FLAG_ENCODING_PARAM, "mpegts_service_type" },
//      { "teletext", "Teletext.",
//        0, AV_OPT_TYPE_CONST, { .i64 = MPEGTS_SERVICE_TYPE_TELETEXT }, 0x01, 0xff,
//        AV_OPT_FLAG_ENCODING_PARAM, "mpegts_service_type" },
//      { "advanced_codec_digital_radio", "Advanced Codec Digital Radio.",
//        0, AV_OPT_TYPE_CONST, { .i64 = MPEGTS_SERVICE_TYPE_ADVANCED_CODEC_DIGITAL_RADIO }, 0x01, 0xff,
//        AV_OPT_FLAG_ENCODING_PARAM, "mpegts_service_type" },
//      { "mpeg2_digital_hdtv", "MPEG2 Digital HDTV.",
//        0, AV_OPT_TYPE_CONST, { .i64 = MPEGTS_SERVICE_TYPE_MPEG2_DIGITAL_HDTV }, 0x01, 0xff,
//        AV_OPT_FLAG_ENCODING_PARAM, "mpegts_service_type" },
//      { "advanced_codec_digital_sdtv", "Advanced Codec Digital SDTV.",
//        0, AV_OPT_TYPE_CONST, { .i64 = MPEGTS_SERVICE_TYPE_ADVANCED_CODEC_DIGITAL_SDTV }, 0x01, 0xff,
//        AV_OPT_FLAG_ENCODING_PARAM, "mpegts_service_type" },
//      { "advanced_codec_digital_hdtv", "Advanced Codec Digital HDTV.",
//        0, AV_OPT_TYPE_CONST, { .i64 = MPEGTS_SERVICE_TYPE_ADVANCED_CODEC_DIGITAL_HDTV }, 0x01, 0xff,
//        AV_OPT_FLAG_ENCODING_PARAM, "mpegts_service_type" },
//      { "hevc_digital_hdtv", "HEVC Digital Television Service.",
//        0, AV_OPT_TYPE_CONST, { .i64 = MPEGTS_SERVICE_TYPE_HEVC_DIGITAL_HDTV }, 0x01, 0xff,
//        AV_OPT_FLAG_ENCODING_PARAM, "mpegts_service_type" },
//      { "mpegts_pmt_start_pid", "Set the first pid of the PMT.",
//        offsetof(MpegTSWrite, pmt_start_pid), AV_OPT_TYPE_INT,
//        { .i64 = 0x1000 }, 0x0010, 0x1f00, AV_OPT_FLAG_ENCODING_PARAM },
//      { "mpegts_start_pid", "Set the first pid.",
//        offsetof(MpegTSWrite, start_pid), AV_OPT_TYPE_INT,
//        { .i64 = 0x0100 }, 0x0010, 0x0f00, AV_OPT_FLAG_ENCODING_PARAM },
//      { "mpegts_m2ts_mode", "Enable m2ts mode.",
//        offsetof(MpegTSWrite, m2ts_mode), AV_OPT_TYPE_BOOL,
//        { .i64 = -1 }, -1, 1, AV_OPT_FLAG_ENCODING_PARAM },
//      { "muxrate", NULL,
//        offsetof(MpegTSWrite, mux_rate), AV_OPT_TYPE_INT,
//        { .i64 = 1 }, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "pes_payload_size", "Minimum PES packet payload in bytes",
//        offsetof(MpegTSWrite, pes_payload_size), AV_OPT_TYPE_INT,
//        { .i64 = DEFAULT_PES_PAYLOAD_SIZE }, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "mpegts_flags", "MPEG-TS muxing flags",
//        offsetof(MpegTSWrite, flags), AV_OPT_TYPE_FLAGS, { .i64 = 0 }, 0, INT_MAX,
//        AV_OPT_FLAG_ENCODING_PARAM, "mpegts_flags" },
//      { "resend_headers", "Reemit PAT/PMT before writing the next packet",
//        0, AV_OPT_TYPE_CONST, { .i64 = MPEGTS_FLAG_REEMIT_PAT_PMT }, 0, INT_MAX,
//        AV_OPT_FLAG_ENCODING_PARAM, "mpegts_flags" },
//      { "latm", "Use LATM packetization for AAC",
//        0, AV_OPT_TYPE_CONST, { .i64 = MPEGTS_FLAG_AAC_LATM }, 0, INT_MAX,
//        AV_OPT_FLAG_ENCODING_PARAM, "mpegts_flags" },
//      { "pat_pmt_at_frames", "Reemit PAT and PMT at each video frame",
//        0, AV_OPT_TYPE_CONST, { .i64 = MPEGTS_FLAG_PAT_PMT_AT_FRAMES}, 0, INT_MAX,
//        AV_OPT_FLAG_ENCODING_PARAM, "mpegts_flags" },
//      { "system_b", "Conform to System B (DVB) instead of System A (ATSC)",
//        0, AV_OPT_TYPE_CONST, { .i64 = MPEGTS_FLAG_SYSTEM_B }, 0, INT_MAX,
//        AV_OPT_FLAG_ENCODING_PARAM, "mpegts_flags" },
//      { "initial_discontinuity", "Mark initial packets as discontinuous",
//        0, AV_OPT_TYPE_CONST, { .i64 = MPEGTS_FLAG_DISCONT }, 0, INT_MAX,
//        AV_OPT_FLAG_ENCODING_PARAM, "mpegts_flags" },
//      // backward compatibility
//      { "resend_headers", "Reemit PAT/PMT before writing the next packet",
//        offsetof(MpegTSWrite, reemit_pat_pmt), AV_OPT_TYPE_INT,
//        { .i64 = 0 }, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "mpegts_copyts", "don't offset dts/pts",
//        offsetof(MpegTSWrite, copyts), AV_OPT_TYPE_BOOL,
//        { .i64 = -1 }, -1, 1, AV_OPT_FLAG_ENCODING_PARAM },
//      { "tables_version", "set PAT, PMT and SDT version",
//        offsetof(MpegTSWrite, tables_version), AV_OPT_TYPE_INT,
//        { .i64 = 0 }, 0, 31, AV_OPT_FLAG_ENCODING_PARAM },
//      { "omit_video_pes_length", "Omit the PES packet length for video packets",
//        offsetof(MpegTSWrite, omit_video_pes_length), AV_OPT_TYPE_BOOL,
//        { .i64 = 1 }, 0, 1, AV_OPT_FLAG_ENCODING_PARAM },
//      { "pcr_period", "PCR retransmission time in milliseconds",
//        offsetof(MpegTSWrite, pcr_period), AV_OPT_TYPE_INT,
//        { .i64 = PCR_RETRANS_TIME }, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "pat_period", "PAT/PMT retransmission time limit in seconds",
//        offsetof(MpegTSWrite, pat_period), AV_OPT_TYPE_DOUBLE,
//        { .dbl = INT_MAX }, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "sdt_period", "SDT retransmission time limit in seconds",
//        offsetof(MpegTSWrite, sdt_period), AV_OPT_TYPE_DOUBLE,
//        { .dbl = INT_MAX }, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { NULL },
//  }

[CCode (cname="mpegts_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "MPEGTS muxer";
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

[CCode (cname="ff_mpegts_muxer", cheader="")]
public class MpegTSOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "mpegts";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "MPEG-TS (MPEG-2 Transport Stream)";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "video/MP2T";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "ts,m2t,m2ts,mts";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MpegTSWrite);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.MP2;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG2VIDEO;
        }
    }
    [CCode (cname="", cheader="")]
    public override int init (
        AVFormatContext format_context
    ); // = mpegts_init,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = mpegts_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = mpegts_write_end,
    [CCode (cname="", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    ); // = mpegts_deinit,
    [CCode (cname="", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = mpegts_check_bitstream,
    //  .flags = AVFMT_ALLOW_FLUSH | AVFMT_VARIABLE_FPS | AVFMT_NODIMENSIONS,
    //  .priv_class = mpegts_muxer_class,
}
