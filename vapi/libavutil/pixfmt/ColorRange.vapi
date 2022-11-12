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
@brief MPEG vs JPEG YUV range.
***********************************************************/
[CCode (cprefix="AVCOL_RANGE_", cheader_filename="ffmpeg/libavutil/pixfmt.h")]
public enum ColorRange {
    UNSPECIFIED,
    /***********************************************************
    @brief The normal 219*2^(n-8) "MPEG" YUV ranges
        ***********************************************************/
    MPEG,
    /***********************************************************
    @brief The normal 2^n-1 "JPEG" YUV ranges
        ***********************************************************/
    JPEG;

    /***********************************************************
    @brief Not part of ABI
        ***********************************************************/
    //  NB,


    /***********************************************************
    @return the name for provided color range or null if unknown.
        ***********************************************************/
    [CCode (cname="av_color_range_name", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static string av_color_range_name (
        ColorRange range
    );

    /***********************************************************
    @return the ColorRange value for name or an ErrorCode if not found.
        ***********************************************************/
    [CCode (cname="av_color_range_from_name", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static ColorRange av_color_range_from_name (
        string name
    );

}

} // namespace LibAVUtil
