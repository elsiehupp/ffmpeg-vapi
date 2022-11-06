/*
 * LATM/LOAS muxer
 * Copyright (c) 2011 Kieran Kunhya <kieran@kunhya.com>
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

AVOutputFormat ff_latm_muxer = {
    .name           = "latm",
    .long_name      = NULL_IF_CONFIG_SMALL("LOAS/LATM"),
    .mime_type      = "audio/MP4A-LATM",
    .extensions     = "latm,loas",
    .priv_data_size = sizeof(LATMContext),
    .audio_codec    = AV_CODEC_ID_AAC,
    .video_codec    = AV_CODEC_ID_NONE,
    .write_header   = latm_write_header,
    .write_packet   = latm_write_packet,
    .priv_class     = &latm_muxer_class,
    .check_bitstream= latm_check_bitstream,
    .flags          = AVFMT_NOTIMESTAMPS,
};
