/*
 * TiVo ty stream demuxer
 * Copyright (c) 2005 VLC authors and VideoLAN
 * Copyright (c) 2005 by Neal Symms (tivo@freakinzoo.com) - February 2005
 * based on code by Christopher Wingert for tivo-mplayer
 * tivo(at)wingert.org, February 2003
 * Copyright (c) 2017 Paul B Mahol
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

AVInputFormat ff_ty_demuxer = {
    .name           = "ty",
    .long_name      = NULL_IF_CONFIG_SMALL("TiVo TY Stream"),
    .priv_data_size = sizeof(TYDemuxContext),
    .read_probe     = ty_probe,
    .read_header    = ty_read_header,
    .read_packet    = ty_read_packet,
    .read_close     = ty_read_close,
    .extensions     = "ty,ty+",
    .flags          = AVFMT_TS_DISCONT,
};
