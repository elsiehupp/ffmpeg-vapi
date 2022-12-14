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
@file @ingroup lavu_crc32
Public header for CRC hash function implementation.
***********************************************************/

[CCode (cprefix="", cheader_filename="ffmpeg/libavutil/crc.h")]
public enum CRCIdentifier {
    AV_CRC_8_ATM,
    AV_CRC_16_ANSI,
    AV_CRC_16_CCITT,
    AV_CRC_32_IEEE,
    /***********************************************************
    @brief Reversed bitorder version of AV_CRC_32_IEEE
        ***********************************************************/
    AV_CRC_32_IEEE_LE,
    /***********************************************************
    @brief Reversed bitorder version of AV_CRC_16_ANSI
        ***********************************************************/
    AV_CRC_16_ANSI_LE,
    AV_CRC_24_IEEE,
    AV_CRC_8_EBU,
    /***********************************************************
    @brief Not part of public API! Do not use outside libavutil.
        ***********************************************************/
    //  AV_CRC_MAX,
}

} // namespace LibAVUtil
