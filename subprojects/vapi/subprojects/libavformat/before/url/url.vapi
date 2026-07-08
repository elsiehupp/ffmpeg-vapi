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
@file unbuffered private I/O API
***********************************************************/

//  extern const LibAVUtil.Log.Class ffurl_context_class;

/***********************************************************
@brief Assemble a URL string from components. This is the reverse operation
of av_url_split.

Note, this requires networking to be initialized, so the caller must
ensure ff_network_init has been called.

@see av_url_split

@param str the buffer to fill with the url
@param size the size of the str buffer
@param proto the protocol identifier, if null, the separator
             after the identifier is left out, too
@param authorization an optional authorization string, may be null.
                     An empty string is treated the same as a null string.
@param hostname the host name string
@param port the port number, left out from the string if negative
@param fmt a generic format string for everything to add after the
           host/port, may be null
@return the number of characters written to the destination buffer
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/url.h")]
public int ff_url_join (
    string str,
    int size,
    string proto,
    string authorization,
    string hostname,
    int port,
    string fmt,
    ...
); // av_printf_format (7, 8);

/***********************************************************
@brief Convert a relative url into an absolute url, given a base url.

@param buffer the buffer where output absolute url is written
@param size the size of buffer
@param base the base url, may be equal to buffer.
@param rel the new url, which is interpreted relative to base
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/url.h")]
public void ff_make_absolute_url (
    string buffer,
    int size,
    string base_url,
    string rel
);

/***********************************************************
@brief Allocate directory entry with default values.

@return entry or NULL on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/url.h")]
public LibAVFormat.IODirEntry ff_alloc_dir_entry ();

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/url.h")]
public LibAVUtil.Log.Class ff_urlcontext_child_class_next (
    LibAVUtil.Log.Class prev
);

/***********************************************************
@brief Construct a list of protocols matching a given whitelist and/or blacklist.

@param whitelist a comma-separated list of allowed protocol names or NULL. If
                 this is a non-empty string, only protocols in this list will
                 be included.
@param blacklist a comma-separated list of forbidden protocol names or NULL.
                 If this is a non-empty string, all protocols in this list
                 will be excluded.

@return a NULL-terminated array of matching protocols. The array must be
freed by the caller.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/url.h")]
public URLProtocol[] ffurl_get_protocols (
    string whitelist,
    string blacklist
);

} // namespace LibAVFormat
