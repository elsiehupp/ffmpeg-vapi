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
@brief Parameters describing a filter to be created in a filtergraph.

Created as a child of LibAVFilter.FilterGraphSegment by avfilter_graph_segment_parse ().
Freed in avfilter_graph_segment_free ().
***********************************************************/
[CCode (cname="struct AVFilterParams",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
[Compact]
public class LibAVFilter.FilterParams {
    /***********************************************************
    @brief The filter context.

    Created by avfilter_graph_segment_create_filters () based on
    LibAVFilter.FilterParams.filter_name and instance_name.

    Callers may also create the filter context manually, then they should
    av_free () filter_name and set it to NULL. Such LibAVFilter.FilterParams instances
    are then skipped by avfilter_graph_segment_create_filters ().
    ***********************************************************/
    [CCode (cname="filter")]
    public LibAVFilter.FilterContext? filter;

    /***********************************************************
    @brief Name of the LibAVFilter.Filter to be used.

    An av_malloc ()'ed string, set by avfilter_graph_segment_parse (). Will be
    passed to avfilter_get_by_name () by
    avfilter_graph_segment_create_filters ().

    Callers may av_free () this string and replace it with another one or
    NULL. If the caller creates the filter instance manually, this string
    MUST be set to NULL.

    When both LibAVFilter.FilterParams.filter an LibAVFilter.FilterParams.filter_name are NULL,
    this LibAVFilter.FilterParams instance is skipped by avfilter_graph_segment_*()
    functions.
    ***********************************************************/
    [CCode (cname="filter_name")]
    public string filter_name;

    /***********************************************************
    @brief Name to be used for this filter instance.

    An av_malloc ()'ed string, may be set by avfilter_graph_segment_parse () or
    left NULL. The caller may av_free () this string and replace with another
    one or NULL.

    Will be used by avfilter_graph_segment_create_filters () - passed as the
    third argument to avfilter_graph_alloc_filter (), then freed and set to
    NULL.
    ***********************************************************/
    [CCode (cname="instance_name")]
    public string instance_name;

    /***********************************************************
    @brief Options to be applied to the filter.

    Filled by avfilter_graph_segment_parse (). Afterwards may be freely
    modified by the caller.

    Will be applied to the filter by avfilter_graph_segment_apply_opts ()
    with an equivalent of av_opt_set_dict2 (filter, &opts, AV_OPT_SEARCH_CHILDREN),
    i.e. any unapplied options will be left in this dictionary.
    ***********************************************************/
    [CCode (cname="opts")]
    public LibAVUtil.Dictionary? opts;

    [CCode (cname="inputs")]
    public LibAVFilter.FilterPadParams[] inputs;

    [CCode (cname="nb_inputs")]
    public uint nb_inputs;

    [CCode (cname="outputs")]
    public LibAVFilter.FilterPadParams[] outputs;

    [CCode (cname="nb_outputs")]
    public uint nb_outputs;
}

} // namespace LibAVFilter
