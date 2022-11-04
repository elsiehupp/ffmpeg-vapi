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
@file
API-specific header for AV_HWDEVICE_TYPE_DRM.

Internal frame allocation is not currently supported - all frames
must be allocated by the user. Thus HardwareFrameContext is always
null, though this may change if support for frame allocation is
added in future.
***********************************************************/

/***********************************************************
@brief DRM frame descriptor.

This is used as the data pointer for PixelFormat.DRM_PRIME frames.
It is also used by user-allocated frame pools - allocating in
HardwareFrameContext.pool must return LibAVUtil.BufferRef (s) which contain
an object of this type.

The fields of this structure should be set such it can be
imported directly by EGL using the EGL_EXT_image_dma_buf_import
and EGL_EXT_image_dma_buf_import_modifiers extensions.
(Note that the exact layout of a particular format may vary between
platforms - we only specify that the same platform should be able
to import it.)

The total number of planes must not exceed AV_DRM_MAX_PLANES, and
the order of the planes by increasing layer index followed by
increasing plane index must be the same as the order which would
be used for the data pointers in the equivalent software format.
***********************************************************/
[CCode (cname="struct AVDRMFrameDescriptor", cheader_filename="ffmpeg/libavutil/hwcontext_drm.h")]
public struct DRMFrameDescriptor {
    /***********************************************************
    @brief The maximum number of layers/planes in a DRM frame.
    ***********************************************************/
    [CCode (cname="AV_DRM_MAX_PLANES", cheader_filename="ffmpeg/libavutil/hwcontext_drm.h")]
    public const size_t AV_DRM_MAX_PLANES;

    /***********************************************************
    @brief Array of objects making up the frame.
    ***********************************************************/
    [CCode (cname="objects")]
    public DRMObjectDescriptor object_list[AV_DRM_MAX_PLANES];

    /***********************************************************
    @brief Number of DRM objects making up this frame.
    ***********************************************************/
    [CCode (cname="nb_objects")]
    public int object_count;

    /***********************************************************
    @brief Array of layers in the frame.
    ***********************************************************/
    [CCode (cname="layers")]
    public DRMLayerDescriptor layer_list[AV_DRM_MAX_PLANES];

    /***********************************************************
    @brief Number of layers in the frame.
    ***********************************************************/
    [CCode (cname="nb_layers")]
    public int layer_count;
}

} // namespace LibAVUtil
