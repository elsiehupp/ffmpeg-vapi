/*
 * IEC 61937 demuxer
 * Copyright (c) 2010 Anssi Hannula <anssi.hannula at iki.fi>
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
 * IEC 61937 demuxer, used for compressed data in S/PDIF
 * @author Anssi Hannula
 */

AVInputFormat ff_spdif_demuxer = {
    .name           = "spdif",
    .long_name      = NULL_IF_CONFIG_SMALL("IEC 61937 (compressed data in S/PDIF)"),
    .read_probe     = spdif_probe,
    .read_header    = spdif_read_header,
    .read_packet    = ff_spdif_read_packet,
    .flags          = AVFMT_GENERIC_INDEX,
};
