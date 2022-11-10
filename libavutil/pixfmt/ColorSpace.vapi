/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>
***********************************************************/
/***********************************************************
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
@brief YUV colorspace type.
These values match the ones defined by ISO/IEC 23001-8_2013 § 7.3.
***********************************************************/
[CCode (cprefix="AVCOL_SPC_", cheader_filename="ffmpeg/libavutil/pixfmt.h")]
public enum ColorSpace {
    /***********************************************************
    @brief Order of coefficients is actually GBR, also IEC 61966-2-1 (sRGB)
    ***********************************************************/
    RGB,
    /***********************************************************
    @brief Also ITU-R BT1361 / IEC 61966-2-4 xvYCC709 / SMPTE RP177 Annex B
    ***********************************************************/
    BT709,
    UNSPECIFIED,
    RESERVED,
    /***********************************************************
    @brief FCC Title 47 Code of Federal Regulations 73.682 (a)(20)
    ***********************************************************/
    FCC,
    /***********************************************************
    @brief Also ITU-R BT601-6 625 / ITU-R BT1358 625 / ITU-R BT1700 625 PAL & SECAM / IEC 61966-2-4 xvYCC601
    ***********************************************************/
    BT470BG,
    /***********************************************************
    @brief Also ITU-R BT601-6 525 / ITU-R BT1358 525 / ITU-R BT1700 NTSC
    ***********************************************************/
    SMPTE170M,
    /***********************************************************
    @brief Functionally identical to ColorSpace.SMPTE170M
    ***********************************************************/
    SMPTE240M,
    /***********************************************************
    @brief Used by Dirac / VC-2 and H.264 FRext, see ITU-T SG16
    ***********************************************************/
    YCGCO,
    /***********************************************************
    @brief ColorSpace.YCOCG = ColorSpace.YCGCO
    ***********************************************************/
    YCOCG,
    /***********************************************************
    @brief ITU-R BT2020 non-constant luminance system
    ***********************************************************/
    BT2020_NCL,
    /***********************************************************
    @brief ITU-R BT2020 constant luminance system
    ***********************************************************/
    BT2020_CL,
    /***********************************************************
    @brief SMPTE 2085, Y'D'zD'x
    ***********************************************************/
    SMPTE2085,
    /***********************************************************
    @brief Chromaticity-derived non-constant luminance system
    ***********************************************************/
    CHROMA_DERIVED_NCL,
    /***********************************************************
    @brief Chromaticity-derived constant luminance system
    ***********************************************************/
    CHROMA_DERIVED_CL,
    /***********************************************************
    @brief ITU-R BT.2100-0, ICtCp
    ***********************************************************/
    ICTCP;
    /***********************************************************
    @brief Not part of ABI
    ***********************************************************/
    //  NB


    /***********************************************************
    @return the name for provided color space or null if unknown.
    ***********************************************************/
    [CCode (cname="av_color_space_name", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static string av_color_space_name (
        ColorSpace space
    );

    /***********************************************************
    @return the ColorSpace value for name or an ErrorCode if not found.
    ***********************************************************/
    [CCode (cname="av_color_space_from_name", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static ColorSpace av_color_space_from_name (
        string name
    );

}

} // namespace LibAVUtil
