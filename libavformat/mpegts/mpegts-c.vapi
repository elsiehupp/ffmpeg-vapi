/*
 * MPEG-2 transport stream (aka DVB) demuxer
 * Copyright (c) 2002-2003 Fabrice Bellard
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#define MPEGTS_OPTIONS \
    { "resync_size",   "set size limit for looking up a new synchronization", offsetof(MpegTSContext, resync_size), AV_OPT_TYPE_INT,  { .i64 =  MAX_RESYNC_SIZE}, 0, INT_MAX,  AV_OPT_FLAG_DECODING_PARAM }

static const AVOption options[] = {
    MPEGTS_OPTIONS,
    {"fix_teletext_pts", "try to fix pts values of dvb teletext streams", offsetof(MpegTSContext, fix_teletext_pts), AV_OPT_TYPE_BOOL,
     {.i64 = 1}, 0, 1, AV_OPT_FLAG_DECODING_PARAM },
    {"ts_packetsize", "output option carrying the raw packet size", offsetof(MpegTSContext, raw_packet_size), AV_OPT_TYPE_INT,
     {.i64 = 0}, 0, 0, AV_OPT_FLAG_DECODING_PARAM | AV_OPT_FLAG_EXPORT | AV_OPT_FLAG_READONLY },
    {"scan_all_pmts", "scan and combine all PMTs", offsetof(MpegTSContext, scan_all_pmts), AV_OPT_TYPE_BOOL,
     {.i64 = -1}, -1, 1, AV_OPT_FLAG_DECODING_PARAM },
    {"skip_unknown_pmt", "skip PMTs for programs not advertised in the PAT", offsetof(MpegTSContext, skip_unknown_pmt), AV_OPT_TYPE_BOOL,
     {.i64 = 0}, 0, 1, AV_OPT_FLAG_DECODING_PARAM },
    {"merge_pmt_versions", "re-use streams when PMT's version/pids change", offsetof(MpegTSContext, merge_pmt_versions), AV_OPT_TYPE_BOOL,
     {.i64 = 0}, 0, 1,  AV_OPT_FLAG_DECODING_PARAM },
    {"skip_changes", "skip changing / adding streams / programs", offsetof(MpegTSContext, skip_changes), AV_OPT_TYPE_BOOL,
     {.i64 = 0}, 0, 1, 0 },
    {"skip_clear", "skip clearing programs", offsetof(MpegTSContext, skip_clear), AV_OPT_TYPE_BOOL,
     {.i64 = 0}, 0, 1, 0 },
    { NULL },
};

static const AVClass mpegts_class = {
    //  .class_name = "mpegts demuxer",
    //  .item_name  = av_default_item_name,
    //  .option     = options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

static const AVOption raw_options[] = {
    MPEGTS_OPTIONS,
    { "compute_pcr",   "compute exact PCR for each transport stream packet",
          offsetof(MpegTSContext, mpeg2ts_compute_pcr), AV_OPT_TYPE_BOOL,
          { .i64 = 0 }, 0, 1,  AV_OPT_FLAG_DECODING_PARAM },
    { "ts_packetsize", "output option carrying the raw packet size",
      offsetof(MpegTSContext, raw_packet_size), AV_OPT_TYPE_INT,
      { .i64 = 0 }, 0, 0,
      AV_OPT_FLAG_DECODING_PARAM | AV_OPT_FLAG_EXPORT | AV_OPT_FLAG_READONLY },
    { NULL },
};

static const AVClass mpegtsraw_class = {
    //  .class_name = "mpegtsraw demuxer",
    //  .item_name  = av_default_item_name,
    //  .option     = raw_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_mpegts_demuxer = {
    //  .name           = "mpegts",
    //  .long_name      = "MPEG-TS (MPEG-2 Transport Stream)",
    //  .priv_data_size = sizeof(MpegTSContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = mpegts_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = mpegts_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = mpegts_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );     = mpegts_read_close,
    [CCode (cname="", cheader="")]
    public override int64 read_timestamp (
        AVFormatContext format_context,
        int stream_index,
        int64[] pos,
        int64 pos_limit
    ); = mpegts_get_dts,
    //  .flags          = AVFMT_SHOW_IDS | AVFMT_TS_DISCONT,
    //  .priv_class     = &mpegts_class,
};

AVInputFormat ff_mpegtsraw_demuxer = {
    //  .name           = "mpegtsraw",
    //  .long_name      = "raw MPEG-TS (MPEG-2 Transport Stream)",
    //  .priv_data_size = sizeof(MpegTSContext),
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = mpegts_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = mpegts_raw_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );     = mpegts_read_close,
    [CCode (cname="", cheader="")]
    public override int64 read_timestamp (
        AVFormatContext format_context,
        int stream_index,
        int64[] pos,
        int64 pos_limit
    ); = mpegts_get_dts,
    //  .flags          = AVFMT_SHOW_IDS | AVFMT_TS_DISCONT,
    //  .priv_class     = &mpegtsraw_class,
};
