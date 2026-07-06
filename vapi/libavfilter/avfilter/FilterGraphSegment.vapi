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
@brief A parsed representation of a filtergraph segment.

A filtergraph segment is conceptually a list of filterchains, with some
supplementary information (e.g. format conversion flags).

Created by avfilter_graph_segment_parse (). Must be freed with
avfilter_graph_segment_free ().
***********************************************************/
[CCode (cname="struct AVFilterGraphSegment",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
[Compact]
public class LibAVFilter.FilterGraphSegment {
    /***********************************************************
    @brief The filtergraph this segment is associated with.
    Set by avfilter_graph_segment_parse ().
    ***********************************************************/
    [CCode (cname="graph")]
    public LibAVFilter.FilterGraph? graph;

    /***********************************************************
    @brief A list of filter chain contained in this segment.
    Set in avfilter_graph_segment_parse ().
    ***********************************************************/
    [CCode (cname="chains")]
    public LibAVFilter.FilterChain[] chains;

    [CCode (cname="nb_chains")]
    public size_t nb_chains;

    /***********************************************************
    @brief A string containing a colon-separated list of key=value options applied
    to all scale filters in this segment.

    May be set by avfilter_graph_segment_parse ().
    The caller may free this string with av_free () and replace it with a
    different av_malloc ()'ed string.
    ***********************************************************/
    [CCode (cname="scale_sws_opts")]
    public string scale_sws_opts;


    /***********************************************************
    @brief Create filters specified in a graph segment.

    Walk through the creation-pending LibAVFilter.FilterParams in the segment and create
    new filter instances for them.
    Creation-pending params are those where LibAVFilter.FilterParams.filter_name is
    non-NULL (and hence LibAVFilter.FilterParams.filter is NULL). All other LibAVFilter.FilterParams
    instances are ignored.

    For any filter created by this function, the corresponding
    LibAVFilter.FilterParams.filter is set to the newly-created filter context,
    LibAVFilter.FilterParams.filter_name and LibAVFilter.FilterParams.instance_name are freed and set
    to NULL.

    @param seg the filtergraph segment to process
    @param flags reserved for future use, caller must set to 0 for now

    @retval "non-negative number" Success, all creation-pending filters were
                                successfully created
    @retval AVERROR_FILTER_NOT_FOUND some filter's name did not correspond to a
                                    known filter
    @retval "another negative error code" other failures

    @note Calling this function multiple times is safe, as it is idempotent.
    ***********************************************************/
    [CCode (cname="avfilter_graph_segment_create_filters",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_graph_segment_create_filters (
        LibAVFilter.FilterGraphSegment? seg,
        int flags
    );

    /***********************************************************
    @brief Apply parsed options to filter instances in a graph segment.

    Walk through all filter instances in the graph segment that have option
    dictionaries associated with them and apply those options with
    av_opt_set_dict2 (..., AV_OPT_SEARCH_CHILDREN). LibAVFilter.FilterParams.opts is
    replaced by the dictionary output by av_opt_set_dict2 (), which should be
    empty (NULL) if all options were successfully applied.

    If any options could not be found, this function will continue processing all
    other filters and finally return AVERROR_OPTION_NOT_FOUND (unless another
    error happens). The calling program may then deal with unapplied options as
    it wishes.

    Any creation-pending filters (see avfilter_graph_segment_create_filters ())
    present in the segment will cause this function to fail. LibAVFilter.FilterParams with
    no associated filter context are simply skipped.

    @param seg the filtergraph segment to process
    @param flags reserved for future use, caller must set to 0 for now

    @retval "non-negative number" Success, all options were successfully applied.
    @retval AVERROR_OPTION_NOT_FOUND some options were not found in a filter
    @retval "another negative error code" other failures

    @note Calling this function multiple times is safe, as it is idempotent.
    ***********************************************************/
    [CCode (cname="avfilter_graph_segment_apply_opts",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_graph_segment_apply_opts (
        LibAVFilter.FilterGraphSegment? seg,
        int flags
    );

    /***********************************************************
    @brief Initialize all filter instances in a graph segment.

    Walk through all filter instances in the graph segment and call
    avfilter_init_dict (..., NULL) on those that have not been initialized yet.

    Any creation-pending filters (see avfilter_graph_segment_create_filters ())
    present in the segment will cause this function to fail. LibAVFilter.FilterParams with
    no associated filter context or whose filter context is already initialized,
    are simply skipped.

    @param seg the filtergraph segment to process
    @param flags reserved for future use, caller must set to 0 for now

    @retval "non-negative number" Success, all filter instances were successfully
                                initialized
    @retval "negative error code" failure

    @note Calling this function multiple times is safe, as it is idempotent.
    ***********************************************************/
    [CCode (cname="avfilter_graph_segment_init",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_graph_segment_init (
        LibAVFilter.FilterGraphSegment? seg,
        int flags
    );

    /***********************************************************
    @brief Link filters in a graph segment.

    Walk through all filter instances in the graph segment and try to link all
    unlinked input and output pads. Any creation-pending filters (see
    avfilter_graph_segment_create_filters ()) present in the segment will cause
    this function to fail. Disabled filters and already linked pads are skipped.

    Every filter output pad that has a corresponding LibAVFilter.FilterPadParams with a
    non-NULL label is
    - linked to the input with the matching label, if one exists;
    - exported in the outputs linked list otherwise, with the label preserved.
    Unlabeled outputs are
    - linked to the first unlinked unlabeled input in the next non-disabled
    filter in the chain, if one exists
    - exported in the outputs linked list otherwise, with NULL label

    Similarly, unlinked input pads are exported in the inputs linked list.

    @param seg the filtergraph segment to process
    @param flags reserved for future use, caller must set to 0 for now
    @param[out] inputs  a linked list of all free (unlinked) inputs of the
                        filters in this graph segment will be returned here. It
                        is to be freed by the caller using avfilter_inout_free ().
    @param[out] outputs a linked list of all free (unlinked) outputs of the
                        filters in this graph segment will be returned here. It
                        is to be freed by the caller using avfilter_inout_free ().

    @retval "non-negative number" success
    @retval "negative error code" failure

    @note Calling this function multiple times is safe, as it is idempotent.
    ***********************************************************/
    [CCode (cname="avfilter_graph_segment_link",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_graph_segment_link (
        LibAVFilter.FilterGraphSegment? seg,
        int flags,
        LibAVFilter.FilterInOut[] inputs,
        LibAVFilter.FilterInOut[] outputs
    );

    /***********************************************************
    @brief Apply all filter/link descriptions from a graph segment to the associated filtergraph.

    This functions is currently equivalent to calling the following in sequence:
    - avfilter_graph_segment_create_filters ();
    - avfilter_graph_segment_apply_opts ();
    - avfilter_graph_segment_init ();
    - avfilter_graph_segment_link ();
    failing if any of them fails. This list may be extended in the future.

    Since the above functions are idempotent, the caller may call some of them
    manually, then do some custom processing on the filtergraph, then call this
    function to do the rest.

    @param seg the filtergraph segment to process
    @param flags reserved for future use, caller must set to 0 for now
    @param[out] inputs passed to avfilter_graph_segment_link ()
    @param[out] outputs passed to avfilter_graph_segment_link ()

    @retval "non-negative number" success
    @retval "negative error code" failure

    @note Calling this function multiple times is safe, as it is idempotent.
    ***********************************************************/
    [CCode (cname="avfilter_graph_segment_apply",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_graph_segment_apply (
        LibAVFilter.FilterGraphSegment? seg,
        int flags,
        LibAVFilter.FilterInOut[] inputs,
        LibAVFilter.FilterInOut[] outputs
    );

    /***********************************************************
    @brief Free the provided LibAVFilter.FilterGraphSegment and everything associated with it.

    @param seg double pointer to the LibAVFilter.FilterGraphSegment to be freed. NULL will
    be written to this pointer on exit from this function.

    @note
    The filter contexts (LibAVFilter.FilterParams.filter) are owned by LibAVFilter.FilterGraph rather
    than LibAVFilter.FilterGraphSegment, so they are not freed.
    ***********************************************************/
    [CCode (cname="avfilter_graph_segment_free",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public void avfilter_graph_segment_free (
        LibAVFilter.FilterGraphSegment[] seg
    );

}

} // namespace LibAVFilter
