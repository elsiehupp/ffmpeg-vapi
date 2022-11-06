/*
 * Copyright (c) 2011 Justin Ruggles
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
 * CRI ADX demuxer
 */

AVInputFormat ff_adx_demuxer = {
    .name           = "adx",
    .long_name      = NULL_IF_CONFIG_SMALL("CRI ADX"),
    .read_probe     = adx_probe,
    .priv_data_size = sizeof(ADXDemuxerContext),
    .read_header    = adx_read_header,
    .read_packet    = adx_read_packet,
    .extensions     = "adx",
    .raw_codec_id   = AV_CODEC_ID_ADPCM_ADX,
    .flags          = AVFMT_GENERIC_INDEX,
};
