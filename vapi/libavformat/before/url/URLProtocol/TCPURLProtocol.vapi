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

[CCode (cname="tcp_class",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
public class TCPURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
    public override string class_name {
        public get {
            return "tcp";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.IntOption () {
                    name = "listen",
                    short_help_text = "Listen for incoming connections",
                    offset = offsetof (
                        TCPContext,
                        listen
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 2,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "timeout",
                    short_help_text = "set timeout (in microseconds) of socket I/O operations",
                    offset = offsetof (
                        TCPContext,
                        rw_timeout
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
                    name = "listen_timeout",
                    short_help_text = "Connection awaiting timeout (in milliseconds)",
                    offset = offsetof (
                        TCPContext,
                        listen_timeout
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
                    name = "send_buffer_size",
                    short_help_text = "Socket send buffer size (in bytes)",
                    offset = offsetof (
                        TCPContext,
                        send_buffer_size
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
                    name = "recv_buffer_size",
                    short_help_text = "Socket receive buffer size (in bytes)",
                    offset = offsetof (
                        TCPContext,
                        recv_buffer_size
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.BoolOption () {
                    name = "tcp_nodelay",
                    short_help_text = "Use TCP_NODELAY to disable nagle's algorithm",
                    offset = offsetof (
                        TCPContext,
                        tcp_nodelay
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
            #if !HAVE_WINSOCK2_H
                new LibAVUtil.IntOption () {
                    name = "tcp_mss",
                    short_help_text = "Maximum segment size for outgoing TCP packets",
                    offset = offsetof (
                        TCPContext,
                        tcp_mss
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
            #endif /* !HAVE_WINSOCK2_H */
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct TCPContext",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
[Compact]
public class TCPPrivateData { }

[CCode (cname="ff_tcp_protocol",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
public class TCPURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
    public override string name {
        public get {
            return "tcp";

        }

    }

    [CCode (cname="tcp_open",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="tcp_accept",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
    public override int url_accept (
        URLContext server_url_context,
        out URLContext client_url_context
    );

    [CCode (cname="tcp_read",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="tcp_write",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="tcp_close",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="tcp_get_file_handle",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="tcp_get_window_size",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
    public override int url_get_short_seek (
        URLContext url_context
    );

    [CCode (cname="tcp_shutdown",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
    public override int url_shutdown (
        URLContext url_context,
        int flags
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (TCPPrivateData);

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/tcp.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
    //  .priv_data_class = tcp_class;
}

} // namespace LibAVFormat
