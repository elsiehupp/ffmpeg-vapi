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
An API-specific header for AV_HWDEVICE_TYPE_QSV.

This API does not support dynamic frame pools. HardwareFrameContext.pool must
contain LibAVUtil.BufferRef(s) whose data pointer points to an mfxFrameSurface1 struct.
***********************************************************/

/***********************************************************
@brief This struct is allocated as HardwareDeviceContext.hwctx
***********************************************************/
[CCode (cname="struct AVQSVDeviceContext", cheader_filename="libavcodec/hwcontext_qsv.h")]
public class QSVDeviceContext : AbstractHardwareContext {
    [CCode (cname="session")]
    public mfxSession session;
}

} // namespace LibAVUtil
