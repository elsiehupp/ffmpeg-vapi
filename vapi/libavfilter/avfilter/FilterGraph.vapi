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

[CCode (cname="struct AVFilterGraph",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
[Compact]
public class LibAVFilter.FilterGraph {
    [CCode (cname="av_class")]
    public LibAVUtil.Class? av_class;

    [CCode (cname="filters")]
    public LibAVFilter.FilterContext[] filters;

    [CCode (cname="nb_filters")]
    public uint nb_filters;

    /***********************************************************
    sws options to use for the auto-inserted scale filters
    ***********************************************************/
    [CCode (cname="scale_sws_opts")]
    public string scale_sws_opts;

    /***********************************************************
    Type of multithreading allowed for filters in this graph. A combination
    of LibAVFilter.FilterThreadSliceFlags flags.

    May be set by the caller at any point, the setting will apply to all
    filters initialized after that. The default is allowing everything.

    When a filter in this graph is initialized, this field is combined using
    bit AND with LibAVFilter.FilterContext.thread_type to get the final mask used for
    determining allowed threading types. I.e. a threading type needs to be
    set in both to be allowed.
    ***********************************************************/
    [CCode (cname="thread_type")]
    public int thread_type;

    /***********************************************************
    Maximum number of threads used by filters in this graph. May be set by
    the caller before adding any filters to the filtergraph. Zero (the
    default) means that the number of threads is determined automatically.
    ***********************************************************/
    [CCode (cname="nb_threads")]
    public int nb_threads;

    /***********************************************************
    Opaque object for libavfilter internal use.
    ***********************************************************/
    [CCode (cname="internal")]
    public AVFilterGraphInternal? internal;

    /***********************************************************
    Opaque user data. May be set by the caller to an arbitrary value, e.g. to
    be used from callbacks like @ref LibAVFilter.FilterGraph.execute.
    Libavfilter will not touch this field in any way.
    ***********************************************************/
    [CCode (cname="opaque")]
    public void *opaque;

    /***********************************************************
    A function pointer passed to the @ref LibAVFilter.FilterGraph.execute callback to be
    executed multiple times, possibly in parallel.

    @param av_filter_context the filter context the job belongs to
    @param arg an opaque parameter passed through from @ref
               LibAVFilter.FilterGraph.execute
    @param jobnr the index of the job being executed
    @param nb_jobs the total number of jobs

    @return 0 on success, a negative AVERROR on error
    ***********************************************************/
    [CCode (cname="avfilter_action_func",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public delegate int AVFilterActionDelegate (
        LibAVFilter.FilterContext? av_filter_context,
        void *arg,
        int jobnr,
        int nb_jobs
    );

    /***********************************************************
    A function executing multiple jobs, possibly in parallel.

    @param av_filter_context the filter context to which the jobs belong
    @param func the function to be called multiple times
    @param arg the argument to be passed to func
    @param ret a nb_jobs-sized array to be filled with return values from each
               invocation of func
    @param nb_jobs the number of jobs to execute

    @return 0 on success, a negative AVERROR on error
    ***********************************************************/
    [CCode (cname="avfilter_execute_func",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public delegate int AVFilterExecuteDelegate (
        LibAVFilter.FilterContext? av_filter_context,
        AVFilterActionDelegate? func,
        void *arg,
        out int ret,
        int nb_jobs
    );

    /***********************************************************
    This callback may be set by the caller immediately after allocating the
    graph and before adding any filters to it, to provide a custom
    multithreading implementation.

    If set, filters with slice threading capability will call this callback
    to execute multiple jobs in parallel.

    If this field is left unset, libavfilter will use its internal
    implementation, which may or may not be multithreaded depending on the
    platform and build options.
    ***********************************************************/
    [CCode (cname="execute")]
    public AVFilterExecuteDelegate? execute;

    /***********************************************************
    swr options to use for the auto-inserted aresample filters, Access ONLY through AVOptions
    ***********************************************************/
    [CCode (cname="aresample_swr_opts")]
    public string aresample_swr_opts;

    /***********************************************************
    Private fields

    The following fields are for internal use only.
    Their type, offset, number and semantic can change without notice.
    ***********************************************************/

    [CCode (cname="sink_links")]
    internal LibAVFilter.FilterLink[] sink_links;

    [CCode (cname="sink_links_count")]
    internal int sink_links_count;

    [CCode (cname="disable_auto_convert")]
    internal uint disable_auto_convert;

    /***********************************************************
    Create a new filter instance in a filter graph.

    @param graph graph in which the new filter will be used
    @param filter the filter to create an instance of
    @param name Name to give to the new instance (will be copied to
                LibAVFilter.FilterContext.name). This may be used by the caller to identify
                different filters, libavfilter itself assigns no semantics to
                this parameter. May be NULL.

    @return the context of the newly created filter instance (note that it is
            also retrievable directly through LibAVFilter.FilterGraph.filters or with
            avfilter_graph_get_filter ()) on success or NULL on failure.
    ***********************************************************/
    [CCode (cname="avfilter_graph_alloc_filter",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public LibAVFilter.FilterContext? avfilter_graph_alloc_filter (
        LibAVFilter.FilterGraph? graph,
        LibAVFilter.Filter? filter,
        string name
    );

    /***********************************************************
    Create and add a filter instance into an existing graph.
    The filter instance is created from the filter filt and inited
    with the parameters args and opaque.

    In case of success put in? filt_ctx the pointer to the created
    filter instance, otherwise set? filt_ctx to NULL.

    @param name the instance name to give to the created filter instance
    @param graph_ctx the filter graph
    @return a negative AVERROR error code in case of failure, a non
    negative value otherwise
    ***********************************************************/
    [CCode (cname="avfilter_graph_create_filter",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_graph_create_filter (
        LibAVFilter.FilterContext[] filt_ctx,
        LibAVFilter.Filter? filt,
        string name,
        string args,
        void *opaque,
        LibAVFilter.FilterGraph? graph_ctx
    );

    /***********************************************************
    Allocate a filter graph.

    @return the allocated filter graph on success or NULL.
    ***********************************************************/
    [CCode (cname="avfilter_graph_alloc",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public LibAVFilter.FilterGraph? avfilter_graph_alloc ();

    /***********************************************************
    Get a filter instance identified by instance name from graph.

    @param graph filter graph to search through.
    @param name filter instance name (should be unique in the graph).
    @return the pointer to the found filter instance or NULL if it
    cannot be found.
    ***********************************************************/
    [CCode (cname="avfilter_graph_get_filter",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public LibAVFilter.FilterContext? avfilter_graph_get_filter (
        LibAVFilter.FilterGraph? graph,
        string name
    );

    /***********************************************************
    Enable or disable automatic format conversion inside the graph.

    Note that format conversion can still happen inside explicitly inserted
    scale and aresample filters.

    @param flags  any of the LibAVFilter.FilterAutoConvertFlags constants
    ***********************************************************/
    [CCode (cname="avfilter_graph_set_auto_convert",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public void avfilter_graph_set_auto_convert (
        LibAVFilter.FilterGraph? graph,
        LibAVFilter.FilterAutoConvertFlags flags
    );

    /***********************************************************
    Check validity and configure all the links and formats in the graph.

    @param graphctx the filter graph
    @param log_ctx context used for logging
    @return >= 0 in case of success, a negative AVERROR code otherwise
    ***********************************************************/
    [CCode (cname="avfilter_graph_config",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_graph_config (
        LibAVFilter.FilterGraph? graphctx,
        void *log_ctx
    );

    /***********************************************************
    Free a graph, destroy its links, and set? graph to NULL.
    If? graph is NULL, do nothing.
    ***********************************************************/
    [CCode (cname="avfilter_graph_free",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public void avfilter_graph_free (
        LibAVFilter.FilterGraph[] graph
    );

    /***********************************************************
    Add a graph described by a string to a graph.

    @note The caller must provide the lists of inputs and outputs,
    which therefore must be known before calling the function.

    @note The inputs parameter describes inputs of the already existing
    part of the graph; i.e. from the point of view of the newly created
    part, they are outputs. Similarly the outputs parameter describes
    outputs of the already existing filters, which are provided as
    inputs to the parsed filters.

    @param graph   the filter graph where to link the parsed graph context
    @param filters string to be parsed
    @param inputs  linked list to the inputs of the graph
    @param outputs linked list to the outputs of the graph
    @return zero on success, a negative AVERROR code on error
    ***********************************************************/
    [CCode (cname="avfilter_graph_parse",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_graph_parse (
        LibAVFilter.FilterGraph? graph,
        string filters,
        LibAVFilter.FilterInOut? inputs,
        LibAVFilter.FilterInOut? outputs,
        void *log_ctx
    );

    /***********************************************************
    Add a graph described by a string to a graph.

    In the graph filters description, if the input label of the first
    filter is not specified, "in" is assumed; if the output label of
    the last filter is not specified, "out" is assumed.

    @param graph   the filter graph where to link the parsed graph context
    @param filters string to be parsed
    @param inputs  pointer to a linked list to the inputs of the graph, may be NULL.
                   If non-NULL,? inputs is updated to contain the list of open inputs
                   after the parsing, should be freed with avfilter_inout_free ().
    @param outputs pointer to a linked list to the outputs of the graph, may be NULL.
                   If non-NULL,? outputs is updated to contain the list of open outputs
                   after the parsing, should be freed with avfilter_inout_free ().
    @return non negative on success, a negative AVERROR code on error
    ***********************************************************/
    [CCode (cname="avfilter_graph_parse_ptr",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_graph_parse_ptr (
        LibAVFilter.FilterGraph? graph,
        string filters,
        LibAVFilter.FilterInOut **inputs,
        LibAVFilter.FilterInOut **outputs,
        void *log_ctx
    );

    /***********************************************************
    Add a graph described by a string to a graph.

    @param[in]  graph   the filter graph where to link the parsed graph context
    @param[in]  filters string to be parsed
    @param[out] inputs  a linked list of all free (unlinked) inputs of the
                        parsed graph will be returned here. It is to be freed
                        by the caller using avfilter_inout_free ().
    @param[out] outputs a linked list of all free (unlinked) outputs of the
                        parsed graph will be returned here. It is to be freed by the
                        caller using avfilter_inout_free ().
    @return zero on success, a negative AVERROR code on error

    @note This function returns the inputs and outputs that are left
    unlinked after parsing the graph and the caller then deals with
    them.
    @note This function makes no reference whatsoever to already
    existing parts of the graph and the inputs parameter will on return
    contain inputs of the newly parsed part of the graph.  Analogously
    the outputs parameter will contain outputs of the newly created
    filters.
    ***********************************************************/
    [CCode (cname="avfilter_graph_parse2",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_graph_parse2 (
        LibAVFilter.FilterGraph? graph,
        string filters,
        LibAVFilter.FilterInOut **inputs,
        LibAVFilter.FilterInOut **outputs
    );

    /***********************************************************
    Send a command to one or more filter instances.

    @param graph  the filter graph
    @param target the filter (s) to which the command should be sent
                  "all" sends to all filters
                  otherwise it can be a filter or filter instance name
                  which will send the command to all matching filters.
    @param cmd    the command to send, for handling simplicity all commands must be alphanumeric only
    @param arg    the argument for the command
    @param res    a buffer with size res_size where the filter (s) can return a response.

    @returns >=0 on success otherwise an error code.
                 AVERROR (ENOSYS) on unsupported commands
    ***********************************************************/
    [CCode (cname="avfilter_graph_send_command",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_graph_send_command (
        LibAVFilter.FilterGraph? graph,
        string target,
        string cmd,
        string arg,
        string res,
        int res_len,
        int flags
    );

    /***********************************************************
    Queue a command for one or more filter instances.

    @param graph  the filter graph
    @param target the filter (s) to which the command should be sent
                  "all" sends to all filters
                  otherwise it can be a filter or filter instance name
                  which will send the command to all matching filters.
    @param cmd    the command to sent, for handling simplicity all commands must be alphanumeric only
    @param arg    the argument for the command
    @param ts     time at which the command should be sent to the filter

    @note As this executes commands after this function returns, no return code
          from the filter is provided, also LibAVFilter.FilterCommandFlags.ONE is not supported.
    ***********************************************************/
    [CCode (cname="avfilter_graph_queue_command",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_graph_queue_command (
        LibAVFilter.FilterGraph? graph,
        string target,
        string cmd,
        string arg,
        LibAVFilter.FilterCommandFlags flags,
        double ts
    );


    /***********************************************************
    Dump a graph into a human-readable string representation.

    @param graph    the graph to dump
    @param options  formatting options; currently ignored
    @return  a string, or NULL in case of memory allocation failure;
             the string must be freed using av_free
    ***********************************************************/
    [CCode (cname="avfilter_graph_dump",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public string avfilter_graph_dump (
        LibAVFilter.FilterGraph? graph,
        string options
    );

    /***********************************************************
    Request a frame on the oldest sink link.

    If the request returns LibAVUtil.ErrorCode.END_OF_FILE, try the next.

    Note that this function is not meant to be the sole scheduling mechanism
    of a filtergraph, only a convenience function to help drain a filtergraph
    in a balanced way under normal circumstances.

    Also note that LibAVUtil.ErrorCode.END_OF_FILE does not mean that frames did not arrive on
    some of the sinks during the process.
    When there are multiple sink links, in case the requested link
    returns an EOF, this may cause a filter to flush pending frames
    which are sent to another sink link, although unrequested.

    @return  the return value of ff_request_frame (),
             or LibAVUtil.ErrorCode.END_OF_FILE if all links returned LibAVUtil.ErrorCode.END_OF_FILE
    ***********************************************************/
    [CCode (cname="avfilter_graph_request_oldest",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_graph_request_oldest (
        LibAVFilter.FilterGraph? graph
    );

}

/***********************************************************
@}
***********************************************************/

} // namespace LibAVFilter





















typedef struct LibAVFilter.FilterGraph {
    const LibAVUtil.Class *av_class;
    LibAVFilter.FilterContext[] filters;
    unsigned nb_filters;

    char *scale_sws_opts; ///< sws options to use for the auto-inserted scale filters

    /***********************************************************
    Type of multithreading allowed for filters in this graph. A combination
    of LibAVFilter.FilterThreadSliceFlags flags.
     *
    May be set by the caller at any point, the setting will apply to all
    filters initialized after that. The default is allowing everything.
     *
    When a filter in this graph is initialized, this field is combined using
    bit AND with LibAVFilter.FilterContext.thread_type to get the final mask used for
    determining allowed threading types. I.e. a threading type needs to be
    set in both to be allowed.
    ***********************************************************/
    int thread_type;

    /***********************************************************
    Maximum number of threads used by filters in this graph. May be set by
    the caller before adding any filters to the filtergraph. Zero (the
    default) means that the number of threads is determined automatically.
    ***********************************************************/
    int nb_threads;

    /***********************************************************
    Opaque user data. May be set by the caller to an arbitrary value, e.g. to
    be used from callbacks like @ref LibAVFilter.FilterGraph.execute.
    Libavfilter will not touch this field in any way.
    ***********************************************************/
    void *opaque;

    /***********************************************************
    This callback may be set by the caller immediately after allocating the
    graph and before adding any filters to it, to provide a custom
    multithreading implementation.
     *
    If set, filters with slice threading capability will call this callback
    to execute multiple jobs in parallel.
     *
    If this field is left unset, libavfilter will use its internal
    implementation, which may or may not be multithreaded depending on the
    platform and build options.
    ***********************************************************/
    avfilter_execute_func *execute;

    char *aresample_swr_opts; ///< swr options to use for the auto-inserted aresample filters, Access ONLY through AVOptions

    /***********************************************************
    Sets the maximum number of buffered frames in the filtergraph combined.
     *
    Zero means no limit. This field must be set before calling
    avfilter_graph_config().
    ***********************************************************/
    unsigned max_buffered_frames;
} LibAVFilter.FilterGraph;

/***********************************************************
Allocate a filter graph.

@return the allocated filter graph on success or NULL.
***********************************************************/
LibAVFilter.FilterGraph *avfilter_graph_alloc(void);

/***********************************************************
Create a new filter instance in a filter graph.

@param graph graph in which the new filter will be used
@param filter the filter to create an instance of
@param name Name to give to the new instance (will be copied to
            LibAVFilter.FilterContext.name). This may be used by the caller to identify
            different filters, libavfilter itself assigns no semantics to
            this parameter. May be NULL.

@return the context of the newly created filter instance (note that it is
        also retrievable directly through LibAVFilter.FilterGraph.filters or with
        avfilter_graph_get_filter()) on success or NULL on failure.
***********************************************************/
LibAVFilter.FilterContext *avfilter_graph_alloc_filter(LibAVFilter.FilterGraph *graph,
                                             const LibAVFilter.Filter *filter,
                                             const char *name);

/***********************************************************
Get a filter instance identified by instance name from graph.

@param graph filter graph to search through.
@param name filter instance name (should be unique in the graph).
@return the pointer to the found filter instance or NULL if it
cannot be found.
***********************************************************/
LibAVFilter.FilterContext *avfilter_graph_get_filter(LibAVFilter.FilterGraph *graph, const char *name);


















/***********************************************************
Parse a textual filtergraph description into an intermediate form.

This intermediate representation is intended to be modified by the caller as
described in the documentation of LibAVFilter.FilterGraphSegment and its children, and
then applied to the graph either manually or with other
avfilter_graph_segment_*() functions. See the documentation for
avfilter_graph_segment_apply() for the canonical way to apply
LibAVFilter.FilterGraphSegment.

@param graph Filter graph the parsed segment is associated with. Will only be
             used for logging and similar auxiliary purposes. The graph will
             not be actually modified by this function - the parsing results
             are instead stored in seg for further processing.
@param graph_str a string describing the filtergraph segment
@param flags reserved for future use, caller must set to 0 for now
@param seg A pointer to the newly-created LibAVFilter.FilterGraphSegment is written
           here on success. The graph segment is owned by the caller and must
           be freed with avfilter_graph_segment_free() before graph itself is
           freed.

@retval "non-negative number" success
@retval "negative error code" failure
 */
int avfilter_graph_segment_parse(LibAVFilter.FilterGraph *graph, const char *graph_str,
                                 int flags, LibAVFilter.FilterGraphSegment **seg);

/***********************************************************
Send a command to one or more filter instances.

@param graph  the filter graph
@param target the filter(s) to which the command should be sent
              "all" sends to all filters
              otherwise it can be a filter or filter instance name
              which will send the command to all matching filters.
@param cmd    the command to send, for handling simplicity all commands must be alphanumeric only
@param arg    the argument for the command
@param res    a buffer with size res_size where the filter(s) can return a response.

@returns >=0 on success otherwise an error code.
             AVERROR(ENOSYS) on unsupported commands
 */
int avfilter_graph_send_command(LibAVFilter.FilterGraph *graph, const char *target, const char *cmd, const char *arg, char *res, int res_len, int flags);

/***********************************************************
Queue a command for one or more filter instances.

@param graph  the filter graph
@param target the filter(s) to which the command should be sent
              "all" sends to all filters
              otherwise it can be a filter or filter instance name
              which will send the command to all matching filters.
@param cmd    the command to sent, for handling simplicity all commands must be alphanumeric only
@param arg    the argument for the command
@param ts     time at which the command should be sent to the filter

@note As this executes commands after this function returns, no return code
      from the filter is provided, also AVFILTER_CMD_FLAG_ONE is not supported.
***********************************************************/
int avfilter_graph_queue_command(LibAVFilter.FilterGraph *graph, const char *target, const char *cmd, const char *arg, int flags, double ts);


/***********************************************************
Dump a graph into a human-readable string representation.

@param graph    the graph to dump
@param options  formatting options; currently ignored
@return  a string, or NULL in case of memory allocation failure;
         the string must be freed using av_free
 */
char *avfilter_graph_dump(LibAVFilter.FilterGraph *graph, const char *options);

/***********************************************************
Request a frame on the oldest sink link.

If the request returns AVERROR_EOF, try the next.

Note that this function is not meant to be the sole scheduling mechanism
of a filtergraph, only a convenience function to help drain a filtergraph
in a balanced way under normal circumstances.

Also note that AVERROR_EOF does not mean that frames did not arrive on
some of the sinks during the process.
When there are multiple sink links, in case the requested link
returns an EOF, this may cause a filter to flush pending frames
which are sent to another sink link, although unrequested.

@return  the return value of ff_request_frame(),
         or AVERROR_EOF if all links returned AVERROR_EOF
 */
int avfilter_graph_request_oldest (
    LibAVFilter.FilterGraph *graph
);

} // namespace LibAVFilter
