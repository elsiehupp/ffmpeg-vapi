/*
 * Input cache protocol.
 * Copyright (c) 2011,2014 Michael Niedermayer
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
 *
 * Based on file.c by Fabrice Bellard
 */

/**
 * @TODO
 *      support keeping files
 *      support filling with a background thread
 */

#define OFFSET(x) offsetof(Context, x)
#define D AV_OPT_FLAG_DECODING_PARAM

static const AVOption options[] = {
    { "read_ahead_limit", "Amount in bytes that may be read ahead when seeking isn't supported, -1 for unlimited", OFFSET(read_ahead_limit), AV_OPT_TYPE_INT, { .i64 = 65536 }, -1, INT_MAX, D },
    {NULL},
};

static const AVClass cache_context_class = {
    .class_name = "Cache",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

const URLProtocol ff_cache_protocol = {
    .name                = "cache",
    .url_open2           = cache_open,
    .url_read            = cache_read,
    .url_seek            = cache_seek,
    .url_close           = cache_close,
    .priv_data_size      = sizeof(Context),
    .priv_data_class     = &cache_context_class,
};
