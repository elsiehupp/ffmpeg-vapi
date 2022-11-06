/*
 * AviSynth/AvxSynth support
 * Copyright (c) 2012 AvxSynth Team
 *
 * This file is part of FFmpeg
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

AVInputFormat ff_avisynth_demuxer = {
    .name           = "avisynth",
    .long_name      = NULL_IF_CONFIG_SMALL("AviSynth script"),
    .priv_data_size = sizeof(AviSynthContext),
    .read_header    = avisynth_read_header,
    .read_packet    = avisynth_read_packet,
    .read_close     = avisynth_read_close,
    .read_seek      = avisynth_read_seek,
    .extensions     = "avs",
};
