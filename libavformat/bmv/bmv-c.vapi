/*
 * Discworld II BMV demuxer
 * Copyright (c) 2011 Konstantin Shishkov
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

AVInputFormat ff_bmv_demuxer = {
    .name           = "bmv",
    .long_name      = NULL_IF_CONFIG_SMALL("Discworld II BMV"),
    .priv_data_size = sizeof(BMVContext),
    .read_header    = bmv_read_header,
    .read_packet    = bmv_read_packet,
    .read_close     = bmv_read_close,
    .extensions     = "bmv",
};
