/***********************************************************
Decryption protocol handler
@copyright 2011 Martin Storsjo
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

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

//  #define OFFSET(x) offsetof(CryptoContext, x)
//  #define D AV_OPT_FLAG_DECODING_PARAM
//  #define E AV_OPT_FLAG_ENCODING_PARAM
//  static const AVOption options[] = {
//      {"key", "AES encryption/decryption key",                   OFFSET(key),         AV_OPT_TYPE_BINARY, .flags = D|E },
//      {"iv",  "AES encryption/decryption initialization vector", OFFSET(iv),          AV_OPT_TYPE_BINARY, .flags = D|E },
//      {"decryption_key", "AES decryption key",                   OFFSET(decrypt_key), AV_OPT_TYPE_BINARY, .flags = D },
//      {"decryption_iv",  "AES decryption initialization vector", OFFSET(decrypt_iv),  AV_OPT_TYPE_BINARY, .flags = D },
//      {"encryption_key", "AES encryption key",                   OFFSET(encrypt_key), AV_OPT_TYPE_BINARY, .flags = E },
//      {"encryption_iv",  "AES encryption initialization vector", OFFSET(encrypt_iv),  AV_OPT_TYPE_BINARY, .flags = E },
//      { NULL }
//  }

[CCode (cname="crypto_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "crypto"
    //  .item_name = av_default_item_name,
    //  .option = options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_crypto_protocol", cheader="")]
public class CryptoURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "crypto"
    [CCode (cname="crypto_open2", cheader="")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );
    [CCode (cname="crypto_seek", cheader="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );
    [CCode (cname="crypto_read", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="crypto_write", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="crypto_close", cheader="")]
    public override int url_close (
        URLContext url_context
    );
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (CryptoContext);
        }
    }
    //  .priv_data_class = crypto_class,
    //  .flags = URL_PROTOCOL_FLAG_NESTED_SCHEME,
}
