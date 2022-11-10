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
@file An API-specific header for AV_HWDEVICE_TYPE_D3D11VA.

The default pool implementation will be fixed-size if initial_pool_size is
set (and allocate elements from an array texture). Otherwise it will allocate
individual textures. Be aware that decoding requires a single array texture.

Using sw_format==PixelFormat.YUV420P has special semantics, and maps to
DXGI_FORMAT_420_OPAQUE. av_hwframe_transfer_data () is not supported for
this format. Refer to MSDN for details.

av_hwdevice_ctx_create () for this device type supports a key named "debug"
for the LibAVUtil.Dictionary entry. If this is set to any value, the device creation
code will try to load various supported D3D debugging layers.
***********************************************************/

/***********************************************************
@brief This struct is allocated as HardwareFrameContext.hwctx
***********************************************************/
[CCode (cname="struct AVD3D11VAFramesContext", cheader_filename="ffmpeg/libavutil/hwcontext_d3d11va.h")]
public class D3D11VAFrameContext : AbstractHardwareContext {
    /***********************************************************
    @brief The canonical texture used for pool allocation. If this is set to null
    on init, the hwframes implementation will allocate and set an array
    texture if initial_pool_size > 0.

    The only situation when the API user should set this is:
    - the user wants to do manual pool allocation (setting
        HardwareFrameContext.pool), instead of letting HardwareFrameContext
        allocate the pool
    - of an array texture
    - and wants it to use it for decoding
    - this has to be done before calling av_hwframe_ctx_init ()

    Deallocating the HardwareFrameContext will always release this interface,
    and it does not matter whether it was user-allocated.

    This is in particular used by the LibAVCodec D3D11VA hwaccel, which
    requires a single array texture. It will create ID3D11VideoDecoderOutputView
    objects for each array texture element on decoder initialization.
    ***********************************************************/
    [CCode (cname="texture")]
    public ID3D11Texture2D texture;

    /***********************************************************
    @brief D3D11_TEXTURE2D_DESC.BindFlags used for texture creation. The user must
    at least set D3D11_BIND_DECODER if the frames context is to be used for
    video decoding.
    This field is ignored/invalid if a user-allocated texture is provided.
    ***********************************************************/
    [CCode (cname="BindFlags")]
    public uint bind_flags;

    /***********************************************************
    @brief D3D11_TEXTURE2D_DESC.MiscFlags used for texture creation.
    This field is ignored/invalid if a user-allocated texture is provided.
    ***********************************************************/
    [CCode (cname="MiscFlags")]
    public uint misc_flags;
}

} // namespace LibAVUtil
