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
@brief Describes single entry of the directory.

Only name and type fields are guaranteed be set.
Rest of fields are protocol or/and platform dependent and might be unknown.
***********************************************************/
[CCode (cname="struct AVIODirEntry",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
[Compact]
public class LibAVFormat.IODirEntry {
    /***********************************************************
    @brief Filename
    ***********************************************************/
    [CCode (cname="")]
    public string name;

    /***********************************************************
    @brief Type of the entry
    ***********************************************************/
    [CCode (cname="")]
    public int type;

    /***********************************************************
    @brief Set to 1 when name is encoded with UTF-8, 0 otherwise.
    Name can be encoded with UTF-8 even though 0 is set.
    ***********************************************************/
    [CCode (cname="")]
    public int utf8;

    /***********************************************************
    @brief File size in bytes, -1 if unknown.
    ***********************************************************/
    [CCode (cname="")]
    public int64 size;

    /***********************************************************
    @brief Time of last modification in microseconds since unix
    epoch, -1 if unknown.
    ***********************************************************/
    [CCode (cname="")]
    public int64 modification_timestamp;

    /***********************************************************
    @brief Time of last access in microseconds since unix epoch,
    -1 if unknown.
    ***********************************************************/
    [CCode (cname="")]
    public int64 access_timestamp;

    /***********************************************************
    @brief Time of last status change in microseconds since unix
    epoch, -1 if unknown.
    ***********************************************************/
    [CCode (cname="")]
    public int64 status_change_timestamp;

    /***********************************************************
    User ID of owner, -1 if unknown.
    ***********************************************************/
    [CCode (cname="")]
    public int64 user_id;

    /***********************************************************
    @brief Group ID of owner, -1 if unknown.
    ***********************************************************/
    [CCode (cname="")]
    public int64 group_id;

    /***********************************************************
    Unix file mode, -1 if unknown.
    ***********************************************************/
    [CCode (cname="")]
    public int64 filemode;

    /***********************************************************
    @brief Free entry allocated by avio_read_dir ().

    @param entry entry to be freed.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public void avio_free_directory_entry (
        out LibAVFormat.IODirEntry entry
    );

}

} // namespace LibAVFormat
