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
@brief Directory entry types.
***********************************************************/
[CCode (cname="enum AVIODirEntryType",cheader_filename="subprojects/ffmpeg/libformat/avio.h")]
public enum AVIODirEntryType {
    [CCode (cname="AVIO_ENTRY_UNKNOWN")]
    UNKNOWN,

    [CCode (cname="AVIO_ENTRY_BLOCK_DEVICE")]
    BLOCK_DEVICE,

    [CCode (cname="AVIO_ENTRY_CHARACTER_DEVICE")]
    CHARACTER_DEVICE,

    [CCode (cname="AVIO_ENTRY_DIRECTORY")]
    DIRECTORY,

    [CCode (cname="AVIO_ENTRY_NAMED_PIPE")]
    NAMED_PIPE,

    [CCode (cname="AVIO_ENTRY_SYMBOLIC_LINK")]
    SYMBOLIC_LINK,

    [CCode (cname="AVIO_ENTRY_SOCKET")]
    SOCKET,

    [CCode (cname="AVIO_ENTRY_FILE")]
    FILE,

    [CCode (cname="AVIO_ENTRY_SERVER")]
    SERVER,

    [CCode (cname="AVIO_ENTRY_SHARE")]
    SHARE,

    [CCode (cname="AVIO_ENTRY_WORKGROUP")]
    WORKGROUP;
}

} // namespace LibAVFormat
