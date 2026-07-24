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

[CCode (cname="struct TLSShared",cheader_filename="subprojects/ffmpeg/libavformat/tls.h")]
[Compact]
public class TLSShared {
    [CCode (cname="")]
    public string ca_file;

    [CCode (cname="")]
    public int verify;

    [CCode (cname="")]
    public string cert_file;

    [CCode (cname="")]
    public string key_file;

    [CCode (cname="")]
    public int listen;

    [CCode (cname="")]
    public string host;

    [CCode (cname="")]
    public char underlying_host[200];

    [CCode (cname="")]
    public int numerichost;

    [CCode (cname="")]
    public URLContext tcp;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/tls.h")]
public define TLS_OPTFL (LibAVUtil.OptionFlags.DECODING_PARAM | LibAVUtil.OptionFlags.ENCODING_PARAM)
public define TLS_COMMON_OPTIONS (
    pstruct,
    options_field
) {
    return {
        new LibAVUtil.StringOption () {
            "ca_file",
            "Certificate Authority database file",
            offsetof (
                pstruct,
                options_field . ca_file
            ),
            .flags = TLS_OPTFL
        },
        new LibAVUtil.StringOption () {
            "cafile",
            "Certificate Authority database file",
            offsetof (
                pstruct,
                options_field . ca_file
            ),
            .flags = TLS_OPTFL
        },
        new LibAVUtil.IntOption () {
            "tls_verify",
            "Verify the peer certificate",
            offsetof (
                pstruct,
                options_field . verify
            ),
            {
                .i64 = 0
            },
            0,
            1,
            .flags = TLS_OPTFL
        },
        new LibAVUtil.StringOption () {
            "cert_file",
            "Certificate file",
            offsetof (
                pstruct,
                options_field . cert_file
            ),
            .flags = TLS_OPTFL
        },
        new LibAVUtil.StringOption () {
            "key_file",
            "Private key file",
            offsetof (
                pstruct,
                options_field . key_file
            ),
            .flags = TLS_OPTFL
        },
        new LibAVUtil.IntOption () {
            "listen",
            "Listen for incoming connections",
            offsetof (
                pstruct,
                options_field . listen
            ),
            {
                .i64 = 0
            },
            0,
            1,
            .flags = TLS_OPTFL
        },
        new LibAVUtil.StringOption () {
            "verifyhost",
            "Verify against a specific hostname",
            offsetof (
                pstruct, options_field . host
            ),
            .flags = TLS_OPTFL
        }

    };

}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/tls.h")]
public int ff_tls_open_underlying (
    TLSShared? tls_shared,
    URLContext parent,
    string uri,
    out LibAVUtil.Dictionary options
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/tls.h")]
public void ff_gnutls_init ();

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/tls.h")]
public void ff_gnutls_deinit ();

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/tls.h")]
public int ff_openssl_init ();

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/tls.h")]
public void ff_openssl_deinit ();

} // namespace LibAVFormat
