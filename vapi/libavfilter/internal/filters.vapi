/***********************************************************
Filters implementation helper functions

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with FFmpeg; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/
namespace LibAVFilter {

/***********************************************************
Filters implementation helper functions
***********************************************************/

[CCode (cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public enum FilterError {
    /***********************************************************
    Special return code when activate () did not do anything.
    ***********************************************************/
    [CCode (cname="FFERROR_NOT_READY")]
    NOT_READY;
    //  FFERRTAG (
    //      'N',
    //      'R',
    //      'D',
    //      'Y'
    //  );

}

/***********************************************************
Mark a filter ready and schedule it for activation.

This is automatically done when something happens to the filter (queued
frame, status change, request on output).
Filters implementing the activate callback can call it directly to
perform one more round of processing later.
It is also useful for filters reacting to external or asynchronous
events.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public void ff_filter_set_ready (
    LibAVFilter.FilterContext? filter,
    uint priority
);

/***********************************************************
Process the commands queued in the link up to the time of the frame.
Commands will trigger the process_command () callback.
@return  >= 0 or AVERROR code.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public int ff_inlink_process_commands (
    LibAVFilter.FilterLink? link,
    LibAVFormat.Frame? frame
);

/***********************************************************
Evaluate the timeline expression of the link for the time and properties
of the frame.
@return  >0 if enabled, 0 if disabled
@note  It does not update link->dst->is_disabled.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public int ff_inlink_evaluate_timeline_at_frame (
    LibAVFilter.FilterLink? link,
    LibAVFormat.Frame? frame
);

/***********************************************************
Get the number of frames available on the link.
@return the number of frames available in the link fifo.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public size_t ff_inlink_queued_frames (
    LibAVFilter.FilterLink? link
);

/***********************************************************
Test if a frame is available on the link.
@return  >0 if a frame is available
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public int ff_inlink_check_available_frame (
    LibAVFilter.FilterLink? link
);


/***********************************************************
Get the number of samples available on the link.

@return the numer of samples available on the link.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public int ff_inlink_queued_samples (
    LibAVFilter.FilterLink? link
);

/***********************************************************
Test if enough samples are available on the link.
@return  >0 if enough samples are available
@note  on EOF and error, min becomes 1
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public int ff_inlink_check_available_samples (
    LibAVFilter.FilterLink? link,
    uint min
);

/***********************************************************
Take a frame from the link's FIFO and update the link's stats.

If ff_inlink_check_available_frame () was previously called, the
preferred way of expressing it is "av_assert1 (ret);" immediately after
ff_inlink_consume_frame (). Negative error codes must still be checked.

@note  May trigger process_command () and/or update is_disabled.
@return  >0 if a frame is available,
         0 and set rframe to NULL if no frame available,
         or AVERROR code
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public int ff_inlink_consume_frame (
    LibAVFilter.FilterLink? link,
    out LibAVFormat.Frame[] rframe
);

/***********************************************************
Take samples from the link's FIFO and update the link's stats.

If ff_inlink_check_available_samples () was previously called, the
preferred way of expressing it is "av_assert1 (ret);" immediately after
ff_inlink_consume_samples (). Negative error codes must still be checked.

@note  May trigger process_command () and/or update is_disabled.
@return  >0 if a frame is available,
         0 and set rframe to NULL if no frame available,
         or AVERROR code
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public int ff_inlink_consume_samples (
    LibAVFilter.FilterLink? link,
    uint min,
    uint max,
    LibAVFormat.Frame? rframe
);

/***********************************************************
Access a frame in the link fifo without consuming it.
The first frame is numbered 0; the designated frame must exist.
@return the frame at idx position in the link fifo.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public LibAVFormat.Frame? ff_inlink_peek_frame (
    LibAVFilter.FilterLink? link,
    size_t idx
);

/***********************************************************
Make sure a frame is writable.
This is similar to av_frame_make_writable () except it uses the link's
buffer allocation callback, and therefore allows direct rendering.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public int ff_inlink_make_frame_writable (
    LibAVFilter.FilterLink? link,
    out LibAVFormat.Frame[] rframe
);

/***********************************************************
Test and acknowledge the change of status on the link.

Status means EOF or an error condition; a change from the normal (0)
status to a non-zero status can be queued in a filter's input link, it
becomes relevant after the frames queued in the link's FIFO are
processed. This function tests if frames are still queued and if a queued
status change has not yet been processed. In that case it performs basic
treatment (updating the link's timestamp) and returns a positive value to
let the filter do its own treatments (flushing...).

Filters implementing the activate callback should call this function when
they think it might succeed (usually after checking unsuccessfully for a
queued frame).
Filters implementing the filter_frame and request_frame callbacks do not
need to call that since the same treatment happens in ff_filter_frame ().

@param[out] rstatus  new or current status
@param[out] rpts     current timestamp of the link in link time base
@return  >0 if status changed, <0 if status already acked, 0 otherwise
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public int ff_inlink_acknowledge_status (
    LibAVFilter.FilterLink? link,
    out int rstatus,
    int64[] rpts
);

/***********************************************************
Mark that a frame is wanted on the link.
Unlike ff_filter_frame (), it must not be called when the link has a
non-zero status, and thus does not acknowledge it.
Also it cannot fail.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public void ff_inlink_request_frame (
    LibAVFilter.FilterLink? link
);

/***********************************************************
Set the status on an input link.
Also discard all frames in the link's FIFO.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public void ff_inlink_set_status (
    LibAVFilter.FilterLink? link,
    int status
);

/***********************************************************
Test if a frame is wanted on an output link.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public static inline int ff_outlink_frame_wanted (
    LibAVFilter.FilterLink? link
);
//  {
//      return link->frame_wanted_out;
//  }

/***********************************************************
Get the status on an output link.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public int ff_outlink_get_status (
    LibAVFilter.FilterLink? link
);

/***********************************************************
Set the status field of a link from the source filter.
The pts should reflect the timestamp of the status change,
in link time base and relative to the frames timeline.
In particular, for LibAVUtil.ErrorCode.END_OF_FILE, it should reflect the
end time of the last frame.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public static inline void ff_outlink_set_status (
    LibAVFilter.FilterLink? link,
    int status,
    int64 pts
);
//  {
//      ff_avfilter_link_set_in_status (
//          link,
//          status,
//          pts
//      );
//  }

/***********************************************************
Forward the status on an output link to an input link.
If the status is set, it will discard all queued frames and this macro
will return immediately.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public define FF_FILTER_FORWARD_STATUS_BACK (
    void *outlink,
    void *inlink
);
//  {
//      int ret = ff_outlink_get_status (outlink);
//      if (ret) {
//          ff_inlink_set_status (inlink, ret);
//          return 0;
//      }
//  }

/***********************************************************
Forward the status on an output link to all input links.
If the status is set, it will discard all queued frames and this macro
will return immediately.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public define FF_FILTER_FORWARD_STATUS_BACK_ALL (
    void *outlink,
    void *filter
);
//  {
//      int ret = ff_outlink_get_status (outlink);
//      if (ret) {
//          uint i;
//          for (i = 0; i < filter->nb_inputs; i++)
//              ff_inlink_set_status (filter->inputs[i], ret);
//          return 0;
//      }
//  }

/***********************************************************
Acknowledge the status on an input link and forward it to an output link.
If the status is set, this macro will return immediately.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public define FF_FILTER_FORWARD_STATUS (
    void *inlink,
    void *outlink
);
//  {
//      int status;
//      int64 pts;
//      if (ff_inlink_acknowledge_status (inlink, &status, &pts)) {
//          ff_outlink_set_status (outlink, status, pts);
//          return 0;
//      }
//  }

/***********************************************************
Acknowledge the status on an input link and forward it to an output link.
If the status is set, this macro will return immediately.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public define FF_FILTER_FORWARD_STATUS_ALL (
    void *inlink,
    void *filter
);
//  {
//      int status;
//      int64 pts;
//      if (ff_inlink_acknowledge_status (inlink, &status, &pts)) {
//          uint i;
//          for (i = 0; i < filter->nb_outputs; i++)
//              ff_outlink_set_status (filter->outputs[i], status, pts);
//          return 0;
//      }
//  }

/***********************************************************
Forward the frame_wanted_out flag from an output link to an input link.
If the flag is set, this macro will return immediately.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/filters.h")]
public define FF_FILTER_FORWARD_WANTED (
    void *outlink,
    void *inlink
);
//  {
//      if (ff_outlink_frame_wanted (outlink)) {
//          ff_inlink_request_frame (inlink);
//          return 0;
//      }
//  }

} // namespace LibAVFilter
