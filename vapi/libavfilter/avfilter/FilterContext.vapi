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
@brief An instance of a filter
***********************************************************/
[CCode (cname="struct AVFilterContext",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
[Compact]
public class LibAVFilter.FilterContext {
    /***********************************************************
    @brief needed for av_log () and filters common options
    ***********************************************************/
    [CCode (cname="av_class")]
    public LibAVUtil.Log.Class? av_class;

    /***********************************************************
    @brief the LibAVFilter.Filter of which this is an instance
    ***********************************************************/
    [CCode (cname="filter")]
    public LibAVFilter.Filter filter;

    /***********************************************************
    @brief name of this filter instance
    ***********************************************************/
    [CCode (cname="name")]
    public string name;

    /***********************************************************
    @brief array of input pads
    ***********************************************************/
    [CCode (cname="input_pads")]
    public LibAVFilter.FilterPad[] input_pads;

    /***********************************************************
    @brief array of pointers to input links
    ***********************************************************/
    [CCode (cname="inputs")]
    public LibAVFilter.FilterLink[] inputs;

    /***********************************************************
    @brief number of input pads
    ***********************************************************/
    [CCode (cname="nb_inputs")]
    public uint nb_inputs;

    /***********************************************************
    @brief array of output pads
    ***********************************************************/
    [CCode (cname="output_pads")]
    public LibAVFilter.FilterPad[] output_pads;

    /***********************************************************
    @brief array of pointers to output links
    ***********************************************************/
    [CCode (cname="outputs")]
    public LibAVFilter.FilterLink[] outputs;

    /***********************************************************
    @brief number of output pads
    ***********************************************************/
    [CCode (cname="nb_outputs")]
    public uint nb_outputs;

    /***********************************************************
    @brief private data for use by the filter
    ***********************************************************/
    [CCode (cname="priv")]
    internal void *priv;

    /***********************************************************
    @brief filtergraph this filter belongs to
    ***********************************************************/
    [CCode (cname="graph")]
    public LibAVFilter.FilterGraph graph;

    /***********************************************************
    @brief Type of multithreading being allowed/used. A combination of
    LibAVFilter.FilterThreadSliceFlags flags.

    May be set by the caller before initializing the filter to forbid some
    or all kinds of multithreading for this filter. The default is allowing
    everything.

    When the filter is initialized, this field is combined using bit AND with
    LibAVFilter.FilterGraph.thread_type to get the final mask used for determining
    allowed threading types. I.e. a threading type needs to be set in both
    to be allowed.

    After the filter is initialized, libavfilter sets this field to the
    threading type that is actually used (0 for no multithreading).
    ***********************************************************/
    [CCode (cname="thread_type")]
    public LibAVFilter.FilterThreadSliceFlags thread_type;

    /***********************************************************
    @brief An opaque struct for libavfilter internal use.
    ***********************************************************/
    [CCode (cname="internal")]
    internal LibAVFilter.FilterInternal? internal;

    /***********************************************************
    @brief enable expression string
    ***********************************************************/
    [CCode (cname="enable_str")]
    public string enable_str;

    /***********************************************************
    @brief the enabled state from the last expression evaluation

    MUST NOT be accessed from outside avfilter.
    ***********************************************************/
    [CCode (cname="is_disabled")]
    public bool is_disabled;

    /***********************************************************
    @brief For filters which will create hardware frames, sets the device the
    filter should create them in.  All other filters will ignore this field:
    in particular, a filter which consumes or processes hardware frames will
    instead use the hw_frames_ctx field in LibAVFilter.FilterLink to carry the
    hardware context information.
    ***********************************************************/
    [CCode (cname="hw_device_ctx")]
    public LibAVUtil.BufferRef hw_device_ctx;

    /***********************************************************
    @brief Max number of threads allowed in this filter instance.
    If <= 0, its value is ignored.
    Overrides global number of threads set per filter graph.
    ***********************************************************/
    [CCode (cname="nb_threads")]
    public int nb_threads;

    /***********************************************************
    @brief Sets the number of extra hardware frames which the filter will
    allocate on its output links for use in following filters or by
    the caller.

    Some hardware filters require all frames that they will use for
    output to be defined in advance before filtering starts.  For such
    filters, any hardware frame pools used for output must therefore be
    of fixed size.  The extra frames set here are on top of any number
    that the filter needs internally in order to operate normally.

    This field must be set before the graph containing this filter is
    configured.
    ***********************************************************/
    [CCode (cname="extra_hw_frames")]
    public int extra_hw_frames;

    /***********************************************************
    @brief Link two filters together.

    @param src    the source filter
    @param srcpad index of the output pad on the source filter
    @param dst    the destination filter
    @param dstpad index of the input pad on the destination filter
    @return       zero on success
    ***********************************************************/
    [CCode (cname="avfilter_link",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_link (
        LibAVFilter.FilterContext? src,
        uint srcpad,
        LibAVFilter.FilterContext? dst,
        uint dstpad
    );

    /***********************************************************
    @brief Negotiate the media format, dimensions, etc of all inputs to a filter.

    @param filter the filter to negotiate the properties for its inputs
    @return       zero on successful negotiation
    ***********************************************************/
    [CCode (cname="avfilter_config_links",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_config_links (
        LibAVFilter.FilterContext? filter
    );

    /***********************************************************
    @brief Make the filter instance process a command.
    It is recommended to use avfilter_graph_send_command ().
    ***********************************************************/
    [CCode (cname="avfilter_process_command",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_process_command (
        LibAVFilter.FilterContext? filter,
        string cmd,
        string arg,
        string res,
        int res_len,
        int flags
    );

    /***********************************************************
    @brief Initialize a filter with the supplied parameters.

    @param av_filter_context  uninitialized filter context to initialize
    @param args Options to initialize the filter with. This must be a
                ':'-separated list of options in the 'key=value' form.
                May be NULL if the options have been set directly using the
                AVOptions API or there are no options that need to be set.
    @return 0 on success, a negative AVERROR on failure
    ***********************************************************/
    [CCode (cname="avfilter_init_str",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_init_str (
        LibAVFilter.FilterContext? av_filter_context,
        string args
    );

    /***********************************************************
    @brief Initialize a filter with the supplied dictionary of options.

    @param av_filter_context     uninitialized filter context to initialize
    @param options An LibAVUtil.Dictionary filled with options for this filter. On
                   return this parameter will be destroyed and replaced with
                   a dict containing options that were not found. This dictionary
                   must be freed by the caller.
                   May be NULL, then this function is equivalent to
                   avfilter_init_str () with the second parameter set to NULL.
    @return 0 on success, a negative AVERROR on failure

    @note This function and avfilter_init_str () do essentially the same thing,
    the difference is in manner in which the options are passed. It is up to the
    calling code to choose whichever is more preferable. The two functions also
    behave differently when some of the provided options are not declared as
    supported by the filter. In such a case, avfilter_init_str () will fail, but
    this function will leave those extra options in the options LibAVUtil.Dictionary and
    continue as usual.
    ***********************************************************/
    [CCode (cname="avfilter_init_dict",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_init_dict (
        LibAVFilter.FilterContext? av_filter_context,
        LibAVUtil.Dictionary **options
    );

    /***********************************************************
    @brief Free a filter context. This will also remove the filter from its
    filtergraph's list of filters.

    @param filter the filter to free
    ***********************************************************/
    [CCode (cname="avfilter_free",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public void avfilter_free (
        LibAVFilter.FilterContext? filter
    );

    /***********************************************************
    @return LibAVUtil.Log.Class for LibAVFilter.FilterContext.

    @see av_opt_find ().
    ***********************************************************/
    [CCode (cname="avfilter_get_class",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public LibAVUtil.Log.Class? avfilter_get_class ();

}

/***********************************************************
@}
***********************************************************/

} // namespace LibAVFilter
