/*
 * True Audio (TTA) muxer
 * Copyright (c) 2016 James Almer
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

AVOutputFormat ff_tta_muxer = {
    .name              = "tta",
    .long_name         = NULL_IF_CONFIG_SMALL("TTA (True Audio)"),
    .mime_type         = "audio/x-tta",
    .extensions        = "tta",
    .priv_data_size    = sizeof(TTAMuxContext),
    .audio_codec       = AV_CODEC_ID_TTA,
    .video_codec       = AV_CODEC_ID_NONE,
    .init              = tta_init,
    .write_header      = tta_write_header,
    .write_packet      = tta_write_packet,
    .write_trailer     = tta_write_trailer,
};
