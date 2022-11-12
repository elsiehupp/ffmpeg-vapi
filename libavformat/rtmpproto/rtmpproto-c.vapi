/***********************************************************
@brief RTMP network protocol
@copyright 2009 Konstantin Shishkov
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
@file RTMP protocol
***********************************************************/

//  #define OFFSET(x) offsetof(RTMPContext, x)
//  #define DEC AV_OPT_FLAG_DECODING_PARAM
//  #define ENC AV_OPT_FLAG_ENCODING_PARAM

//  static const LibAVUtil.Option rtmp_options[] = {
//      {"rtmp_app", "Name of application to connect to on the RTMP server", OFFSET(app), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC|ENC},
//      {"rtmp_buffer", "Set buffer time in milliseconds. The default is 3000.", OFFSET(client_buffer_time), AV_OPT_TYPE_INT, {.i64 = 3000}, 0, INT_MAX, DEC|ENC},
//      {"rtmp_conn", "Append arbitrary AMF data to the Connect message", OFFSET(conn), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC|ENC},
//      {"rtmp_flashver", "Version of the Flash plugin used to run the SWF player.", OFFSET(flashver), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC|ENC},
//      {"rtmp_flush_interval", "Number of packets flushed in the same request (RTMPT only).", OFFSET(flush_interval), AV_OPT_TYPE_INT, {.i64 = 10}, 0, INT_MAX, ENC},
//      {"rtmp_live", "Specify that the media is a live stream.", OFFSET(live), AV_OPT_TYPE_INT, {.i64 = -2}, INT_MIN, INT_MAX, DEC, "rtmp_live"},
//      {"any", "both", 0, AV_OPT_TYPE_CONST, {.i64 = -2}, 0, 0, DEC, "rtmp_live"},
//      {"live", "live stream", 0, AV_OPT_TYPE_CONST, {.i64 = -1}, 0, 0, DEC, "rtmp_live"},
//      {"recorded", "recorded stream", 0, AV_OPT_TYPE_CONST, {.i64 = 0}, 0, 0, DEC, "rtmp_live"},
//      {"rtmp_pageurl", "URL of the web page in which the media was embedded. By default no value will be sent.", OFFSET(pageurl), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC},
//      {"rtmp_playpath", "Stream identifier to play or to publish", OFFSET(playpath), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC|ENC},
//      {"rtmp_subscribe", "Name of live stream to subscribe to. Defaults to rtmp_playpath.", OFFSET(subscribe), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC},
//      {"rtmp_swfhash", "SHA256 hash of the decompressed SWF file (32 bytes).", OFFSET(swfhash), AV_OPT_TYPE_BINARY, .flags = DEC},
//      {"rtmp_swfsize", "Size of the decompressed SWF file, required for SWFVerification.", OFFSET(swfsize), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, DEC},
//      {"rtmp_swfurl", "URL of the SWF player. By default no value will be sent", OFFSET(swfurl), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC|ENC},
//      {"rtmp_swfverify", "URL to player swf file, compute hash/size automatically.", OFFSET(swfverify), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC},
//      {"rtmp_tcurl", "URL of the target stream. Defaults to proto://host[:port]/app.", OFFSET(tcurl), AV_OPT_TYPE_STRING, {.str = NULL }, 0, 0, DEC|ENC},
//      {"rtmp_listen", "Listen for incoming rtmp connections", OFFSET(listen), AV_OPT_TYPE_INT, {.i64 = 0}, INT_MIN, INT_MAX, DEC, "rtmp_listen" },
//      {"listen",      "Listen for incoming rtmp connections", OFFSET(listen), AV_OPT_TYPE_INT, {.i64 = 0}, INT_MIN, INT_MAX, DEC, "rtmp_listen" },
//      {"timeout", "Maximum timeout (in seconds) to wait for incoming connections. -1 is infinite. Implies -rtmp_listen 1",  OFFSET(listen_timeout), AV_OPT_TYPE_INT, {.i64 = -1}, INT_MIN, INT_MAX, DEC, "rtmp_listen" },
//      { NULL },
//  }

[CCode (cname="rtmp_class", cheader_filename="")]
public class RTMPURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "rtmp";
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
    //  .option = rtmp_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="struct RTMPContext", cheader_filename="")]
public struct RTMPPrivateData { }

[CCode (cname="ff_rtmp_protocol", cheader_filename="")]
public class RTMPURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "rtmp";
        }
    }

    [CCode (cname="rtmp_open", cheader_filename="")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="rtmp_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_seek", cheader_filename="")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_pause", cheader_filename="")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTMPPrivateData);
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
    //  .priv_data_class = rtmp_class,
}

[CCode (cname="rtmpe_class", cheader_filename="")]
public class RTMPEURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "rtmpe";
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
    //  .option = rtmp_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_rtmpe_protocol", cheader_filename="")]
public class RTMPEURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "rtmpe";
        }
    }

    [CCode (cname="rtmp_open", cheader_filename="")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="rtmp_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_seek", cheader_filename="")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_pause", cheader_filename="")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTMPPrivateData);
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
    //  .priv_data_class = rtmpe_class,
}

[CCode (cname="rtmps_class", cheader_filename="")]
public class RTMPSURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "rtmps";
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
    //  .option = rtmp_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_rtmps_protocol", cheader_filename="")]
public class RTMPSURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "rtmps";
        }
    }

    [CCode (cname="rtmp_open", cheader_filename="")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="rtmp_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_seek", cheader_filename="")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_pause", cheader_filename="")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTMPPrivateData);
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
    //  .priv_data_class = rtmps_class,
}

[CCode (cname="rtmpt_class", cheader_filename="")]
public class RTMPTURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "rtmpt";
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
    //  .option = rtmp_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_rtmpt_protocol", cheader_filename="")]
public class RTMPTURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "rtmpt";
        }
    }

    [CCode (cname="rtmp_open", cheader_filename="")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="rtmp_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_seek", cheader_filename="")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_pause", cheader_filename="")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTMPPrivateData);
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
    //  .priv_data_class = rtmpt_class,
}

[CCode (cname="rtmpte_class", cheader_filename="")]
public class RTMPTEURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "rtmpte";
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
    //  .option = rtmp_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_rtmpte_protocol", cheader_filename="")]
public class RTMPTEURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "rtmpte";
        }
    }

    [CCode (cname="rtmp_open", cheader_filename="")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="rtmp_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_seek", cheader_filename="")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_pause", cheader_filename="")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTMPPrivateData);
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
    //  .priv_data_class = rtmpte_class,
}

[CCode (cname="rtmpts_class", cheader_filename="")]
public class RTMPTSURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "rtmpts";
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
    //  .option = rtmp_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_rtmpts_protocol", cheader_filename="")]
public class RTMPTSURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "rtmpts";
        }
    }

    [CCode (cname="rtmp_open", cheader_filename="")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="rtmp_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_seek", cheader_filename="")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_pause", cheader_filename="")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTMPPrivateData);
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
    //  .priv_data_class = rtmpts_class,
}

} // namespace LibAVFormat
