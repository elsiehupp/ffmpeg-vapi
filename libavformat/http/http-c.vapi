/*
 * HTTP protocol for ffmpeg client
 * Copyright (c) 2000, 2001 Fabrice Bellard
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

/* XXX: POST protocol is not completely implemented because ffmpeg uses
 * only a subset of it. */

#define HTTP_CLASS(flavor)                          \
static const AVClass flavor ## _context_class = {   \
    .class_name = # flavor,                         \
    .item_name  = av_default_item_name,             \
    .option     = options,                          \
    .version    = LIBAVUTIL_VERSION_INT,            \
}

#if CONFIG_HTTP_PROTOCOL
HTTP_CLASS(http);

const URLProtocol ff_http_protocol = {
    .name                = "http",
    .url_open2           = http_open,
    .url_accept          = http_accept,
    .url_handshake       = http_handshake,
    .url_read            = http_read,
    .url_write           = http_write,
    .url_seek            = http_seek,
    .url_close           = http_close,
    .url_get_file_handle = http_get_file_handle,
    .url_get_short_seek  = http_get_short_seek,
    .url_shutdown        = http_shutdown,
    .priv_data_size      = sizeof(HTTPContext),
    .priv_data_class     = &http_context_class,
    .flags               = URL_PROTOCOL_FLAG_NETWORK,
    .default_whitelist   = "http,https,tls,rtp,tcp,udp,crypto,httpproxy"
};
#endif /* CONFIG_HTTP_PROTOCOL */

#if CONFIG_HTTPS_PROTOCOL
HTTP_CLASS(https);

const URLProtocol ff_https_protocol = {
    .name                = "https",
    .url_open2           = http_open,
    .url_read            = http_read,
    .url_write           = http_write,
    .url_seek            = http_seek,
    .url_close           = http_close,
    .url_get_file_handle = http_get_file_handle,
    .url_get_short_seek  = http_get_short_seek,
    .url_shutdown        = http_shutdown,
    .priv_data_size      = sizeof(HTTPContext),
    .priv_data_class     = &https_context_class,
    .flags               = URL_PROTOCOL_FLAG_NETWORK,
    .default_whitelist   = "http,https,tls,rtp,tcp,udp,crypto,httpproxy"
};
#endif /* CONFIG_HTTPS_PROTOCOL */

#if CONFIG_HTTPPROXY_PROTOCOL
const URLProtocol ff_httpproxy_protocol = {
    .name                = "httpproxy",
    .url_open            = http_proxy_open,
    .url_read            = http_buf_read,
    .url_write           = http_proxy_write,
    .url_close           = http_proxy_close,
    .url_get_file_handle = http_get_file_handle,
    .priv_data_size      = sizeof(HTTPContext),
    .flags               = URL_PROTOCOL_FLAG_NETWORK,
};
#endif /* CONFIG_HTTPPROXY_PROTOCOL */
