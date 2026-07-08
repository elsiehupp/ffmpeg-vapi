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
Chromaticity coordinates of the source primaries.
These values match the ones defined by ISO/IEC 23091-2_2019 subclause 8.1 and ITU-T H.273.
***********************************************************/
[CCode (cname="enum AVColorPrimaries",cheader_filename="subprojects/ffmpeg/libavutil/pixfmt.h")]
public enum LibAVUtil.ColorPrimaries {
    [CCode (cname="AVCOL_PRI_RESERVED0")]
    RESERVED0, // 0

    /***********************************************************
    @brief also ITU-R BT1361 / IEC 61966-2-4 / SMPTE RP 177 Annex B
    ***********************************************************/
    [CCode (cname="AVCOL_PRI_BT709")]
    BT709, // 1

    [CCode (cname="AVCOL_PRI_UNSPECIFIED")]
    UNSPECIFIED, // 2

    /***********************************************************
    @brief
    ***********************************************************/
    [CCode (cname="AVCOL_PRI_RESERVED")]
    RESERVED, // 3

    /***********************************************************
    @brief also FCC Title 47 Code of Federal Regulations 73.682 (a)(20)
    ***********************************************************/
    [CCode (cname="AVCOL_PRI_BT470M")]
    BT470M, // 4


    /***********************************************************
    @brief also ITU-R BT601-6 625 / ITU-R BT1358 625 / ITU-R BT1700 625 PAL & SECAM
    ***********************************************************/
    [CCode (cname="AVCOL_PRI_BT470BG")]
    BT470BG, // 5

    /***********************************************************
    @brief also ITU-R BT601-6 525 / ITU-R BT1358 525 / ITU-R BT1700 NTSC
    ***********************************************************/
    [CCode (cname="AVCOL_PRI_SMPTE170M")]
    SMPTE170M, // 6

    /***********************************************************
    @brief identical to above, also called "SMPTE C" even though it uses D65
    ***********************************************************/
    [CCode (cname="AVCOL_PRI_SMPTE240M")]
    SMPTE240M, // 7

    /***********************************************************
    @brief colour filters using Illuminant C
    ***********************************************************/
    [CCode (cname="AVCOL_PRI_FILM")]
    FILM, // 8

    /***********************************************************
    @brief ITU-R BT2020
    ***********************************************************/
    [CCode (cname="AVCOL_PRI_BT2020")]
    BT2020, // 9

    /***********************************************************
    @brief SMPTE ST 428-1 (CIE 1931 XYZ)
    ***********************************************************/
    [CCode (cname="AVCOL_PRI_SMPTE428")]
    SMPTE428, // 10

    [CCode (cname="AVCOL_PRI_SMPTEST428_1")]
    SMPTEST428_1, // LibAVUtil.ColorPrimaries.SMPTE428,

    /***********************************************************
    @brief SMPTE ST 431-2 (2011) / DCI P3
    ***********************************************************/
    [CCode (cname="AVCOL_PRI_SMPTE431")]
    SMPTE431, // 11

    /***********************************************************
    @brief SMPTE ST 432-1 (2010) / P3 D65 / Display P3
    ***********************************************************/
    [CCode (cname="AVCOL_PRI_SMPTE432")]
    SMPTE432, // 12

    /***********************************************************
    @brief EBU Tech. 3213-E (nothing there) / one of JEDEC P22 group phosphors
    ***********************************************************/
    [CCode (cname="AVCOL_PRI_EBU3213")]
    EBU3213, // 22

    [CCode (cname="AVCOL_PRI_JEDEC_P22")]
    JEDEC_P22, // LibAVUtil.ColorPrimaries.EBU3213,

    /***********************************************************
    @brief Not part of ABI
    ***********************************************************/
    [CCode (cname="AVCOL_PRI_NB")]
    NB,

    /***********************************************************
    The following entries are not part of H.273, but custom extensions
    ***********************************************************/

    [CCode (cname="AVCOL_PRI_EXT_BASE")]
    EXT_BASE, // 256

    [CCode (cname="AVCOL_PRI_V_GAMUT")]
    V_GAMUT, // LibAVUtil.ColorPrimaries.EXT_BASE

    /***********************************************************
    @brief Not part of ABI
    ***********************************************************/
    [CCode (cname="AVCOL_PRI_EXT_NB")]
    EXT_NB;
}

} // namespace LibAVUtil
