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
@file API-specific header for AV_HWDEVICE_TYPE_VAAPI.

Dynamic frame pools are supported, but note that any pool used as a render
target is required to be of fixed size in order to be be usable as an
argument to vaCreateContext ().

For user-allocated pools, HardwareFrameContext.pool must return LibAVUtil.BufferRef (s)
with the data pointer set to a VASurfaceID.
***********************************************************/
[Flags]
[CCode (cprefix="", cheader_filename="ffmpeg/libavutil/hwcontext_vaapi.h")]
public enum VAAPIDriverQuirk {
    /***********************************************************
    @brief The quirks field has been set by the user and should not be detected
    automatically by av_hwdevice_ctx_init ().
    ***********************************************************/
    [CCode (cname="")]
    AV_VAAPI_DRIVER_QUIRK_USER_SET,
    /***********************************************************
    @brief The driver does not destroy parameter buffers when they are used by
    vaRenderPicture (). Additional code will be required to destroy them
    separately afterwards.
    ***********************************************************/
    [CCode (cname="")]
    AV_VAAPI_DRIVER_QUIRK_RENDER_PARAM_BUFFERS,

    /***********************************************************
    @brief The driver does not support the VASurfaceAttribMemoryType attribute,
    so the surface allocation code will not try to use it.
    ***********************************************************/
    [CCode (cname="")]
    AV_VAAPI_DRIVER_QUIRK_ATTRIB_MEMTYPE,

    /***********************************************************
    @brief The driver does not support surface attributes at all.
    The surface allocation code will never pass them to surface allocation,
    and the results of the vaQuerySurfaceAttributes () call will be faked.
    ***********************************************************/
    [CCode (cname="")]
    AV_VAAPI_DRIVER_QUIRK_SURFACE_ATTRIBUTES,
}

} // namespace LibAVUtil
