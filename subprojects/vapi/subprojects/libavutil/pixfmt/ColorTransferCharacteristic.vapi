/***********************************************************
Copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at>

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

/***********************************************************
@file
pixel format definitions
***********************************************************/

//  #include "libavutil/avconfig.h"
//  #include "version.h"

namespace LibAVUtil {

/***********************************************************
Color Transfer Characteristic.
These values match the ones defined by ISO/IEC 23091-2_2019 subclause 8.2.
***********************************************************/
[CCode (cname="enum AVColorTransferCharacteristic",cheader_filename="subprojects/ffmpeg/libavutil/pixfmt.h")]
public enum LibAVUtil.ColorTransferCharacteristic {
    [CCode (cname="AVCOL_TRC_RESERVED0")]
    RESERVED0, // 0

    /***********************************************************
    @brief also ITU-R BT1361
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_BT709")]
    BT709, // 1

    [CCode (cname="AVCOL_TRC_UNSPECIFIED")]
    UNSPECIFIED, // 2

    [CCode (cname="AVCOL_TRC_RESERVED")]
    RESERVED, // 3

    /***********************************************************
    @brief also ITU-R BT470M / ITU-R BT1700 625 PAL & SECAM
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_GAMMA22")]
    GAMMA22, // 4

    /***********************************************************
    @brief also ITU-R BT470BG
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_GAMMA28")]
    GAMMA28, // 5

    /***********************************************************
    @brief also ITU-R BT601-6 525 or 625 / ITU-R BT1358 525 or 625 / ITU-R BT1700 NTSC
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_SMPTE170M")]
    SMPTE170M, // 6

    [CCode (cname="AVCOL_TRC_SMPTE240M")]
    SMPTE240M, // 7

    /***********************************************************
    @brief "Linear transfer characteristics"
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_LINEAR")]
    LINEAR, // 8

    /***********************************************************
    @brief "Logarithmic transfer characteristic (100:1 range)"
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_LOG")]
    LOG, // 9

    /***********************************************************
    @brief "Logarithmic transfer characteristic (100 * Sqrt (10) : 1 range)"
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_LOG_SQRT")]
    LOG_SQRT, // 10

    /***********************************************************
    @brief IEC 61966-2-4
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_IEC61966_2_4")]
    IEC61966_2_4, // 11

    /***********************************************************
    @brief ITU-R BT1361 Extended Colour Gamut
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_BT1361_ECG")]
    BT1361_ECG, // 12

    /***********************************************************
    @brief IEC 61966-2-1 (sRGB or sYCC)
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_IEC61966_2_1")]
    IEC61966_2_1, // 13

    /***********************************************************
    @brief ITU-R BT2020 for 10-bit system
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_BT2020_10")]
    BT2020_10, // 14

    /***********************************************************
    @brief ITU-R BT2020 for 12-bit system
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_BT2020_12")]
    BT2020_12, // 15

    /***********************************************************
    @brief SMPTE ST 2084 for 10-, 12-, 14- and 16-bit systems
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_SMPTE2084")]
    SMPTE2084, // 16

    [CCode (cname="AVCOL_TRC_SMPTEST2084")]
    SMPTEST2084, // LibAVUtil.ColorTransferCharacteristic.SMPTE2084

    /***********************************************************
    @brief SMPTE ST 428-1
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_SMPTE428")]
    SMPTE428, // 17

    [CCode (cname="AVCOL_TRC_SMPTEST428_1")]
    SMPTEST428_1, // LibAVUtil.ColorTransferCharacteristic.SMPTE428

    /***********************************************************
    @brief ARIB STD-B67, known as "Hybrid log-gamma"
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_ARIB_STD_B67")]
    ARIB_STD_B67, // 18

    /***********************************************************
    @brief Not part of ABI
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_NB")]
    NB,

    /***********************************************************
    The following entries are not part of H.273, but custom extensions
    ***********************************************************/

    [CCode (cname="AVCOL_TRC_EXT_BASE")]
    EXT_BASE, // 256

    [CCode (cname="AVCOL_TRC_V_LOG")]
    V_LOG, // LibAVUtil.ColorTransferCharacteristic.EXT_BASE

    /***********************************************************
    @brief Not part of ABI
    ***********************************************************/
    [CCode (cname="AVCOL_TRC_EXT_NB")]
    EXT_NB;
}

} // namespace LibAVUtil
