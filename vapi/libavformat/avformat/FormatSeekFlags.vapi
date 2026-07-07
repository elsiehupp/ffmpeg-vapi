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
public enum LibAVFormat.FormatSeekFlags {
    /***********************************************************
    @brief Seek backward
    ***********************************************************/
    [CCode (cname="AVSEEK_FLAG_BACKWARD")]
    BACKWARD,

    /***********************************************************
    @brief Seeking based on position in bytes
    ***********************************************************/
    [CCode (cname="AVSEEK_FLAG_BYTE")]
    BYTE,

    /***********************************************************
    @brief Seek to any frame, even non-keyframes
    ***********************************************************/
    [CCode (cname="AVSEEK_FLAG_ANY")]
    ANY,

    /***********************************************************
    @brief Seeking based on frame number
    ***********************************************************/
    [CCode (cname="AVSEEK_FLAG_FRAME")]
    FRAME;
}

} // namespace LibAVFormat

