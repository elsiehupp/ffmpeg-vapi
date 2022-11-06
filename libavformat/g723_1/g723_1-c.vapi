/*
 * G.723.1 demuxer
 * Copyright (c) 2010 Mohamed Naufal Basheer
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
 * G.723.1 demuxer
 */

AVInputFormat ff_g723_1_demuxer = {
    .name        = "g723_1",
    .long_name   = NULL_IF_CONFIG_SMALL("G.723.1"),
    .read_header = g723_1_init,
    .read_packet = g723_1_read_packet,
    .extensions  = "tco,rco,g723_1",
    .flags       = AVFMT_GENERIC_INDEX
};