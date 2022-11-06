/*
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
 * Haivision Open SRT (Secure Reliable Transport) protocol
 */

static const AVClass libsrt_class = {
    .class_name = "libsrt",
    .item_name  = av_default_item_name,
    .option     = libsrt_options,
    .version    = LIBAVUTIL_VERSION_INT,
};

const URLProtocol ff_libsrt_protocol = {
    .name                = "srt",
    .url_open            = libsrt_open,
    .url_read            = libsrt_read,
    .url_write           = libsrt_write,
    .url_close           = libsrt_close,
    .url_get_file_handle = libsrt_get_file_handle,
    .priv_data_size      = sizeof(SRTContext),
    .flags               = URL_PROTOCOL_FLAG_NETWORK,
    .priv_data_class     = &libsrt_class,
};
