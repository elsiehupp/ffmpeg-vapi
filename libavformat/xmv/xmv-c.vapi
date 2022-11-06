/*
 * Microsoft XMV demuxer
 * Copyright (c) 2011 Sven Hesse <drmccoy@drmccoy.de>
 * Copyright (c) 2011 Matthew Hoops <clone2727@gmail.com>
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
 * Microsoft XMV demuxer
 */

AVInputFormat ff_xmv_demuxer = {
    .name           = "xmv",
    .long_name      = NULL_IF_CONFIG_SMALL("Microsoft XMV"),
    .extensions     = "xmv",
    .priv_data_size = sizeof(XMVDemuxContext),
    .read_probe     = xmv_probe,
    .read_header    = xmv_read_header,
    .read_packet    = xmv_read_packet,
    .read_close     = xmv_read_close,
};
