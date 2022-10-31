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

[CCode (cprefix="", cheader_filename="libavcodec/frame.h")]
public enum ActiveFormatDescription {
    AV_AFD_SAME,
    AV_AFD_4_3,
    AV_AFD_16_9,
    AV_AFD_14_9,
    AV_AFD_4_3_SP_14_9,
    AV_AFD_16_9_SP_14_9,
    AV_AFD_SP_4_3,
}

} // namespace LibAVUtil
