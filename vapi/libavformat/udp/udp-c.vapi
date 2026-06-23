/***********************************************************
@brief UDP prototype streaming system
@copyright 2000, 2001, 2002 Fabrice Bellard
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
@file UDP protocol
***********************************************************/

[CCode (cname="",cheader_filename="")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.IntOption () {
        name = "buffer_size",
        short_help_text = "System data size (in bytes)",
        offsetof (
            UDPContext,
            buffer_size
        ),
        {
            .i64 = -1
        },
        -1,
        int.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.Int64Option () {
        name = "bitrate",
        short_help_text = "Bits to send per second",
        offsetof (
            UDPContext,
            bitrate
        ),
        {
            .i64 = 0
        },
        0,
        int64.MAX,
        .flags =
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.Int64Option () {
        name = "burst_bits",
        short_help_text = "Max length of bursts in bits (when using bitrate)",
        offsetof (
            UDPContext,
            burst_bits
        ),
        {
            .i64 = 0
        },
        0,
        int64.MAX,
        .flags =
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.IntOption () {
        name = "localport",
        short_help_text = "Local port",
        offsetof (
            UDPContext,
            local_port
        ),
        {
            .i64 = -1
        },
        -1,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.IntOption () {
        name = "local_port",
        short_help_text = "Local port",
        offsetof (
            UDPContext,
            local_port
        ),
        {
            .i64 = -1
        },
        -1,
        int.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.StringOption () {
        name = "localaddr",
        short_help_text = "Local address",
        offsetof (
            UDPContext,
            localaddr
        ),
        {
            .str = NULL
        },
        //  .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.IntOption () {
        name = "udplite_coverage",
        short_help_text = "choose UDPLite head size which should be validated by checksum",
        offsetof (
            UDPContext,
            udplite_coverage
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.IntOption () {
        name = "pkt_size",
        short_help_text = "Maximum UDP packet size",
        offsetof (
            UDPContext,
            pkt_size
        ),
        {
            .i64 = 1472
        },
        -1,
        int.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.BoolOption () {
        name = "reuse",
        short_help_text = "explicitly allow reusing UDP sockets",
        offsetof (
            UDPContext,
            reuse_socket
        ),
        {
            .i64 = -1
        },
        -1,
        1,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.BoolOption () {
        name = "reuse_socket",
        short_help_text = "explicitly allow reusing UDP sockets",
        offsetof (
            UDPContext,
            reuse_socket
        ),
        {
            .i64 = -1
        },
        -1,
        1,
        //  .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.BoolOption () {
        name = "broadcast",
        short_help_text = "explicitly allow or disallow broadcast destination",
        offsetof (
            UDPContext,
            is_broadcast
        ),
        {
            .i64 = 0
        },
        0,
        1,

        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.IntOption () {
        name = "ttl",
        short_help_text = "Time to live (multicast only)",
        offsetof (
            UDPContext,
            ttl
        ),
        {
            .i64 = 16
        },
        0,
        int.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.BoolOption () {
        name = "connect",
        short_help_text = "set if connect () should be called on socket",
        offsetof (
            UDPContext,
            is_connected
        ),
        {
            .i64 = 0
        },
        0,
        1,
        //  .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.IntOption () {
        name = "fifo_size",
        short_help_text = "set the UDP receiving circular buffer size, expressed as a number of packets with size of 188 bytes",
        offsetof (
            UDPContext,
            circular_buffer_size
        ),
        {
            .i64 = 7*4096
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "overrun_nonfatal",
        short_help_text = "survive in case of UDP receiving circular buffer overrun",
        offsetof (
            UDPContext,
            overrun_nonfatal
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "timeout",
        short_help_text = "set raise error timeout (only in read mode)",
        offsetof (
            UDPContext,
            timeout
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "sources",
        short_help_text = "Source list",
        offsetof (
            UDPContext,
            sources
        ),
        {
            .str = NULL
        },
        //  .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.StringOption () {
        name = "block",
        short_help_text = "Block list",
        offsetof (
            UDPContext,
            block
        ),
        {
            .str = NULL
        },
        //  .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    {
        NULL
    }
}

[CCode (cname="udp_class",cheader_filename="ffmpeg/libformat/udp.c")]
public class UDPURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/udp.c")]
    public override string class_name {
        public get {
            return "udp";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/udp.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/udp.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/udp.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="udplite_context_class",cheader_filename="ffmpeg/libformat/udp.c")]
public class UDPLiteURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/udp.c")]
    public override string class_name {
        public get {
            return "udplite";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/udp.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = options,

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/udp.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct UDPContext",cheader_filename="ffmpeg/libformat/udp.c")]
[Compact]
public class UDPPrivateData { }

[CCode (cname="ff_udp_protocol",cheader_filename="ffmpeg/libformat/udp.c")]
public class UDPURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/udp.c")]
    public override string name {
        public get {
            return "udp";

        }

    }

    [CCode (cname="udp_open",cheader_filename="ffmpeg/libformat/udp.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="udp_read",cheader_filename="ffmpeg/libformat/udp.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="udp_write",cheader_filename="ffmpeg/libformat/udp.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="udp_close",cheader_filename="ffmpeg/libformat/udp.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="udp_get_file_handle",cheader_filename="ffmpeg/libformat/udp.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/udp.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (UDPPrivateData);

        }

    }
    //  .priv_data_class = udp_class,

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/udp.c")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;

        }

    }
}

[CCode (cname="ff_udplite_protocol",cheader_filename="ffmpeg/libformat/udp.c")]
public class UDPLiteURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/udp.c")]
    public override string name {
        public get {
            return "udplite";

        }

    }

    [CCode (cname="udplite_open",cheader_filename="ffmpeg/libformat/udp.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="udp_read",cheader_filename="ffmpeg/libformat/udp.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="udp_write",cheader_filename="ffmpeg/libformat/udp.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="udp_close",cheader_filename="ffmpeg/libformat/udp.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="udp_get_file_handle",cheader_filename="ffmpeg/libformat/udp.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/udp.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (UDPPrivateData);

        }

    }
    //  .priv_data_class = udplite_context_class,

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/udp.c")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;

        }

    }
}

} // namespace LibAVFormat
