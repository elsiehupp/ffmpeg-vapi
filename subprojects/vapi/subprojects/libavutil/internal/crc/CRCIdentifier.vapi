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

[CCode (cname="enum AVCRCId",cprefix="AV_CRC_",cheader_filename="subprojects/ffmpeg/libavutil/crc.h")]
public enum CRCIdentifier {
    @8_ATM,
    @16_ANSI,
    @16_CCITT,
    @32_IEEE,

    /***********************************************************
    @brief Reversed bitorder version of CRCIdentifier.32_IEEE
    ***********************************************************/
    @32_IEEE_LE,

    /***********************************************************
    @brief Reversed bitorder version of CRCIdentifier.16_ANSI
    ***********************************************************/
    @16_ANSI_LE,
    @24_IEEE,
    @8_EBU,

    /***********************************************************
    @brief Not part of public API! Do not use outside libavutil.
    ***********************************************************/
    //  MAX;
}

} // namespace LibAVUtil
