/*
 * Core Audio Format muxer
 * Copyright (c) 2011 Carl Eugen Hoyos
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

AVOutputFormat ff_caf_muxer = {
    .name           = "caf",
    .long_name      = NULL_IF_CONFIG_SMALL("Apple CAF (Core Audio Format)"),
    .mime_type      = "audio/x-caf",
    .extensions     = "caf",
    .priv_data_size = sizeof(CAFContext),
    .audio_codec    = AV_CODEC_ID_PCM_S16BE,
    .video_codec    = AV_CODEC_ID_NONE,
    .write_header   = caf_write_header,
    .write_packet   = caf_write_packet,
    .write_trailer  = caf_write_trailer,
    .codec_tag      = (const AVCodecTag* const []){ff_codec_caf_tags, 0},
};
