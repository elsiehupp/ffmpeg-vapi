/*
 * webp muxer
 * Copyright (c) 2014 Michael Niedermayer
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

#define OFFSET(x) offsetof(WebpContext, x)
#define ENC AV_OPT_FLAG_ENCODING_PARAM
static const AVOption options[] = {
    { "loop", "Number of times to loop the output: 0 - infinite loop", OFFSET(loop),
      AV_OPT_TYPE_INT, { .i64 = 1 }, 0, 65535, ENC },
    { NULL },
};

static const AVClass webp_muxer_class = {
    .class_name = "WebP muxer",
    .item_name  = av_default_item_name,
    .version    = LIBAVUTIL_VERSION_INT,
    .option     = options,
};
AVOutputFormat ff_webp_muxer = {
    .name           = "webp",
    .long_name      = NULL_IF_CONFIG_SMALL("WebP"),
    .extensions     = "webp",
    .priv_data_size = sizeof(WebpContext),
    .video_codec    = AV_CODEC_ID_WEBP,
    .write_header   = webp_write_header,
    .write_packet   = webp_write_packet,
    .write_trailer  = webp_write_trailer,
    .priv_class     = &webp_muxer_class,
    .flags          = AVFMT_VARIABLE_FPS,
};
