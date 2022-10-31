/***********************************************************
@brief Pixel format descriptor
@copyright 2009 Michael Niedermayer <michaelni@gmx.at>

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

[Flags]
[CCode (cprefix="FF_LOSS_", cheader_filename="libavcodec/pixdesc.h")]
public enum PixelLossFlags {
    /***********************************************************
    @brief Loss due to resolution change
    ***********************************************************/
    RESOLUTION,
    /***********************************************************
    @brief Loss due to color depth change
    ***********************************************************/
    DEPTH,
    /***********************************************************
    @brief Loss due to color space conversion
    ***********************************************************/
    COLORSPACE,
    /***********************************************************
    @brief Loss of alpha bits
    ***********************************************************/
    ALPHA,
    /***********************************************************
    @brief Loss due to color quantization
    ***********************************************************/
    [CCode (cname="FF_LOSS_COLORQUANT")]
    COLOR_QUANTIZATION,
    /***********************************************************
    @brief Loss of chroma (e.g. RGB to gray conversion)
    ***********************************************************/
    CHROMA;


    /***********************************************************
    @brief Compute what kind of losses will occur when converting from one specific
    pixel format to another.
    When converting from one pixel format to another, information loss may occur.
    For example, when converting from RGB24 to GRAY, the color information will
    be lost. Similarly, other losses occur when converting from some formats to
    other formats. These losses can involve loss of chroma, but also loss of
    resolution, loss of color depth, loss due to the color space conversion, loss
    of the alpha bits or loss due to color quantization.
    av_get_fix_fmt_loss () informs you about the various types of losses
    which will occur when converting from one pixel format to another.

    @param[in] output_pix_fmt destination pixel format
    @param[in] input_pix_fmt source pixel format
    @param[in] has_alpha Whether the source pixel format alpha channel is used.
    @return Combination of flags informing you what kind of losses will occur
    (maximum loss for an invalid output_pix_fmt).
    ***********************************************************/
    [CCode (cname="av_get_pix_fmt_loss", cheader_filename="libavcodec/pixdesc.h")]
    public static PixelLossFlags av_get_pix_fmt_loss (
        PixelFormat output_pix_fmt,
        PixelFormat input_pix_fmt,
        int has_alpha
    );


    /***********************************************************
    @brief Compute what kind of losses will occur when converting from one specific
    pixel format to another.
    When converting from one pixel format to another, information loss may occur.
    For example, when converting from RGB24 to GRAY, the color information will
    be lost. Similarly, other losses occur when converting from some formats to
    other formats. These losses can involve loss of chroma, but also loss of
    resolution, loss of color depth, loss due to the color space conversion, loss
    of the alpha bits or loss due to color quantization.
    av_get_fix_fmt_loss () informs you about the various types of losses
    which will occur when converting from one pixel format to another.

    @param[in] output_pix_fmt destination pixel format
    @param[in] input_pix_fmt source pixel format
    @param[in] has_alpha Whether the source pixel format alpha channel is used.
    @return Combination of flags informing you what kind of losses will occur
        (maximum loss for an invalid output_pix_fmt).
    ***********************************************************/
    [CCode (cname="av_find_best_pix_fmt_of_2", cheader_filename="libavcodec/pixdesc.h")]
    public static PixelFormat av_find_best_pix_fmt_of_2 (
        PixelFormat output_pix_fmt1,
        PixelFormat output_pix_fmt2,
        PixelFormat input_pix_fmt,
        int has_alpha,
        out PixelLossFlags loss_ptr
    );

}

} // namespace LibAVUtil
