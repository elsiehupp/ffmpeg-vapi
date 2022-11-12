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
@brief Chromaticity coordinates of the source primaries.
These values match the ones defined by ISO/IEC 23001-8_2013 § 7.1.
***********************************************************/
[CCode (cprefix="AVCOL_PRI_", cheader_filename="ffmpeg/libavutil/pixfmt.h")]
public enum ColorPrimaries {
    RESERVED0,
    /***********************************************************
    @brief Also ITU-R BT1361 / IEC 61966-2-4 / SMPTE RP177 Annex B
    ***********************************************************/
    BT709,
    UNSPECIFIED,
    RESERVED,
    /***********************************************************
    @brief Also FCC Title 47 Code of Federal Regulations 73.682 (a)(20)
    ***********************************************************/
    BT470M,
    /***********************************************************
    @brief Also ITU-R BT601-6 625 / ITU-R BT1358 625 / ITU-R BT1700 625 PAL & SECAM
    ***********************************************************/
    BT470BG,
    /***********************************************************
    @brief Also ITU-R BT601-6 525 / ITU-R BT1358 525 / ITU-R BT1700 NTSC
    ***********************************************************/
    SMPTE170M,
    /***********************************************************
    @brief Functionally identical to above ColorPrimaries.SMPTE170M
    ***********************************************************/
    SMPTE240M,
    /***********************************************************
    @brief Colour filters using Illuminant C
    ***********************************************************/
    FILM,
    /***********************************************************
    @brief ITU-R BT2020
    ***********************************************************/
    BT2020,
    /***********************************************************
    @brief SMPTE ST 428-1 (CIE 1931 XYZ)
    ***********************************************************/
    SMPTE428,
    /***********************************************************
    @brief ColorPrimaries.SMPTEST428_1 = ColorPrimaries.SMPTE428
    ***********************************************************/
    SMPTEST428_1,
    /***********************************************************
    @brief SMPTE ST 431-2 (2011) / DCI P3
    ***********************************************************/
    SMPTE431,
    /***********************************************************
    @brief SMPTE ST 432-1 (2010) / P3 D65 / Display P3
    ***********************************************************/
    SMPTE432,
    /***********************************************************
    @brief JEDEC P22 phosphors
    ***********************************************************/
    JEDEC_P22;

    /***********************************************************
    @brief Not part of ABI
    ***********************************************************/
    //  ColorPrimaries.NB


    /***********************************************************
    @return the name for provided color primaries or null if unknown.
    ***********************************************************/
    [CCode (cname="av_color_primaries_name", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static string av_color_primaries_name (
        ColorPrimaries primaries
    );

    /***********************************************************
    @return the ColorPrimaries value for name or an ErrorCode if not found.
    ***********************************************************/
    [CCode (cname="av_color_primaries_from_name", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static ColorPrimaries av_color_primaries_from_name (
        string name
    );

}

} // namespace LibAVUtil
