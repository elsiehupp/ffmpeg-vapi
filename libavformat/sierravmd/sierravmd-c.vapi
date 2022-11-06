/*
 * Sierra VMD Format Demuxer
 * Copyright (c) 2004 The FFmpeg project
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
 * Sierra VMD file demuxer
 * by Vladimir "VAG" Gneushev (vagsoft at mail.ru)
 * for more information on the Sierra VMD file format, visit:
 *   http://www.pcisys.net/~melanson/codecs/
 */

AVInputFormat ff_vmd_demuxer = {
    .name           = "vmd",
    .long_name      = NULL_IF_CONFIG_SMALL("Sierra VMD"),
    .priv_data_size = sizeof(VmdDemuxContext),
    .read_probe     = vmd_probe,
    .read_header    = vmd_read_header,
    .read_packet    = vmd_read_packet,
    .read_close     = vmd_read_close,
};
