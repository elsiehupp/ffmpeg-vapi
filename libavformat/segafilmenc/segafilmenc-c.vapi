/*
 * Sega FILM Format (CPK) Muxer
 * Copyright (C) 2003 The FFmpeg project
 * Copyright (C) 2018 Misty De Meo
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
 * Sega FILM (.cpk) file muxer
 * @author Misty De Meo <misty@brew.sh>
 *
 * @see For more information regarding the Sega FILM file format, visit:
 *   http://wiki.multimedia.cx/index.php?title=Sega_FILM
 */

static const AVClass film_muxer_class = {
    .class_name     = "Sega FILM muxer",
    .item_name      = av_default_item_name,
    .version        = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_segafilm_muxer = {
    .name           = "film_cpk",
    .long_name      = NULL_IF_CONFIG_SMALL("Sega FILM / CPK"),
    .extensions     = "cpk",
    .priv_data_size = sizeof(FILMOutputContext),
    .audio_codec    = AV_CODEC_ID_PCM_S16BE_PLANAR,
    .video_codec    = AV_CODEC_ID_CINEPAK,
    .init           = film_init,
    .write_trailer  = film_write_header,
    .write_packet   = film_write_packet,
    .priv_class     = &film_muxer_class,
};
