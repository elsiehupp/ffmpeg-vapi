/***********************************************************
@brief Direct3D11 Hardware acceleration

@copyright 2009 Laurent Aimar
@copyright 2015 Steve Lhomme

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
@file
@ingroup lavc_codec_hwaccel_d3d11va
Public LibAVCodec D3D11VA header.
***********************************************************/

/***********************************************************
@defgroup lavc_codec_hwaccel_d3d11va Direct3D11
@ingroup lavc_codec_hwaccel
***********************************************************/

//  #if !defined (_WIN32_WINNT) || _WIN32_WINNT < 0x0602
//  #undef _WIN32_WINNT
//  #define _WIN32_WINNT 0x0602
//  #endif

/***********************************************************
@brief This structure is used to provides the necessary configurations and data
to the Direct3D11 FFmpeg HWAccel implementation.

The application must make it available as CodecContext.hwaccel_context.

Use av_d3d11va_alloc_context () exclusively to allocate an Direct3D11VideoAccelerationContext.
***********************************************************/
[CCode (cname="struct AVD3D11VAContext", cheader_filename="ffmpeg/libavcodec/d3d11va.h")]
public struct Direct3D11VideoAccelerationContext {
    /***********************************************************
    @brief D3D11 decoder object
    ***********************************************************/
    [CCode (cname="decoder")]
    public ID3D11VideoDecoder decoder;

    /***********************************************************
    @brief D3D11 VideoContext
    ***********************************************************/
    [CCode (cname="video_context")]
    public ID3D11VideoContext video_context;

    /***********************************************************
    @brief D3D11 configuration used to create the decoder
    ***********************************************************/
    [CCode (cname="cfg")]
    public D3D11_VIDEO_DECODER_CONFIG cfg;

    /***********************************************************
    @brief The number of surface in the surface array
    ***********************************************************/
    [CCode (cname="surface_count")]
    public uint surface_count;

    /***********************************************************
    @brief The array of Direct3D surfaces used to create the decoder
    ***********************************************************/
    [CCode (cname="surface")]
    public ID3D11VideoDecoderOutputView[] surface;

    /***********************************************************
    @brief A bit field configuring the workarounds needed for using the decoder
    ***********************************************************/
    [CCode (cname="workaround")]
    public Direct3D11VideoAccelerationWorkaroundFlags workaround;

    /***********************************************************
    @brief Private to the FFmpeg HardwareAcceleration implementation
    ***********************************************************/
    [CCode (cname="report_id")]
    public uint report_id;

    /***********************************************************
    @brief Mutex to access video_context
    ***********************************************************/
    [CCode (cname="context_mutex")]
    public HANDLE context_mutex;

    /***********************************************************
    @brief Allocate an Direct3D11VideoAccelerationContext.

    @return Newly-allocated Direct3D11VideoAccelerationContext or null on failure.
    ***********************************************************/
    [CCode (cname="av_d3d11va_alloc_context", cheader_filename="ffmpeg/libavcodec/d3d11va.h")]
    public Direct3D11VideoAccelerationContext av_d3d11va_alloc_context ();
}

} // namespace LibAVCodec
