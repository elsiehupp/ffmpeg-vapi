/*
 * G.729 bit format muxer and demuxer
 * Copyright (c) 2007-2008 Vladimir Voroshilov
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

#if CONFIG_BIT_MUXER
AVOutputFormat ff_bit_muxer = {
    .name         = "bit",
    .long_name    = NULL_IF_CONFIG_SMALL("G.729 BIT file format"),
    .mime_type    = "audio/bit",
    .extensions   = "bit",
    .audio_codec  = AV_CODEC_ID_G729,
    .video_codec  = AV_CODEC_ID_NONE,
    .write_header = write_header,
    .write_packet = write_packet,
};
#endif
