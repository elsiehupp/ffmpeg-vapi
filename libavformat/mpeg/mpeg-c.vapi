/*
 * MPEG-1/2 demuxer
 * Copyright (c) 2000, 2001, 2002 Fabrice Bellard
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

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_mpegps_demuxer = {
    //  .name           = "mpeg",
    //  .long_name      = "MPEG-PS (MPEG-2 Program Stream)",
    //  .priv_data_size = sizeof(MpegDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = mpegps_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = mpegps_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = mpegps_read_packet,
    [CCode (cname="", cheader="")]
    public override int64 read_timestamp (
        AVFormatContext format_context,
        int stream_index,
        int64[] pos,
        int64 pos_limit
    ); = mpegps_read_dts,
    //  .flags          = AVFMT_SHOW_IDS | AVFMT_TS_DISCONT,
};

#if CONFIG_VOBSUB_DEMUXER
static const AVOption options[] = {
    { "sub_name", "URI for .sub file", offsetof(MpegDemuxContext, sub_name), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, AV_OPT_FLAG_DECODING_PARAM },
    { NULL }
};

static const AVClass vobsub_demuxer_class = {
    //  .class_name = "vobsub",
    //  .item_name  = av_default_item_name,
    //  .option     = options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_vobsub_demuxer = {
    //  .name           = "vobsub",
    //  .long_name      = "VobSub subtitle format",
    //  .priv_data_size = sizeof(MpegDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = vobsub_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = vobsub_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = vobsub_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_seek2 (
        AVFormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );     = vobsub_read_seek,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );     = vobsub_read_close,
    //  .flags          = AVFMT_SHOW_IDS,
    //  .extensions     = "idx",
    //  .priv_class     = &vobsub_demuxer_class,
};
#endif
