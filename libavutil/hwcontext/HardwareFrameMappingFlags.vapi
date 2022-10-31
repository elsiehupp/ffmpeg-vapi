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
@brief Flags to apply to frame mappings.
***********************************************************/
[Flags]
[CCode (cprefix="AV_HWFRAME_MAP_", cheader_filename="libavcodec/hwcontext.h")]
public enum HardwareFrameMappingFlags {
    /***********************************************************
    @brief The mapping must be readable.
    ***********************************************************/
    [CCode (cname="")]
    READ,
    /***********************************************************
    @brief The mapping must be writeable.
    ***********************************************************/
    [CCode (cname="")]
    WRITE,
    /***********************************************************
    @brief The mapped frame will be overwritten completely in subsequent
    operations, so the current frame data need not be loaded. Any values
    which are not overwritten are unspecified.
    ***********************************************************/
    [CCode (cname="")]
    OVERWRITE,
    /***********************************************************
    @brief The mapping must be direct. That is, there must not be any copying in
    the map or unmap steps. Note that performance of direct mappings may
    be much lower than normal memory.
    ***********************************************************/
    [CCode (cname="")]
    DIRECT,
}

} // namespace LibAVUtil
