/***********************************************************
@brief TLS/SSL Protocol
@copyright 2011 Martin Storsjo
@copyright 2017 sfan5 <sfan5@live.de>
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

[CCode (cname="tls_class",cheader_filename="subprojects/ffmpeg/libavformat/tls_libtls.c")]
public class LibTLSURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/tls_libtls.c")]
    public override string class_name {
        public get {
            return "tls";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/tls_libtls.c")]
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
                TLS_COMMON_OPTIONS (
                    TLSContext,
                    tls_shared
                ),
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/tls_libtls.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct TLSContext",cheader_filename="subprojects/ffmpeg/libavformat/tls_libtls.c")]
[Compact]
public class LibTLSPrivateData { }

[CCode (cname="ff_tls_protocol",cheader_filename="subprojects/ffmpeg/libavformat/tls_libtls.c")]
public class LibTLSURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/tls_libtls.c")]
    public override string name {
        public get {
            return "tls";

        }

    }

    [CCode (cname="ff_tls_open",cheader_filename="subprojects/ffmpeg/libavformat/tls_libtls.c")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="ff_tls_read",cheader_filename="subprojects/ffmpeg/libavformat/tls_libtls.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="ff_tls_write",cheader_filename="subprojects/ffmpeg/libavformat/tls_libtls.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="ff_tls_close",cheader_filename="subprojects/ffmpeg/libavformat/tls_libtls.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="tls_get_file_handle",cheader_filename="subprojects/ffmpeg/libavformat/tls_libtls.c")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/tls_libtls.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (LibTLSPrivateData);

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/tls_libtls.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
    //  .priv_data_class = tls_class;
}

} // namespace LibAVFormat
