/*
 * Sony OpenMG (OMA) demuxer
 *
 * Copyright (c) 2008, 2013 Maxim Poliakovski
 *               2008 Benjamin Larsson
 *               2011 David Goldwich
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
 * This is a demuxer for Sony OpenMG Music files
 *
 * Known file extensions: ".oma", "aa3"
 * The format of such files consists of three parts:
 * - "ea3" header carrying overall info and metadata. Except for starting with
 *   "ea" instead of "ID", it's an ID3v2 header.
 * - "EA3" header is a Sony-specific header containing information about
 *   the OpenMG file: codec type (usually ATRAC, can also be MP3 or WMA),
 *   codec specific info (packet size, sample rate, channels and so on)
 *   and DRM related info (file encryption, content id).
 * - Sound data organized in packets follow the EA3 header
 *   (can be encrypted using the Sony DRM!).
 *
 * Supported decoders: ATRAC3, ATRAC3+, MP3, LPCM
 */

AVInputFormat ff_oma_demuxer = {
    .name           = "oma",
    .long_name      = NULL_IF_CONFIG_SMALL("Sony OpenMG audio"),
    .priv_data_size = sizeof(OMAContext),
    .read_probe     = oma_read_probe,
    .read_header    = oma_read_header,
    .read_packet    = oma_read_packet,
    .read_seek      = oma_read_seek,
    .read_close     = oma_read_close,
    .flags          = AVFMT_GENERIC_INDEX,
    .extensions     = "oma,omg,aa3",
    .codec_tag      = (const AVCodecTag* const []){ff_oma_codec_tags, 0},
};