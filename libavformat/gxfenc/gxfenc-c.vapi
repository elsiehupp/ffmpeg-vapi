/*
 * GXF muxer.
 * Copyright (c) 2006 SmartJog S.A., Baptiste Coudurier <baptiste dot coudurier at smartjog dot com>
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

AVOutputFormat ff_gxf_muxer = {
    .name              = "gxf",
    .long_name         = NULL_IF_CONFIG_SMALL("GXF (General eXchange Format)"),
    .extensions        = "gxf",
    .priv_data_size    = sizeof(GXFContext),
    .audio_codec       = AV_CODEC_ID_PCM_S16LE,
    .video_codec       = AV_CODEC_ID_MPEG2VIDEO,
    .write_header      = gxf_write_header,
    .write_packet      = gxf_write_packet,
    .write_trailer     = gxf_write_trailer,
    .interleave_packet = gxf_interleave_packet,
};
