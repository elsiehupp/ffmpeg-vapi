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

[CCode (cname="struct AVHWDeviceInternal", cheader_filename="ffmpeg/libavutil/hwcontext.h")]
public struct AVHWDeviceInternal { }

[CCode (cname="struct AVHWContext", cheader_filename="ffmpeg/libavutil/hwcontext.h")]
public abstract class AbstractHardwareContext { }

public delegate void AVHWDeviceContextFreeDelegate (
    HardwareDeviceContext hardware_device_context
);

/***********************************************************
@brief This struct aggregates all the (hardware/vendor-specific) "high-level" state,
i.e. state that is not tied to a concrete processing configuration.
E.g., in an API that supports hardware-accelerated encoding and decoding,
this struct will (if possible) wrap the state that is common to both encoding
and decoding and from which specific instances of encoders or decoders can be
derived.

This struct is reference-counted with the LibAVUtil.Buffer mechanism. The
av_hwdevice_ctx_alloc () constructor yields a reference, whose data field
points to the actual HardwareDeviceContext. Further objects derived from
HardwareDeviceContext (such as HardwareFrameContext, describing a frame pool with
specific properties) will hold an internal reference to it. After all the
references are released, the HardwareDeviceContext itself will be freed,
optionally invoking a user-specified callback for uninitializing the hardware
state.
***********************************************************/
[CCode (cname="struct AVHWDeviceContext", cheader_filename="ffmpeg/libavutil/hwcontext.h")]
public struct HardwareDeviceContext {
    /***********************************************************
    @brief A class for logging. Set by av_hwdevice_ctx_alloc ().
        ***********************************************************/
    [CCode (cname="av_class")]
    public Class av_class;

    /***********************************************************
    @brief Private data used internally by libavutil. Must not be accessed in any
    way by the caller.
        ***********************************************************/
    //  [CCode (cname="internal")]
    //  public AVHWDeviceInternal internal;

    /***********************************************************
    @brief This field identifies the underlying API used for hardware access.

    This field is set when this struct is allocated and never changed
    afterwards.
        ***********************************************************/
    [CCode (cname="type")]
    public HardwareDeviceType type;

    /***********************************************************
    @brief The format-specific data, allocated and freed by libavutil along with
    this context.

    Should be cast by the user to the format-specific context defined in the
    corresponding header (hwcontext_*.h) and filled as described in the
    documentation before calling av_hwdevice_ctx_init ().

    After calling av_hwdevice_ctx_init () this struct should not be modified
    by the caller.
        ***********************************************************/
    [CCode (cname="hwctx")]
    public AbstractHardwareContext hwctx;

    /***********************************************************
    @brief This field may be set by the caller before calling av_hwdevice_ctx_init ().

    If non-null, this callback will be called when the last reference to
    this context is unreferenced, immediately before it is freed.

    @note when other objects (e.g an HardwareFrameContext) are derived from this
        struct, this callback will be invoked after all such child objects
        are fully uninitialized and their respective destructors invoked.
        ***********************************************************/
    [CCode (cname="free")]
    public AVHWDeviceContextFreeDelegate free;

    /***********************************************************
    @brief Arbitrary user data, to be used e.g. by the free () callback.
        ***********************************************************/
    [CCode (cname="user_opaque")]
    public void *user_opaque;
}

} // namespace LibAVUtil
