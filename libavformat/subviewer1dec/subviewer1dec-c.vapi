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
 * SubViewer v1 subtitle demuxer
 */

AVInputFormat ff_subviewer1_demuxer = {
    .name           = "subviewer1",
    .long_name      = NULL_IF_CONFIG_SMALL("SubViewer v1 subtitle format"),
    .priv_data_size = sizeof(SubViewer1Context),
    .read_probe     = subviewer1_probe,
    .read_header    = subviewer1_read_header,
    .read_packet    = subviewer1_read_packet,
    .read_seek2     = subviewer1_read_seek,
    .read_close     = subviewer1_read_close,
    .extensions     = "sub",
};
