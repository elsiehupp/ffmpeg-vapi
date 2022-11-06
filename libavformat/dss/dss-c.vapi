/*
 * Digital Speech Standard (DSS) demuxer
 * Copyright (c) 2014 Oleksij Rempel <linux@rempel-privat.de>
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

AVInputFormat ff_dss_demuxer = {
    .name           = "dss",
    .long_name      = NULL_IF_CONFIG_SMALL("Digital Speech Standard (DSS)"),
    .priv_data_size = sizeof(DSSDemuxContext),
    .read_probe     = dss_probe,
    .read_header    = dss_read_header,
    .read_packet    = dss_read_packet,
    .read_close     = dss_read_close,
    .read_seek      = dss_read_seek,
    .extensions     = "dss"
};
