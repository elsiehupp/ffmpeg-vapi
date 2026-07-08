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
Parameters of a filter's input or output pad.

Created as a child of LibAVFilter.FilterParams by avfilter_graph_segment_parse ().
Freed in avfilter_graph_segment_free ().
***********************************************************/
[CCode (cname="struct AVFilterPadParams",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
[Compact]
public class LibAVFilter.FilterPadParams {
    /***********************************************************
    An av_malloc ()'ed string containing the pad label.

    May be av_free ()'d and set to NULL by the caller, in which case this pad
    will be treated as unlabeled for linking.
    May also be replaced by another av_malloc ()'ed string.
    ***********************************************************/
    [CCode (cname="label")]
    public string label;
}

/***********************************************************
@}
***********************************************************/

} // namespace LibAVFilter
