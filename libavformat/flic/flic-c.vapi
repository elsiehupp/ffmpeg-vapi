/*
 * FLI/FLC Animation File Demuxer
 * Copyright (c) 2003 The FFmpeg project
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
 * FLI/FLC file demuxer
 * by Mike Melanson (melanson@pcisys.net)
 * for more information on the .fli/.flc file format and all of its many
 * variations, visit:
 *   http://www.compuphase.com/flic.htm
 *
 * This demuxer handles standard 0xAF11- and 0xAF12-type FLIs. It also handles
 * special FLIs from the PC games "Magic Carpet" and "X-COM: Terror from the Deep".
 */

AVInputFormat ff_flic_demuxer = {
    .name           = "flic",
    .long_name      = NULL_IF_CONFIG_SMALL("FLI/FLC/FLX animation"),
    .priv_data_size = sizeof(FlicDemuxContext),
    .read_probe     = flic_probe,
    .read_header    = flic_read_header,
    .read_packet    = flic_read_packet,
};
