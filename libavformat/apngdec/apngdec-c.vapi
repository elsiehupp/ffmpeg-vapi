/*
 * APNG demuxer
 * Copyright (c) 2014 Benoit Fouet
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
 * APNG demuxer.
 * @see https://wiki.mozilla.org/APNG_Specification
 * @see http://www.w3.org/TR/PNG
 */

static const AVOption options[] = {
    { "ignore_loop", "ignore loop setting"                         , offsetof(APNGDemuxContext, ignore_loop),
      AV_OPT_TYPE_BOOL, { .i64 = 1 }              , 0, 1      , AV_OPT_FLAG_DECODING_PARAM },
    { "max_fps"    , "maximum framerate (0 is no limit)"           , offsetof(APNGDemuxContext, max_fps),
      AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
    { "default_fps", "default framerate (0 is as fast as possible)", offsetof(APNGDemuxContext, default_fps),
      AV_OPT_TYPE_INT, { .i64 = DEFAULT_APNG_FPS }, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
    { NULL },
};

static const AVClass demuxer_class = {
    .class_name = "APNG demuxer",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
    .category   = AV_CLASS_CATEGORY_DEMUXER,
};

AVInputFormat ff_apng_demuxer = {
    .name           = "apng",
    .long_name      = NULL_IF_CONFIG_SMALL("Animated Portable Network Graphics"),
    .priv_data_size = sizeof(APNGDemuxContext),
    .read_probe     = apng_probe,
    .read_header    = apng_read_header,
    .read_packet    = apng_read_packet,
    .flags          = AVFMT_GENERIC_INDEX,
    .priv_class     = &demuxer_class,
};
