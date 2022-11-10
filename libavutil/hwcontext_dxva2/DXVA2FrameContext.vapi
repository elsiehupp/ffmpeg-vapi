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
@file An API-specific header for AV_HWDEVICE_TYPE_DXVA2.

Only fixed-size pools are supported.

For user-allocated pools, HardwareFrameContext.pool must return LibAVUtil.BufferRef (s)
with the data pointer set to a pointer to IDirect3DSurface9.
***********************************************************/

/***********************************************************
@brief This struct is allocated as HardwareFrameContext.hwctx
***********************************************************/
[CCode (cname="struct AVDXVA2FramesContext", cheader_filename="ffmpeg/libavutil/hwcontext_dxva2.h")]
public class DXVA2FrameContext : AbstractHardwareContext {
    /***********************************************************
    @brief The surface type (e.g. DXVA2_VideoProcessorRenderTarget or
    DXVA2_VideoDecoderRenderTarget). Must be set by the caller.
    ***********************************************************/
    [CCode (cname="surface_type")]
    public DWORD surface_type;

    /***********************************************************
    @brief The surface pool. When an external pool is not provided by the caller,
    this will be managed (allocated and filled on init, freed on uninit) by
    libavutil.
    ***********************************************************/
    [CCode (cname="surfaces")]
    public IDirect3DSurface9[] surface_list;
    [CCode (cname="nb_surfaces")]
    public int surface_count;

    /***********************************************************
    @brief Certain drivers require the decoder to be destroyed before the surfaces.
    To allow internally managed pools to work properly in such cases, this
    field is provided.

    If it is non-null, libavutil will call IDirectXVideoDecoder_Release () on
    it just before the internal surface pool is freed.

    This is for convenience only. Some code uses other methods to manage the
    decoder reference.
    ***********************************************************/
    [CCode (cname="decoder_to_release")]
    public IDirectXVideoDecoder decoder_to_release;
}

} // namespace LibAVUtil
