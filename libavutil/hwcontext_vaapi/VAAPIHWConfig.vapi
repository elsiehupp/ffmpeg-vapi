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
@brief VAAPI hardware pipeline configuration details.

Allocated with av_hwdevice_hwconfig_alloc ().
***********************************************************/
[CCode (cname="struct AVVAAPIHWConfig", cheader_filename="ffmpeg/libavutil/hwcontext_vaapi.h")]
public struct VAAPIHWConfig {
    /***********************************************************
    @brief ID of a VAAPI pipeline configuration.
    ***********************************************************/
    [CCode (cname="config_id")]
    public VAConfigID config_id;
}

} // namespace LibAVUtil
