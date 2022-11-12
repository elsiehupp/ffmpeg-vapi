/***********************************************************
@brief LibAVUtil.Options
@copyright 2005 Michael Niedermayer <michaelni@gmx.at>
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

[Flags]
[CCode (cheader_filename="ffmpeg/libavutil/opt.h")]
public enum OptionSearchFlags {
    /***********************************************************
    @brief Search in possible children of the given object first.
    ***********************************************************/
    [CCode (cname="AV_OPT_SEARCH_CHILDREN")]
    SEARCH_CHILDREN,
    /***********************************************************
    @description The object passed to av_opt_find () is fake --
        only a double pointer to Class instead of a required
        pointer to a struct containing Class. This is useful
        for searching for options without needing to allocate
        the corresponding object.
    ***********************************************************/
    [CCode (cname="AV_OPT_SEARCH_FAKE_OBJ")]
    FAKE_OBJECT_PARAMETER,

    /***********************************************************
    @description In av_opt_get, return null if the option has a pointer type and is set to null,
        rather than returning an empty string.
    ***********************************************************/
    AV_OPT_ALLOW_NULL,

    /***********************************************************
    @description Allows av_opt_query_ranges and av_opt_query_ranges_default to return more than
        one component for certain option types.
    @see @link OptionRangeList for details.
    ***********************************************************/
    AV_OPT_MULTI_COMPONENT_RANGE,
}

} // namespace LibAVUtil
