/*
 * FLV demuxer
 * Copyright (c) 2003 The FFmpeg Project
 *
 * This demuxer will generate a 1 byte extradata for VP6F content.
 * It is composed of:
 *  - upper 4 bits: difference between encoded width and visible width
 *  - lower 4 bits: difference between encoded height and visible height
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

#define OFFSET(x) offsetof(FLVContext, x)
#define VD AV_OPT_FLAG_VIDEO_PARAM | AV_OPT_FLAG_DECODING_PARAM
static const AVOption options[] = {
    { "flv_metadata", "Allocate streams according to the onMetaData array", OFFSET(trust_metadata), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, VD },
    { "flv_full_metadata", "Dump full metadata of the onMetadata", OFFSET(dump_full_metadata), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, VD },
    { "flv_ignore_prevtag", "Ignore the Size of previous tag", OFFSET(trust_datasize), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, VD },
    { "missing_streams", "", OFFSET(missing_streams), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, 0xFF, VD | AV_OPT_FLAG_EXPORT | AV_OPT_FLAG_READONLY },
    { NULL }
};

static const AVClass flv_class = {
    .class_name = "flvdec",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_flv_demuxer = {
    .name           = "flv",
    .long_name      = NULL_IF_CONFIG_SMALL("FLV (Flash Video)"),
    .priv_data_size = sizeof(FLVContext),
    .read_probe     = flv_probe,
    .read_header    = flv_read_header,
    .read_packet    = flv_read_packet,
    .read_seek      = flv_read_seek,
    .read_close     = flv_read_close,
    .extensions     = "flv",
    .priv_class     = &flv_class,
};

static const AVClass live_flv_class = {
    .class_name = "live_flvdec",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_live_flv_demuxer = {
    .name           = "live_flv",
    .long_name      = NULL_IF_CONFIG_SMALL("live RTMP FLV (Flash Video)"),
    .priv_data_size = sizeof(FLVContext),
    .read_probe     = live_flv_probe,
    .read_header    = flv_read_header,
    .read_packet    = flv_read_packet,
    .read_seek      = flv_read_seek,
    .read_close     = flv_read_close,
    .extensions     = "flv",
    .priv_class     = &live_flv_class,
    .flags          = AVFMT_TS_DISCONT
};

static const AVClass kux_class = {
    .class_name = "kuxdec",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_kux_demuxer = {
    .name           = "kux",
    .long_name      = NULL_IF_CONFIG_SMALL("KUX (YouKu)"),
    .priv_data_size = sizeof(FLVContext),
    .read_probe     = kux_probe,
    .read_header    = flv_read_header,
    .read_packet    = flv_read_packet,
    .read_seek      = flv_read_seek,
    .read_close     = flv_read_close,
    .extensions     = "kux",
    .priv_class     = &kux_class,
};
