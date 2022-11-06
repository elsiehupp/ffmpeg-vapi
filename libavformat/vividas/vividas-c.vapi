/*
 * Vividas VIV format Demuxer
 * Copyright (c) 2012 Krzysztof Klinikowski
 * Copyright (c) 2010 Andrzej Szombierski
 * based on vivparse Copyright (c) 2007 Måns Rullgård
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
 * @brief Vividas VIV (.viv) file demuxer
 * @author Andrzej Szombierski [qq at kuku eu org] (2010-07)
 * @sa http://wiki.multimedia.cx/index.php?title=Vividas_VIV
 */

AVInputFormat ff_vividas_demuxer = {
    .name           = "vividas",
    .long_name      = NULL_IF_CONFIG_SMALL("Vividas VIV"),
    .priv_data_size = sizeof(VividasDemuxContext),
    .read_probe     = viv_probe,
    .read_header    = viv_read_header,
    .read_packet    = viv_read_packet,
    .read_close     = viv_read_close,
    .read_seek      = viv_read_seek,
};
