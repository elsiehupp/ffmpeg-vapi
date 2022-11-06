/*
 * LRC lyrics file format decoder
 * Copyright (c) 2014 StarBrilliant <m13253@hotmail.com>
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

AVInputFormat ff_lrc_demuxer = {
    .name           = "lrc",
    .long_name      = NULL_IF_CONFIG_SMALL("LRC lyrics"),
    .priv_data_size = sizeof (LRCContext),
    .read_probe     = lrc_probe,
    .read_header    = lrc_read_header,
    .read_packet    = lrc_read_packet,
    .read_close     = lrc_read_close,
    .read_seek2     = lrc_read_seek
};