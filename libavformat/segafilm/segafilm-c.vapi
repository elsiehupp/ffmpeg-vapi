/*
 * Sega FILM Format (CPK) Demuxer
 * Copyright (c) 2003 The FFmpeg project
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
 * Sega FILM (.cpk) file demuxer
 * by Mike Melanson (melanson@pcisys.net)
 * For more information regarding the Sega FILM file format, visit:
 *   http://www.pcisys.net/~melanson/codecs/
 */

AVInputFormat ff_segafilm_demuxer = {
    .name           = "film_cpk",
    .long_name      = NULL_IF_CONFIG_SMALL("Sega FILM / CPK"),
    .priv_data_size = sizeof(FilmDemuxContext),
    .read_probe     = film_probe,
    .read_header    = film_read_header,
    .read_packet    = film_read_packet,
    .read_close     = film_read_close,
    .read_seek      = film_read_seek,
};
