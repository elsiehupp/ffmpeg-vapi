/***********************************************************
Copyright (c) 2013 Paul B Mahol

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
namespace LibAVFilter {

/***********************************************************
A filterchain is a list of filter specifications.

Created as a child of LibAVFilter.FilterGraphSegment by avfilter_graph_segment_parse ().
Freed in avfilter_graph_segment_free ().
***********************************************************/
[CCode (cname="struct AVFilterChain",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
[Compact]
public class LibAVFilter.FilterChain {
    [CCode (cname="filters")]
    public LibAVFilter.FilterParams[] filters;

    [CCode (cname="nb_filters")]
    public size_t nb_filters;
}

} // namespace LibAVFilter
