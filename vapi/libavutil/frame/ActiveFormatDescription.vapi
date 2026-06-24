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
@file @ingroup lavu_frame
reference-counted frame API
***********************************************************/

[CCode (cprefix="AV_AFD_",cheader_filename="subprojects/ffmpeg/libavutil/frame.h")]
public enum ActiveFormatDescription {
    SAME,
    @4_3,
    @16_9,
    @14_9,
    @4_3_SP_14_9,
    @16_9_SP_14_9,
    SP_4_3;
}

} // namespace LibAVUtil
