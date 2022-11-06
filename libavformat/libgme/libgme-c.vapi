/*
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
* libgme demuxer
*/

static const AVClass class_gme = {
    .class_name = "Game Music Emu demuxer",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_libgme_demuxer = {
    .name           = "libgme",
    .long_name      = NULL_IF_CONFIG_SMALL("Game Music Emu demuxer"),
    .priv_data_size = sizeof(GMEContext),
    .read_probe     = probe_gme,
    .read_header    = read_header_gme,
    .read_packet    = read_packet_gme,
    .read_close     = read_close_gme,
    .read_seek      = read_seek_gme,
    .priv_class     = &class_gme,
};
