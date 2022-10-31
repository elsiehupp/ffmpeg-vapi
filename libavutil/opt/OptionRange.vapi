/***********************************************************
@brief LibAVUtil.Options
@copyright 2005 Michael Niedermayer <michaelni@gmx.at>

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
@file
LibAVUtil.Options
***********************************************************/

/***********************************************************
@brief A single allowed range of values, or a single allowed value.
***********************************************************/
[CCode (cname="struct AVOptionRange", cheader_filename="ffmpeg/libavutil/opt.h")]
public struct OptionRange {
    [CCode (cname="str")]
    public string str;

    /***********************************************************
    @brief Value range.
    For string ranges this represents the min/max length.
    For dimensions this represents the min/max pixel count or width/height in multi-component case.
    ***********************************************************/
    [CCode (cname="value_min")]
    public double value_min;

    /***********************************************************
    @brief Value range.
    For string ranges this represents the min/max length.
    For dimensions this represents the min/max pixel count or width/height in multi-component case.
    ***********************************************************/
    [CCode (cname="value_max")]
    public double value_max;

    /***********************************************************
    @brief Value's component range.
    For string this represents the unicode range for chars, 0-127 limits to ASCII.
    ***********************************************************/
    [CCode (cname="component_min")]
    public double component_min;

    /***********************************************************
    @brief Value's component range.
    For string this represents the unicode range for chars, 0-127 limits to ASCII.
    ***********************************************************/
    [CCode (cname="component_max")]
    public double component_max;

    /***********************************************************
    @brief Range flag.
    If set to 1 the struct encodes a range, if set to 0 a single value.
    ***********************************************************/
    [CCode (cname="is_range")]
    public int is_range;
}

} // namespace LibAVUtil
