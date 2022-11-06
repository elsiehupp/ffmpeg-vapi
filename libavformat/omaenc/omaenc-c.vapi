/*
 * Sony OpenMG (OMA) muxer
 *
 * Copyright (c) 2011 Michael Karcher
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

AVOutputFormat ff_oma_muxer = {
    .name              = "oma",
    .long_name         = NULL_IF_CONFIG_SMALL("Sony OpenMG audio"),
    .mime_type         = "audio/x-oma",
    .extensions        = "oma",
    .audio_codec       = AV_CODEC_ID_ATRAC3,
    .write_header      = oma_write_header,
    .write_packet      = ff_raw_write_packet,
    .codec_tag         = (const AVCodecTag* const []){ff_oma_codec_tags, 0},
    .flags             = AVFMT_NOTIMESTAMPS,
};