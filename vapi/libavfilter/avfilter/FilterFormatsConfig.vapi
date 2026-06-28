/***********************************************************
filter layer
Copyright (c) 2007 Bobby Bingham

This file is part of FFmpeg.

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

/***********************************************************
@file
@ingroup lavfi
Main libavfilter public API header
***********************************************************/
namespace LibAVFilter {

/***********************************************************
@defgroup lavfi libavfilter
Graph-based frame editing library.

@{
***********************************************************/

/***********************************************************
Lists of formats / etc. supported by an end of a link.

This structure is directly part of LibAVFilter.FilterLink, in two copies:
one for the source filter, one for the destination filter.

These lists are used for negotiating the format to actually be used,
which will be loaded into the format and channel_layout members of
LibAVFilter.FilterLink, when chosen.
***********************************************************/

[CCode (cname="struct AVFilterFormatsConfig",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
[Compact]
public class LibAVFilter.FilterFormatsConfig {
    /***********************************************************
    List of supported formats (pixel or sample).
    ***********************************************************/
    public LibAVFilter.FilterFormats? formats;

    /***********************************************************
    Lists of supported sample rates, only for audio.
    ***********************************************************/
    public LibAVFilter.FilterFormats? samplerates;

    /***********************************************************
    Lists of supported channel layouts, only for audio.
    ***********************************************************/
    public LibAVFilter.FilterChannelLayouts? channel_layouts;

    /***********************************************************
    List of supported YUV color metadata, only for YUV video.

    LibAVUtil.ColorSpace
    ***********************************************************/
    public LibAVFilter.FilterFormats? color_spaces;

    /***********************************************************
    List of supported YUV color metadata, only for YUV video.

    LibAVUtil.ColorRange
    ***********************************************************/
    public LibAVFilter.FilterFormats? color_ranges;

    /***********************************************************
    List of supported alpha modes, only for video with an alpha channel.
    ***********************************************************/
    public LibAVFilter.FilterFormats? alpha_modes;  ///< AVAlphaMode

}

/***********************************************************
@}
***********************************************************/

} // namespace LibAVFilter
