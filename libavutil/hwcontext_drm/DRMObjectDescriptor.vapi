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
@brief DRM object descriptor.

Describes a single DRM object, addressing it as a PRIME file
descriptor.
***********************************************************/
[CCode (cname="struct AVDRMObjectDescriptor", cheader_filename="libavcodec/hwcontext_drm.h")]
public struct DRMObjectDescriptor {
    /***********************************************************
    @brief DRM PRIME fd for the object.
    ***********************************************************/
    [CCode (cname="fd")]
    public int file_descriptor;

    /***********************************************************
    @brief Total size of the object.

    (This includes any parts not which do not contain image data.)
    ***********************************************************/
    [CCode (cname="size")]
    public size_t size;

    /***********************************************************
    @brief Format modifier applied to the object (DRM_FORMAT_MOD_*).

    If the format modifier is unknown then this should be set to
    DRM_FORMAT_MOD_INVALID.
    ***********************************************************/
    [CCode (cname="format_modifier")]
    public uint64 format_modifier;
}

} // namespace LibAVUtil
