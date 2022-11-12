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
/***********************************************************
@brief DXVA2 Hardware acceleration

@copyright 2009 Laurent Aimar
***********************************************************/
namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file @ingroup lavc_codec_hwaccel_dxva2
Public LibAVCodec DXVA2 header.
***********************************************************/

/***********************************************************
@defgroup lavc_codec_hwaccel_dxva2 DXVA2
@ingroup lavc_codec_hwaccel
***********************************************************/
[Flags]
[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/dxva2.h")]
public enum DirectXVideoAccelerationWorkaroundFlags {
    /***********************************************************
    @brief Workaround for DXVA2 and old UVD/UVD+ ATI video cards
    ***********************************************************/
    FF_DXVA2_WORKAROUND_SCALING_LIST_ZIGZAG,
    /***********************************************************
    @brief Workaround for DXVA2 and old Intel GPUs with ClearVideo
    interface
    ***********************************************************/
    FF_DXVA2_WORKAROUND_INTEL_CLEARVIDEO,
}

} // namespace LibAVCodec
