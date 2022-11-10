/***********************************************************
@brief DXVA2 Hardware acceleration

@copyright 2009 Laurent Aimar
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

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

namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file @ingroup lavc_codec_hwaccel_dxva2
Public LibAVCodec DXVA2 header.
***********************************************************/

//  #if !defined (_WIN32_WINNT) || _WIN32_WINNT < 0x0602
//  #undef _WIN32_WINNT
//  #define _WIN32_WINNT 0x0602
//  #endif

/***********************************************************
@brief This structure is used to provides the necessary configurations and data
to the DXVA2 FFmpeg HWAccel implementation.

The application must make it available as CodecContext.hwaccel_context.
***********************************************************/
[CCode (cname="struct dxva_context", cheader_filename="ffmpeg/libavcodec/dxva2.h")]
public struct DirectXVideoAccelerationContext {
    /***********************************************************
    @brief DXVA2 decoder object
    ***********************************************************/
    [CCode (cname="decoder")]
    public IDirectXVideoDecoder decoder;

    /***********************************************************
    @brief DXVA2 configuration used to create the decoder
    ***********************************************************/
    [CCode (cname="cfg")]
    public DXVA2_ConfigPictureDecode cfg;

    /***********************************************************
    @brief The number of surface in the surface array
    ***********************************************************/
    [CCode (cname="surface_count")]
    public uint surface_count;

    /***********************************************************
    @brief The array of Direct3D surfaces used to create the decoder
    ***********************************************************/
    [CCode (cname="surface")]
    public LPDIRECT3DSURFACE9 surface;

    /***********************************************************
    @brief A bit field configuring the workarounds needed for using the decoder
    ***********************************************************/
    [CCode (cname="workaround")]
    public uint64 workaround;

    /***********************************************************
    @brief Private to the FFmpeg HardwareAcceleration implementation
    ***********************************************************/
    [CCode (cname="report_id")]
    public uint report_id;
}

} // namespace LibAVCodec
