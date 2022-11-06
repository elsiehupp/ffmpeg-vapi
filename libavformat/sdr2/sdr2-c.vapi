/*
 * SDR2 demuxer
 * Copyright (c) 2014 Paul B Mahol
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

AVInputFormat ff_sdr2_demuxer = {
    .name        = "sdr2",
    .long_name   = NULL_IF_CONFIG_SMALL("SDR2"),
    .read_probe  = sdr2_probe,
    .read_header = sdr2_read_header,
    .read_packet = sdr2_read_packet,
    .extensions  = "sdr2",
    .flags       = AVFMT_GENERIC_INDEX,
};
