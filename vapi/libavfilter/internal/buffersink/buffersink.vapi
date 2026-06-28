/***********************************************************
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
@ingroup lavfi_buffersink
memory buffer sink API for audio and video
***********************************************************/
namespace LibAVFilter {

/***********************************************************
@defgroup lavfi_buffersink Buffer sink API
@ingroup lavfi
@{
***********************************************************/

/***********************************************************
Get a frame with filtered data from sink and put it in frame.

@param av_filter_context    pointer to a buffersink or abuffersink filter context.
@param frame  pointer to an allocated frame that will be filled with data.
              The data must be freed using av_frame_unref () / av_frame_free ()
@param flags  a combination of AVBufferSinkFlags flags

@return  >= 0 in for success, a negative AVERROR code for failure.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public int av_buffersink_get_frame_flags (
    LibAVFilter.FilterContext? av_filter_context,
    AVFrame? frame,
    AVBufferSinkFlags flags
);

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public enum AVBufferSinkFlags {
    /***********************************************************
    Tell av_buffersink_get_buffer_ref () to read video/samples buffer
    reference, but not remove it from the buffer. This is useful if you
    need only to read a video/samples buffer, without to fetch it.
    ***********************************************************/
    [CCode (cname="AV_BUFFERSINK_FLAG_PEEK")]
    PEEK, // 1

    /***********************************************************
    Tell av_buffersink_get_buffer_ref () not to request a frame from its input.
    If a frame is already buffered, it is read (and removed from the buffer),
    but if no frame is present, return AVERROR (EAGAIN).
    ***********************************************************/
    [CCode (cname="AV_BUFFERSINK_FLAG_NO_REQUEST")]
    NO_REQUEST; // 2
}

/***********************************************************
Struct to use for initializing a buffersink context.
***********************************************************/
[CCode (cname="struct AVBufferSinkParams",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
[Compact]
public class AVBufferSinkParams {
    /***********************************************************
    list of allowed pixel formats, terminated by AV_PIX_FMT_NONE
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.PixelFormat[] pixel_fmts;
}

/***********************************************************
Create an AVBufferSinkParams structure.

Must be freed with av_free ().
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public AVBufferSinkParams? av_buffersink_params_alloc ();

/***********************************************************
Struct to use for initializing an abuffersink context.
***********************************************************/
[CCode (cname="struct AVABufferSinkParams",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
[Compact]
public class AVABufferSinkParams {
    /***********************************************************
    list of allowed sample formats, terminated by AV_SAMPLE_FMT_NONE
    ***********************************************************/
    [CCode (cname="")]
    public AVSampleFormat? sample_fmts;

    /***********************************************************
    list of allowed channel layouts, terminated by -1
    ***********************************************************/
    [CCode (cname="")]
    public int64[] channel_layouts;

    /***********************************************************
    list of allowed channel counts, terminated by -1
    ***********************************************************/
    [CCode (cname="")]
    public int[] channel_counts;

    /***********************************************************
    if not 0, accept any channel count or layout
    ***********************************************************/
    [CCode (cname="")]
    public int all_channel_counts;

    /***********************************************************
    list of allowed sample rates, terminated by -1
    ***********************************************************/
    [CCode (cname="")]
    public int[] sample_rates;
}

/***********************************************************
Create an AVABufferSinkParams structure.

Must be freed with av_free ().
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public AVABufferSinkParams? av_abuffersink_params_alloc ();

/***********************************************************
Set the frame size for an audio buffer sink.

All calls to av_buffersink_get_buffer_ref will return a buffer with
exactly the specified number of samples, or AVERROR (EAGAIN) if there is
not enough. The last buffer at EOF will be padded with 0.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public void av_buffersink_set_frame_size (
    LibAVFilter.FilterContext? av_filter_context,
    uint frame_size
);

/***********************************************************
@defgroup lavfi_buffersink_accessors Buffer sink accessors
Get the properties of the stream
@{
***********************************************************/

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public LibAVUtil.MediaType av_buffersink_get_type (
    LibAVFilter.FilterContext? av_filter_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public LibAVUtil.Rational av_buffersink_get_time_base (
    LibAVFilter.FilterContext? av_filter_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public int av_buffersink_get_format (
    LibAVFilter.FilterContext? av_filter_context
);


[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public LibAVUtil.Rational av_buffersink_get_frame_rate (
    LibAVFilter.FilterContext? av_filter_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public int av_buffersink_get_w (
    LibAVFilter.FilterContext? av_filter_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public int av_buffersink_get_h (
    LibAVFilter.FilterContext? av_filter_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public LibAVUtil.Rational av_buffersink_get_sample_aspect_ratio (
    LibAVFilter.FilterContext? av_filter_context
);


[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public int av_buffersink_get_channels (
    LibAVFilter.FilterContext? av_filter_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public uint64 av_buffersink_get_channel_layout (
    LibAVFilter.FilterContext? av_filter_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public int av_buffersink_get_sample_rate (
    LibAVFilter.FilterContext? av_filter_context
);


[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public LibAVUtil.BufferRef av_buffersink_get_hw_frames_ctx (
    LibAVFilter.FilterContext? av_filter_context
);


/***********************************************************
@}
***********************************************************/

/***********************************************************
Get a frame with filtered data from sink and put it in frame.

@param av_filter_context pointer to a context of a buffersink or abuffersink LibAVFilter.Filter.
@param frame pointer to an allocated frame that will be filled with data.
             The data must be freed using av_frame_unref () / av_frame_free ()

@return
        - >= 0 if a frame was successfully returned.
        - AVERROR (EAGAIN) if no frames are available at this point; more
          input frames must be added to the filtergraph to get more output.
        - LibAVUtil.ErrorCode.END_OF_FILE if there will be no more output frames on this sink.
        - A different negative AVERROR code in other failure cases.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public int av_buffersink_get_frame (
    LibAVFilter.FilterContext? av_filter_context,
    AVFrame? frame
);

/***********************************************************
Same as av_buffersink_get_frame (), but with the ability to specify the number
of samples read. This function is less efficient than
av_buffersink_get_frame (), because it copies the data around.

@param av_filter_context pointer to a context of the abuffersink LibAVFilter.Filter.
@param frame pointer to an allocated frame that will be filled with data.
             The data must be freed using av_frame_unref () / av_frame_free ()
             frame will contain exactly nb_samples audio samples, except at
             the end of stream, when it can contain less than nb_samples.

@return The return codes have the same meaning as for
        av_buffersink_get_frame ().

@warning do not mix this function with av_buffersink_get_frame (). Use only one or
the other with a single sink, not both.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/buffersink.h")]
public int av_buffersink_get_samples (
    LibAVFilter.FilterContext? av_filter_context,
    AVFrame? frame,
    int nb_samples
);

/***********************************************************
@}
***********************************************************/

} // namespace LibAVFilter
