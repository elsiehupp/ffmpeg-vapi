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

[CCode (cname="rtp_class",cheader_filename="subprojects/ffmpeg/libavformat/rtpproto.c")]
public class RTPURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/rtpproto.c")]
    public override string class_name {
        public get {
            return "rtp";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/rtpproto.c")]
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
                    name = "ttl",
                    short_help_text = "Time to live (in milliseconds, multicast only)",
                    offset = offsetof (
                        RTPContext,
                        ttl
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
                    name = "buffer_size",
                    short_help_text = "Send/Receive buffer size (in bytes)",
                    offset = offsetof (
                        RTPContext,
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
                new LibAVUtil.IntOption () {
                    name = "rtcp_port",
                    short_help_text = "Custom rtcp port",
                    offset = offsetof (
                        RTPContext,
                        rtcp_port
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
                    name = "local_rtpport",
                    short_help_text = "Local rtp port",
                    offset = offsetof (
                        RTPContext,
                        local_rtpport
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
                    name = "local_rtcpport",
                    short_help_text = "Local rtcp port",
                    offset = offsetof (
                        RTPContext,
                        local_rtcpport
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
                    name = "connect",
                    short_help_text = "Connect socket",
                    offset = offsetof (
                        RTPContext,
                        connect
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.BoolOption () {
                    name = "write_to_source",
                    short_help_text = "Send packets to the source address of the latest received packet",
                    offset = offsetof (
                        RTPContext,
                        write_to_source
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
                    name = "pkt_size",
                    short_help_text = "Maximum packet size",
                    offset = offsetof (
                        RTPContext,
                        pkt_size
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
                    name = "dscp",
                    short_help_text = "DSCP class",
                    offset = offsetof (
                        RTPContext,
                        dscp
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
                    name = "sources",
                    short_help_text = "Source list",
                    offset = offsetof (
                        RTPContext,
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
                        RTPContext,
                        block
                    ),
                    default_value = "",
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.StringOption () {
                    name = "fec",
                    short_help_text = "FEC",
                    offset = offsetof (
                        RTPContext,
                        fec_options_str
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

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/rtpproto.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct RTPContext",cheader_filename="subprojects/ffmpeg/libavformat/rtpproto.c")]
[Compact]
public class RTPPrivateData { }

[CCode (cname="ff_rtp_protocol",cheader_filename="subprojects/ffmpeg/libavformat/rtpproto.c")]
public class RTPURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/rtpproto.c")]
    public override string name {
        public get {
            return "rtp";

        }

    }

    [CCode (cname="rtp_open",cheader_filename="subprojects/ffmpeg/libavformat/rtpproto.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="rtp_read",cheader_filename="subprojects/ffmpeg/libavformat/rtpproto.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtp_write",cheader_filename="subprojects/ffmpeg/libavformat/rtpproto.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtp_close",cheader_filename="subprojects/ffmpeg/libavformat/rtpproto.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="rtp_get_file_handle",cheader_filename="subprojects/ffmpeg/libavformat/rtpproto.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="rtp_get_multi_file_handle",cheader_filename="subprojects/ffmpeg/libavformat/rtpproto.c")]
    public override int url_get_multi_file_handle (
        URLContext url_context,
        out int[] handles,
        out int numhandles
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/rtpproto.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTPPrivateData);

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/rtpproto.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
    //  .priv_data_class = rtp_class;
}

} // namespace LibAVFormat
