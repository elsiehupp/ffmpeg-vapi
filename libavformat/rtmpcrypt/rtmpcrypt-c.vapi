/*
 * RTMPE network protocol
 * Copyright (c) 2008-2009 Andrej Stepanchuk
 * Copyright (c) 2009-2010 Howard Chu
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
 * RTMPE protocol
 */

#define OFFSET(x) offsetof(RTMPEContext, x)
#define DEC AV_OPT_FLAG_DECODING_PARAM

static const AVOption ffrtmpcrypt_options[] = {
    {"ffrtmpcrypt_tunneling", "Use a HTTP tunneling connection (RTMPTE).", OFFSET(tunneling), AV_OPT_TYPE_INT, {.i64 = 0}, 0, 1, DEC},
    { NULL },
};

static const AVClass ffrtmpcrypt_class = {
    .class_name = "ffrtmpcrypt",
    .item_name  = av_default_item_name,
    .option     = ffrtmpcrypt_options,
    .version    = LIBAVUTIL_VERSION_INT,
};

const URLProtocol ff_ffrtmpcrypt_protocol = {
    .name            = "ffrtmpcrypt",
    .url_open        = rtmpe_open,
    .url_read        = rtmpe_read,
    .url_write       = rtmpe_write,
    .url_close       = rtmpe_close,
    .priv_data_size  = sizeof(RTMPEContext),
    .flags           = URL_PROTOCOL_FLAG_NETWORK,
    .priv_data_class = &ffrtmpcrypt_class,
};
