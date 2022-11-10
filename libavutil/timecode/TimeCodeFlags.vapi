/***********************************************************
@copyright 2006 Smartjog S.A.S, Baptiste Coudurier <baptiste.coudurier@gmail.com>
@copyright 2011-2012 Smartjog S.A.S, Clément Bœsch <clement.boesch@smartjog.com>
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVUtil {

/***********************************************************
@file Timecode helpers header
***********************************************************/

[Flags]
[CCode (cheader_filename="ffmpeg/libavutil/timecode.h")]
public enum TimeCodeFlags {
    /***********************************************************
    @brief Timecode is drop frame
    ***********************************************************/
    [CCode (cname="AV_TIMECODE_FLAG_DROPFRAME")]
    DROP_FRAME,
    /***********************************************************
    @brief Timecode wraps after 24 hours
    ***********************************************************/
    [CCode (cname="AV_TIMECODE_FLAG_24HOURSMAX")]
    WRAPS_AFTER_24_HOURS,
    /***********************************************************
    @brief Negative time values are allowed
    ***********************************************************/
    [CCode (cname="AV_TIMECODE_FLAG_ALLOWNEGATIVE")]
    ALLOW_NEGATIVE,
}

} // namespace LibAVUtil
