/*
 * Copyright (c) 2012 Clément Bœsch
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
 * WebVTT subtitle demuxer
 * @see http://dev.w3.org/html5/webvtt/
 */

#define OFFSET(x) offsetof(WebVTTContext, x)
#define KIND_FLAGS AV_OPT_FLAG_SUBTITLE_PARAM|AV_OPT_FLAG_DECODING_PARAM

static const AVOption options[] = {
    { "kind", "Set kind of WebVTT track", OFFSET(kind), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX, KIND_FLAGS, "webvtt_kind" },
        { "subtitles",    "WebVTT subtitles kind",    0, AV_OPT_TYPE_CONST, { .i64 = 0 },                           INT_MIN, INT_MAX, KIND_FLAGS, "webvtt_kind" },
        { "captions",     "WebVTT captions kind",     0, AV_OPT_TYPE_CONST, { .i64 = AV_DISPOSITION_CAPTIONS },     INT_MIN, INT_MAX, KIND_FLAGS, "webvtt_kind" },
        { "descriptions", "WebVTT descriptions kind", 0, AV_OPT_TYPE_CONST, { .i64 = AV_DISPOSITION_DESCRIPTIONS }, INT_MIN, INT_MAX, KIND_FLAGS, "webvtt_kind" },
        { "metadata",     "WebVTT metadata kind",     0, AV_OPT_TYPE_CONST, { .i64 = AV_DISPOSITION_METADATA },     INT_MIN, INT_MAX, KIND_FLAGS, "webvtt_kind" },
    { NULL }
};

static const AVClass webvtt_demuxer_class = {
    .class_name  = "WebVTT demuxer",
    .item_name   = av_default_item_name,
    .option      = options,
    .version     = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_webvtt_demuxer = {
    .name           = "webvtt",
    .long_name      = NULL_IF_CONFIG_SMALL("WebVTT subtitle"),
    .priv_data_size = sizeof(WebVTTContext),
    .read_probe     = webvtt_probe,
    .read_header    = webvtt_read_header,
    .read_packet    = webvtt_read_packet,
    .read_seek2     = webvtt_read_seek,
    .read_close     = webvtt_read_close,
    .extensions     = "vtt",
    .priv_class     = &webvtt_demuxer_class,
};
