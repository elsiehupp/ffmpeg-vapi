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

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/url.h")]
public enum URLProtocolFlags {
    /***********************************************************
    @brief The protocol name can be the first part of a nested protocol scheme
    ***********************************************************/
    [CCode (cname="URL_PROTOCOL_FLAG_NESTED_SCHEME")]
    NESTED_SCHEME,

    /***********************************************************
    @brief The protocol uses network
    ***********************************************************/
    [CCode (cname="URL_PROTOCOL_FLAG_NETWORK")]
    NETWORK;
}
