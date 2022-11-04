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
@brief List of OptionRange structs.
***********************************************************/
[CCode (cname="struct AVOptionRanges", cheader_filename="ffmpeg/libavutil/opt.h")]
public struct OptionRangeList {
    /***********************************************************
    @brief Array of option ranges.

    Most of option types use just one component.
    Following describes multi-component option types:

    OptionType.IMAGE_SIZE:
    component index 0: range of pixel count (width * height).
    component index 1: range of width.
    component index 2: range of height.

    @note To obtain multi-component version of this structure, user must
    provide AV_OPT_MULTI_COMPONENT_RANGE to av_opt_query_ranges or
    av_opt_query_ranges_default function.

    Multi-component range can be read as in following example:

    @code
    int range_index, component_index;
    OptionRangeList ranges;
    OptionRange range[3]; // may require more than 3 in the future.
    av_opt_query_ranges (&ranges, obj, key, AV_OPT_MULTI_COMPONENT_RANGE);
    for (range_index = 0; range_index < ranges.nb_ranges; range_index++) {
    for (component_index = 0; component_index < ranges.nb_components; component_index++)
    range[component_index] = ranges.range[ranges.nb_ranges * component_index + range_index];
    //do something with range here.
    }
    av_opt_freep_ranges (&ranges);
    @endcode
    ***********************************************************/
    [CCode (cname="range")]
    public OptionRange[] range_list;

    /***********************************************************
    @brief Number of ranges per component.
    ***********************************************************/
    [CCode (cname="nb_ranges")]
    public int range_count;

    /***********************************************************
    @brief Number of componentes.
    ***********************************************************/
    [CCode (cname="nb_components")]
    public int component_count;
}

} // namespace LibAVUtil
