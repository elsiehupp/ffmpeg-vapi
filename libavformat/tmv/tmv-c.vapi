/*
 * 8088flex TMV file demuxer
 * Copyright (c) 2009 Daniel Verkamp <daniel at drv.nu>
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

/**
 * @file
 * 8088flex TMV file demuxer
 * @author Daniel Verkamp
 * @see http://www.oldskool.org/pc/8088_Corruption
 */

AVInputFormat ff_tmv_demuxer = {
    .name           = "tmv",
    .long_name      = NULL_IF_CONFIG_SMALL("8088flex TMV"),
    .priv_data_size = sizeof(TMVContext),
    .read_probe     = tmv_probe,
    .read_header    = tmv_read_header,
    .read_packet    = tmv_read_packet,
    .read_seek      = tmv_read_seek,
    .flags          = AVFMT_GENERIC_INDEX,
};
