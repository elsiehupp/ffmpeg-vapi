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
@brief D3D11 frame descriptor for pool allocation.

In user-allocated pools, HardwareFrameContext.pool must return LibAVUtil.BufferRef (s)
with the data pointer pointing at an object of this type describing the
planes of the frame.

This has no use outside of custom allocation, and Frame LibAVUtil.BufferRef do not
necessarily point to an instance of this struct.
***********************************************************/
[CCode (cname="struct AVD3D11FrameDescriptor", cheader_filename="ffmpeg/libavutil/hwcontext_d3d11va.h")]
public struct D3D11FrameDescriptor {
    /***********************************************************
    @brief The texture in which the frame is located. The reference count is
    managed by the LibAVUtil.BufferRef, and destroying the reference will release
    the interface.

    Normally stored in Frame.data[0].
    ***********************************************************/
    [CCode (cname="texture")]
    public ID3D11Texture2D texture;

    /***********************************************************
    @brief The index into the array texture element representing the frame, or 0
    if the texture is not an array texture.

    Normally stored in Frame.data[1] (cast from intptr_t).
    ***********************************************************/
    [CCode (cname="index")]
    public int index;
}

} // namespace LibAVUtil
