/***********************************************************
@copyright 2014 Tim Walker <tdskywalker@gmail.com>

This file is part of FFmpeg.

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
audio downmix medatata
***********************************************************/

/***********************************************************
@addtogroup LibAVUtil.Audio
***********************************************************/

/***********************************************************
@defgroup downmix_info Audio downmix metadata
***********************************************************/

/***********************************************************
@brief Possible downmix types.
***********************************************************/
[CCode (cprefix="AV_DOWNMIX_TYPE_", cheader_filename="libavcodec/downmix_info.h")]
public enum DownMixType {
    /***********************************************************
    @brief Not indicated.
    ***********************************************************/
    UNKNOWN,
    /***********************************************************
    @brief Lo/Ro 2-channel downmix (Stereo).
    ***********************************************************/
    LORO,
    /***********************************************************
    @brief Lt/Rt 2-channel downmix, Dolby Surround compatible.
    ***********************************************************/
    LTRT,
    /***********************************************************
    @brief Lt/Rt 2-channel downmix, Dolby Pro Logic II compatible.
    ***********************************************************/
    DPLII,
    /***********************************************************
    @brief Number of downmix types. Not part of ABI.
    ***********************************************************/
    //  DownMixType.NB
}

} // namespace LibAVUtil
