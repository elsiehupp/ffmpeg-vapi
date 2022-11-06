/*
 * Linux Media Labs MPEG-4 demuxer
 * Copyright (c) 2008 Ivo van Poorten
 *
 * Due to a lack of sample files, only files with one channel are supported.
 * u-law and ADPCM audio are unsupported for the same reason.
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

AVInputFormat ff_lmlm4_demuxer = {
    .name           = "lmlm4",
    .long_name      = NULL_IF_CONFIG_SMALL("raw lmlm4"),
    .read_probe     = lmlm4_probe,
    .read_header    = lmlm4_read_header,
    .read_packet    = lmlm4_read_packet,
};
