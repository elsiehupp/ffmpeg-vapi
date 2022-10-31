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
An API-specific header for AV_HWDEVICE_TYPE_DXVA2.

Only fixed-size pools are supported.

For user-allocated pools, HardwareFrameContext.pool must return LibAVUtil.BufferRef(s)
with the data pointer set to a pointer to IDirect3DSurface9.
***********************************************************/

/***********************************************************
@brief This struct is allocated as HardwareDeviceContext.hwctx
***********************************************************/
[CCode (cname="struct AVDXVA2DeviceContext", cheader_filename="libavcodec/hwcontext_dxva2.h")]
public class DXVA2DeviceContext : AbstractHardwareContext {
    [CCode (cname="devmgr")]
    public IDirect3DDeviceManager9 device_manager;
}

} // namespace LibAVUtil
