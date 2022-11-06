/*
 * Brute Force & Ignorance (BFI) demuxer
 * Copyright (c) 2008 Sisir Koppaka
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
 * @brief Brute Force & Ignorance (.bfi) file demuxer
 * @author Sisir Koppaka ( sisir.koppaka at gmail dot com )
 * @see http://wiki.multimedia.cx/index.php?title=BFI
 */

AVInputFormat ff_bfi_demuxer = {
    .name           = "bfi",
    .long_name      = NULL_IF_CONFIG_SMALL("Brute Force & Ignorance"),
    .priv_data_size = sizeof(BFIContext),
    .read_probe     = bfi_probe,
    .read_header    = bfi_read_header,
    .read_packet    = bfi_read_packet,
};
