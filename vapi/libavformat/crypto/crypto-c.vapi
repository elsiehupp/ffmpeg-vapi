/***********************************************************
@brief Decryption protocol handler
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

[CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/crypto.c")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.BinaryOption () {
        name = "key",
        short_help_text = "AES encryption/decryption key",
        offset = offsetof (
            CryptoContext,
            key
        ),
        option_flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.BinaryOption () {
        name = "iv",
        short_help_text = "AES encryption/decryption initialization vector",
        offset = offsetof (
            CryptoContext,
            iv
        ),
        option_flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.BinaryOption () {
        name = "decryption_key",
        short_help_text = "AES decryption key",
        offset = offsetof (
            CryptoContext,
            decrypt_key
        ),
        option_flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.BinaryOption () {
        name = "decryption_iv",
        short_help_text = "AES decryption initialization vector",
        offset = offsetof (
            CryptoContext,
            decrypt_iv
        ),
        option_flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.BinaryOption () {
        name = "encryption_key",
        short_help_text = "AES encryption key",
        offset = offsetof (
            CryptoContext,
            encrypt_key
        ),
        option_flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.BinaryOption () {
        name = "encryption_iv",
        short_help_text = "AES encryption initialization vector",
        offset = offsetof (
            CryptoContext,
            encrypt_iv
        ),
        option_flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    {
        NULL
    }
}

[CCode (cname="crypto_class",cheader_filename="subprojects/ffmpeg/libavformat/crypto.c")]
public class CryptoURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/crypto.c")]
    public override string class_name {
        public get {
            return "crypto";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/crypto.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = options,

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/crypto.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct CryptoContext",cheader_filename="subprojects/ffmpeg/libavformat/crypto.c")]
[Compact]
public class CryptoPrivateData { }

[CCode (cname="ff_crypto_protocol",cheader_filename="subprojects/ffmpeg/libavformat/crypto.c")]
public class CryptoURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/crypto.c")]
    public override string name {
        public get {
            return "crypto";

        }

    }

    [CCode (cname="crypto_open2",cheader_filename="subprojects/ffmpeg/libavformat/crypto.c")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="crypto_seek",cheader_filename="subprojects/ffmpeg/libavformat/crypto.c")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );

    [CCode (cname="crypto_read",cheader_filename="subprojects/ffmpeg/libavformat/crypto.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="crypto_write",cheader_filename="subprojects/ffmpeg/libavformat/crypto.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="crypto_close",cheader_filename="subprojects/ffmpeg/libavformat/crypto.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/crypto.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (CryptoPrivateData);

        }

    }
    //  .priv_data_class = crypto_class,

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/crypto.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NESTED_SCHEME;

        }

    }
}

} // namespace LibAVFormat
