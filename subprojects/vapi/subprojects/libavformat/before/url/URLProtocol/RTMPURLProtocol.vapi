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

public abstract class RTMPOptionsClass : LibAVUtil.Log.Class {

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.StringOption () {
                    name = "rtmp_app",
                    short_help_text = "Name of application to connect to on the RTMP server",
                    offset = offsetof (
                        RTMPContext,
                        app
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "rtmp_buffer",
                    short_help_text = "Set buffer time in milliseconds. The default is 3000.",
                    offset = offsetof (
                        RTMPContext,
                        client_buffer_time
                    ),
                    default_value = 3000,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.StringOption () {
                    name = "rtmp_conn",
                    short_help_text = "Append arbitrary AMF data to the Connect message",
                    offset = offsetof (
                        RTMPContext,
                        conn
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.StringOption () {
                    name = "rtmp_flashver",
                    short_help_text = "Version of the Flash plugin used to run the SWF player.",
                    offset = offsetof (
                        RTMPContext,
                        flashver
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "rtmp_flush_interval",
                    short_help_text = "Number of packets flushed in the same request (RTMPT only).",
                    offset = offsetof (
                        RTMPContext,
                        flush_interval
                    ),
                    default_value = 10,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "rtmp_live",
                    short_help_text = "Specify that the media is a live stream.",
                    offset = offsetof (
                        RTMPContext,
                        live
                    ),
                    default_value = -2,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "rtmp_live"
                },
                new LibAVUtil.ConstOption () {
                    name = "any",
                    short_help_text = "both",
                    offset = 0,
                    default_value = -2,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "rtmp_live"
                },
                new LibAVUtil.ConstOption () {
                    name = "live",
                    short_help_text = "live stream",
                    offset = 0,
                    default_value = -1,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "rtmp_live"
                },
                new LibAVUtil.ConstOption () {
                    name = "recorded",
                    short_help_text = "recorded stream",
                    offset = 0,
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "rtmp_live"
                },
                new LibAVUtil.StringOption () {
                    name = "rtmp_pageurl",
                    short_help_text = "URL of the web page in which the media was embedded. By default no value will be sent.",
                    offset = offsetof (
                        RTMPContext,
                        pageurl
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "rtmp_playpath",
                    short_help_text = "Stream identifier to play or to publish",
                    offset = offsetof (
                        RTMPContext,
                        playpath
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.StringOption () {
                    name = "rtmp_subscribe",
                    short_help_text = "Name of live stream to subscribe to. Defaults to rtmp_playpath.",
                    offset = offsetof (
                        RTMPContext,
                        subscribe
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.BinaryOption () {
                    name = "rtmp_swfhash",
                    short_help_text = "SHA256 hash of the decompressed SWF file (32 bytes).",
                    offset = offsetof (
                        RTMPContext,
                        swfhash
                    ),
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "rtmp_swfsize",
                    short_help_text = "Size of the decompressed SWF file,
                    required for SWFVerification.",
                    offset = offsetof (
                        RTMPContext,
                        swfsize
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "rtmp_swfurl",
                    short_help_text = "URL of the SWF player. By default no value will be sent",
                    offset = offsetof (
                        RTMPContext,
                        swfurl
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.StringOption () {
                    name = "rtmp_swfverify",
                    short_help_text = "URL to player swf file, compute hash/size automatically.",
                    offset = offsetof (
                        RTMPContext,
                        swfverify
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "rtmp_tcurl",
                    short_help_text = "URL of the target stream. Defaults to proto://host[:port]/app.",
                    offset = offsetof (
                        RTMPContext,
                        tcurl
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "rtmp_listen",
                    short_help_text = "Listen for incoming rtmp connections",
                    offset = offsetof (
                        RTMPContext,
                        listen
                    ),
                    default_value = 0,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "rtmp_listen"
                },
                new LibAVUtil.IntOption () {
                    name = "listen",
                    short_help_text = "Listen for incoming rtmp connections",
                    offset = offsetof (
                        RTMPContext,
                        listen
                    ),
                    default_value = 0,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "rtmp_listen"
                },
                new LibAVUtil.IntOption () {
                    name = "timeout",
                    short_help_text = "Maximum timeout (in seconds) to wait for incoming connections. -1 is infinite. Implies -rtmp_listen 1",
                    offset = offsetof (
                        RTMPContext,
                        listen_timeout
                    ),
                    default_value = -1,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "rtmp_listen"
                },
                {
                    NULL
                }

            };

        }

    }

}

[CCode (cname="rtmp_class",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
public class RTMPURLProtocolClass : RTMPOptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string class_name {
        public get {
            return "rtmp";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct RTMPContext",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
[Compact]
public class RTMPPrivateData { }

[CCode (cname="ff_rtmp_protocol",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
public class RTMPURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string name {
        public get {
            return "rtmp";

        }

    }

    [CCode (cname="rtmp_open",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="rtmp_read",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_seek",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_pause",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_write",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTMPPrivateData);

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
    //  .priv_data_class = rtmp_class;
}

[CCode (cname="rtmpe_class",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
public class RTMPEURLProtocolClass : RTMPOptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string class_name {
        public get {
            return "rtmpe";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_rtmpe_protocol",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
public class RTMPEURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string name {
        public get {
            return "rtmpe";

        }

    }

    [CCode (cname="rtmp_open",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="rtmp_read",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_seek",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_pause",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_write",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTMPPrivateData);

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
    //  .priv_data_class = rtmpe_class;
}

[CCode (cname="rtmps_class",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
public class RTMPSURLProtocolClass : RTMPOptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string class_name {
        public get {
            return "rtmps";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_rtmps_protocol",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
public class RTMPSURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string name {
        public get {
            return "rtmps";

        }

    }

    [CCode (cname="rtmp_open",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="rtmp_read",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_seek",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_pause",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_write",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTMPPrivateData);

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
    //  .priv_data_class = rtmps_class;
}

[CCode (cname="rtmpt_class",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
public class RTMPTURLProtocolClass : RTMPOptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string class_name {
        public get {
            return "rtmpt";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_rtmpt_protocol",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
public class RTMPTURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string name {
        public get {
            return "rtmpt";

        }

    }

    [CCode (cname="rtmp_open",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="rtmp_read",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_seek",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_pause",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_write",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTMPPrivateData);

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
    //  .priv_data_class = rtmpt_class;
}

[CCode (cname="rtmpte_class",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
public class RTMPTEURLProtocolClass : RTMPOptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string class_name {
        public get {
            return "rtmpte";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_rtmpte_protocol",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
public class RTMPTEURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string name {
        public get {
            return "rtmpte";

        }

    }

    [CCode (cname="rtmp_open",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="rtmp_read",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_seek",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_pause",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_write",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTMPPrivateData);

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
    //  .priv_data_class = rtmpte_class;
}

[CCode (cname="rtmpts_class",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
public class RTMPTSURLProtocolClass : RTMPOptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string class_name {
        public get {
            return "rtmpts";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_rtmpts_protocol",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
public class RTMPTSURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override string name {
        public get {
            return "rtmpts";

        }

    }

    [CCode (cname="rtmp_open",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="rtmp_read",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_seek",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_pause",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_write",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTMPPrivateData);

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/rtmpproto.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
    //  .priv_data_class = rtmpts_class;
}

} // namespace LibAVFormat
