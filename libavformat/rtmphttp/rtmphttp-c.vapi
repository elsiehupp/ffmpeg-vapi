/*
 * RTMP HTTP network protocol
 * Copyright (c) 2012 Samuel Pitoiset
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
 * RTMP HTTP protocol
 */

#define OFFSET(x) offsetof(RTMP_HTTPContext, x)
#define DEC AV_OPT_FLAG_DECODING_PARAM

static const AVOption ffrtmphttp_options[] = {
    {"ffrtmphttp_tls", "Use a HTTPS tunneling connection (RTMPTS).", OFFSET(tls), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, DEC},
    { NULL },
};

static const AVClass ffrtmphttp_class = {
    .class_name = "ffrtmphttp",
    .item_name  = av_default_item_name,
    .option     = ffrtmphttp_options,
    .version    = LIBAVUTIL_VERSION_INT,
};

const URLProtocol ff_ffrtmphttp_protocol = {
    .name           = "ffrtmphttp",
    .url_open       = rtmp_http_open,
    .url_read       = rtmp_http_read,
    .url_write      = rtmp_http_write,
    .url_close      = rtmp_http_close,
    .priv_data_size = sizeof(RTMP_HTTPContext),
    .flags          = URL_PROTOCOL_FLAG_NETWORK,
    .priv_data_class= &ffrtmphttp_class,
    .default_whitelist = "https,http,tcp,tls",
};
