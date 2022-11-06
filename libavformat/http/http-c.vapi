/***********************************************************
 HTTP protocol for ffmpeg client
 @copyright 2000, 2001 Fabrice Bellard

 This file is part of FFmpeg.

 FFmpeg is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2.1 of the License, or (at your option) any later version.

 FFmpeg is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public
 License along with FFmpeg; if not, write to the Free Software
 Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

/* XXX: POST protocol is not completely implemented because ffmpeg uses
 only a subset of it. */

#define HTTP_CLASS(flavor)                          \
static const AVClass flavor ## _context_class = {   \
    //  .class_name = # flavor,                         \
    //  .item_name  = av_default_item_name,             \
    //  .option     = options,                          \
    //  .version    = LIBAVUTIL_VERSION_INT,            \
}

#if CONFIG_HTTP_PROTOCOL
HTTP_CLASS(http);

[CCode (cname="ff_http_protocol", cheader="")]
public class HTTPURLProtocol : URLProtocol {
    //  .name                = "http",
    [CCode (cname="", cheader="")]
    public override int url_open2 (
        URLContext h,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );           = http_open,
    [CCode (cname="", cheader="")]
    public override int url_accept (
        URLContext server_url_context,
        out URLContext client_url_context
    );          = http_accept,
    [CCode (cname="", cheader="")]
    public override int url_handshake (
        URLContext client_url_context
    );       = http_handshake,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext h,
        uchar[] buf,
        int size
    );            = http_read,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext h,
        uchar[] buf,
        int size
    );           = http_write,
    [CCode (cname="", cheader="")]
    public override int64 url_seek (
        URLContext h,
        int64 pos,
        int whence
    );            = http_seek,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext h
    );           = http_close,
    [CCode (cname="", cheader="")]
    public override int url_get_file_handle (
        URLContext h
    ); = http_get_file_handle,
    [CCode (cname="", cheader="")]
    public override int url_get_short_seek (
        URLContext h
    );  = http_get_short_seek,
    [CCode (cname="", cheader="")]
    public override int url_shutdown (
        URLContext h,
        int flags
    );        = http_shutdown,
    //  .priv_data_size      = sizeof(HTTPContext),
    //  .priv_data_class     = &http_context_class,
    //  .flags               = URL_PROTOCOL_FLAG_NETWORK,
    //  .default_whitelist   = "http,https,tls,rtp,tcp,udp,crypto,httpproxy"
}
#endif /* CONFIG_HTTP_PROTOCOL */

#if CONFIG_HTTPS_PROTOCOL
HTTP_CLASS(https);

[CCode (cname="ff_https_protocol", cheader="")]
public class URLProtocol : URLProtocol ff_https_protocol = {
    //  .name                = "https",
    [CCode (cname="", cheader="")]
    public override int url_open2 (
        URLContext h,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );           = http_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext h,
        uchar[] buf,
        int size
    );            = http_read,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext h,
        uchar[] buf,
        int size
    );           = http_write,
    [CCode (cname="", cheader="")]
    public override int64 url_seek (
        URLContext h,
        int64 pos,
        int whence
    );            = http_seek,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext h
    );           = http_close,
    [CCode (cname="", cheader="")]
    public override int url_get_file_handle (
        URLContext h
    ); = http_get_file_handle,
    [CCode (cname="", cheader="")]
    public override int url_get_short_seek (
        URLContext h
    );  = http_get_short_seek,
    [CCode (cname="", cheader="")]
    public override int url_shutdown (
        URLContext h,
        int flags
    );        = http_shutdown,
    //  .priv_data_size      = sizeof(HTTPContext),
    //  .priv_data_class     = &https_context_class,
    //  .flags               = URL_PROTOCOL_FLAG_NETWORK,
    //  .default_whitelist   = "http,https,tls,rtp,tcp,udp,crypto,httpproxy"
}
#endif /* CONFIG_HTTPS_PROTOCOL */

#if CONFIG_HTTPPROXY_PROTOCOL
[CCode (cname="", cheader="")]
public class URLProtocol : URLProtocol ff_httpproxy_protocol = {
    //  .name                = "httpproxy",
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext h,
        string url,
        int flags
    );            = http_proxy_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext h,
        uchar[] buf,
        int size
    );            = http_buf_read,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext h,
        uchar[] buf,
        int size
    );           = http_proxy_write,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext h
    );           = http_proxy_close,
    [CCode (cname="", cheader="")]
    public override int url_get_file_handle (
        URLContext h
    ); = http_get_file_handle,
    //  .priv_data_size      = sizeof(HTTPContext),
    //  .flags               = URL_PROTOCOL_FLAG_NETWORK,
}
#endif /* CONFIG_HTTPPROXY_PROTOCOL */
