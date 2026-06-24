/***********************************************************
@brief SRTP network protocol
@copyright 2012 Martin Storsjo
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

[CCode (cname="srtp_context_class",cheader_filename="subprojects/ffmpeg/libavformat/srtpproto.c")]
public class SRTPURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/srtpproto.c")]
    public override string class_name {
        public get {
            return "srtp";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/srtpproto.c")]
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
                new LibAVUtil.StringOption () {
                    name = "srtp_out_suite",
                    short_help_text = "",
                    offset = offsetof (
                        SRTPProtoContext,
                        out_suite
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "srtp_out_params",
                    short_help_text = "",
                    offset = offsetof (
                        SRTPProtoContext,
                        out_params
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "srtp_in_suite",
                    short_help_text = "",
                    offset = offsetof (
                        SRTPProtoContext,
                        in_suite
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "srtp_in_params",
                    short_help_text = "",
                    offset = offsetof (
                        SRTPProtoContext,
                        in_params
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/srtpproto.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct SRTPProtoContext",cheader_filename="subprojects/ffmpeg/libavformat/srtpproto.c")]
[Compact]
public class SRTPPrivateData { }

[CCode (cname="ff_srtp_protocol",cheader_filename="subprojects/ffmpeg/libavformat/srtpproto.c")]
public class SRTPURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/srtpproto.c")]
    public override string name {
        public get {
            return "srtp";

        }

    }

    [CCode (cname="srtp_open",cheader_filename="subprojects/ffmpeg/libavformat/srtpproto.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="srtp_read",cheader_filename="subprojects/ffmpeg/libavformat/srtpproto.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="srtp_write",cheader_filename="subprojects/ffmpeg/libavformat/srtpproto.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="srtp_close",cheader_filename="subprojects/ffmpeg/libavformat/srtpproto.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="srtp_get_file_handle",cheader_filename="subprojects/ffmpeg/libavformat/srtpproto.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="srtp_get_multi_file_handle",cheader_filename="subprojects/ffmpeg/libavformat/srtpproto.c")]
    public override int url_get_multi_file_handle (
        URLContext url_context,
        out int[] handles,
        out int numhandles
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/srtpproto.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SRTPPrivateData);

        }

    }
    //  .priv_data_class = srtp_context_class,

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/srtpproto.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
}

} // namespace LibAVFormat
