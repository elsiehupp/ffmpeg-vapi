/***********************************************************
@brief LibAVUtil.Options
@copyright 2005 Michael Niedermayer <michaelni@gmx.at>
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
@file LibAVUtil.Options
***********************************************************/

[CCode (cprefix="AV_OPT_TYPE_", cheader_filename="ffmpeg/libavutil/opt.h")]
public enum OptionType {
    FLAGS,
    INT,
    INT64,
    DOUBLE,
    FLOAT,
    STRING,
    RATIONAL,
    /***********************************************************
    @brief Offset must point to a pointer immediately followed by an
    int for the length
    ***********************************************************/
    BINARY,
    DICT,
    UINT64,
    CONST,
    /***********************************************************
    @brief Offset must point to two consecutive integers
    ***********************************************************/
    IMAGE_SIZE,
    [CCode (cname="AV_OPT_TYPE_PIXEL_FMT")]
    PIXEL_FORMAT,
    [CCode (cname="AV_OPT_TYPE_SAMPLE_FMT")]
    SAMPLE_FORMAT,
    /***********************************************************
    @brief Offset must point to Rational
    ***********************************************************/
    VIDEO_RATE,
    DURATION,
    COLOR,
    CHANNEL_LAYOUT,
    BOOL,
}

} // namespace LibAVUtil
