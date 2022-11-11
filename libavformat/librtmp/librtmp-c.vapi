/***********************************************************
RTMP network protocol
@copyright 2010 Howard Chu
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

namespace LibAVFormat {

/***********************************************************
@file RTMP protocol based on http://rtmpdump.mplayerhq.hu/ librtmp
***********************************************************/

//  #define OFFSET(x) offsetof(LibRTMPContext, x)
//  #define DEC AV_OPT_FLAG_DECODING_PARAM
//  #define ENC AV_OPT_FLAG_ENCODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      {"rtmp_app", "Name of application to connect to on the RTMP server", OFFSET(app), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC|ENC},
//      {"rtmp_buffer", "Set buffer time in milliseconds. The default is 3000.", OFFSET(client_buffer_time), AV_OPT_TYPE_STRING, {.str = "3000"}, 0, 0, DEC|ENC},
//      {"rtmp_conn", "Append arbitrary AMF data to the Connect message", OFFSET(conn), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC|ENC},
//      {"rtmp_flashver", "Version of the Flash plugin used to run the SWF player.", OFFSET(flashver), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC|ENC},
//      {"rtmp_live", "Specify that the media is a live stream.", OFFSET(live), AV_OPT_TYPE_INT, {.i64 = 0}, INT_MIN, INT_MAX, DEC, "rtmp_live"},
//      {"any", "both", 0, AV_OPT_TYPE_CONST, {.i64 = -2}, 0, 0, DEC, "rtmp_live"},
//      {"live", "live stream", 0, AV_OPT_TYPE_CONST, {.i64 = -1}, 0, 0, DEC, "rtmp_live"},
//      {"recorded", "recorded stream", 0, AV_OPT_TYPE_CONST, {.i64 = 0}, 0, 0, DEC, "rtmp_live"},
//      {"rtmp_pageurl", "URL of the web page in which the media was embedded. By default no value will be sent.", OFFSET(pageurl), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC},
//      {"rtmp_playpath", "Stream identifier to play or to publish", OFFSET(playpath), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC|ENC},
//      {"rtmp_subscribe", "Name of live stream to subscribe to. Defaults to rtmp_playpath.", OFFSET(subscribe), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC},
//      {"rtmp_swfurl", "URL of the SWF player. By default no value will be sent", OFFSET(swfurl), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC|ENC},
//      {"rtmp_swfverify", "URL to player swf file, compute hash/size automatically. (unimplemented)", OFFSET(swfverify), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC},
//      {"rtmp_tcurl", "URL of the target stream. Defaults to proto://host[:port]/app.", OFFSET(tcurl), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC|ENC},
//  #if CONFIG_NETWORK
//      {"rtmp_buffer_size", "set buffer size in bytes", OFFSET(buffer_size), AV_OPT_TYPE_INT, {.i64 = -1}, -1, INT_MAX, DEC|ENC },
//  #endif
//      { NULL },
//  }

[CCode (cname="librtmp_class", cheader="")]
public class LibRTMPURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "librtmp protocol";
        }
    }
    [CCode (cname="item_name", cheader="")]
    public override string item_name (
        void *class_context
    ) {
        return av_default_item_name (
            class_context
        );
    }
    [CCode (cname="options", cheader="")]
    public override LibAVUtil.Option[] option { public get; }
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_librtmp_protocol", cheader="")]
public class LibRTMPURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "rtmp";
        }
    }
    [CCode (cname="rtmp_open", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );
    [CCode (cname="rtmp_read", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="rtmp_write", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="rtmp_close", cheader="")]
    public override int url_close (
        URLContext url_context
    );
    [CCode (cname="rtmp_read_pause", cheader="")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );
    [CCode (cname="rtmp_read_seek", cheader="")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
    [CCode (cname="rtmp_get_file_handle", cheader="")]
    public override int url_get_file_handle (
        URLContext url_context
    );
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (LibRTMPContext);
        }
    }
    //  .priv_data_class = librtmp_class,
    [CCode (cname="flags", cheader="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
}

[CCode (cname="librtmpt_class", cheader="")]
public class LibRTMPTURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "librtmpt protocol";
        }
    }
    [CCode (cname="item_name", cheader="")]
    public override string item_name (
        void *class_context
    ) {
        return av_default_item_name (
            class_context
        );
    }
    [CCode (cname="options", cheader="")]
    public override LibAVUtil.Option[] option { public get; }
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_librtmpt_protocol", cheader="")]
public class LibRTMPTURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "rtmpt";
        }
    }
    [CCode (cname="rtmp_open", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );
    [CCode (cname="rtmp_read", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="rtmp_write", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="rtmp_close", cheader="")]
    public override int url_close (
        URLContext url_context
    );
    [CCode (cname="rtmp_read_pause", cheader="")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );
    [CCode (cname="rtmp_read_seek", cheader="")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
    [CCode (cname="rtmp_get_file_handle", cheader="")]
    public override int url_get_file_handle (
        URLContext url_context
    );
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (LibRTMPContext);
        }
    }
    //  .priv_data_class = librtmpt_class,
    [CCode (cname="flags", cheader="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
}

[CCode (cname="librtmpe_class", cheader="")]
public class LibRTMPEURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "librtmpe protocol";
        }
    }
    [CCode (cname="item_name", cheader="")]
    public override string item_name (
        void *class_context
    ) {
        return av_default_item_name (
            class_context
        );
    }
    [CCode (cname="options", cheader="")]
    public override LibAVUtil.Option[] option { public get; }
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_librtmpe_protocol", cheader="")]
public class LibRTMPEURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "rtmpe";
        }
    }
    [CCode (cname="rtmp_open", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );
    [CCode (cname="rtmp_read", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="rtmp_write", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="rtmp_close", cheader="")]
    public override int url_close (
        URLContext url_context
    );
    [CCode (cname="rtmp_read_pause", cheader="")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );
    [CCode (cname="rtmp_read_seek", cheader="")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
    [CCode (cname="rtmp_get_file_handle", cheader="")]
    public override int url_get_file_handle (
        URLContext url_context
    );
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (LibRTMPContext);
        }
    }
    //  .priv_data_class = librtmpe_class,
    [CCode (cname="flags", cheader="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
}

[CCode (cname="librtmpte_class", cheader="")]
public class LibRTMPTEURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "librtmpte protocol";
        }
    }
    [CCode (cname="item_name", cheader="")]
    public override string item_name (
        void *class_context
    ) {
        return av_default_item_name (
            class_context
        );
    }
    [CCode (cname="options", cheader="")]
    public override LibAVUtil.Option[] option { public get; }
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_librtmpte_protocol", cheader="")]
public class LibRTMPTEURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "rtmpte";
        }
    }
    [CCode (cname="rtmp_open", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );
    [CCode (cname="rtmp_read", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="rtmp_write", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="rtmp_close", cheader="")]
    public override int url_close (
        URLContext url_context
    );
    [CCode (cname="rtmp_read_pause", cheader="")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );
    [CCode (cname="rtmp_read_seek", cheader="")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
    [CCode (cname="rtmp_get_file_handle", cheader="")]
    public override int url_get_file_handle (
        URLContext url_context
    );
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (LibRTMPContext);
        }
    }
    //  .priv_data_class = librtmpte_class,
    [CCode (cname="flags", cheader="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
}

[CCode (cname="librtmps_class", cheader="")]
public class LibRTMPSURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "librtmps protocol";
        }
    }
    [CCode (cname="item_name", cheader="")]
    public override string item_name (
        void *class_context
    ) {
        return av_default_item_name (
            class_context
        );
    }
    [CCode (cname="options", cheader="")]
    public override LibAVUtil.Option[] option { public get; }
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_librtmps_protocol", cheader="")]
public class LibRTMPSURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "rtmps";
        }
    }
    [CCode (cname="rtmp_open", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );
    [CCode (cname="rtmp_read", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="rtmp_write", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="rtmp_close", cheader="")]
    public override int url_close (
        URLContext url_context
    );
    [CCode (cname="rtmp_read_pause", cheader="")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );
    [CCode (cname="rtmp_read_seek", cheader="")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
    [CCode (cname="rtmp_get_file_handle", cheader="")]
    public override int url_get_file_handle (
        URLContext url_context
    );
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (LibRTMPContext);
        }
    }
    //  .priv_data_class = librtmps_class,
    [CCode (cname="flags", cheader="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
}

} // namespace LibAVFormat
