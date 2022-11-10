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

public delegate void D3D11VADeviceLockDelegate (
    void *lock_ctx
);
public delegate void D3D11VADeviceUnlockDelegate (
    void *lock_ctx
);

/***********************************************************
@brief This struct is allocated as HardwareDeviceContext.hwctx
***********************************************************/
[CCode (cname="struct AVD3D11VADeviceContext", cheader_filename="ffmpeg/libavutil/hwcontext_d3d11va.h")]
public class D3D11VADeviceContext : AbstractHardwareContext {
    /***********************************************************
    @brief Device used for texture creation and access. This can also be used to
    set the LibAVCodec decoding device.

    Must be set by the user. This is the only mandatory field - the other
    device context fields are set from this and are available for convenience.

    Deallocating the HardwareDeviceContext will always release this interface,
    and it does not matter whether it was user-allocated.
    ***********************************************************/
    [CCode (cname="device")]
    public ID3D11Device device;

    /***********************************************************
    @brief If unset, this will be set from the device field on init.

    Deallocating the HardwareDeviceContext will always release this interface,
    and it does not matter whether it was user-allocated.
    ***********************************************************/
    [CCode (cname="device_context")]
    public ID3D11DeviceContext device_context;

    /***********************************************************
    @brief If unset, this will be set from the device field on init.

    Deallocating the HardwareDeviceContext will always release this interface,
    and it does not matter whether it was user-allocated.
    ***********************************************************/
    [CCode (cname="video_device")]
    public ID3D11VideoDevice video_device;

    /***********************************************************
    @brief If unset, this will be set from the device_context field on init.

    Deallocating the HardwareDeviceContext will always release this interface,
    and it does not matter whether it was user-allocated.
    ***********************************************************/
    [CCode (cname="video_context")]
    public ID3D11VideoContext video_context;

    /***********************************************************
    @brief Callbacks for locking. They protect accesses to device_context and
    video_context calls. They also protect access to the internal staging
    texture (for av_hwframe_transfer_data () calls). They do NOT protect
    access to hwcontext or decoder state in general.

    If unset on init, the hwcontext implementation will set them to use an
    internal mutex.

    The underlying lock must be recursive. lock_ctx is for free use by the
    locking implementation.
    ***********************************************************/
    [CCode (cname="lock")]
    public D3D11VADeviceLockDelegate lock;
    [CCode (cname="unlock")]
    public D3D11VADeviceUnlockDelegate unlock;
    [CCode (cname="lock_ctx")]
    public void *lock_context;
}

} // namespace LibAVUtil
