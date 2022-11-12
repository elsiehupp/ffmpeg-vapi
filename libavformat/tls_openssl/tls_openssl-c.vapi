/***********************************************************
@brief TLS/SSL Protocol
@copyright 2011 Martin Storsjo
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

//  #if OPENSSL_VERSION_NUMBER < 0x1010000fL
//  static BIO_METHOD url_bio_method = {
//      //  .type = BIO_TYPE_SOURCE_SINK,
//      //  .name = "urlprotocol bio",
//      //  .bwrite = url_bio_bwrite,
//      //  .bread = url_bio_bread,
//      //  .bputs = url_bio_bputs,
//      //  .bgets = NULL,
//      //  .ctrl = url_bio_ctrl,
//      //  .create = url_bio_create,
//      //  .destroy = url_bio_destroy,
//  }
//  #endif

//  static const LibAVUtil.Option options[] = {
//      TLS_COMMON_OPTIONS(TLSContext, tls_shared),
//      { NULL }
//  }

[CCode (cname="tls_class", cheader_filename="")]
public class OpenTLSURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "tls";
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

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="struct TLSContext", cheader_filename="")]
public struct OpenTLSPrivateData { }

[CCode (cname="ff_tls_protocol", cheader_filename="")]
public class OpenTLSURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "tls";
        }
    }

    [CCode (cname="tls_open", cheader_filename="")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="tls_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="tls_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="tls_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="tls_get_file_handle", cheader_filename="")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (OpenTLSPrivateData);
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
    //  .priv_data_class = tls_class,
}

} // namespace LibAVFormat
