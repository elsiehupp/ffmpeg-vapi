/***********************************************************
@brief TCP protocol
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

[CCode (cname="",cheader_filename="")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.IntOption () {
        name = "listen",
        short_help_text = "Listen for incoming connections",
        offsetof (
            TCPContext,
            listen
        ),
        {
            .i64 = 0
        },
        0,
        2,
        //  .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.IntOption () {
        name = "timeout",
        short_help_text = "set timeout (in microseconds) of socket I/O operations",
        offsetof (
            TCPContext,
            rw_timeout
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
        name = "listen_timeout",
        short_help_text = "Connection awaiting timeout (in milliseconds)",
        offsetof (
            TCPContext,
            listen_timeout
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
        name = "send_buffer_size",
        short_help_text = "Socket send buffer size (in bytes)",
        offsetof (
            TCPContext,
            send_buffer_size
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
        name = "recv_buffer_size",
        short_help_text = "Socket receive buffer size (in bytes)",
        offsetof (
            TCPContext,
            recv_buffer_size
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
        name = "tcp_nodelay",
        short_help_text = "Use TCP_NODELAY to disable nagle's algorithm",
        offsetof (
            TCPContext,
            tcp_nodelay
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ) },
#if !HAVE_WINSOCK2_H
    new LibAVUtil.IntOption () {
        name = "tcp_mss",
        short_help_text = "Maximum segment size for outgoing TCP packets",
        offsetof (
            TCPContext,
            tcp_mss
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
        ) },
#endif /***********************************************************
!HAVE_WINSOCK2_H
***********************************************************/
    {
        NULL
    }
}

[CCode (cname="tcp_class",cheader_filename="ffmpeg/libformat/tcp.c")]
public class TCPURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/tcp.c")]
    public override string class_name {
        public get {
            return "tcp";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/tcp.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/tcp.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/tcp.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct TCPContext",cheader_filename="ffmpeg/libformat/tcp.c")]
[Compact]
public class TCPPrivateData { }

[CCode (cname="ff_tcp_protocol",cheader_filename="ffmpeg/libformat/tcp.c")]
public class TCPURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/tcp.c")]
    public override string name {
        public get {
            return "tcp";

        }

    }

    [CCode (cname="tcp_open",cheader_filename="ffmpeg/libformat/tcp.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="tcp_accept",cheader_filename="ffmpeg/libformat/tcp.c")]
    public override int url_accept (
        URLContext server_url_context,
        out URLContext client_url_context
    );

    [CCode (cname="tcp_read",cheader_filename="ffmpeg/libformat/tcp.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="tcp_write",cheader_filename="ffmpeg/libformat/tcp.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="tcp_close",cheader_filename="ffmpeg/libformat/tcp.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="tcp_get_file_handle",cheader_filename="ffmpeg/libformat/tcp.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="tcp_get_window_size",cheader_filename="ffmpeg/libformat/tcp.c")]
    public override int url_get_short_seek (
        URLContext url_context
    );

    [CCode (cname="tcp_shutdown",cheader_filename="ffmpeg/libformat/tcp.c")]
    public override int url_shutdown (
        URLContext url_context,
        int flags
    );

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/tcp.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (TCPPrivateData);

        }

    }

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/tcp.c")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;

        }

    }
    //  .priv_data_class = tcp_class;
}

} // namespace LibAVFormat
