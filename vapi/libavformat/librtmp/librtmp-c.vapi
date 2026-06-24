/***********************************************************
@brief RTMP network protocol
@copyright 2010 Howard Chu
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
@file RTMP protocol based on http://rtmpdump.mplayerhq.hu/ librtmp
***********************************************************/

[CCode (cname="options",cheader_filename="")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.StringOption () {
        name = "rtmp_app",
        short_help_text = "Name of application to connect to on the RTMP server",
        offset = offsetof (
            LibRTMPContext,
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
    new LibAVUtil.StringOption () {
        name = "rtmp_buffer",
        short_help_text = "Set buffer time in milliseconds. The default is 3000.",
        offset = offsetof (
            LibRTMPContext,
            client_buffer_time
        ),
        default_value = "3000",
        minimum_value = 0,
        maximum_value = 0,
        option_flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.StringOption () {
        name = "rtmp_conn",
        short_help_text = "Append arbitrary AMF data to the Connect message",
        offset = offsetof (
            LibRTMPContext,
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
            LibRTMPContext,
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
        name = "rtmp_live",
        short_help_text = "Specify that the media is a live stream.",
        offset = offsetof (
            LibRTMPContext,
            live
        ),
        default_value = 0,
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
            LibRTMPContext,
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
            LibRTMPContext,
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
            LibRTMPContext,
            subscribe
        ),
        default_value = "",
        minimum_value = 0,
        maximum_value = 0,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "rtmp_swfurl",
        short_help_text = "URL of the SWF player. By default no value will be sent",
        offset = offsetof (
            LibRTMPContext,
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
        short_help_text = "URL to player swf file, compute hash/size automatically. (unimplemented)",
        offset = offsetof (
            LibRTMPContext,
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
            LibRTMPContext,
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
#if CONFIG_NETWORK
    new LibAVUtil.IntOption () {
        name = "rtmp_buffer_size",
        short_help_text = "set buffer size in bytes",
        offset = offsetof (
            LibRTMPContext,
            buffer_size
        ),
        default_value = -1,
        minimum_value = -1,
        maximum_value = int.MAX,
        option_flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
#endif
    {
        NULL
    }

};

[CCode (cname="struct LibRTMPContext",cheader_filename="ffmpeg/libformat/librtmp.c")]
[Compact]
public class LibRTMPPrivateData { }

[CCode (cname="librtmp_class",cheader_filename="ffmpeg/libformat/librtmp.c")]
public class LibRTMPURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override string class_name {
        public get {
            return "librtmp protocol";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_librtmp_protocol",cheader_filename="ffmpeg/libformat/librtmp.c")]
public class LibRTMPURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override string name {
        public get {
            return "rtmp";

        }

    }

    [CCode (cname="rtmp_open",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="rtmp_read",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_write",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="rtmp_read_pause",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_read_seek",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_get_file_handle",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (LibRTMPPrivateData);

        }

    }
    //  .priv_data_class = librtmp_class,

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
}

[CCode (cname="librtmpt_class",cheader_filename="ffmpeg/libformat/librtmp.c")]
public class LibRTMPTURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override string class_name {
        public get {
            return "librtmpt protocol";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_librtmpt_protocol",cheader_filename="ffmpeg/libformat/librtmp.c")]
public class LibRTMPTURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override string name {
        public get {
            return "rtmpt";

        }

    }

    [CCode (cname="rtmp_open",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="rtmp_read",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_write",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="rtmp_read_pause",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_read_seek",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_get_file_handle",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (LibRTMPPrivateData);

        }

    }
    //  .priv_data_class = librtmpt_class,

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
}

[CCode (cname="librtmpe_class",cheader_filename="ffmpeg/libformat/librtmp.c")]
public class LibRTMPEURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override string class_name {
        public get {
            return "librtmpe protocol";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_librtmpe_protocol",cheader_filename="ffmpeg/libformat/librtmp.c")]
public class LibRTMPEURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override string name {
        public get {
            return "rtmpe";

        }

    }

    [CCode (cname="rtmp_open",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="rtmp_read",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_write",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="rtmp_read_pause",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_read_seek",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_get_file_handle",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (LibRTMPPrivateData);

        }

    }
    //  .priv_data_class = librtmpe_class,

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
}

[CCode (cname="librtmpte_class",cheader_filename="ffmpeg/libformat/librtmp.c")]
public class LibRTMPTEURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override string class_name {
        public get {
            return "librtmpte protocol";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_librtmpte_protocol",cheader_filename="ffmpeg/libformat/librtmp.c")]
public class LibRTMPTEURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override string name {
        public get {
            return "rtmpte";

        }

    }

    [CCode (cname="rtmp_open",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="rtmp_read",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_write",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="rtmp_read_pause",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_read_seek",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_get_file_handle",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (LibRTMPPrivateData);

        }

    }
    //  .priv_data_class = librtmpte_class,

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
}

[CCode (cname="librtmps_class",cheader_filename="ffmpeg/libformat/librtmp.c")]
public class LibRTMPSURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override string class_name {
        public get {
            return "librtmps protocol";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_librtmps_protocol",cheader_filename="ffmpeg/libformat/librtmp.c")]
public class LibRTMPSURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override string name {
        public get {
            return "rtmps";

        }

    }

    [CCode (cname="rtmp_open",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="rtmp_read",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_write",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmp_close",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="rtmp_read_pause",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="rtmp_read_seek",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="rtmp_get_file_handle",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (LibRTMPPrivateData);

        }

    }
    //  .priv_data_class = librtmps_class,

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/librtmp.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
}

} // namespace LibAVFormat
