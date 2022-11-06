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
    .class_name     = "RTSP demuxer",
    .item_name      = av_default_item_name,
    .option         = ff_rtsp_options,
    .version        = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_rtsp_demuxer = {
    .name           = "rtsp",
    .long_name      = NULL_IF_CONFIG_SMALL("RTSP input"),
    .priv_data_size = sizeof(RTSPState),
    .read_probe     = rtsp_probe,
    .read_header    = rtsp_read_header,
    .read_packet    = rtsp_read_packet,
    .read_close     = rtsp_read_close,
    .read_seek      = rtsp_read_seek,
    .flags          = AVFMT_NOFILE,
    .read_play      = rtsp_read_play,
    .read_pause     = rtsp_read_pause,
    .priv_class     = &rtsp_demuxer_class,
};
