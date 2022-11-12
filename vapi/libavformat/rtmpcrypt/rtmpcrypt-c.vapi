/***********************************************************
@brief RTMPE network protocol
@copyright 2008-2009 Andrej Stepanchuk
@copyright 2009-2010 Howard Chu
@copyright 2012 Samuel Pitoiset
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
@file RTMPE protocol
***********************************************************/

//  #define OFFSET (x) offsetof (RTMPEContext, x)
//  #define DEC AV_OPT_FLAG_DECODING_PARAM

//  static const LibAVUtil.Option ffrtmpcrypt_options[] = {
//      {"ffrtmpcrypt_tunneling", "Use a HTTP tunneling connection (RTMPTE).", OFFSET (tunneling), AV_OPT_TYPE_INT, {.i64 = 0}, 0, 1, DEC},
//      { NULL },
//  }

[CCode (cname="ffrtmpcrypt_class", cheader_filename="")]
public class RTMPCryptURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "ffrtmpcrypt";
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
    //  .option = ffrtmpcrypt_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="struct RTMPEContext", cheader_filename="")]
public struct RTMPCryptPrivateData { }

[CCode (cname="ff_ffrtmpcrypt_protocol", cheader_filename="")]
public class RTMPCryptURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "ffrtmpcrypt";
        }
    }

    [CCode (cname="rtmpe_open", cheader_filename="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="rtmpe_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmpe_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="rtmpe_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTMPCryptPrivateData);
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
    //  .priv_data_class = ffrtmpcrypt_class,
}

} // namespace LibAVFormat
