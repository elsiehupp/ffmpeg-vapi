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

/***********************************************************
@brief Allocate an HardwareDeviceContext for a given hardware type.

@param type the type of the hardware device to allocate.
@return a reference to the newly created HardwareDeviceContext on success or null
    on failure.
***********************************************************/
[CCode (cname="av_hwdevice_ctx_alloc", cheader_filename="libavcodec/hwcontext.h")]
public LibAVUtil.BufferRef av_hwdevice_ctx_alloc (
    HardwareDeviceType type
);

/***********************************************************
@brief Finalize the device context before use. This function must be called after
the context is filled with all the required information and before it is
used in any way.

@param ref a reference to the HardwareDeviceContext
@return 0 on success, a negative LibAVUtil.ErrorCode code on failure
***********************************************************/
[CCode (cname="av_hwdevice_ctx_init", cheader_filename="libavcodec/hwcontext.h")]
public int av_hwdevice_ctx_init (
    LibAVUtil.BufferRef ref
);

/***********************************************************
@brief Open a device of the specified type and create an HardwareDeviceContext for it.

This is a convenience function intended to cover the simple cases. Callers
who need to fine-tune device creation/management should open the device
manually and then wrap it in an HardwareDeviceContext using
av_hwdevice_ctx_alloc ()/av_hwdevice_ctx_init ().

The returned context is already initialized and ready for use, the caller
should not call av_hwdevice_ctx_init () on it. The user_opaque/free fields of
the created HardwareDeviceContext are set by this function and should not be
touched by the caller.

@param device_ctx On success, a reference to the newly-created device context
    will be written here. The reference is owned by the caller
    and must be released with av_buffer_unref () when no longer
    needed. On failure, null will be written to this pointer.
@param type The type of the device to create.
@param device A type-specific string identifying the device to open.
@param opts A dictionary of additional (type-specific) options to use in
    opening the device. The dictionary remains owned by the caller.
@param flags currently unused

@return 0 on success, a negative LibAVUtil.ErrorCode code on failure.
***********************************************************/
[CCode (cname="av_hwdevice_ctx_create", cheader_filename="libavcodec/hwcontext.h")]
public int av_hwdevice_ctx_create (
    LibAVUtil.BufferRef device_ctx,
    HardwareDeviceType type,
    string device,
    LibAVUtil.Dictionary opts,
    int flags
);

/***********************************************************
@brief Create a new device of the specified type from an existing device.

If the source device is a device of the target type or was originally
derived from such a device (possibly through one or more intermediate
devices of other types), then this will return a reference to the
existing device of the same type as is requested.

Otherwise, it will attempt to derive a new device from the given source
device. If direct derivation to the new type is not implemented, it will
attempt the same derivation from each ancestor of the source device in
turn looking for an implemented derivation method.

@param output_ctx On success, a reference to the newly-created
    HardwareDeviceContext.
@param type The type of the new device to create.
@param input_ctx A reference to an existing HardwareDeviceContext which will be
    used to create the new device.
@param flags Currently unused; should be set to zero.
@return 0 on success, a negative LibAVUtil.ErrorCode code on failure.
***********************************************************/
[CCode (cname="av_hwdevice_ctx_create_derived", cheader_filename="libavcodec/hwcontext.h")]
public int av_hwdevice_ctx_create_derived (
    LibAVUtil.BufferRef output_ctx,
    HardwareDeviceType type,
    LibAVUtil.BufferRef input_ctx,
    int flags
);

/***********************************************************
@brief Allocate an HardwareFrameContext tied to a given device context.

@param device_ctx a reference to a HardwareDeviceContext. This function will make
    a new reference for internal use, the one passed to the
    function remains owned by the caller.
@return a reference to the newly created HardwareFrameContext on success or null
    on failure.
***********************************************************/
[CCode (cname="av_hwframe_ctx_alloc", cheader_filename="libavcodec/hwcontext.h")]
public LibAVUtil.BufferRef av_hwframe_ctx_alloc (
    LibAVUtil.BufferRef device_ctx
);

/***********************************************************
@brief Finalize the context before use. This function must be called after the
context is filled with all the required information and before it is attached
to any frames.

@param ref a reference to the HardwareFrameContext
@return 0 on success, a negative LibAVUtil.ErrorCode code on failure
***********************************************************/
[CCode (cname="av_hwframe_ctx_init", cheader_filename="libavcodec/hwcontext.h")]
public int av_hwframe_ctx_init (
    LibAVUtil.BufferRef ref
);

/***********************************************************
@brief Allocate a new frame attached to the given HardwareFrameContext.

@param hwframe_ctx a reference to an HardwareFrameContext
@param frame an empty (freshly allocated or unreffed) frame to be filled with
    newly allocated buffers.
@param flags currently unused, should be set to zero
@return 0 on success, a negative LibAVUtil.ErrorCode code on failure
***********************************************************/
[CCode (cname="av_hwframe_get_buffer", cheader_filename="libavcodec/hwcontext.h")]
public int av_hwframe_get_buffer (
    LibAVUtil.BufferRef hwframe_ctx,
    Frame frame,
    int flags
);

/***********************************************************
@brief Copy data to or from a hw surface. At least one of output_frame/input_frame must have an
HardwareFrameContext attached.

If input_frame has an HardwareFrameContext attached, then the format of output_frame (if set)
must use one of the formats returned by av_hwframe_transfer_get_formats (input_frame,
AV_HWFRAME_TRANSFER_DIRECTION_FROM).
If output_frame has an HardwareFrameContext attached, then the format of input_frame must use one
of the formats returned by av_hwframe_transfer_get_formats (output_frame,
AV_HWFRAME_TRANSFER_DIRECTION_TO)

output_frame may be "clean" (i.e. with data/buf pointers unset), in which case the
data buffers will be allocated by this function using av_frame_get_buffer ().
If output_frame->format is set, then this format will be used, otherwise (when
output_frame->format is PixelFormat.NONE) the first acceptable format will be chosen.

The two frames must have matching allocated dimensions (i.e. equal to
HardwareFrameContext.width/height), since not all device types support
transferring a sub-rectangle of the whole surface. The display dimensions
(i.e. Frame.width/height) may be smaller than the allocated dimensions, but
also have to be equal for both frames. When the display dimensions are
smaller than the allocated dimensions, the content of the padding in the
destination frame is unspecified.

@param output_frame the destination frame. output_frame is not touched on failure.
@param input_frame the source frame.
@param flags currently unused, should be set to zero
@return 0 on success, a negative LibAVUtil.ErrorCode error code on failure.
***********************************************************/
[CCode (cname="av_hwframe_transfer_data", cheader_filename="libavcodec/hwcontext.h")]
public int av_hwframe_transfer_data (
    Frame output_frame,
    Frame input_frame,
    int flags
);

/***********************************************************
@brief Allocate a hardware-specific configuration structure for a given hardware device.
After use, the user must free all members as required by the specific
hardware structure being used, then free the structure itself with
av_free ().

@param device_ctx a reference to the associated HardwareDeviceContext.
@return The newly created hardware-specific configuration structure on
    success or null on failure.
***********************************************************/
[CCode (cname="av_hwdevice_hwconfig_alloc", cheader_filename="libavcodec/hwcontext.h")]
public void *av_hwdevice_hwconfig_alloc (
    LibAVUtil.BufferRef device_ctx
);

/***********************************************************
@brief Map a hardware frame.

This has a number of different possible effects, depending on the format
and origin of the input_frame and output_frame frames. On input, input_frame should be a usable
frame with valid buffers and output_frame should be blank (typically as just created
by av_frame_alloc ()). input_frame should have an associated hwframe context, and
output_frame may optionally have a format and associated hwframe context.

If input_frame was created by mapping a frame from the hwframe context of output_frame,
then this function undoes the mapping - output_frame is replaced by a reference to
the frame that input_frame was originally mapped from.

If both input_frame and output_frame have an associated hwframe context, then this function
attempts to map the input_frame frame from its hardware context to that of output_frame and
then fill output_frame with appropriate data to be usable there. This will only be
possible if the hwframe contexts and associated devices are compatible -
given compatible devices, av_hwframe_ctx_create_derived () can be used to
create a hwframe context for output_frame in which mapping should be possible.

If input_frame has a hwframe context but output_frame does not, then the input_frame frame is
mapped to normal memory and should thereafter be usable as a normal frame.
If the format is set on output_frame, then the mapping will attempt to create output_frame
with that format and fail if it is not possible. If format is unset (is
PixelFormat.NONE) then output_frame will be mapped with whatever the most appropriate
format to use is (probably the sw_format of the input_frame hwframe context).

A return value of LibAVUtil.ErrorCode (ENOSYS) indicates that the mapping is not
possible with the given arguments and hwframe setup, while other return
values indicate that it failed somehow.

@param output_frame Destination frame, to contain the mapping.
@param input_frame Source frame, to be mapped.
@param flags Some combination of HardwareFrameMappingFlags flags.
@return 0 on success, negative LibAVUtil.ErrorCode code on failure.
***********************************************************/
[CCode (cname="av_hwframe_map", cheader_filename="libavcodec/hwcontext.h")]
public int av_hwframe_map (
    out Frame output_frame,
    Frame input_frame,
    HardwareFrameMappingFlags flags
);

/***********************************************************
@brief Create and initialise an HardwareFrameContext as a mapping of another existing
HardwareFrameContext on a different device.

av_hwframe_ctx_init () should not be called after this.

@param derived_frame_ctx On success, a reference to the newly created
    HardwareFrameContext.
@param derived_device_ctx A reference to the device to create the new
    HardwareFrameContext on.
@param source_frame_ctx A reference to an existing HardwareFrameContext
    which will be mapped to the derived context.
@param flags Some combination of HardwareFrameMappingFlags flags, defining the
    mapping parameters to apply to frames which are allocated
    in the derived device.
@return 0 on success, negative LibAVUtil.ErrorCode code on failure.
***********************************************************/
[CCode (cname="av_hwframe_ctx_create_derived", cheader_filename="libavcodec/hwcontext.h")]
public int av_hwframe_ctx_create_derived (
    LibAVUtil.BufferRef derived_frame_ctx,
    PixelFormat format,
    LibAVUtil.BufferRef derived_device_ctx,
    LibAVUtil.BufferRef source_frame_ctx,
    HardwareFrameMappingFlags flags
);

} // namespace LibAVUtil
