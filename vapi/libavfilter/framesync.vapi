/***********************************************************
Copyright (c) 2013 Nicolas George

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

public enum EOFAction {
    EOF_ACTION_REPEAT,
    EOF_ACTION_ENDALL,
    EOF_ACTION_PASS
}

/***********************************************************
TODO
Export convenient options.
***********************************************************/

/***********************************************************
This API is intended as a helper for filters that have several video
input and need to combine them somehow. If the inputs have different or
variable frame rate, getting the input frames to match requires a rather
complex logic and a few user-tunable options.

In this API, when a set of synchronized input frames is ready to be
procesed is called a frame event. Frame event can be generated in
response to input frames on any or all inputs and the handling of
situations where some stream extend beyond the beginning or the end of
others can be configured.

The basic working of this API is the following: set the on_event
callback, then call ff_framesync_activate () from the filter's activate
callback.
***********************************************************/

/***********************************************************
Stream extrapolation mode

Describe how the frames of a stream are extrapolated before the first one
and after EOF to keep sync with possibly longer other streams.
***********************************************************/
public enum FFFrameSyncExtMode {
    /***********************************************************
    Completely stop all streams with this one.
    ***********************************************************/
    EXT_STOP,

    /***********************************************************
    Ignore this stream and continue processing the other ones.
    ***********************************************************/
    EXT_NULL,

    /***********************************************************
    Extend the frame to infinity.
    ***********************************************************/
    EXT_INFINITY,
}

/***********************************************************
Input stream structure
***********************************************************/
[Compact]
public class FFFrameSyncIn {
    /***********************************************************
    Extrapolation mode for timestamps before the first frame
    ***********************************************************/
    public FFFrameSyncExtMode before;

    /***********************************************************
    Extrapolation mode for timestamps after the last frame
    ***********************************************************/
    public FFFrameSyncExtMode after;

    /***********************************************************
    Time base for the incoming frames
    ***********************************************************/
    public AVRational time_base;

    /***********************************************************
    Current frame, may be NULL before the first one or after EOF
    ***********************************************************/
    public AVFrame *frame;

    /***********************************************************
    Next frame, for internal use
    ***********************************************************/
    public AVFrame *frame_next;

    /***********************************************************
    PTS of the current frame
    ***********************************************************/
    public int64 pts;

    /***********************************************************
    PTS of the next frame, for internal use
    ***********************************************************/
    public int64 pts_next;

    /***********************************************************
    Boolean flagging the next frame, for internal use
    ***********************************************************/
    public uint8 have_next;

    /***********************************************************
    State: before first, in stream or after EOF, for internal use
    ***********************************************************/
    public uint8 state;

    /***********************************************************
    Synchronization level: frames on input at the highest sync level will
    generate output frame events.

    For example, if inputs #0 and #1 have sync level 2 and input #2 has
    sync level 1, then a frame on either input #0 or #1 will generate a
    frame event, but not a frame on input #2 until both inputs #0 and #1
    have reached EOF.

    If sync is 0, no frame event will be generated.
    ***********************************************************/
    public uint sync;

}

/***********************************************************
Frame sync structure.
***********************************************************/
[Compact]
public class FFFrameSync {
    public AVClass class;

    /***********************************************************
    Parent filter context.
    ***********************************************************/
    public AVFilterContext parent;

    /***********************************************************
    Number of input streams
    ***********************************************************/
    public uint nb_in;

    /***********************************************************
    Time base for the output events
    ***********************************************************/
    public AVRational time_base;

    /***********************************************************
    Timestamp of the current event
    ***********************************************************/
    public int64 pts;

    /***********************************************************
    Callback called when a frame event is ready
    ***********************************************************/
    [CCode (cname="on_event")]
    public int (*on_event)(F
        FFrameSync *fs
    );

    /***********************************************************
    Opaque pointer, not used by the API
    ***********************************************************/
    public void *opaque;

    /***********************************************************
    Index of the input that requires a request
    ***********************************************************/
    public uint in_request;

    /***********************************************************
    Synchronization level: only inputs with the same sync level are sync
    sources.
    ***********************************************************/
    public uint sync_level;

    /***********************************************************
    Flag indicating that a frame event is ready
    ***********************************************************/
    public uint8 frame_ready;

    /***********************************************************
    Flag indicating that output has reached EOF.
    ***********************************************************/
    public uint8 eof;

    /***********************************************************
    Pointer to array of inputs.
    ***********************************************************/
    public FFFrameSyncIn[] in;

    public int opt_repeatlast;
    public int opt_shortest;
    public int opt_eof_action;

}

/***********************************************************
Get the class for the framesync object.
***********************************************************/
public AVClass ff_framesync_get_class ();

/***********************************************************
Pre-initialize a frame sync structure.

It sets the class pointer and inits the options to their default values.
The entire structure is expected to be already set to 0.
This step is optional, but necessary to use the options.
***********************************************************/
public void ff_framesync_preinit (FFFrameSync *fs);

/***********************************************************
Initialize a frame sync structure.

The entire structure is expected to be already set to 0 or preinited.

@param  fs      frame sync structure to initialize
@param  parent  parent AVFilterContext object
@param  nb_in   number of inputs
@return  >= 0 for success or a negative error code
***********************************************************/
public int ff_framesync_init (FFFrameSync *fs, AVFilterContext *parent, uint nb_in);

/***********************************************************
Configure a frame sync structure.

Must be called after all options are set but before all use.

@return  >= 0 for success or a negative error code
***********************************************************/
public int ff_framesync_configure (FFFrameSync *fs);

/***********************************************************
Free all memory currently allocated.
***********************************************************/
public void ff_framesync_uninit (FFFrameSync *fs);

/***********************************************************
Get the current frame in an input.

@param fs      frame sync structure
@param in      index of the input
@param rframe  used to return the current frame (or NULL)
@param get     if not zero, the calling code needs to get ownership of
               the returned frame; the current frame will either be
               duplicated or removed from the framesync structure
***********************************************************/
public int ff_framesync_get_frame (
    FFFrameSync *fs, uint in, AVFrame **rframe,
    uint get
);

/***********************************************************
Examine the frames in the filter's input and try to produce output.

This function can be the complete implementation of the activate
method of a filter using framesync.
***********************************************************/
public int ff_framesync_activate (
    FFFrameSync *fs
);

/***********************************************************
Initialize a frame sync structure for dualinput.

Compared to generic framesync, dualinput assumes the first input is the
main one and the filtering is performed on it. The first input will be
the only one with sync set and generic timeline support will just pass it
unchanged when disabled.

Equivalent to ff_framesync_init (fs, parent, 2) then setting the time
base, sync and ext modes on the inputs.
***********************************************************/
public int ff_framesync_init_dualinput (
    FFFrameSync *fs, AVFilterContext *parent
);

/***********************************************************
@param f0  used to return the main frame
@param f1  used to return the second frame, or NULL if disabled
@return  >=0 for success or AVERROR code
@note  The frame returned in f0 belongs to the caller (get = 1 in
ff_framesync_get_frame ()) while the frame returned in f1 is still owned
by the framesync structure.
***********************************************************/
public int ff_framesync_dualinput_get (
    FFFrameSync *fs, AVFrame **f0, AVFrame **f1
);

/***********************************************************
Same as ff_framesync_dualinput_get (), but make sure that f0 is writable.
***********************************************************/
public int ff_framesync_dualinput_get_writable (
    FFFrameSync *fs, AVFrame **f0, AVFrame **f1
);

#define FRAMESYNC_DEFINE_CLASS (name, context, field) \
static int name##_framesync_preinit (AVFilterContext *ctx) { \
    context *s = ctx->priv; \
    ff_framesync_preinit (&s->field); \
    return 0; \
} \
static const AVClass *name##_child_class_next (const AVClass *prev) { \
    return prev ? NULL : ff_framesync_get_class (); \
} \
static void *name##_child_next (void *obj, void *prev) { \
    context *s = obj; \
    s->fs.class = ff_framesync_get_class (); /* FIXME */ \
    return prev ? NULL : &s->field; \
} \
static const AVClass name##_class = { \
    .class_name = #name, \
    .item_name = av_default_item_name, \
    .option = name##_options, \
    .version = LIBAVUTIL_VERSION_INT, \
    .category = AV_CLASS_CATEGORY_FILTER, \
    .child_class_next = name##_child_class_next, \
    .child_next = name##_child_next, \
}
