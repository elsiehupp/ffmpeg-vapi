/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>
@copyright 2008 Peter Ross
***********************************************************/
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
@file audio channel layout utility functions
***********************************************************/

/***********************************************************
@addtogroup LibAVUtil.Audio
***********************************************************/

[CCode (cprefix="AV_MATRIX_ENCODING_",cheader_filename="subprojects/ffmpeg/libavutil/channel_layout.h")]
public enum MatrixEncoding {
    NONE,
    DOLBY,

    [CCode (cname="AV_MATRIX_ENCODING_DPLII")]
    DOLBY_PRO_LOGIC_II,

    [CCode (cname="AV_MATRIX_ENCODING_DPLIIX")]
    DOLBY_PRO_LOGIC_II_X,

    [CCode (cname="AV_MATRIX_ENCODING_DPLIIZ")]
    DOLBY_PRO_LOGIC_II_Z,

    [CCode (cname="AV_MATRIX_ENCODING_DOLBYEX")]
    DOLBY_EX,

    [CCode (cname="AV_MATRIX_ENCODING_DOLBYHEADPHONE")]
    DOLBY_HEADPHONE,
    NB;
}

} // namespace LibAVUtil
