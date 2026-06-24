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

[CCode (cheader_filename="subprojects/ffmpeg/libavutil/avutil.h")]
public enum PictureType {
    /***********************************************************
    @brief Undefined
    ***********************************************************/
    [CCode (name="AV_PICTURE_TYPE_NONE")]
    NONE,

    /***********************************************************
    @brief Intra
    ***********************************************************/
    [CCode (name="AV_PICTURE_TYPE_I")]
    INTRA,

    /***********************************************************
    @brief Predicted
    ***********************************************************/
    [CCode (name="AV_PICTURE_TYPE_P")]
    PREDICTED,

    /***********************************************************
    @brief Bi-dir predicted
    ***********************************************************/
    [CCode (name="AV_PICTURE_TYPE_B")]
    BIDIRECTIONAL_PREDICTED,

    /***********************************************************
    @brief S (GMC)-VOP MPEG-4
    ***********************************************************/
    [CCode (name="AV_PICTURE_TYPE_S")]
    S_GMC_VOP_MPEG4,

    /***********************************************************
    @brief Switching Intra
    ***********************************************************/
    [CCode (name="AV_PICTURE_TYPE_SI")]
    SWITCHING_INTRA,

    /***********************************************************
    @brief Switching Predicted
    ***********************************************************/
    [CCode (name="AV_PICTURE_TYPE_SP")]
    SWITCHING_PREDICTED,

    /***********************************************************
    @brief BI type
    ***********************************************************/
    [CCode (name="AV_PICTURE_TYPE_BI")]
    BI;

    /***********************************************************
    @brief Return a single letter to describe the given picture type
    pict_type.

    @param[in] pict_type the picture type @return a single character
    representing the picture type, '?' if pict_type is unknown
    ***********************************************************/
    [CCode (cname="av_get_picture_type_char",cheader_filename="subprojects/ffmpeg/libavutil/avutil.h")]
    public char to_char (
        PictureType pict_type
    );

}

} // namespace LibAVUtil
