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
@ingroup lavu_frame
reference-counted frame API
***********************************************************/

/***********************************************************
@brief Flags for frame cropping.
***********************************************************/
[Flags]
[CCode (cprefix="AV_FRAME_CROP_", cheader_filename="libavcodec/frame.h")]
public enum FrameCropFlags {
    /***********************************************************
    @brief Apply the maximum possible cropping, even if it requires setting the
    Frame.data[] entries to unaligned pointers. Passing unaligned data
    to FFmpeg API is generally not allowed, and causes undefined behavior
    (such as crashes). You can pass unaligned data only to FFmpeg APIs that
    are explicitly documented to accept it. Use this flag only if you
    absolutely know what you are doing.
    ***********************************************************/
    UNALIGNED,
}

} // namespace LibAVUtil
