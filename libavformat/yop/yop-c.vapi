/*
 * Psygnosis YOP demuxer
 *
 * Copyright (C) 2010 Mohamed Naufal Basheer <naufal11@gmail.com>
 * derived from the code by
 * Copyright (C) 2009 Thomas P. Higdon <thomas.p.higdon@gmail.com>
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

AVInputFormat ff_yop_demuxer = {
    .name           = "yop",
    .long_name      = NULL_IF_CONFIG_SMALL("Psygnosis YOP"),
    .priv_data_size = sizeof(YopDecContext),
    .read_probe     = yop_probe,
    .read_header    = yop_read_header,
    .read_packet    = yop_read_packet,
    .read_close     = yop_read_close,
    .read_seek      = yop_read_seek,
    .extensions     = "yop",
    .flags          = AVFMT_GENERIC_INDEX,
};
