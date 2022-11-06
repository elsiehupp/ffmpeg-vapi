/*
 * SRTP network protocol
 * Copyright (c) 2012 Martin Storsjo
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

#define D AV_OPT_FLAG_DECODING_PARAM
#define E AV_OPT_FLAG_ENCODING_PARAM
static const AVOption options[] = {
    { "srtp_out_suite", "", offsetof(SRTPProtoContext, out_suite), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, E },
    { "srtp_out_params", "", offsetof(SRTPProtoContext, out_params), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, E },
    { "srtp_in_suite", "", offsetof(SRTPProtoContext, in_suite), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, D },
    { "srtp_in_params", "", offsetof(SRTPProtoContext, in_params), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, D },
    { NULL }
};

static const AVClass srtp_context_class = {
    .class_name     = "srtp",
    .item_name      = av_default_item_name,
    .option         = options,
    .version        = LIBAVUTIL_VERSION_INT,
};

const URLProtocol ff_srtp_protocol = {
    .name                      = "srtp",
    .url_open                  = srtp_open,
    .url_read                  = srtp_read,
    .url_write                 = srtp_write,
    .url_close                 = srtp_close,
    .url_get_file_handle       = srtp_get_file_handle,
    .url_get_multi_file_handle = srtp_get_multi_file_handle,
    .priv_data_size            = sizeof(SRTPProtoContext),
    .priv_data_class           = &srtp_context_class,
    .flags                     = URL_PROTOCOL_FLAG_NETWORK,
};
