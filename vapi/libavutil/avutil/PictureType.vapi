/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>
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
@defgroup lavu_picture Image related

AVPicture types, pixel formats and basic image planes manipulation.
***********************************************************/

[CCode (cprefix="", cheader_filename="ffmpeg/libavutil/avutil.h")]
public enum PictureType {
    /***********************************************************
    @brief Undefined
        ***********************************************************/
    AV_PICTURE_TYPE_NONE,
    /***********************************************************
    @brief Intra
        ***********************************************************/
    AV_PICTURE_TYPE_I,
    /***********************************************************
    @brief Predicted
        ***********************************************************/
    AV_PICTURE_TYPE_P,
    /***********************************************************
    @brief Bi-dir predicted
        ***********************************************************/
    AV_PICTURE_TYPE_B,
    /***********************************************************
    @brief S (GMC)-VOP MPEG-4
        ***********************************************************/
    AV_PICTURE_TYPE_S,
    /***********************************************************
    @brief Switching Intra
        ***********************************************************/
    AV_PICTURE_TYPE_SI,
    /***********************************************************
    @brief Switching Predicted
        ***********************************************************/
    AV_PICTURE_TYPE_SP,
    /***********************************************************
    @brief BI type
        ***********************************************************/
    AV_PICTURE_TYPE_BI,
}

} // namespace LibAVUtil
