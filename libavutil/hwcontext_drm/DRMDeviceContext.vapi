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
@file
API-specific header for AV_HWDEVICE_TYPE_DRM.

Internal frame allocation is not currently supported - all frames
must be allocated by the user. Thus HardwareFrameContext is always
null, though this may change if support for frame allocation is
added in future.
***********************************************************/

/***********************************************************
@brief DRM device.

Allocated as HardwareDeviceContext.hwctx.
***********************************************************/
[CCode (cname="struct AVDRMDeviceContext", cheader_filename="ffmpeg/libavutil/hwcontext_drm.h")]
public class DRMDeviceContext : AbstractHardwareContext {
    /***********************************************************
    @brief File descriptor of DRM device.

    This is used as the device to create frames on, and may also be
    used in some derivation and mapping operations.

    If no device is required, set to -1.
    ***********************************************************/
    [CCode (cname="fd")]
    public int file_descriptor;
}

} // namespace LibAVUtil
