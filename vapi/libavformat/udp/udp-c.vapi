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

[CCode (cname="udp_class",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
public class UDPURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override string class_name {
        public get {
            return "udp";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="udplite_context_class",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
public class UDPLiteURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override string class_name {
        public get {
            return "udplite";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="option",cheader_filename="")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.IntOption () {
                    name = "buffer_size",
                    short_help_text = "System data size (in bytes)",
                    offset = offsetof (
                        UDPContext,
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
                new LibAVUtil.Int64Option () {
                    name = "bitrate",
                    short_help_text = "Bits to send per second",
                    offset = offsetof (
                        UDPContext,
                        bitrate
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int64.MAX,
                    .flags =
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.Int64Option () {
                    name = "burst_bits",
                    short_help_text = "Max length of bursts in bits (when using bitrate)",
                    offset = offsetof (
                        UDPContext,
                        burst_bits
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int64.MAX,
                    .flags =
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "localport",
                    short_help_text = "Local port",
                    offset = offsetof (
                        UDPContext,
                        local_port
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "local_port",
                    short_help_text = "Local port",
                    offset = offsetof (
                        UDPContext,
                        local_port
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.StringOption () {
                    name = "localaddr",
                    short_help_text = "Local address",
                    offset = offsetof (
                        UDPContext,
                        localaddr
                    ),
                    default_value = "",
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "udplite_coverage",
                    short_help_text = "choose UDPLite head size which should be validated by checksum",
                    offset = offsetof (
                        UDPContext,
                        udplite_coverage
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "pkt_size",
                    short_help_text = "Maximum UDP packet size",
                    offset = offsetof (
                        UDPContext,
                        pkt_size
                    ),
                    default_value = 1472,
                    minimum_value = -1,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.BoolOption () {
                    name = "reuse",
                    short_help_text = "explicitly allow reusing UDP sockets",
                    offset = offsetof (
                        UDPContext,
                        reuse_socket
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.BoolOption () {
                    name = "reuse_socket",
                    short_help_text = "explicitly allow reusing UDP sockets",
                    offset = offsetof (
                        UDPContext,
                        reuse_socket
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.BoolOption () {
                    name = "broadcast",
                    short_help_text = "explicitly allow or disallow broadcast destination",
                    offset = offsetof (
                        UDPContext,
                        is_broadcast
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "ttl",
                    short_help_text = "Time to live (multicast only)",
                    offset = offsetof (
                        UDPContext,
                        ttl
                    ),
                    default_value = 16,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.BoolOption () {
                    name = "connect",
                    short_help_text = "set if connect () should be called on socket",
                    offset = offsetof (
                        UDPContext,
                        is_connected
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "fifo_size",
                    short_help_text = "set the UDP receiving circular buffer size, expressed as a number of packets with size of 188 bytes",
                    offset = offsetof (
                        UDPContext,
                        circular_buffer_size
                    ),
                    default_value = 7*4096,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "overrun_nonfatal",
                    short_help_text = "survive in case of UDP receiving circular buffer overrun",
                    offset = offsetof (
                        UDPContext,
                        overrun_nonfatal
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "timeout",
                    short_help_text = "set raise error timeout (only in read mode)",
                    offset = offsetof (
                        UDPContext,
                        timeout
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "sources",
                    short_help_text = "Source list",
                    offset = offsetof (
                        UDPContext,
                        sources
                    ),
                    default_value = "",
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.StringOption () {
                    name = "block",
                    short_help_text = "Block list",
                    offset = offsetof (
                        UDPContext,
                        block
                    ),
                    default_value = "",
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct UDPContext",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
[Compact]
public class UDPPrivateData { }

[CCode (cname="ff_udp_protocol",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
public class UDPURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override string name {
        public get {
            return "udp";

        }

    }

    [CCode (cname="udp_open",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="udp_read",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="udp_write",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="udp_close",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="udp_get_file_handle",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (UDPPrivateData);

        }

    }
    //  .priv_data_class = udp_class,

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
}

[CCode (cname="ff_udplite_protocol",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
public class UDPLiteURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override string name {
        public get {
            return "udplite";

        }

    }

    [CCode (cname="udplite_open",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="udp_read",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="udp_write",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="udp_close",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="udp_get_file_handle",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (UDPPrivateData);

        }

    }
    //  .priv_data_class = udplite_context_class,

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/udp.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
}

} // namespace LibAVFormat
