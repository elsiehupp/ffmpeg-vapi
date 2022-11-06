/*
 * Core Audio Format demuxer
 * Copyright (c) 2007 Justin Ruggles
 * Copyright (c) 2009 Peter Ross
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
 * Core Audio Format demuxer
 */

AVInputFormat ff_caf_demuxer = {
    .name           = "caf",
    .long_name      = NULL_IF_CONFIG_SMALL("Apple CAF (Core Audio Format)"),
    .priv_data_size = sizeof(CafContext),
    .read_probe     = probe,
    .read_header    = read_header,
    .read_packet    = read_packet,
    .read_seek      = read_seek,
    .codec_tag      = (const AVCodecTag* const []){ ff_codec_caf_tags, 0 },
};
