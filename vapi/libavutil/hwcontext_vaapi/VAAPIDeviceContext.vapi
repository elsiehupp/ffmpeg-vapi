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
@brief VAAPI connection details.

Allocated as HardwareDeviceContext.hwctx
***********************************************************/
[CCode (cname="struct AVVAAPIDeviceContext", cheader_filename="ffmpeg/libavutil/hwcontext_vaapi.h")]
public class VAAPIDeviceContext : AbstractHardwareContext {
    /***********************************************************
    @brief The VADisplay handle, to be filled by the user.
    ***********************************************************/
    [CCode (cname="display")]
    public VADisplay display;

    /***********************************************************
    @brief Driver quirks to apply - this is filled by av_hwdevice_ctx_init (),
    with reference to a table of known drivers, unless the
    AV_VAAPI_DRIVER_QUIRK_USER_SET bit is already present. The user
    may need to refer to this field when performing any later
    operations using VAAPI with the same VADisplay.
    ***********************************************************/
    [CCode (cname="driver_quirks")]
    public uint driver_quirks;
}

} // namespace LibAVUtil
