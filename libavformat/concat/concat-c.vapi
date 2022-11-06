/*
 * Concat URL protocol
 * Copyright (c) 2006 Steve Lhomme
 * Copyright (c) 2007 Wolfram Gloger
 * Copyright (c) 2010 Michele Orrù
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

const URLProtocol ff_concat_protocol = {
    .name           = "concat",
    .url_open       = concat_open,
    .url_read       = concat_read,
    .url_seek       = concat_seek,
    .url_close      = concat_close,
    .priv_data_size = sizeof(struct concat_data),
    .default_whitelist = "concat,file,subfile",
};
