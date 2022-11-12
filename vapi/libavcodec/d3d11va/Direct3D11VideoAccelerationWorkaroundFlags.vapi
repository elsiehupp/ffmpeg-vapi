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
@brief Direct3D11 Hardware acceleration

@copyright 2009 Laurent Aimar
@copyright 2015 Steve Lhomme
***********************************************************/
namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file @ingroup lavc_codec_hwaccel_d3d11va
Public LibAVCodec D3D11VA header.
***********************************************************/

/***********************************************************
@defgroup lavc_codec_hwaccel_d3d11va Direct3D11
@ingroup lavc_codec_hwaccel
***********************************************************/
[Flags]
[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/d3d11va.h")]
public enum Direct3D11VideoAccelerationWorkaroundFlags {
    /***********************************************************
    @brief Workaround for Direct3D11 and old UVD/UVD+ ATI video cards
        ***********************************************************/
    FF_DXVA2_WORKAROUND_SCALING_LIST_ZIGZAG,
    /***********************************************************
    @brief Workaround for Direct3D11 and old Intel GPUs with ClearVideo
    interface
        ***********************************************************/
    FF_DXVA2_WORKAROUND_INTEL_CLEARVIDEO,
}

} // namespace LibAVCodec
