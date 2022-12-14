/***********************************************************
@brief HTTP protocol for ffmpeg client
@copyright 2000, 2001 Fabrice Bellard
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

namespace LibAVFormat {

/***********************************************************
@brief XXX: POST protocol is not completely implemented because ffmpeg uses
only a subset of it.
***********************************************************/

#if CONFIG_HTTP_PROTOCOL
[CCode (cname="http_context_class", cheader_filename="")]
public class HTTPURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "http";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_http_protocol", cheader_filename="")]
public class HTTPURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "http";
        }
    }

    [CCode (cname="http_open", cheader_filename="")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="http_accept", cheader_filename="")]
    public override int url_accept (
        URLContext server_url_context,
        out URLContext client_url_context
    );

    [CCode (cname="http_handshake", cheader_filename="")]
    public override int url_handshake (
        URLContext client_url_context
    );

    [CCode (cname="http_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="http_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="http_seek", cheader_filename="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );

    [CCode (cname="http_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="http_get_file_handle", cheader_filename="")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="http_get_short_seek", cheader_filename="")]
    public override int url_get_short_seek (
        URLContext url_context
    );

    [CCode (cname="http_shutdown", cheader_filename="")]
    public override int url_shutdown (
        URLContext url_context,
        int flags
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HTTPContext);
        }
    }
    //  .priv_data_class = http_context_class,
    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
    //  .default_whitelist = "http,https,tls,rtp,tcp,udp,crypto,httpproxy";
}
#endif /***********************************************************
    CONFIG_HTTP_PROTOCOL
***********************************************************/

#if CONFIG_HTTPS_PROTOCOL
[CCode (cname="https_context_class", cheader_filename="")]
public class HTTPSURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "https";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_https_protocol", cheader_filename="")]
public class HTTPSURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "https";
        }
    }

    [CCode (cname="http_open", cheader_filename="")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="http_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="http_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="http_seek", cheader_filename="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );

    [CCode (cname="http_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="http_get_file_handle", cheader_filename="")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="http_get_short_seek", cheader_filename="")]
    public override int url_get_short_seek (
        URLContext url_context
    );

    [CCode (cname="http_shutdown", cheader_filename="")]
    public override int url_shutdown (
        URLContext url_context,
        int flags
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HTTPContext);
        }
    }
    //  .priv_data_class = https_context_class,
    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
    //  .default_whitelist = "http,https,tls,rtp,tcp,udp,crypto,httpproxy";
}
#endif /***********************************************************
    CONFIG_HTTPS_PROTOCOL
***********************************************************/

#if CONFIG_HTTPPROXY_PROTOCOL
[CCode (cname="ff_httpproxy_protocol", cheader_filename="")]
public class HttpProxyURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "httpproxy";
        }
    }

    [CCode (cname="http_proxy_open", cheader_filename="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="http_buf_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="http_proxy_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="http_proxy_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="http_get_file_handle", cheader_filename="")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HTTPContext);
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
}
#endif /***********************************************************
    CONFIG_HTTPPROXY_PROTOCOL
***********************************************************/

} // namespace LibAVFormat
