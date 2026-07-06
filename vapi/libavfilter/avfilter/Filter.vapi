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
Filter definition. This defines the pads a filter contains, and all the
callback functions used to interact with the filter.
***********************************************************/
[CCode (cname="struct AVFilter",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
[Compact]
public class LibAVFilter.Filter {
    /***********************************************************
    Filter name. Must be non-NULL and unique among filters.
    ***********************************************************/
    [CCode (cname="name")]
    public string name;

    /***********************************************************
    A description of the filter. May be NULL.

    You should use the NULL_IF_CONFIG_SMALL () macro to define it.
    ***********************************************************/
    [CCode (cname="description")]
    public string description;

    /***********************************************************
    List of inputs, terminated by a zeroed element.

    NULL if there are no (static) inputs. Instances of filters with
    LibAVFilter.FilterFlags.DYNAMIC_INPUTS set may have more inputs than present in
    this list.
    ***********************************************************/
    [CCode (cname="inputs")]
    public LibAVFilter.FilterPad[] inputs;

    /***********************************************************
    List of outputs, terminated by a zeroed element.

    NULL if there are no (static) outputs. Instances of filters with
    LibAVFilter.FilterFlags.DYNAMIC_OUTPUTS set may have more outputs than present in
    this list.
    ***********************************************************/
    [CCode (cname="outputs")]
    public LibAVFilter.FilterPad[] outputs;

    /***********************************************************
    A class for the private data, used to declare filter private AVOptions.
    This field is NULL for filters that do not declare any options.

    If this field is non-NULL, the first member of the filter private data
    must be a pointer to LibAVUtil.Log.Class, which will be set by libavfilter generic
    code to this class.
    ***********************************************************/
    [CCode (cname="priv_class")]
    public LibAVUtil.Log.Class priv_class;

    /***********************************************************
    A combination of LibAVFilter.FilterFlags
    ***********************************************************/
    [CCode (cname="flags")]
    public LibAVFilter.FilterFlags flags;

    /*****************************************************************
    All fields below this line are not part of the public API. They
    may not be used outside of libavfilter and can be changed and
    removed at will.
    New public fields should be added right above.
    ***********************************************************/

    public delegate int PreinitDelegate (
        LibAVFilter.FilterContext? av_filter_context
    );

    /***********************************************************
    Filter pre-initialization function

    This callback will be called immediately after the filter context is
    allocated, to allow allocating and initing sub-objects.

    If this callback is not NULL, the uninit callback will be called on
    allocation failure.

    @return 0 on success,
            AVERROR code on failure (but the code will be
              dropped and treated as ENOMEM by the calling code)
    ***********************************************************/
    [CCode (cname="preinit")]
    public PreinitDelegate preinit;

    public delegate int InitDelegate (
        LibAVFilter.FilterContext? av_filter_context
    );

    /***********************************************************
    Filter initialization function.

    This callback will be called only once during the filter lifetime, after
    all the options have been set, but before links between filters are
    established and format negotiation is done.

    Basic filter initialization should be done here. Filters with dynamic
    inputs and/or outputs should create those inputs/outputs here based on
    provided options. No more changes to this filter's inputs/outputs can be
    done after this callback.

    This callback must not assume that the filter links exist or frame
    parameters are known.

    @ref LibAVFilter.Filter.uninit "uninit" is guaranteed to be called even if
        initialization fails, so this callback does not have to clean up on
        failure.

    @return 0 on success, a negative AVERROR on failure
    ***********************************************************/
    [CCode (cname="init")]
    public InitDelegate init;

    public delegate int InitDictDelegate (
        LibAVFilter.FilterContext? av_filter_context,
        ref LibAVUtil.Dictionary? options
    );

    /***********************************************************
    Should be set instead of @ref LibAVFilter.Filter.init "init" by the filters that
    want to pass a dictionary of AVOptions to nested contexts that are
    allocated during init.

    On return, the options dict should be freed and replaced with one that
    contains all the options which could not be processed by this filter (or
    with NULL if all the options were processed).

    Otherwise the semantics is the same as for @ref LibAVFilter.Filter.init "init".
    ***********************************************************/
    [CCode (cname="init_dict")]
    public InitDictDelegate init_dict;

    public delegate void UninitDelegate (
        LibAVFilter.FilterContext? av_filter_context
    );

    /***********************************************************
    Filter uninitialization function.

    Called only once right before the filter is freed. Should deallocate any
    memory held by the filter, release any buffer references, etc. It does
    not need to deallocate the LibAVFilter.FilterContext.priv memory itself.

    This callback may be called even if @ref LibAVFilter.Filter.init "init" was not
    called or failed, so it must be prepared to handle such a situation.
    ***********************************************************/
    [CCode (cname="uninit")]
    public UninitDelegate uninit;

    public delegate int QueryFormatsDelegate (
        LibAVFilter.FilterContext? av_filter_context
    );

    /***********************************************************
    Query formats supported by the filter on its inputs and outputs.

    This callback is called after the filter is initialized (so the inputs
    and outputs are fixed), shortly before the format negotiation. This
    callback may be called more than once.

    This callback must set LibAVFilter.FilterLink.out_formats on every input link and
    LibAVFilter.FilterLink.in_formats on every output link to a list of pixel/sample
    formats that the filter supports on that link. For audio links, this
    filter must also set @ref LibAVFilter.FilterLink.in_samplerates "in_samplerates" /

    @ref LibAVFilter.FilterLink.out_samplerates "out_samplerates" and
    @ref LibAVFilter.FilterLink.in_channel_layouts "in_channel_layouts" /
    @ref LibAVFilter.FilterLink.out_channel_layouts "out_channel_layouts" analogously.

    This callback may be NULL for filters with one input, in which case
    libavfilter assumes that it supports all input formats and preserves
    them on output.

    @return zero on success, a negative value corresponding to an
        AVERROR code otherwise
    ***********************************************************/
    [CCode (cname="query_formats")]
    public QueryFormatsDelegate query_formats;

    /***********************************************************
    size of private data to allocate for the filter
    ***********************************************************/
    [CCode (cname="priv_size")]
    public int priv_size;

    /***********************************************************
    Additional flags for avfilter internal use only.
    ***********************************************************/
    [CCode (cname="flags_internal")]
    public int flags_internal;

    /***********************************************************
    Used by the filter registration system. Must not be touched by any other code.
    ***********************************************************/
    [CCode (cname="next")]
    public LibAVFilter.Filter next;

    public delegate int ProcessCommandDelegate (
        LibAVFilter.FilterContext? av_filter_context,
        string cmd,
        string arg,
        string res,
        int res_len,
        LibAVFilter.FilterCommandFlags flags
    );

    /***********************************************************
    Make the filter instance process a command.

    @param cmd    the command to process, for handling simplicity all commands must be alphanumeric only
    @param arg    the argument for the command
    @param res    a buffer with size res_size where the filter (s) can return a response. This must not change when the command is not supported.
    @param flags  if LibAVFilter.FilterCommandFlags.FAST is set and the command would be
                  time consuming then a filter should treat it like an unsupported command

    @returns >=0 on success otherwise an error code.
             AVERROR (ENOSYS) on unsupported commands
    ***********************************************************/
    [CCode (cname="process_command")]
    public ProcessCommandDelegate process_command;

    public delegate int InitOpaqueDelegate (
        LibAVFilter.FilterContext? av_filter_context,
        void *opaque
    );

    /***********************************************************
    Filter initialization function, alternative to the init ()
    callback. Args contains the user-supplied parameters, opaque is
    used for providing binary data.
    ***********************************************************/
    [CCode (cname="init_opaque")]
    public InitOpaqueDelegate init_opaque;

    public delegate int ActivateDelegate (
        LibAVFilter.FilterContext? av_filter_context
    );

    /***********************************************************
    Filter activation function.

    Called when any processing is needed from the filter, instead of any
    filter_frame and request_frame on pads.

    The function must examine inlinks and outlinks and perform a single
    step of processing. If there is nothing to do, the function must do
    nothing and not return an error. If more steps are or may be
    possible, it must use ff_filter_set_ready () to schedule another
    activation.
    ***********************************************************/
    [CCode (cname="activate")]
    public ActivateDelegate? activate;


    /***********************************************************
    Return the LibAVFilter.Version.INT constant.
    ***********************************************************/
    [CCode (cname="avfilter_version",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public uint avfilter_version ();

    /***********************************************************
    Return the libavfilter build-time configuration.
    ***********************************************************/
    [CCode (cname="avfilter_configuration",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public string avfilter_configuration ();

    /***********************************************************
    Return the libavfilter license.
    ***********************************************************/
    [CCode (cname="avfilter_license",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public string avfilter_license ();

    /***********************************************************
    Get the number of elements in an LibAVFilter.Filter's inputs or outputs array.
    ***********************************************************/
    [CCode (cname="avfilter_filter_pad_count",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public uint avfilter_filter_pad_count (
        LibAVFilter.Filter? filter,
        bool is_output
    );

    /***********************************************************
    Iterate over all registered filters.

    @param opaque a pointer where libavfilter will store the iteration state. Must
                  point to NULL to start the iteration.

    @return the next registered filter or NULL when the iteration is
            finished
    ***********************************************************/
    [CCode (cname="av_filter_iterate",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public LibAVFilter.Filter? av_filter_iterate (
        void **opaque
    );

    /***********************************************************
    Get a filter definition matching the given name.

    @param name the filter name to find
    @return     the filter definition, if any matching one is registered.
                NULL if none found.
    ***********************************************************/
    [CCode (cname="avfilter_get_by_name",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public LibAVFilter.Filter? avfilter_get_by_name (
        string name
    );

}

/***********************************************************
@}
***********************************************************/

} // namespace LibAVFilter
