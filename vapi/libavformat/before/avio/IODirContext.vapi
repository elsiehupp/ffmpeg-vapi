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

[CCode (cname="struct AVIODirContext",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
[Compact]
public class LibAVFormat.IODirContext {
    [CCode (cname="")]
    public URLContext url_context;

    /***********************************************************
    @brief Open directory for reading.

    @param io_context directory read context. Pointer to a NULL pointer must be passed.
    @param url directory to be listed.
    @param options A dictionary filled with protocol-private options. On return
                   this parameter will be destroyed and replaced with a dictionary
                   containing options that were not found. May be NULL.
    @return >=0 on success or negative on error.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_open_dir (
        out LibAVFormat.IODirContext io_dir_context,
        string url,
        out LibAVUtil.Dictionary options
    );

    /***********************************************************
    @brief Get next directory entry.

    Returned entry must be freed with avio_free_directory_entry (). In particular
    it may outlive LibAVFormat.IODirContext.

    @param io_dir_context directory read context.
    @param[out] next next entry or NULL when no more entries.
    @return >=0 on success or negative on error. End of list is not considered an
                error.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_read_dir (
        LibAVFormat.IODirContext io_dir_context,
        out LibAVFormat.IODirEntry next
    );

    /***********************************************************
    @brief Close directory.

    @note Entries created using avio_read_dir () are not deleted and must be
    freeded with avio_free_directory_entry ().

    @param io_dir_context directory read context.
    @return >=0 on success or negative on error.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_close_dir (
        out LibAVFormat.IODirContext io_dir_context
    );

}

} // namespace LibAVFormat
