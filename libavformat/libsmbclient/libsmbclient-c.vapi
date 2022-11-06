/*
 * Copyright (c) 2014 Lukasz Marek <lukasz.m.luki@gmail.com>
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

#define OFFSET(x) offsetof(LIBSMBContext, x)
#define D AV_OPT_FLAG_DECODING_PARAM
#define E AV_OPT_FLAG_ENCODING_PARAM
static const AVOption options[] = {
    {"timeout",   "set timeout in ms of socket I/O operations",    OFFSET(timeout), AV_OPT_TYPE_INT, {.i64 = -1}, -1, INT_MAX, D|E },
    {"truncate",  "truncate existing files on write",              OFFSET(trunc),   AV_OPT_TYPE_INT, { .i64 = 1 }, 0, 1, E },
    {"workgroup", "set the workgroup used for making connections", OFFSET(workgroup), AV_OPT_TYPE_STRING, { 0 }, 0, 0, D|E },
    {NULL}
};

static const AVClass libsmbclient_context_class = {
    .class_name     = "libsmbc",
    .item_name      = av_default_item_name,
    .option         = options,
    .version        = LIBAVUTIL_VERSION_INT,
};

const URLProtocol ff_libsmbclient_protocol = {
    .name                = "smb",
    .url_open            = libsmbc_open,
    .url_read            = libsmbc_read,
    .url_write           = libsmbc_write,
    .url_seek            = libsmbc_seek,
    .url_close           = libsmbc_close,
    .url_delete          = libsmbc_delete,
    .url_move            = libsmbc_move,
    .url_open_dir        = libsmbc_open_dir,
    .url_read_dir        = libsmbc_read_dir,
    .url_close_dir       = libsmbc_close_dir,
    .priv_data_size      = sizeof(LIBSMBContext),
    .priv_data_class     = &libsmbclient_context_class,
    .flags               = URL_PROTOCOL_FLAG_NETWORK,
};
