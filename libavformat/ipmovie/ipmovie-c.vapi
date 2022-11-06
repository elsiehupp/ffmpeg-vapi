/*
 * Interplay MVE File Demuxer
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
 * Interplay MVE file demuxer
 * by Mike Melanson (melanson@pcisys.net)
 * For more information regarding the Interplay MVE file format, visit:
 *   http://www.pcisys.net/~melanson/codecs/
 * The aforementioned site also contains a command line utility for parsing
 * IP MVE files so that you can get a good idea of the typical structure of
 * such files. This demuxer is not the best example to use if you are trying
 * to write your own as it uses a rather roundabout approach for splitting
 * up and sending out the chunks.
 */

AVInputFormat ff_ipmovie_demuxer = {
    .name           = "ipmovie",
    .long_name      = NULL_IF_CONFIG_SMALL("Interplay MVE"),
    .priv_data_size = sizeof(IPMVEContext),
    .read_probe     = ipmovie_probe,
    .read_header    = ipmovie_read_header,
    .read_packet    = ipmovie_read_packet,
};
