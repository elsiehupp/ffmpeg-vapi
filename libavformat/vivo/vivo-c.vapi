/*
 * Vivo stream demuxer
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
 * @brief Vivo stream demuxer
 * @author Daniel Verkamp <daniel at drv.nu>
 * @sa http://wiki.multimedia.cx/index.php?title=Vivo
 */

AVInputFormat ff_vivo_demuxer = {
    .name           = "vivo",
    .long_name      = NULL_IF_CONFIG_SMALL("Vivo"),
    .priv_data_size = sizeof(VivoContext),
    .read_probe     = vivo_probe,
    .read_header    = vivo_read_header,
    .read_packet    = vivo_read_packet,
    .extensions     = "viv",
};
