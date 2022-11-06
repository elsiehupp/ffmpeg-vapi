/*
 * Copyright (c) 2012 Clément Bœsch
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
 * MPL2 subtitles format demuxer
 */

AVInputFormat ff_mpl2_demuxer = {
    .name           = "mpl2",
    .long_name      = NULL_IF_CONFIG_SMALL("MPL2 subtitles"),
    .priv_data_size = sizeof(MPL2Context),
    .read_probe     = mpl2_probe,
    .read_header    = mpl2_read_header,
    .read_packet    = mpl2_read_packet,
    .read_seek2     = mpl2_read_seek,
    .read_close     = mpl2_read_close,
    .extensions     = "txt,mpl2",
};
