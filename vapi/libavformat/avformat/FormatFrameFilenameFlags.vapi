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
@file @ingroup libavf
Main libavformat public API header
***********************************************************/

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum LibAVFormat.FormatFrameFilenameFlags {
    /***********************************************************
    @brief Allow multiple %d
    ***********************************************************/
    [CCode (cname="AV_FRAME_FILENAME_FLAGS_MULTIPLE")]
    MULTIPLE;
}

} // namespace LibAVFormat

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
#define AV_FRAME_FILENAME_FLAGS_MULTIPLE          1  ///< Allow multiple %d
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
#define AV_FRAME_FILENAME_FLAGS_IGNORE_TRUNCATION 2  ///< Ignore truncated output instead of returning an error
