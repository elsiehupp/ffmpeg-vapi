/*
 * Metar Gear Solid: The Twin Snakes demuxer
 * Copyright (c) 2012 Paul B Mahol
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


AVInputFormat ff_mgsts_demuxer = {
    .name        = "mgsts",
    .long_name   = NULL_IF_CONFIG_SMALL("Metal Gear Solid: The Twin Snakes"),
    .read_probe  = read_probe,
    .read_header = read_header,
    .read_packet = read_packet,
    .flags       = AVFMT_GENERIC_INDEX,
};