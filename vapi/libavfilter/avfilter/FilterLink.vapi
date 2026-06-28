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
@brief A link between two filters. This contains pointers to the source and
destination filters between which this link exists, and the indexes of
the pads involved. In addition, this link also contains the parameters
which have been negotiated and agreed-upon between the filter, such as
image dimensions, format, etc.

Applications must not normally access the link structure directly.
Use the buffersrc and buffersink API instead.
In the future, access to the header may be reserved for filters
implementation.
***********************************************************/
[CCode (cname="struct AVFilterLink",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
[Compact]
public class LibAVFilter.FilterLink {
    /***********************************************************
    @brief source filter
    ***********************************************************/
    [CCode (cname="src")]
    public LibAVFilter.FilterContext? src;

    /***********************************************************
    @brief output pad on the source filter
    ***********************************************************/
    [CCode (cname="srcpad")]
    public LibAVFilter.FilterPad? srcpad;

    /***********************************************************
    @brief dest filter
    ***********************************************************/
    [CCode (cname="dst")]
    public LibAVFilter.FilterContext? dst;

    /***********************************************************
    @brief input pad on the dest filter
    ***********************************************************/
    [CCode (cname="dstpad")]
    public LibAVFilter.FilterPad? dstpad;

    /***********************************************************
    @brief filter media type
    ***********************************************************/
    [CCode (cname="type")]
    public LibAVUtil.MediaType type;

    /***********************************************************
    These parameters apply only to video
    ***********************************************************/
    /***********************************************************
    @brief agreed-upon image width
    ***********************************************************/
    [CCode (cname="w")]
    public int w;

    /***********************************************************
    @brief agreed-upon image height
    ***********************************************************/
    [CCode (cname="h")]
    public int h;

    /***********************************************************
    @brief agreed-upon sample aspect ratio
    ***********************************************************/
    [CCode (cname="sample_aspect_ratio")]
    public AVRational sample_aspect_ratio;

    /***********************************************************
    For non-YUV links, these are respectively set to fallback values (as
    appropriate for that colorspace).

    Note: This includes grayscale formats, as these are currently treated
    as forced full range always.
    ***********************************************************/
    /***********************************************************
    @brief agreed-upon YUV color space
    ***********************************************************/
    [CCode (cname="colorspace")]
    public LibAVUtil.ColorSpace colorspace;
    /***********************************************************
    @brief agreed-upon YUV color range
    ***********************************************************/
    [CCode (cname="color_range")]
    public LibAVUtil.ColorRange color_range;

    /***********************************************************
    These parameters apply only to audio
    ***********************************************************/
    /***********************************************************
    @brief channel layout of current buffer (see libavutil/channel_layout.h)
    ***********************************************************/
    [CCode (cname="ch_layout")]
    public uint64 channel_layout;

    /***********************************************************
    @brief samples per second
    ***********************************************************/
    [CCode (cname="sample_rate")]
    public int sample_rate;

    /***********************************************************
    @brief agreed-upon media format
    ***********************************************************/
    [CCode (cname="format")]
    public int format;

    /***********************************************************
    @brief Define the time base used by the PTS of the frames/samples
    which will pass through this link.
    During the configuration stage, each filter is supposed to
    change only the output timebase, while the timebase of the
    input link is assumed to be an unchangeable property.
    ***********************************************************/
    [CCode (cname="time_base")]
    public AVRational time_base;

    public AVFrameSideData[] side_data;
    public int nb_side_data;

    public AVAlphaMode alpha_mode; ///< alpha mode (for videos with an alpha channel)

    /*****************************************************************
    All fields below this line are not part of the public API. They
    may not be used outside of libavfilter and can be changed and
    removed at will.
    New public fields should be added right above.
    ***********************************************************/

    /***********************************************************
    Lists of supported formats / etc. supported by the input filter.
    ***********************************************************/
    [CCode (cname="incfg")]
    internal LibAVFilter.FilterFormatsConfig incfg;

    /***********************************************************
    Lists of supported formats / etc. supported by the output filter.
    ***********************************************************/
    [CCode (cname="outcfg")]
    internal LibAVFilter.FilterFormatsConfig outcfg;

    /*****************************************************************
    All fields below this line are not part of the public API. They
    may not be used outside of libavfilter and can be changed and
    removed at will.
    New public fields should be added right above.
    *****************************************************************
    ***********************************************************/
    /***********************************************************
    @brief Lists of formats and channel layouts supported by the input and output
    filters respectively. These lists are used for negotiating the format
    to actually be used, which will be loaded into the format and
    channel_layout members, above, when chosen.
    ***********************************************************/
    [CCode (cname="in_formats")]
    internal LibAVFilter.FilterFormats? in_formats;

    [CCode (cname="out_formats")]
    internal LibAVFilter.FilterFormats? out_formats;

    /***********************************************************
    @brief Lists of channel layouts and sample rates used for automatic
    negotiation.
    ***********************************************************/
    [CCode (cname="in_samplerates")]
    internal LibAVFilter.FilterFormats? in_samplerates;

    [CCode (cname="out_samplerates")]
    internal LibAVFilter.FilterFormats? out_samplerates;

    [CCode (cname="in_channel_layouts")]
    internal LibAVFilter.FilterChannelLayouts? in_channel_layouts;

    [CCode (cname="out_channel_layouts")]
    internal LibAVFilter.FilterChannelLayouts? out_channel_layouts;

    /***********************************************************
    Audio only, the destination filter sets this to a non-zero value to
    request that buffers with the given number of samples should be sent to
    it. LibAVFilter.FilterPad.needs_fifo must also be set on the corresponding input
    pad.
    Last buffer before EOF will be padded with silence.
    ***********************************************************/
    [CCode (cname="request_samples")]
    internal int request_samples;

    /***********************************************************
    stage of the initialization of the link properties (dimensions, etc)
    ***********************************************************/
    [CCode (cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    internal enum InitializationStage {
        /***********************************************************
        not started
        ***********************************************************/
        [CCode (cname="AVLINK_UNINIT")]
        UNINITIALIZED, // = 0

        /***********************************************************
        started, but incomplete
        ***********************************************************/
        [CCode (cname="AVLINK_STARTINIT")]
        STARTED_INITIALIZATION,

        /***********************************************************
        complete
        ***********************************************************/
        [CCode (cname="AVLINK_INIT")]
        INITIALIZED;
    }

    /***********************************************************
    stage of the initialization of the link properties (dimensions, etc)
    ***********************************************************/
    [CCode (cname="init_state")]
    internal InitializationStage init_state;

    /***********************************************************
    Graph the filter belongs to.
    ***********************************************************/
    [CCode (cname="graph")]
    internal LibAVFilter.FilterGraph? graph;

    /***********************************************************
    Current timestamp of the link, as defined by the most recent
    frame (s), in link time_base units.
    ***********************************************************/
    [CCode (cname="current_pts")]
    internal int64 current_pts;

    /***********************************************************
    Current timestamp of the link, as defined by the most recent
    frame (s), in AV_TIME_BASE units.
    ***********************************************************/
    [CCode (cname="current_pts_us")]
    internal int64 current_pts_us;

    /***********************************************************
    Index in the age array.
    ***********************************************************/
    [CCode (cname="age_index")]
    internal int age_index;

    /***********************************************************
    Frame rate of the stream on the link, or 1/0 if unknown or variable;
    if left to 0/0, will be automatically copied from the first input
    of the source filter if it exists.

    Sources should set it to the best estimation of the real frame rate.
    If the source frame rate is unknown or variable, set this to 1/0.
    Filters should update it if necessary depending on their function.
    Sinks can use it to set a default output frame rate.
    It is similar to the r_frame_rate field in LibAVFormat.Stream.
    ***********************************************************/
    [CCode (cname="frame_rate")]
    internal AVRational frame_rate;

    /***********************************************************
    Buffer partially filled with samples to achieve a fixed/minimum size.
    ***********************************************************/
    [CCode (cname="partial_buf")]
    internal AVFrame partial_buf;

    /***********************************************************
    Size of the partial buffer to allocate.
    Must be between min_samples and max_samples.
    ***********************************************************/
    [CCode (cname="partial_buf_size")]
    internal int partial_buf_size;

    /***********************************************************
    Minimum number of samples to filter at once. If filter_frame () is
    called with fewer samples, it will accumulate them in partial_buf.
    This field and the related ones must not be changed after filtering
    has started.
    If 0, all related fields are ignored.
    ***********************************************************/
    [CCode (cname="min_samples")]
    internal int min_samples;

    /***********************************************************
    Maximum number of samples to filter at once. If filter_frame () is
    called with more samples, it will split them.
    ***********************************************************/
    [CCode (cname="max_samples")]
    internal int max_samples;

    /***********************************************************
    Number of channels.
    ***********************************************************/
    [CCode (cname="channels")]
    internal int channels;

    /***********************************************************
    Link processing flags.
    ***********************************************************/
    [CCode (cname="flags")]
    internal uint flags;

    /***********************************************************
    Number of past frames sent through the link.
    ***********************************************************/
    [CCode (cname="frame_count_in")]
    internal int64 frame_count_in;

    /***********************************************************
    Number of past frames sent through the link.
    ***********************************************************/
    [CCode (cname="frame_count_out")]
    internal int64 frame_count_out;

    /***********************************************************
    A pointer to a FFFramePool struct.
    ***********************************************************/
    [CCode (cname="frame_pool")]
    internal void *frame_pool;

    /***********************************************************
    True if a frame is currently wanted on the output of this filter.
    Set when ff_request_frame () is called by the output,
    cleared when a frame is filtered.
    ***********************************************************/
    [CCode (cname="frame_wanted_out")]
    internal int frame_wanted_out;

    /***********************************************************
    For hwaccel pixel formats, this should be a reference to the
    AVHWFramesContext describing the frames.
    ***********************************************************/
    [CCode (cname="hw_frames_ctx")]
    internal AVBufferRef hw_frames_ctx;

#if !FF_INTERNAL_FIELDS

    /***********************************************************
    Internal structure members.
    The fields below this limit are internal for libavfilter's use
    and must in no way be accessed by applications.
    ***********************************************************/
    [CCode (cname="reserved")]
    internal char reserved[0xF000];

#else /* FF_INTERNAL_FIELDS */

    /***********************************************************
    Queue of frames waiting to be filtered.
    ***********************************************************/
    [CCode (cname="fifo")]
    internal FFFrameQueue fifo;

    /***********************************************************
    If set, the source filter can not generate a frame as is.
    The goal is to avoid repeatedly calling the request_frame () method on
    the same link.
    ***********************************************************/
    [CCode (cname="frame_blocked_in")]
    internal int frame_blocked_in;

    /***********************************************************
    Link input status.
    If not zero, all attempts of filter_frame will fail with the
    corresponding code.
    ***********************************************************/
    [CCode (cname="status_in")]
    internal int status_in;

    /***********************************************************
    Timestamp of the input status change.
    ***********************************************************/
    [CCode (cname="status_in_pts")]
    internal int64 status_in_pts;

    /***********************************************************
    Link output status.
    If not zero, all attempts of request_frame will fail with the
    corresponding code.
    ***********************************************************/
    [CCode (cname="status_out")]
    internal int status_out;

#endif // FF_INTERNAL_FIELDS

    /***********************************************************
    Get the hardware frames context of a filter link.

    @param link an LibAVFilter.FilterLink

    @return a ref-counted copy of the link's hw_frames_ctx field if there is
            a hardware frames context associated with the link or NULL otherwise.
            The returned AVBufferRef needs to be released with av_buffer_unref()
            when it is no longer used.
    ***********************************************************/
    [CCode (cname="avfilter_link_get_hw_frames_ctx",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public AVBufferRef? avfilter_link_get_hw_frames_ctx(
        LibAVFilter.FilterLink? link
    );

    /***********************************************************
    Free the link in? link, and set its pointer to NULL.
    ***********************************************************/
    [CCode (cname="avfilter_link_free",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public void avfilter_link_free (
        LibAVFilter.FilterLink **link
    );

    /***********************************************************
    Set the closed field of a link.
    @deprecated applications are not supposed to mess with links, they should
    close the sinks.
    ***********************************************************/
    [CCode (cname="avfilter_link_set_closed",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    //  attribute_deprecated
    public void avfilter_link_set_closed (
        LibAVFilter.FilterLink? link,
        int closed
    );

    /***********************************************************
    Insert a filter in the middle of an existing link.

    @param link the link into which the filter should be inserted
    @param filt the filter to be inserted
    @param filt_srcpad_idx the input pad on the filter to connect
    @param filt_dstpad_idx the output pad on the filter to connect
    @return     zero on success
    ***********************************************************/
    [CCode (cname="avfilter_insert_filter",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public int avfilter_insert_filter (
        LibAVFilter.FilterLink? link,
        LibAVFilter.FilterContext? filt,
        uint filt_srcpad_idx,
        uint filt_dstpad_idx
    );

}

/***********************************************************
@}
***********************************************************/

} // namespace LibAVFilter
