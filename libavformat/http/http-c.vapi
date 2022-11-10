/***********************************************************
HTTP protocol for ffmpeg client
@copyright 2000, 2001 Fabrice Bellard
***********************************************************/
/***********************************************************
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

/***********************************************************
XXX: POST protocol is not completely implemented because ffmpeg uses
only a subset of it.
***********************************************************/

#if CONFIG_HTTP_PROTOCOL
[CCode (cname="http_context_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "http";
        }
    }
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}


[CCode (cname="ff_http_protocol", cheader="")]
public class HTTPURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "http";
        }
    }
    [CCode (cname="http_open", cheader="")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );
    [CCode (cname="http_accept", cheader="")]
    public override int url_accept (
        URLContext server_url_context,
        out URLContext client_url_context
    );
    [CCode (cname="http_handshake", cheader="")]
    public override int url_handshake (
        URLContext client_url_context
    );
    [CCode (cname="http_read", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="http_write", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="http_seek", cheader="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );
    [CCode (cname="http_close", cheader="")]
    public override int url_close (
        URLContext url_context
    );
    [CCode (cname="http_get_file_handle", cheader="")]
    public override int url_get_file_handle (
        URLContext url_context
    );
    [CCode (cname="http_get_short_seek", cheader="")]
    public override int url_get_short_seek (
        URLContext url_context
    );
    [CCode (cname="http_shutdown", cheader="")]
    public override int url_shutdown (
        URLContext url_context,
        int flags
    );
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HTTPContext);
        }
    }
    //  .priv_data_class = http_context_class,
    //  .flags = URL_PROTOCOL_FLAG_NETWORK,
    //  .default_whitelist = "http,https,tls,rtp,tcp,udp,crypto,httpproxy"
}
#endif /* CONFIG_HTTP_PROTOCOL */

#if CONFIG_HTTPS_PROTOCOL
[CCode (cname="https_context_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "https";
        }
    }
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}


[CCode (cname="ff_https_protocol", cheader="")]
public class URLProtocol : URLProtocol ff_https_protocol = {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "https";
        }
    }
    [CCode (cname="http_open", cheader="")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );
    [CCode (cname="http_read", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="http_write", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="http_seek", cheader="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );
    [CCode (cname="http_close", cheader="")]
    public override int url_close (
        URLContext url_context
    );
    [CCode (cname="http_get_file_handle", cheader="")]
    public override int url_get_file_handle (
        URLContext url_context
    );
    [CCode (cname="http_get_short_seek", cheader="")]
    public override int url_get_short_seek (
        URLContext url_context
    );
    [CCode (cname="http_shutdown", cheader="")]
    public override int url_shutdown (
        URLContext url_context,
        int flags
    );
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HTTPContext);
        }
    }
    //  .priv_data_class = https_context_class,
    //  .flags = URL_PROTOCOL_FLAG_NETWORK,
    //  .default_whitelist = "http,https,tls,rtp,tcp,udp,crypto,httpproxy"
}
#endif /* CONFIG_HTTPS_PROTOCOL */

#if CONFIG_HTTPPROXY_PROTOCOL
[CCode (cname="ff_httpproxy_protocol", cheader="")]
public class URLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "httpproxy";
        }
    }
    [CCode (cname="http_proxy_open", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );
    [CCode (cname="http_buf_read", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="http_proxy_write", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="http_proxy_close", cheader="")]
    public override int url_close (
        URLContext url_context
    );
    [CCode (cname="http_get_file_handle", cheader="")]
    public override int url_get_file_handle (
        URLContext url_context
    );
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HTTPContext);
        }
    }
    //  .flags = URL_PROTOCOL_FLAG_NETWORK,
}
#endif /* CONFIG_HTTPPROXY_PROTOCOL */
