/***********************************************************
@brief Unix socket protocol
@copyright 2013 Luca Barbato
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
@file
Unix socket url_protocol
***********************************************************/

[CCode (cname="unix_class",cheader_filename="subprojects/ffmpeg/libavformat/unix.c")]
public class UnixURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/unix.c")]
    public override string class_name {
        public get {
            return "unix";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/unix.c")]
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
                new LibAVUtil.BoolOption () {
                    name = "listen",
                    short_help_text = "Open socket for listening",
                    offset = offsetof (
                        UnixContext,
                        listen
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
                    name = "timeout",
                    short_help_text = "Timeout in ms",
                    offset = offsetof (
                        UnixContext,
                        timeout
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
                    name = "type",
                    short_help_text = "Socket type",
                    offset = offsetof (
                        UnixContext,
                        type
                    ),
                    default_value = SOCK_STREAM,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "type"
                },
                new LibAVUtil.ConstOption () {
                    name = "stream",
                    short_help_text = "Stream (reliable stream-oriented)",
                    offset = 0,
                    default_value = SOCK_STREAM,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "type"
                },
                new LibAVUtil.ConstOption () {
                    name = "datagram",
                    short_help_text = "Datagram (unreliable packet-oriented)",
                    offset = 0,
                    default_value = SOCK_DGRAM,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "type"
                },
                new LibAVUtil.ConstOption () {
                    name = "seqpacket",
                    short_help_text = "Seqpacket (reliable packet-oriented",
                    offset = 0,
                    default_value = SOCK_SEQPACKET,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "type"
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/unix.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct UnixContext",cheader_filename="subprojects/ffmpeg/libavformat/unix.c")]
[Compact]
public class UnixPrivateData { }

[CCode (cname="ff_unix_protocol",cheader_filename="subprojects/ffmpeg/libavformat/unix.c")]
public class UnixURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/unix.c")]
    public override string name {
        public get {
            return "unix";

        }

    }

    [CCode (cname="unix_open",cheader_filename="subprojects/ffmpeg/libavformat/unix.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="unix_read",cheader_filename="subprojects/ffmpeg/libavformat/unix.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="unix_write",cheader_filename="subprojects/ffmpeg/libavformat/unix.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="unix_close",cheader_filename="subprojects/ffmpeg/libavformat/unix.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="unix_get_file_handle",cheader_filename="subprojects/ffmpeg/libavformat/unix.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/unix.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (UnixPrivateData);

        }

    }
    //  .priv_data_class = unix_class,

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/unix.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
}

} // namespace LibAVFormat
