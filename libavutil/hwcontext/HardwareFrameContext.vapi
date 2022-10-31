/***********************************************************
@brief This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVUtil {

[CCode (cname="struct AVHWFramesInternal", cheader_filename="libavcodec/hwcontext.h")]
public struct HardwareFrameInternalContext { }

public delegate void HardwareFrameContextFreeDelegate (
    HardwareFrameContext hardware_frames_context
);

/***********************************************************
@brief This struct describes a set or pool of "hardware" frames (i.e. those with
data not located in normal system memory). All the frames in the pool are
assumed to be allocated in the same way and interchangeable.

This struct is reference-counted with the LibAVUtil.Buffer mechanism and tied to a
given HardwareDeviceContext instance. The av_hwframe_ctx_alloc () constructor
yields a reference, whose data field points to the actual HardwareFrameContext
struct.
***********************************************************/
[CCode (cname="struct AVHWFramesContext", cheader_filename="libavcodec/hwcontext.h")]
public struct HardwareFrameContext {
    /***********************************************************
    @brief A class for logging.
    ***********************************************************/
    [CCode (cname="av_class")]
    public Class av_class;

    /***********************************************************
    @brief Private data used internally by libavutil. Must not be accessed in any
    way by the caller.
    ***********************************************************/
    //  [CCode (cname="internal")]
    //  public HardwareFrameInternalContext internal;

    /***********************************************************
    @brief A reference to the parent HardwareDeviceContext. This reference is owned and
    managed by the enclosing HardwareFrameContext, but the caller may derive
    additional references from it.
    ***********************************************************/
    [CCode (cname="device_ref")]
    public LibAVUtil.BufferRef device_ref;

    /***********************************************************
    @brief The parent HardwareDeviceContext. This is simply a pointer to
    device_ref->data provided for convenience.

    Set by libavutil in av_hwframe_ctx_init ().
    ***********************************************************/
    [CCode (cname="device_ctx")]
    public HardwareDeviceContext hardware_device_context;

    /***********************************************************
    @brief The format-specific data, allocated and freed automatically along with
    this context.

    Should be cast by the user to the format-specific context defined in the
    corresponding header (hwframe_*.h) and filled as described in the
    documentation before calling av_hwframe_ctx_init ().

    After any frames using this context are created, the contents of this
    struct should not be modified by the caller.
    ***********************************************************/
    [CCode (cname="hwctx")]
    public void *hardware_context_data;

    /***********************************************************
    @brief This field may be set by the caller before calling av_hwframe_ctx_init ().

    If non-null, this callback will be called when the last reference to
    this context is unreferenced, immediately before it is freed.
    ***********************************************************/
    [CCode (cname="free")]
    public HardwareFrameContextFreeDelegate free;

    /***********************************************************
    @brief Arbitrary user data, to be used e.g. by the free () callback.
    ***********************************************************/
    [CCode (cname="user_opaque")]
    public void *user_opaque;

    /***********************************************************
    @brief A pool from which the frames are allocated by av_hwframe_get_buffer ().
    This field may be set by the caller before calling av_hwframe_ctx_init ().
    The buffers returned by calling av_buffer_pool_get () on this pool must
    have the properties described in the documentation in the corresponding hw
    type's header (hwcontext_*.h). The pool will be freed strictly before
    this struct's free () callback is invoked.

    This field may be null, then libavutil will attempt to allocate a pool
    internally. Note that certain device types enforce pools allocated at
    fixed size (frame count), which cannot be extended dynamically. In such a
    case, initial_pool_size must be set appropriately.
    ***********************************************************/
    [CCode (cname="pool")]
    public LibAVUtil.BufferPool pool;

    /***********************************************************
    @brief Initial size of the frame pool. If a device type does not support
    dynamically resizing the pool, then this is also the maximum pool size.

    May be set by the caller before calling av_hwframe_ctx_init (). Must be
    set if pool is null and the device type does not support dynamic pools.
    ***********************************************************/
    [CCode (cname="initial_pool_size")]
    public int initial_pool_size;

    /***********************************************************
    @brief The pixel format identifying the underlying hardware surface type.

    Must be a hwaccel format, i.e. the corresponding descriptor must have the
    AV_PIX_FMT_FLAG_HWACCEL flag set.

    Must be set by the user before calling av_hwframe_ctx_init ().
    ***********************************************************/
    [CCode (cname="format")]
    public PixelFormat format;

    /***********************************************************
    @brief The pixel format identifying the actual data layout of the hardware
    frames.

    Must be set by the caller before calling av_hwframe_ctx_init ().

    @note when the underlying API does not provide the exact data layout, but
    only the colorspace/bit depth, this field should be set to the fully
    planar version of that format (e.g. for 8-bit 420 YUV it should be
    PixelFormat.YUV420P, not PixelFormat.NV12 or anything else).
    ***********************************************************/
    [CCode (cname="sw_format")]
    public PixelFormat sw_format;

    /***********************************************************
    @brief The allocated dimensions of the frames in this pool.

    Must be set by the user before calling av_hwframe_ctx_init ().
    ***********************************************************/
    [CCode (cname="width")]
    public int width;
    [CCode (cname="height")]
    public int height;
}
} // namespace LibAVUtil
