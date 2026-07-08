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
A linked-list of the inputs/outputs of the filter chain.

This is mainly useful for avfilter_graph_parse () / avfilter_graph_parse2 (),
where it is used to communicate open (unlinked) inputs and outputs from and
to the caller.
This struct specifies, per each not connected pad contained in the graph, the
filter context and the pad index required for establishing a link.
***********************************************************/
[CCode (cname="struct AVFilterInOut",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
[Compact]
public class LibAVFilter.FilterInOut {
    /***********************************************************
    @brief unique name for this input/output in the list
    ***********************************************************/
    [CCode (cname="name")]
    public string name;

    /***********************************************************
    @brief filter context associated to this input/output
    ***********************************************************/
    [CCode (cname="filter_ctx")]
    public LibAVFilter.FilterContext? filter_ctx;

    /***********************************************************
    @brief index of the filt_ctx pad to use for linking
    ***********************************************************/
    [CCode (cname="pad_idx")]
    public int pad_idx;

    /***********************************************************
    @brief next input/output in the list, NULL if this is the last
    ***********************************************************/
    [CCode (cname="next")]
    public LibAVFilter.FilterInOut? next;

    /***********************************************************
    @brief Allocate a single LibAVFilter.FilterInOut entry.
    Must be freed with avfilter_inout_free ().
    @return allocated LibAVFilter.FilterInOut on success, NULL on failure.
    ***********************************************************/
    [CCode (cname="avfilter_inout_alloc")]
    public LibAVFilter.FilterInOut? avfilter_inout_alloc ();

    /***********************************************************
    @brief Free the supplied list of LibAVFilter.FilterInOut and set *inout to NULL.
    If *inout is NULL, do nothing.
    ***********************************************************/
    [CCode (cname="avfilter_inout_free")]
    public void avfilter_inout_free (
        LibAVFilter.FilterInOut[] inout
    );

}

/***********************************************************
@}
***********************************************************/

} // namespace LibAVFilter
