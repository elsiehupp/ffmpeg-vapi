/*
 * mtv demuxer
 * Copyright (c) 2006 Reynaldo H. Verdejo Pinochet
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
 * MTV demuxer.
 */

AVInputFormat ff_mtv_demuxer = {
    .name           = "mtv",
    .long_name      = NULL_IF_CONFIG_SMALL("MTV"),
    .priv_data_size = sizeof(MTVDemuxContext),
    .read_probe     = mtv_probe,
    .read_header    = mtv_read_header,
    .read_packet    = mtv_read_packet,
};
