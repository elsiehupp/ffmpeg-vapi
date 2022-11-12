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

//  #define D AV_OPT_FLAG_DECODING_PARAM
//  #define E AV_OPT_FLAG_ENCODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      { "srtp_out_suite", "", offsetof (SRTPProtoContext, out_suite), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, E },
//      { "srtp_out_params", "", offsetof (SRTPProtoContext, out_params), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, E },
//      { "srtp_in_suite", "", offsetof (SRTPProtoContext, in_suite), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, D },
//      { "srtp_in_params", "", offsetof (SRTPProtoContext, in_params), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, D },
//      { NULL }
//  }

[CCode (cname="srtp_context_class", cheader_filename="")]
public class SRTPURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "srtp";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="struct SRTPProtoContext", cheader_filename="")]
public struct SRTPPrivateData { }

[CCode (cname="ff_srtp_protocol", cheader_filename="")]
public class SRTPURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "srtp";
        }
    }

    [CCode (cname="srtp_open", cheader_filename="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="srtp_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="srtp_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="srtp_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="srtp_get_file_handle", cheader_filename="")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="srtp_get_multi_file_handle", cheader_filename="")]
    public override int url_get_multi_file_handle (
        URLContext url_context,
        out int[] handles,
        out int numhandles
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SRTPPrivateData);
        }
    }
    //  .priv_data_class = srtp_context_class,
    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
}

} // namespace LibAVFormat
