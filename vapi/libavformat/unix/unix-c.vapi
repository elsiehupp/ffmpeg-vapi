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

[CCode (cname="",cheader_filename="")]
static const LibAVUtil.Option unix_options[] = {
    new LibAVUtil.BoolOption () {
        name = "listen",
        short_help_text = "Open socket for listening",
        offsetof (
            UnixContext,
            listen
        ),
        {
            .i64 = 0
        },
        0,
        1,
        (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.IntOption () {
        name = "timeout",
        short_help_text = "Timeout in ms",
        offsetof (
            UnixContext,
            timeout
        ),
        {
            .i64 = -1
        },
        -1,
        int.MAX,
        (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.IntOption () {
        name = "type",
        short_help_text = "Socket type",
        offsetof (
            UnixContext,
            type
        ),
        {
            .i64 = SOCK_STREAM
        },
        int.MIN,
        int.MAX,
        (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "type"
    },
    new LibAVUtil.ConstOption () {
        name = "stream",
        short_help_text = "Stream (reliable stream-oriented)",
        0,
        {
            .i64 = SOCK_STREAM
        },
        int.MIN,
        int.MAX,
        (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "type"
    },
    new LibAVUtil.ConstOption () {
        name = "datagram",
        short_help_text = "Datagram (unreliable packet-oriented)",
        0,
        {
            .i64 = SOCK_DGRAM
        },
        int.MIN,
        int.MAX,
        (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "type"
    },
    new LibAVUtil.ConstOption () {
        name = "seqpacket",
        short_help_text = "Seqpacket (reliable packet-oriented",
        0,
        {
            .i64 = SOCK_SEQPACKET
        },
        int.MIN,
        int.MAX,
        (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "type"
    },
    {
        NULL
    }
}

[CCode (cname="unix_class",cheader_filename="ffmpeg/libformat/unix.c")]
public class UnixURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/unix.c")]
    public override string class_name {
        public get {
            return "unix";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/unix.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = unix_options,

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/unix.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct UnixContext",cheader_filename="ffmpeg/libformat/unix.c")]
[Compact]
public class UnixPrivateData { }

[CCode (cname="ff_unix_protocol",cheader_filename="ffmpeg/libformat/unix.c")]
public class UnixURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/unix.c")]
    public override string name {
        public get {
            return "unix";

        }

    }

    [CCode (cname="unix_open",cheader_filename="ffmpeg/libformat/unix.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="unix_read",cheader_filename="ffmpeg/libformat/unix.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="unix_write",cheader_filename="ffmpeg/libformat/unix.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="unix_close",cheader_filename="ffmpeg/libformat/unix.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="unix_get_file_handle",cheader_filename="ffmpeg/libformat/unix.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/unix.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (UnixPrivateData);

        }

    }
    //  .priv_data_class = unix_class,

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/unix.c")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;

        }

    }
}

} // namespace LibAVFormat
