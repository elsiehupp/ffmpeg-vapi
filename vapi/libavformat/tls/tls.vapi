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

[CCode (cname="struct TLSShared", cheader_filename="")]
public struct TLSShared {
    [CCode (cname="", cheader_filename="")]
    public string ca_file;

    [CCode (cname="", cheader_filename="")]
    public int verify;

    [CCode (cname="", cheader_filename="")]
    public string cert_file;

    [CCode (cname="", cheader_filename="")]
    public string key_file;

    [CCode (cname="", cheader_filename="")]
    public int listen;

    [CCode (cname="", cheader_filename="")]
    public string host;

    [CCode (cname="", cheader_filename="")]
    public char underlying_host[200];

    [CCode (cname="", cheader_filename="")]
    public int numerichost;

    [CCode (cname="", cheader_filename="")]
    public URLContext tcp;
}

//  #define TLS_OPTFL (AV_OPT_FLAG_DECODING_PARAM | AV_OPT_FLAG_ENCODING_PARAM)
//  #define TLS_COMMON_OPTIONS (pstruct, options_field)
//      {"ca_file", "Certificate Authority database file", offsetof (pstruct, options_field . ca_file), AV_OPT_TYPE_STRING, .flags = TLS_OPTFL },
//      {"cafile", "Certificate Authority database file", offsetof (pstruct, options_field . ca_file), AV_OPT_TYPE_STRING, .flags = TLS_OPTFL },
//      {"tls_verify", "Verify the peer certificate", offsetof (pstruct, options_field . verify), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, 1, .flags = TLS_OPTFL },
//      {"cert_file", "Certificate file", offsetof (pstruct, options_field . cert_file), AV_OPT_TYPE_STRING, .flags = TLS_OPTFL },
//      {"key_file", "Private key file", offsetof (pstruct, options_field . key_file), AV_OPT_TYPE_STRING, .flags = TLS_OPTFL },
//      {"listen", "Listen for incoming connections", offsetof (pstruct, options_field . listen), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, 1, .flags = TLS_OPTFL },
//      {"verifyhost", "Verify against a specific hostname", offsetof (pstruct, options_field . host), AV_OPT_TYPE_STRING, .flags = TLS_OPTFL }

[CCode (cname="", cheader_filename="")]
public int ff_tls_open_underlying (
    TLSShared *tls_shared,
    URLContext parent,
    string uri,
    out LibAVUtil.Dictionary options
);

[CCode (cname="", cheader_filename="")]
public void ff_gnutls_init ();

[CCode (cname="", cheader_filename="")]
public void ff_gnutls_deinit ();

[CCode (cname="", cheader_filename="")]
public int ff_openssl_init ();

[CCode (cname="", cheader_filename="")]
public void ff_openssl_deinit ();

} // namespace LibAVFormat
