/*
 * RAW aptX demuxer
 *
 * Copyright (C) 2017  Aurelien Jacobs <aurel@gnuage.org>
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

static const AVOption aptx_options[] = {
    { "sample_rate", "", offsetof(AptXDemuxerContext, sample_rate), AV_OPT_TYPE_INT, {.i64 = 48000}, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
    { NULL },
};

#if CONFIG_APTX_DEMUXER
static const AVClass aptx_demuxer_class = {
    .class_name = "aptx demuxer",
    .item_name  = av_default_item_name,
    .option     = aptx_options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_aptx_demuxer = {
    .name           = "aptx",
    .long_name      = NULL_IF_CONFIG_SMALL("raw aptX"),
    .extensions     = "aptx",
    .priv_data_size = sizeof(AptXDemuxerContext),
    .read_header    = aptx_read_header,
    .read_packet    = aptx_read_packet,
    .flags          = AVFMT_GENERIC_INDEX,
    .priv_class     = &aptx_demuxer_class,
};
#endif

#if CONFIG_APTX_HD_DEMUXER
static const AVClass aptx_hd_demuxer_class = {
    .class_name = "aptx hd demuxer",
    .item_name  = av_default_item_name,
    .option     = aptx_options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_aptx_hd_demuxer = {
    .name           = "aptx_hd",
    .long_name      = NULL_IF_CONFIG_SMALL("raw aptX HD"),
    .extensions     = "aptxhd",
    .priv_data_size = sizeof(AptXDemuxerContext),
    .read_header    = aptx_hd_read_header,
    .read_packet    = aptx_hd_read_packet,
    .flags          = AVFMT_GENERIC_INDEX,
    .priv_class     = &aptx_hd_demuxer_class,
};
#endif
