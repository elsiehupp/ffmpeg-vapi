/***********************************************************
@brief HTTP authentication
@copyright 2010 Martin Storsjo
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
@brief Authentication types, ordered from weakest to strongest.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public enum HTTPAuthType {
    /***********************************************************
    @brief No authentication specified
    ***********************************************************/
    HTTP_AUTH_NONE,
    /***********************************************************
    @brief HTTP 1.0 Basic auth from RFC 1945
    (also in RFC 2617)
    ***********************************************************/
    HTTP_AUTH_BASIC,
    /***********************************************************
    @brief HTTP 1.1 Digest auth from RFC 2617
    ***********************************************************/
    HTTP_AUTH_DIGEST,
}

[CCode (cname="struct DigestParams", cheader_filename="")]
public struct DigestParams {
    /***********************************************************
    @brief Server specified nonce
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char nonce[300];

    /***********************************************************
    @brief Server specified digest algorithm
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char algorithm[10];

    /***********************************************************
    @brief Quality of protection, containing the one
    that we've chosen to use, from the
    alternatives that the server offered.
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char qop[30];

    /***********************************************************
    @brief A server-specified string that should be
    included in authentication responses, not
    included in the actual digest calculation.
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char opaque[300];

    /***********************************************************
    @brief The server indicated that the auth was ok,
    but needs to be redone with a new, non-stale
    nonce.
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char stale[10];

    /***********************************************************
    @brief Nonce count, the number of earlier replies
    where this particular nonce has been used.
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int nc;
}

/***********************************************************
@brief HTTP Authentication state structure. Must be zero-initialized
before used with the functions below.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public struct HTTPAuthState {
    /***********************************************************
    @brief The currently chosen auth type.
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int auth_type;

    /***********************************************************
    @brief Authentication realm
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char realm[200];

    /***********************************************************
    @brief The parameters specific to digest authentication.
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public DigestParams digest_params;

    /***********************************************************
    @brief Auth ok, but needs to be resent with a new nonce.
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int stale;
}

[CCode (cname="", cheader_filename="")]
public void ff_http_auth_handle_header (
    HTTPAuthState state,
    string key,
    string value
);

[CCode (cname="", cheader_filename="")]
public string ff_http_auth_create_response (
    HTTPAuthState state,
    string auth,
    string path,
    string method
);

} // namespace LibAVFormat
