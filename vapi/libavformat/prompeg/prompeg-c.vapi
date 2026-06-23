/***********************************************************
@brief Pro-MPEG Code of Practice #3 Release 2 FEC
@copyright 2016 Mobibase, France (http://www.mobibase.com)
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
@file Pro-MPEG Code of Practice #3 Release 2 FEC protocol
@author Vlad Tarca <vlad.tarca@gmail.com>
***********************************************************/

/***********************************************************
@brief Reminder:

[RFC 2733] FEC Packet Structure

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                         RTP Header                            |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                         FEC Header                            |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                         FEC Payload                           |
    |                                                               |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


[RFC 3550] RTP header

    0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |V=2|P|X|  CC   |M|     PT      |       sequence number         |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                           timestamp                           |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |           synchronization source (SSRC) identifier            |
    +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
    |            contributing source (CSRC) identifiers             |
    |                             ....                              |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

[RFC 3550] RTP header extension (after CSRC)

    0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |      defined by profile       |           length              |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                        header extension                       |
    |                             ....                              |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

[Pro-MPEG COP3] FEC Header

    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |      SNBase low bits          |        length recovery        |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |E| PT recovery |                 mask                          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |                          TS recovery                          |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |X|D|type |index|    offset     |      NA       |SNBase ext bits|
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
***********************************************************/

static const LibAVUtil.Option options[] = {
    new LibAVUtil.IntOption () {
        name = "ttl",
        short_help_text = "Time to live (in milliseconds, multicast only)",
        offsetof (
            PrompegContext,
            ttl
        ),
        {
            .i64 = -1
        },
        -1,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "l",
        short_help_text = "FEC L",
        offsetof (
            PrompegContext,
            l
        ),
        {
            .i64 = 5
        },
        4,
        20,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "d",
        short_help_text = "FEC D",
        offsetof (
            PrompegContext,
            d
        ),
        {
            .i64 = 5
        },
        4,
        20,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }
}

[CCode (cname="prompeg_class",cheader_filename="ffmpeg/libformat/prompeg.c")]
public class ProMpegURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/prompeg.c")]
    public override string class_name {
        public get {
            return "prompeg";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/prompeg.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/prompeg.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/prompeg.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct PrompegContext",cheader_filename="ffmpeg/libformat/prompeg.c")]
[Compact]
public class ProMpegPrivateData { }

[CCode (cname="ff_prompeg_protocol",cheader_filename="ffmpeg/libformat/prompeg.c")]
public class ProMpegURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/prompeg.c")]
    public override string name {
        public get {
            return "prompeg";

        }

    }

    [CCode (cname="prompeg_open",cheader_filename="ffmpeg/libformat/prompeg.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="prompeg_write",cheader_filename="ffmpeg/libformat/prompeg.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="prompeg_close",cheader_filename="ffmpeg/libformat/prompeg.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/prompeg.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ProMpegPrivateData);

        }

    }

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/prompeg.c")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;

        }

    }
    //  .priv_data_class = prompeg_class;
}

} // namespace LibAVFormat
