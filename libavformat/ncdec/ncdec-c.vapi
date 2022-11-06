/*
 * NC camera feed demuxer
 * Copyright (c) 2009  Nicolas Martin (martinic at iro dot umontreal dot ca)
 *                     Edouard Auvinet
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

AVInputFormat ff_nc_demuxer = {
    .name           = "nc",
    .long_name      = NULL_IF_CONFIG_SMALL("NC camera feed"),
    .read_probe     = nc_probe,
    .read_header    = nc_read_header,
    .read_packet    = nc_read_packet,
    .extensions     = "v",
};
