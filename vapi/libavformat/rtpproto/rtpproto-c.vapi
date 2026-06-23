/***********************************************************
@brief RTP network protocol
@copyright 2002 Fabrice Bellard
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
@file RTP protocol
***********************************************************/

[CCode (cname="",cheader_filename="")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.IntOption () {
        name = "ttl",
        short_help_text = "Time to live (in milliseconds, multicast only)",
        offsetof (
            RTPContext,
            ttl
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
    new LibAVUtil.IntOption () {
        name = "buffer_size",
        short_help_text = "Send/Receive buffer size (in bytes)",
        offsetof (
            RTPContext,
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
    new LibAVUtil.IntOption () {
        name = "rtcp_port",
        short_help_text = "Custom rtcp port",
        offsetof (
            RTPContext,
            rtcp_port
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
    new LibAVUtil.IntOption () {
        name = "local_rtpport",
        short_help_text = "Local rtp port",
        offsetof (
            RTPContext,
            local_rtpport
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
    new LibAVUtil.IntOption () {
        name = "local_rtcpport",
        short_help_text = "Local rtcp port",
        offsetof (
            RTPContext,
            local_rtcpport
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
    new LibAVUtil.BoolOption () {
        name = "connect",
        short_help_text = "Connect socket",
        offsetof (
            RTPContext,
            connect
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
    new LibAVUtil.BoolOption () {
        name = "write_to_source",
        short_help_text = "Send packets to the source address of the latest received packet",
        offsetof (
            RTPContext,
            write_to_source
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
        name = "pkt_size",
        short_help_text = "Maximum packet size",
        offsetof (
            RTPContext,
            pkt_size
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
    new LibAVUtil.IntOption () {
        name = "dscp",
        short_help_text = "DSCP class",
        offsetof (
            RTPContext,
            dscp
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
        name = "sources",
        short_help_text = "Source list",
        offsetof (
            RTPContext,
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
            RTPContext,
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
    new LibAVUtil.StringOption () {
        name = "fec",
        short_help_text = "FEC",
        offsetof (
            RTPContext,
            fec_options_str
        ),
        {
            .str = NULL
        },
        //  .flags =
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    {
        NULL
    }
}

[CCode (cname="rtp_class",cheader_filename="ffmpeg/libformat/rtpproto.c")]
public class RTPURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/rtpproto.c")]
    public override string class_name {
        public get {
            return "rtp";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/rtpproto.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/rtpproto.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/rtpproto.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct RTPContext",cheader_filename="ffmpeg/libformat/rtpproto.c")]
[Compact]
public class RTPPrivateData { }

[CCode (cname="ff_rtp_protocol",cheader_filename="ffmpeg/libformat/rtpproto.c")]
public class RTPURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/rtpproto.c")]
    public override string name {
        public get {
            return "rtp";

        }

    }

    [CCode (cname="rtp_open",cheader_filename="ffmpeg/libformat/rtpproto.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="rtp_read",cheader_filename="ffmpeg/libformat/rtpproto.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtp_write",cheader_filename="ffmpeg/libformat/rtpproto.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtp_close",cheader_filename="ffmpeg/libformat/rtpproto.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="rtp_get_file_handle",cheader_filename="ffmpeg/libformat/rtpproto.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="rtp_get_multi_file_handle",cheader_filename="ffmpeg/libformat/rtpproto.c")]
    public override int url_get_multi_file_handle (
        URLContext url_context,
        out int[] handles,
        out int numhandles
    );

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/rtpproto.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTPPrivateData);

        }

    }

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/rtpproto.c")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;

        }

    }
    //  .priv_data_class = rtp_class;
}

} // namespace LibAVFormat
