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
@file API-specific header for AV_HWDEVICE_TYPE_DRM.

Internal frame allocation is not currently supported - all frames
must be allocated by the user. Thus HardwareFrameContext is always
null, though this may change if support for frame allocation is
added in future.
***********************************************************/

/***********************************************************
@brief DRM layer descriptor.

Describes a single layer within a frame. This has the structure
defined by its format, and will contain one or more planes.
***********************************************************/
[CCode (cname="struct AVDRMLayerDescriptor", cheader_filename="ffmpeg/libavutil/hwcontext_drm.h")]
public struct DRMLayerDescriptor {
    /***********************************************************
    @brief Format of the layer (DRM_FORMAT_*).
    ***********************************************************/
    [CCode (cname="format")]
    public uint32 format;

    /***********************************************************
    @brief Array of planes in this layer.
    ***********************************************************/
    [CCode (cname="planes")]
    public DRMPlaneDescriptor plane_list[MAX_PLANE_COUNT];

    /***********************************************************
    @brief Number of planes in the layer.

    This must match the number of planes required by format.
    ***********************************************************/
    [CCode (cname="nb_planes")]
    public int plane_count;

    /***********************************************************
    @brief The maximum number of layers/planes in a DRM frame.
    ***********************************************************/
    [CCode (cname="AV_DRM_MAX_PLANES", cheader_filename="ffmpeg/libavutil/hwcontext_drm.h")]
    public const size_t MAX_PLANE_COUNT;

}

} // namespace LibAVUtil
