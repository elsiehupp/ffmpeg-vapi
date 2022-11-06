/*
 * SER demuxer
 * Copyright (c) 2018 Paul B Mahol
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

#define OFFSET(x) offsetof(SERDemuxerContext, x)
#define DEC AV_OPT_FLAG_DECODING_PARAM
static const AVOption ser_options[] = {
    { "framerate", "set frame rate", OFFSET(framerate), AV_OPT_TYPE_VIDEO_RATE, {.str = "25"}, 0, INT_MAX, DEC },
    { NULL },
};

static const AVClass ser_demuxer_class = {
    .class_name = "ser demuxer",
    .item_name  = av_default_item_name,
    .option     = ser_options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_ser_demuxer = {
    .name           = "ser",
    .long_name      = NULL_IF_CONFIG_SMALL("SER (Simple uncompressed video format for astronomical capturing)"),
    .priv_data_size = sizeof(SERDemuxerContext),
    .read_probe     = ser_probe,
    .read_header    = ser_read_header,
    .read_packet    = ser_read_packet,
    .flags          = AVFMT_GENERIC_INDEX,
    .extensions     = "ser",
    .raw_codec_id   = AV_CODEC_ID_RAWVIDEO,
    .priv_class     = &ser_demuxer_class,
};
