/*
 * GXF demuxer.
 * Copyright (c) 2006 Reimar Doeffinger
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

AVInputFormat ff_gxf_demuxer = {
    .name           = "gxf",
    .long_name      = NULL_IF_CONFIG_SMALL("GXF (General eXchange Format)"),
    .priv_data_size = sizeof(struct gxf_stream_info),
    .read_probe     = gxf_probe,
    .read_header    = gxf_header,
    .read_packet    = gxf_packet,
    .read_seek      = gxf_seek,
    .read_timestamp = gxf_read_timestamp,
};