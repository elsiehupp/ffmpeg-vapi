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
 * SubViewer subtitle demuxer
 * @see https://en.wikipedia.org/wiki/SubViewer
 */

AVInputFormat ff_subviewer_demuxer = {
    .name           = "subviewer",
    .long_name      = NULL_IF_CONFIG_SMALL("SubViewer subtitle format"),
    .priv_data_size = sizeof(SubViewerContext),
    .read_probe     = subviewer_probe,
    .read_header    = subviewer_read_header,
    .read_packet    = subviewer_read_packet,
    .read_seek2     = subviewer_read_seek,
    .read_close     = subviewer_read_close,
    .extensions     = "sub",
};
