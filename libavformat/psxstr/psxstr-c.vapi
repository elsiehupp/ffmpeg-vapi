/*
 * Sony Playstation (PSX) STR File Demuxer
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
 * PSX STR file demuxer
 * by Mike Melanson (melanson@pcisys.net)
 * This module handles streams that have been ripped from Sony Playstation
 * CD games. This demuxer can handle either raw STR files (which are just
 * concatenations of raw compact disc sectors) or STR files with 0x2C-byte
 * RIFF headers, followed by CD sectors.
 */

AVInputFormat ff_str_demuxer = {
    .name           = "psxstr",
    .long_name      = NULL_IF_CONFIG_SMALL("Sony Playstation STR"),
    .priv_data_size = sizeof(StrDemuxContext),
    .read_probe     = str_probe,
    .read_header    = str_read_header,
    .read_packet    = str_read_packet,
    .read_close     = str_read_close,
    .flags          = AVFMT_NO_BYTE_SEEK,
};