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
YUV colorspace type.
These values match the ones defined by ISO/IEC 23091-2_2019 subclause 8.3.
***********************************************************/
[CCode (cname="enum AVColorSpace",cheader_filename="subprojects/ffmpeg/libavutil/pixfmt.h")]
public enum LibAVUtil.ColorSpace {
    /***********************************************************
    @brief order of coefficients is actually GBR, also IEC 61966-2-1 (sRGB), YZX and ST 428-1
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_RGB")]
    AVCOL_SPC_RGB, // 0

    /***********************************************************
    @brief also ITU-R BT1361 / IEC 61966-2-4 xvYCC709 / derived in SMPTE RP 177 Annex B
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_BT709")]
    AVCOL_SPC_BT709, // 1

    [CCode (cname="AVCOL_SPC_UNSPECIFIED")]
    AVCOL_SPC_UNSPECIFIED, // 2

    /***********************************************************
    @brief reserved for future use by ITU-T and ISO/IEC just like 15-255 are
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_RESERVED")]
    AVCOL_SPC_RESERVED, // 3

    /***********************************************************
    @brief FCC Title 47 Code of Federal Regulations 73.682 (a)(20)
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_FCC")]
    AVCOL_SPC_FCC, // 4

    /***********************************************************
    @brief also ITU-R BT601-6 625 / ITU-R BT1358 625 / ITU-R BT1700 625 PAL & SECAM / IEC 61966-2-4 xvYCC601
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_BT470BG")]
    AVCOL_SPC_BT470BG, // 5

    /***********************************************************
    @brief also ITU-R BT601-6 525 / ITU-R BT1358 525 / ITU-R BT1700 NTSC / functionally identical to above
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_SMPTE170M")]
    AVCOL_SPC_SMPTE170M, // 6

    /***********************************************************
    @brief derived from 170M primaries and D65 white point, 170M is derived from BT470 System M's primaries
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_SMPTE240M")]
    AVCOL_SPC_SMPTE240M, // 7

    /***********************************************************
    @brief used by Dirac / VC-2 and H.264 FRext, see ITU-T SG16
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_YCGCO")]
    AVCOL_SPC_YCGCO, // 8

    [CCode (cname="AVCOL_SPC_YCOCG")]
    AVCOL_SPC_YCOCG, // AVCOL_SPC_YCGCO

    /***********************************************************
    @brief ITU-R BT2020 non-constant luminance system
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_BT2020_NCL")]
    AVCOL_SPC_BT2020_NCL, // 9

    /***********************************************************
    @brief ITU-R BT2020 constant luminance system
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_BT2020_CL")]
    AVCOL_SPC_BT2020_CL, // 10

    /***********************************************************
    @brief SMPTE 2085, Y'D'zD'x
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_SMPTE2085")]
    AVCOL_SPC_SMPTE2085, // 11

    /***********************************************************
    @brief Chromaticity-derived non-constant luminance system
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_CHROMA_DERIVED_NCL")]
    AVCOL_SPC_CHROMA_DERIVED_NCL, // 12

    /***********************************************************
    @brief Chromaticity-derived constant luminance system
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_CHROMA_DERIVED_CL")]
    AVCOL_SPC_CHROMA_DERIVED_CL, // 13

    /***********************************************************
    @brief ITU-R BT.2100-0, ICtCp
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_ICTCP")]
    AVCOL_SPC_ICTCP, // 14

    /***********************************************************
    @brief SMPTE ST 2128, IPT-C2
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_IPT_C2")]
    AVCOL_SPC_IPT_C2, // 15

    /***********************************************************
    @brief YCgCo-R, even addition of bits
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_YCGCO_RE")]
    AVCOL_SPC_YCGCO_RE, // 16

    /***********************************************************
    @brief YCgCo-R, odd addition of bits
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_YCGCO_RO")]
    AVCOL_SPC_YCGCO_RO, // 17

    /***********************************************************
    @brief Not part of ABI
    ***********************************************************/
    [CCode (cname="AVCOL_SPC_NB")]
    AVCOL_SPC_NB;
}

} // namespace LibAVUtil
