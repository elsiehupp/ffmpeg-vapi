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
An API-specific header for AV_HWDEVICE_TYPE_CUDA.

This API supports dynamic frame pools. HardwareFrameContext.pool must return
LibAVUtil.BufferRef(s) whose data pointer is a CUdeviceptr.
***********************************************************/

[CCode (cname="struct AVCUDADeviceContextInternal", cheader_filename="libavcodec/hwcontext_cuda.h")]
public struct CUDADeviceContextInternal { }

/***********************************************************
@brief This struct is allocated as HardwareDeviceContext.hwctx

@note HardwareFrameContext.hwctx is currently not used
***********************************************************/
[CCode (cname="struct AVCUDADeviceContext", cheader_filename="libavcodec/hwcontext_cuda.h")]
public class CUDADeviceContext : AbstractHardwareContext {
    [CCode (cname="cuda_ctx")]
    public CUcontext cuda_ctx;
    [CCode (cname="stream")]
    public CUstream stream;
    [CCode (cname="internal")]
    public CUDADeviceContextInternal internal;
}

} // namespace LibAVUtil
