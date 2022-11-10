/***********************************************************
MPEG-2 transport stream (aka DVB) demuxer
@copyright 2002-2003 Fabrice Bellard
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

//  #define MPEGTS_OPTIONS
//      { "resync_size",   "set size limit for looking up a new synchronization", offsetof(MpegTSContext, resync_size), AV_OPT_TYPE_INT,  { .i64 =  MAX_RESYNC_SIZE}, 0, INT_MAX,  AV_OPT_FLAG_DECODING_PARAM }

//  static const AVOption options[] = {
//      MPEGTS_OPTIONS,
//      {"fix_teletext_pts", "try to fix pts values of dvb teletext streams", offsetof(MpegTSContext, fix_teletext_pts), AV_OPT_TYPE_BOOL,
//       {.i64 = 1}, 0, 1, AV_OPT_FLAG_DECODING_PARAM },
//      {"ts_packetsize", "output option carrying the raw packet size", offsetof(MpegTSContext, raw_packet_size), AV_OPT_TYPE_INT,
//       {.i64 = 0}, 0, 0, AV_OPT_FLAG_DECODING_PARAM | AV_OPT_FLAG_EXPORT | AV_OPT_FLAG_READONLY },
//      {"scan_all_pmts", "scan and combine all PMTs", offsetof(MpegTSContext, scan_all_pmts), AV_OPT_TYPE_BOOL,
//       {.i64 = -1}, -1, 1, AV_OPT_FLAG_DECODING_PARAM },
//      {"skip_unknown_pmt", "skip PMTs for programs not advertised in the PAT", offsetof(MpegTSContext, skip_unknown_pmt), AV_OPT_TYPE_BOOL,
//       {.i64 = 0}, 0, 1, AV_OPT_FLAG_DECODING_PARAM },
//      {"merge_pmt_versions", "re-use streams when PMT's version/pids change", offsetof(MpegTSContext, merge_pmt_versions), AV_OPT_TYPE_BOOL,
//       {.i64 = 0}, 0, 1,  AV_OPT_FLAG_DECODING_PARAM },
//      {"skip_changes", "skip changing / adding streams / programs", offsetof(MpegTSContext, skip_changes), AV_OPT_TYPE_BOOL,
//       {.i64 = 0}, 0, 1, 0 },
//      {"skip_clear", "skip clearing programs", offsetof(MpegTSContext, skip_clear), AV_OPT_TYPE_BOOL,
//       {.i64 = 0}, 0, 1, 0 },
//      { NULL },
//  }

[CCode (cname="mpegts_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "mpegts demuxer"
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}

//  static const AVOption raw_options[] = {
//      MPEGTS_OPTIONS,
//      { "compute_pcr",   "compute exact PCR for each transport stream packet"
//            offsetof(MpegTSContext, mpeg2ts_compute_pcr), AV_OPT_TYPE_BOOL,
//            { .i64 = 0 }, 0, 1,  AV_OPT_FLAG_DECODING_PARAM },
//      { "ts_packetsize", "output option carrying the raw packet size"
//        offsetof(MpegTSContext, raw_packet_size), AV_OPT_TYPE_INT,
//        { .i64 = 0 }, 0, 0,
//        AV_OPT_FLAG_DECODING_PARAM | AV_OPT_FLAG_EXPORT | AV_OPT_FLAG_READONLY },
//      { NULL },
//  }

[CCode (cname="mpegtsraw_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "mpegtsraw demuxer"
    //  .item_name = av_default_item_name,
    //  .option = raw_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_mpegts_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "mpegts"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "MPEG-TS (MPEG-2 Transport Stream)"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MpegTSContext);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = mpegts_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = mpegts_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = mpegts_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    ); // = mpegts_read_close,
    [CCode (cname="", cheader="")]
    public override int64 read_timestamp (
        AVFormatContext format_context,
        int stream_index,
        int64[] pos,
        int64 pos_limit
    ); // = mpegts_get_dts,
    //  .flags = AVFMT_SHOW_IDS | AVFMT_TS_DISCONT,
    //  .priv_class = mpegts_class,
}

[CCode (cname="ff_mpegtsraw_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "mpegtsraw"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw MPEG-TS (MPEG-2 Transport Stream)"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MpegTSContext);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = mpegts_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = mpegts_raw_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    ); // = mpegts_read_close,
    [CCode (cname="", cheader="")]
    public override int64 read_timestamp (
        AVFormatContext format_context,
        int stream_index,
        int64[] pos,
        int64 pos_limit
    ); // = mpegts_get_dts,
    //  .flags = AVFMT_SHOW_IDS | AVFMT_TS_DISCONT,
    //  .priv_class = mpegtsraw_class,
}
