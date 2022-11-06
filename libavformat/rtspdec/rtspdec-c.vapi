/*
 * RTSP demuxer
 * Copyright (c) 2002 Fabrice Bellard
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

static const AVClass rtsp_demuxer_class = {
    //  .class_name     = "RTSP demuxer",
    //  .item_name      = av_default_item_name,
    //  .option         = ff_rtsp_options,
    //  .version        = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_rtsp_demuxer = {
    //  .name           = "rtsp",
    //  .long_name      = "RTSP input",
    //  .priv_data_size = sizeof(RTSPState),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = rtsp_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = rtsp_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = rtsp_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );     = rtsp_read_close,
    [CCode (cname="", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );      = rtsp_read_seek,
    //  .flags          = AVFMT_NOFILE,
    [CCode (cname="", cheader="")]
    public override int read_play (
        AVFormatContext format_context
    );      = rtsp_read_play,
    [CCode (cname="", cheader="")]
    public override int read_pause (
        AVFormatContext format_context
    );     = rtsp_read_pause,
    //  .priv_class     = &rtsp_demuxer_class,
};
