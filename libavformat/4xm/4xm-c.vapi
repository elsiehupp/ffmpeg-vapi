/*
 * 4X Technologies .4xm File Demuxer (no muxer)
 * Copyright (c) 2003  The FFmpeg project
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
 * 4X Technologies file demuxer
 * by Mike Melanson (melanson@pcisys.net)
 * for more information on the .4xm file format, visit:
 *   http://www.pcisys.net/~melanson/codecs/
 */

AVInputFormat ff_fourxm_demuxer = {
    .name           = "4xm",
    .long_name      = NULL_IF_CONFIG_SMALL("4X Technologies"),
    .priv_data_size = sizeof(FourxmDemuxContext),
    .read_probe     = fourxm_probe,
    .read_header    = fourxm_read_header,
    .read_packet    = fourxm_read_packet,
    .read_close     = fourxm_read_close,
};