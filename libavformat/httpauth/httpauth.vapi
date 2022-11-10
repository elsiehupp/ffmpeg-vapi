/***********************************************************
HTTP authentication
@copyright 2010 Martin Storsjo
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

namespace LibAVFormat {

/***********************************************************
Authentication types, ordered from weakest to strongest.
***********************************************************/
public enum HTTPAuthType {
    /***********************************************************
    No authentication specified
    ***********************************************************/
    HTTP_AUTH_NONE,
    /***********************************************************
    HTTP 1.0 Basic auth from RFC 1945
    (also in RFC 2617)
    ***********************************************************/
    HTTP_AUTH_BASIC,
    /***********************************************************
    HTTP 1.1 Digest auth from RFC 2617
    ***********************************************************/
    HTTP_AUTH_DIGEST,
}

public struct DigestParams {
    /***********************************************************
    Server specified nonce
    ***********************************************************/
    public char nonce[300];
    /***********************************************************
    Server specified digest algorithm
    ***********************************************************/
    public char algorithm[10];
    /***********************************************************
    Quality of protection, containing the one
    that we've chosen to use, from the
    alternatives that the server offered.
    ***********************************************************/
    public char qop[30];
    /***********************************************************
    A server-specified string that should be
    included in authentication responses, not
    included in the actual digest calculation.
    ***********************************************************/
    public char opaque[300];
    /***********************************************************
    The server indicated that the auth was ok,
    but needs to be redone with a new, non-stale
    nonce.
    ***********************************************************/
    public char stale[10];
    /***********************************************************
    Nonce count, the number of earlier replies
    where this particular nonce has been used.
    ***********************************************************/
    public int nc;
}

/***********************************************************
HTTP Authentication state structure. Must be zero-initialized
before used with the functions below.
***********************************************************/
public struct HTTPAuthState {
    /***********************************************************
    The currently chosen auth type.
    ***********************************************************/
    public int auth_type;
    /***********************************************************
    Authentication realm
    ***********************************************************/
    public char realm[200];
    /***********************************************************
    The parameters specific to digest authentication.
    ***********************************************************/
    public DigestParams digest_params;
    /***********************************************************
    Auth ok, but needs to be resent with a new nonce.
    ***********************************************************/
    public int stale;
}

public void ff_http_auth_handle_header (
    HTTPAuthState state,
    string key,
    string value
);

public string ff_http_auth_create_response (
    HTTPAuthState state,
    string auth,
    string path,
    string method
);

} // namespace LibAVFormat
