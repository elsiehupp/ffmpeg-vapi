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
@brief This struct describes the constraints on hardware frames
attached to a given device with a hardware-specific
configuration. This is returned by av_hwdevice_get_hwframe_constraints ()
and must be freed by
av_hwframe_constraints_free () after use.
***********************************************************/
[CCode (cname="struct AVHWFramesConstraints", cheader_filename="ffmpeg/libavutil/hwcontext.h")]
public struct HardwareFrameConstraints {
    /***********************************************************
    @brief A list of possible values for format in the hw_frames_ctx,
    terminated by PixelFormat.NONE. This member will always be
    filled.
    ***********************************************************/
    [CCode (cname="valid_hw_formats")]
    public PixelFormat[] valid_hw_formats;

    /***********************************************************
    @brief A list of possible values for sw_format in the hw_frames_ctx,
    terminated by PixelFormat.NONE. Can be null if this
    information is not known.
    ***********************************************************/
    [CCode (cname="valid_sw_formats")]
    public PixelFormat[] valid_sw_formats;

    /***********************************************************
    @brief The minimum size of frames in this hw_frames_ctx.
    (Zero if not known.)
    ***********************************************************/
    [CCode (cname="min_width")]
    public int min_width;

    /***********************************************************
    @brief The minimum size of frames in this hw_frames_ctx.
    (Zero if not known.)
    ***********************************************************/
    [CCode (cname="min_height")]
    public int min_height;

    /***********************************************************
    @brief The maximum size of frames in this hw_frames_ctx.
    (INT_MAX if not known / no limit.)
    ***********************************************************/
    [CCode (cname="max_width")]
    public int max_width;

    /***********************************************************
    @brief The maximum size of frames in this hw_frames_ctx.
    (INT_MAX if not known / no limit.)
    ***********************************************************/
    [CCode (cname="max_height")]
    public int max_height;

    /***********************************************************
    @brief Get the constraints on hardware frames given a device and
    the hardware-specific configuration to be used with that
    device. If no hardware-specific configuration is provided,
    returns the maximum possible capabilities of the device.

    @param ref a reference to the associated HardwareDeviceContext.
    @param hwconfig a filled hardware-specific configuration structure, or null
        to return the maximum possible capabilities of the device.
    @return HardwareFrameConstraints structure describing the constraints
        on the device, or null if not available.
    ***********************************************************/
    [CCode (cname="av_hwdevice_get_hwframe_constraints", cheader_filename="ffmpeg/libavutil/hwcontext.h")]
    public HardwareFrameConstraints av_hwdevice_get_hwframe_constraints (
        LibAVUtil.BufferRef ref,
        void *hwconfig
    );

    /***********************************************************
    @brief Free an HardwareFrameConstraints structure.

    @param constraints The (filled or unfilled) HardwareFrameConstraints structure.
    ***********************************************************/
    [CCode (cname="av_hwframe_constraints_free", cheader_filename="ffmpeg/libavutil/hwcontext.h")]
    public void av_hwframe_constraints_free (
        HardwareFrameConstraints constraints
    );

}

} // namespace LibAVUtil
