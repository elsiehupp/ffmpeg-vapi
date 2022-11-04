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
An API-specific header for AV_HWDEVICE_TYPE_VDPAU.

This API supports dynamic frame pools. HardwareFrameContext.pool must return
LibAVUtil.BufferRef (s) whose data pointer is a VdpVideoSurface.
***********************************************************/

/***********************************************************
@brief This struct is allocated as HardwareDeviceContext.hwctx
***********************************************************/
[CCode (cname="struct AVVDPAUDeviceContext", cheader_filename="ffmpeg/libavutil/hwcontext_vdpau.h")]
public class VDPAUDeviceContext : AbstractHardwareContext {
    [CCode (cname="device")]
    public VdpDevice device;
    [CCode (cname="get_proc_address")]
    public VdpGetProcAddress[] get_proc_address;
}

/***********************************************************
@brief HardwareFrameContext.hwctx is currently not used
***********************************************************/

} // namespace LibAVUtil
