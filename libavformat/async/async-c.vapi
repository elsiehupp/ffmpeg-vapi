/*
 * Input async protocol.
 * Copyright (c) 2015 Zhang Rui <bbcallen@gmail.com>
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
 * Based on libavformat/cache.c by Michael Niedermayer
 */

 /**
 * @TODO
 *      support timeout
 *      support work with concatdec, hls
 */

#define OFFSET(x) offsetof(Context, x)
#define D AV_OPT_FLAG_DECODING_PARAM

static const AVOption options[] = {
    {NULL},
};

#undef D
#undef OFFSET

static const AVClass async_context_class = {
    .class_name = "Async",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

const URLProtocol ff_async_protocol = {
    .name                = "async",
    .url_open2           = async_open,
    .url_read            = async_read,
    .url_seek            = async_seek,
    .url_close           = async_close,
    .priv_data_size      = sizeof(Context),
    .priv_data_class     = &async_context_class,
};

#if 0

#define OFFSET(x) offsetof(TestContext, x)
#define D AV_OPT_FLAG_DECODING_PARAM

static const AVOption async_test_options[] = {
    { "async-test-read-error",      "cause read fail",
        OFFSET(opt_read_error),     AV_OPT_TYPE_INT, { .i64 = 0 }, INT_MIN, INT_MAX, .flags = D },
    {NULL},
};

#undef D
#undef OFFSET

static const AVClass async_test_context_class = {
    .class_name = "Async-Test",
    .item_name  = av_default_item_name,
    .option     = async_test_options,
    .version    = LIBAVUTIL_VERSION_INT,
};

const URLProtocol ff_async_test_protocol = {
    .name                = "async-test",
    .url_open2           = async_test_open,
    .url_read            = async_test_read,
    .url_seek            = async_test_seek,
    .url_close           = async_test_close,
    .priv_data_size      = sizeof(TestContext),
    .priv_data_class     = &async_test_context_class,
};

#endif
