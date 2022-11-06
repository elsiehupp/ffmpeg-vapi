/*
 * RAW GSM demuxer
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

static const AVOption options[] = {
    { "sample_rate", "", offsetof(GSMDemuxerContext, sample_rate),
       AV_OPT_TYPE_INT, {.i64 = GSM_SAMPLE_RATE}, 1, INT_MAX / GSM_BLOCK_SIZE,
       AV_OPT_FLAG_DECODING_PARAM },
    { NULL },
};

static const AVClass gsm_class = {
    .class_name = "gsm demuxer",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_gsm_demuxer = {
    .name           = "gsm",
    .long_name      = NULL_IF_CONFIG_SMALL("raw GSM"),
    .priv_data_size = sizeof(GSMDemuxerContext),
    .read_probe     = gsm_probe,
    .read_header    = gsm_read_header,
    .read_packet    = gsm_read_packet,
    .flags          = AVFMT_GENERIC_INDEX,
    .extensions     = "gsm",
    .raw_codec_id   = AV_CODEC_ID_GSM,
    .priv_class     = &gsm_class,
};