/***********************************************************
@brief Pixel format descriptor
@copyright 2009 Michael Niedermayer <michaelni@gmx.at>
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

[Flags]
[CCode (cprefix="", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
public enum PixelFormatFlags {
    /***********************************************************
    @brief Pixel format is big-endian.
        ***********************************************************/
    AV_PIX_FMT_FLAG_BE,
    /***********************************************************
    @brief Pixel format has a palette in data[1], values are indexes in this palette.
        ***********************************************************/
    AV_PIX_FMT_FLAG_PAL,
    /***********************************************************
    @brief All values of a component are bit-wise packed end to end.
        ***********************************************************/
    AV_PIX_FMT_FLAG_BITSTREAM,
    /***********************************************************
    @brief Pixel format is a hardware accelerated format.
        ***********************************************************/
    AV_PIX_FMT_FLAG_HWACCEL,
    /***********************************************************
    @brief At least one pixel component is not in the first data plane.
        ***********************************************************/
    AV_PIX_FMT_FLAG_PLANAR,
    /***********************************************************
    @brief The pixel format contains RGB-like data (as opposed to YUV/grayscale).
        ***********************************************************/
    AV_PIX_FMT_FLAG_RGB,

    /***********************************************************
    @brief The pixel format is "pseudo-paletted". This means that it contains a
    fixed palette in the 2nd plane but the palette is fixed/constant for each
    PIX_FMT. This allows interpreting the data as if it was PAL8, which can
    in some cases be simpler. Or the data can be interpreted purely based on
    the pixel format without using the palette.
    An example of a pseudo-paletted format is PixelFormat.GRAY8

    @deprecated This flag is deprecated, and will be removed. When it is removed,
    the extra palette allocation in Frame.data[1] is removed as well. Only
    actual paletted formats (as indicated by AV_PIX_FMT_FLAG_PAL) will have a
    palette. Starting with FFmpeg versions which have this flag deprecated, the
    extra "pseudo" palette is already ignored, and API users are not required to
    allocate a palette for AV_PIX_FMT_FLAG_PSEUDOPAL formats (it was required
    before the deprecation, though).
        ***********************************************************/
    AV_PIX_FMT_FLAG_PSEUDOPAL,

    /***********************************************************
    @brief The pixel format has an alpha channel. This is set on all formats that
    support alpha in some way, including PixelFormat.PAL8. The alpha is always
    straight, never pre-multiplied.

    If a codec or a filter does not support alpha, it should set all alpha to
    opaque, or use the equivalent pixel formats without alpha component, e.g.
    PixelFormat.RGB0 (or PixelFormat.RGB24 etc.) instead of PixelFormat.RGBA.
        ***********************************************************/
    AV_PIX_FMT_FLAG_ALPHA,

    /***********************************************************
    @brief The pixel format is following a Bayer pattern
        ***********************************************************/
    AV_PIX_FMT_FLAG_BAYER,

    /***********************************************************
    @brief The pixel format contains IEEE-754 floating point values. Precision (double,
    single, or half) should be determined by the pixel size (64, 32, or 16 bits).
        ***********************************************************/
    AV_PIX_FMT_FLAG_FLOAT,
}

} // namespace LibAVUtil
