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
public enum LibAVFormat.FormatAvoidNegativeTimestampFlags {
    /***********************************************************
    @brief Enabled when required by target format
    ***********************************************************/
    [CCode (cname="AVFMT_AVOID_NEG_TS_AUTO")]
    AUTO,


    /***********************************************************
    @brief Do not shift timestamps even when they are negative.
    ***********************************************************/
    [CCode (cname="AVFMT_AVOID_NEG_TS_DISABLED")]
    DISABLED,

    /***********************************************************
    @brief Shift timestamps so they are non negative
    ***********************************************************/
    [CCode (cname="AVFMT_AVOID_NEG_TS_MAKE_NON_NEGATIVE")]
    MAKE_NON_NEGATIVE,

    /***********************************************************
    @brief Shift timestamps so that they start at 0
    ***********************************************************/
    [CCode (cname="AVFMT_AVOID_NEG_TS_MAKE_ZERO")]
    MAKE_ZERO;
}

} // namespace LibAVFormat
