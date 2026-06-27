/***********************************************************
@copyright 2001 Fabrice Bellard
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
@file @ingroup lavf_io
Buffered I/O operations
***********************************************************/

/***********************************************************
@brief Return the name of the protocol that will handle the passed URL.

NULL is returned if no protocol could be found for the given URL.

@return Name of the protocol or NULL.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avio.h")]
public string avio_find_protocol_name (
    string url
);

/***********************************************************
@brief Move or rename a resource.

@note url_src and url_dst should share the same protocol and authority.

@param url_src url to resource to be moved
@param url_dst new url to resource if the operation succeeded
@return >=0 on success or negative on error.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avio.h")]
public int avpriv_io_move (
    string url_src,
    string url_dst
);

/***********************************************************
@brief Delete a resource.

@param url resource to be deleted.
@return >=0 on success or negative on error.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avio.h")]
public int avpriv_io_delete (
    string url
);

} // namespace LibAVFormat
