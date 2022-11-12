/***********************************************************
@brief HTTP definitions
@copyright 2010 Josh Allmann
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

[CCode (cname="", cheader_filename="")]
public const size_t HTTP_HEADERS_SIZE;

/***********************************************************
@brief Initialize the authentication state based on another HTTP URLContext.
This can be used to pre-initialize the authentication parameters if
they are known beforehand, to avoid having to do an initial failing
request just to get the parameters.

@param dest URL context whose authentication state gets updated
@param src URL context whose authentication state gets copied
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void ff_http_init_auth_state (
    URLContext dest,
    URLContext src
);

/***********************************************************
@brief Send a new HTTP request, reusing the old connection.

@param h pointer to the resource
@param uri uri used to perform the request
@return a negative value if an error condition occurred, 0
otherwise
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_http_do_new_request (
    URLContext url_context,
    string uri
);

[CCode (cname="", cheader_filename="")]
public int ff_http_averror (
    int status_code,
    int default_averror
);

} // namespace LibAVFormat
