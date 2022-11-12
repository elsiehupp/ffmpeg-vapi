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
@brief DRM plane descriptor.

Describes a single plane of a layer, which is contained within
a single object.
***********************************************************/
[CCode (cname="struct AVDRMPlaneDescriptor", cheader_filename="ffmpeg/libavutil/hwcontext_drm.h")]
public struct DRMPlaneDescriptor {
    /***********************************************************
    @brief Index of the object containing this plane in the objects
    array of the enclosing frame descriptor.
        ***********************************************************/
    [CCode (cname="object_index")]
    public int object_index;

    /***********************************************************
    @brief Offset within that object of this plane.
        ***********************************************************/
    [CCode (cname="offset")]
    public size_t offset;

    /***********************************************************
    @brief Pitch (linesize) of this plane.
        ***********************************************************/
    [CCode (cname="pitch")]
    public size_t pitch;
}

} // namespace LibAVUtil
