/*
 * ASF compatible demuxer
 * Copyright (c) 2000, 2001 Fabrice Bellard
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

static const AVClass asf_class = {
    .class_name = "asf demuxer",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_asf_demuxer = {
    .name           = "asf",
    .long_name      = NULL_IF_CONFIG_SMALL("ASF (Advanced / Active Streaming Format)"),
    .priv_data_size = sizeof(ASFContext),
    .read_probe     = asf_probe,
    .read_header    = asf_read_header,
    .read_packet    = asf_read_packet,
    .read_close     = asf_read_close,
    .read_seek      = asf_read_seek,
    .read_timestamp = asf_read_pts,
    .flags          = AVFMT_NOBINSEARCH | AVFMT_NOGENSEARCH,
    .priv_class     = &asf_class,
};
