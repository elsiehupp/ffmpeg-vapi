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
Pixel format.

@note
LibAVUtil.PixelFormat.RGB32 is handled in an endian-specific manner. An RGBA
color is put together as:
 (A << 24) | (R << 16) | (G << 8) | B
This is stored as BGRA on little-endian CPU architectures and ARGB on
big-endian CPUs.

@note
If the resolution is not a multiple of the chroma subsampling factor
then the chroma plane resolution must be rounded up.

@par
When the pixel format is palettized RGB32 (LibAVUtil.PixelFormat.PAL8), the palettized
image data is stored in LibAVFormat.Frame.data[0]. The palette is transported in
LibAVFormat.Frame.data[1], is 1024 bytes long (256 4-byte entries) and is
formatted the same as in, // LibAVUtil.PixelFormat.RGB32 described above (i.e., it is
also endian-specific). Note also that the individual RGB32 palette
components stored in LibAVFormat.Frame.data[1] should be in the range 0..255.
This is important as many custom PAL8 video codecs that were designed
to run on the IBM VGA graphics adapter use 6-bit palette components.

@par
For all the 8 bits per pixel formats, an RGB32 palette is in data[1] like
for pal8. This palette is filled in automatically by the function
allocating the picture.
***********************************************************/
[CCode (cname="enum AVPixelFormat",cprefix="AV_PIX_FMT_",cheader_filename="subprojects/ffmpeg/libavutil/pixfmt.h")]
public enum LibAVUtil.PixelFormat {
    NONE, //, // -1,

    /***********************************************************
    @brief planar YUV 4:2:0, 12bpp, (1 Cr & Cb sample per 2x2 Y samples)
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV420P,

    /***********************************************************
    @brief packed YUV 4:2:2, 16bpp, Y0 Cb Y1 Cr
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUYV422,

    /***********************************************************
    @brief packed RGB 8:8:8, 24bpp, RGBRGB...
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGB24,

    /***********************************************************
    @brief packed RGB 8:8:8, 24bpp, BGRBGR...
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGR24,

    /***********************************************************
    @brief planar YUV 4:2:2, 16bpp, (1 Cr & Cb sample per 2x1 Y samples)
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV422P,

    /***********************************************************
    @brief planar YUV 4:4:4, 24bpp, (1 Cr & Cb sample per 1x1 Y samples)
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV444P,

    /***********************************************************
    @brief planar YUV 4:1:0,  9bpp, (1 Cr & Cb sample per 4x4 Y samples)
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV410P,

    /***********************************************************
    @brief planar YUV 4:1:1, 12bpp, (1 Cr & Cb sample per 4x1 Y samples)
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV411P,

    /***********************************************************
    @brief        Y        ,  8bpp
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAY8,

    /***********************************************************
    @brief       Y        ,  1bpp, 0 is white, 1 is black, in each byte pixels are ordered from the msb to the lsb
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    MONOWHITE,

    /***********************************************************
    @brief        Y        ,  1bpp, 0 is black, 1 is white, in each byte pixels are ordered from the msb to the lsb
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    MONOBLACK,

    /***********************************************************
    @brief 8 bits with, // LibAVUtil.PixelFormat.RGB32 palette
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    PAL8,

    /***********************************************************
    @brief planar YUV 4:2:0, 12bpp, full scale (JPEG), deprecated in favor of, // LibAVUtil.PixelFormat.YUV420P and setting color_range
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVJ420P,

    /***********************************************************
    @brief planar YUV 4:2:2, 16bpp, full scale (JPEG), deprecated in favor of, // LibAVUtil.PixelFormat.YUV422P and setting color_range
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVJ422P,

    /***********************************************************
    @brief planar YUV 4:4:4, 24bpp, full scale (JPEG), deprecated in favor of, // LibAVUtil.PixelFormat.YUV444P and setting color_range
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVJ444P,

    /***********************************************************
    @brief packed YUV 4:2:2, 16bpp, Cb Y0 Cr Y1
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    UYVY422,

    /***********************************************************
    @brief packed YUV 4:1:1, 12bpp, Cb Y0 Y1 Cr Y2 Y3
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    UYYVYY411,

    /***********************************************************
    @brief packed RGB 3:3:2,  8bpp, (msb)2B 3G 3R (lsb)
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGR8,

    /***********************************************************
    @brief packed RGB 1:2:1 bitstream,  4bpp, (msb)1B 2G 1R (lsb), a byte contains two pixels, the first pixel in the byte is the one composed by the 4 msb bits
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGR4,

    /***********************************************************
    @brief packed RGB 1:2:1,  8bpp, (msb)1B 2G 1R (lsb)
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGR4_BYTE,

    /***********************************************************
    @brief packed RGB 3:3:2,  8bpp, (msb)3R 3G 2B (lsb)
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGB8,

    /***********************************************************
    @brief packed RGB 1:2:1 bitstream,  4bpp, (msb)1R 2G 1B (lsb), a byte contains two pixels, the first pixel in the byte is the one composed by the 4 msb bits
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGB4,

    /***********************************************************
    @brief packed RGB 1:2:1,  8bpp, (msb)1R 2G 1B (lsb)
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGB4_BYTE,

    /***********************************************************
    @brief planar YUV 4:2:0, 12bpp, 1 plane for Y and 1 plane for the UV components, which are interleaved (first byte U and the following byte V)
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    NV12,

    /***********************************************************
    @brief as above, but U and V bytes are swapped
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    NV21,


    /***********************************************************
    @brief packed ARGB 8:8:8:8, 32bpp, ARGBARGB...
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    ARGB,

    /***********************************************************
    @brief packed RGBA 8:8:8:8, 32bpp, RGBARGBA...
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGBA,

    /***********************************************************
    @brief packed ABGR 8:8:8:8, 32bpp, ABGRABGR...
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    ABGR,

    /***********************************************************
    @brief packed BGRA 8:8:8:8, 32bpp, BGRABGRA...
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGRA,


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAY16BE, ///<        Y        , 16bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAY16LE, ///<        Y        , 16bpp, little-endian

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV440P, ///< planar YUV 4:4:0 (1 Cr & Cb sample per 1x2 Y samples)

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVJ440P, ///< planar YUV 4:4:0 full scale (JPEG), deprecated in favor of, // LibAVUtil.PixelFormat.YUV440P and setting color_range

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA420P, ///< planar YUV 4:2:0, 20bpp, (1 Cr & Cb sample per 2x2 Y & A samples),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGB48BE, ///< packed RGB 16:16:16, 48bpp, 16R, 16G, 16B, the 2-byte value for each R/G/B component is stored as big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGB48LE, ///< packed RGB 16:16:16, 48bpp, 16R, 16G, 16B, the 2-byte value for each R/G/B component is stored as little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGB565BE, ///< packed RGB 5:6:5, 16bpp, (msb)   5R 6G 5B (lsb), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGB565LE, ///< packed RGB 5:6:5, 16bpp, (msb)   5R 6G 5B (lsb), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGB555BE, ///< packed RGB 5:5:5, 16bpp, (msb)1X 5R 5G 5B (lsb), big-endian   , X=unused/undefined,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGB555LE, ///< packed RGB 5:5:5, 16bpp, (msb)1X 5R 5G 5B (lsb), little-endian, X=unused/undefined


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGR565BE, ///< packed BGR 5:6:5, 16bpp, (msb)   5B 6G 5R (lsb), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGR565LE, ///< packed BGR 5:6:5, 16bpp, (msb)   5B 6G 5R (lsb), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGR555BE, ///< packed BGR 5:5:5, 16bpp, (msb)1X 5B 5G 5R (lsb), big-endian   , X=unused/undefined,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGR555LE, ///< packed BGR 5:5:5, 16bpp, (msb)1X 5B 5G 5R (lsb), little-endian, X=unused/undefined,

    /***********************************************************
    Hardware acceleration through VA-API, data[3] contains a
    VASurfaceID.
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    VAAPI,


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV420P16LE, ///< planar YUV 4:2:0, 24bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV420P16BE, ///< planar YUV 4:2:0, 24bpp, (1 Cr & Cb sample per 2x2 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV422P16LE, ///< planar YUV 4:2:2, 32bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV422P16BE, ///< planar YUV 4:2:2, 32bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV444P16LE, ///< planar YUV 4:4:4, 48bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV444P16BE, ///< planar YUV 4:4:4, 48bpp, (1 Cr & Cb sample per 1x1 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    DXVA2_VLD, ///< HW decoding through DXVA2, Picture.data[3] contains a LPDIRECT3DSURFACE9 pointer


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGB444LE, ///< packed RGB 4:4:4, 16bpp, (msb)4X 4R 4G 4B (lsb), little-endian, X=unused/undefined,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGB444BE, ///< packed RGB 4:4:4, 16bpp, (msb)4X 4R 4G 4B (lsb), big-endian,    X=unused/undefined,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGR444LE, ///< packed BGR 4:4:4, 16bpp, (msb)4X 4B 4G 4R (lsb), little-endian, X=unused/undefined,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGR444BE, ///< packed BGR 4:4:4, 16bpp, (msb)4X 4B 4G 4R (lsb), big-endian,    X=unused/undefined,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YA8, ///< 8 bits gray, 8 bits alpha


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    Y400A, //, //, // LibAVUtil.PixelFormat.YA8, ///< alias for, // LibAVUtil.PixelFormat.YA8,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAY8A, //, //, // LibAVUtil.PixelFormat.YA8, ///< alias for, // LibAVUtil.PixelFormat.YA8


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGR48BE, ///< packed RGB 16:16:16, 48bpp, 16B, 16G, 16R, the 2-byte value for each R/G/B component is stored as big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGR48LE, ///< packed RGB 16:16:16, 48bpp, 16B, 16G, 16R, the 2-byte value for each R/G/B component is stored as little-endian,

    /***********************************************************
    The following 12 formats have the disadvantage of needing 1 format for each bit depth.
    Notice that each 9/10 bits sample is stored in 16 bits with extra padding.
    If you want to support multiple bit depths, then using, // LibAVUtil.PixelFormat.YUV420P16* with the bpp stored separately is better.
    ***********************************************************/

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV420P9BE, ///< planar YUV 4:2:0, 13.5bpp, (1 Cr & Cb sample per 2x2 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV420P9LE, ///< planar YUV 4:2:0, 13.5bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV420P10BE,///< planar YUV 4:2:0, 15bpp, (1 Cr & Cb sample per 2x2 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV420P10LE,///< planar YUV 4:2:0, 15bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV422P10BE,///< planar YUV 4:2:2, 20bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV422P10LE,///< planar YUV 4:2:2, 20bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV444P9BE, ///< planar YUV 4:4:4, 27bpp, (1 Cr & Cb sample per 1x1 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV444P9LE, ///< planar YUV 4:4:4, 27bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV444P10BE,///< planar YUV 4:4:4, 30bpp, (1 Cr & Cb sample per 1x1 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV444P10LE,///< planar YUV 4:4:4, 30bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV422P9BE, ///< planar YUV 4:2:2, 18bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV422P9LE, ///< planar YUV 4:2:2, 18bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRP, ///< planar GBR 4:4:4 24bpp,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBR24P, //, //, // LibAVUtil.PixelFormat.GBRP, // alias for #LibAVUtil.PixelFormat.GBRP,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRP9BE, ///< planar GBR 4:4:4 27bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRP9LE, ///< planar GBR 4:4:4 27bpp, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRP10BE, ///< planar GBR 4:4:4 30bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRP10LE, ///< planar GBR 4:4:4 30bpp, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRP16BE, ///< planar GBR 4:4:4 48bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRP16LE, ///< planar GBR 4:4:4 48bpp, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA422P, ///< planar YUV 4:2:2 24bpp, (1 Cr & Cb sample per 2x1 Y & A samples),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA444P, ///< planar YUV 4:4:4 32bpp, (1 Cr & Cb sample per 1x1 Y & A samples),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA420P9BE, ///< planar YUV 4:2:0 22.5bpp, (1 Cr & Cb sample per 2x2 Y & A samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA420P9LE, ///< planar YUV 4:2:0 22.5bpp, (1 Cr & Cb sample per 2x2 Y & A samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA422P9BE, ///< planar YUV 4:2:2 27bpp, (1 Cr & Cb sample per 2x1 Y & A samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA422P9LE, ///< planar YUV 4:2:2 27bpp, (1 Cr & Cb sample per 2x1 Y & A samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA444P9BE, ///< planar YUV 4:4:4 36bpp, (1 Cr & Cb sample per 1x1 Y & A samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA444P9LE, ///< planar YUV 4:4:4 36bpp, (1 Cr & Cb sample per 1x1 Y & A samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA420P10BE, ///< planar YUV 4:2:0 25bpp, (1 Cr & Cb sample per 2x2 Y & A samples, big-endian),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA420P10LE, ///< planar YUV 4:2:0 25bpp, (1 Cr & Cb sample per 2x2 Y & A samples, little-endian),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA422P10BE, ///< planar YUV 4:2:2 30bpp, (1 Cr & Cb sample per 2x1 Y & A samples, big-endian),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA422P10LE, ///< planar YUV 4:2:2 30bpp, (1 Cr & Cb sample per 2x1 Y & A samples, little-endian),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA444P10BE, ///< planar YUV 4:4:4 40bpp, (1 Cr & Cb sample per 1x1 Y & A samples, big-endian),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA444P10LE, ///< planar YUV 4:4:4 40bpp, (1 Cr & Cb sample per 1x1 Y & A samples, little-endian),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA420P16BE, ///< planar YUV 4:2:0 40bpp, (1 Cr & Cb sample per 2x2 Y & A samples, big-endian),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA420P16LE, ///< planar YUV 4:2:0 40bpp, (1 Cr & Cb sample per 2x2 Y & A samples, little-endian),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA422P16BE, ///< planar YUV 4:2:2 48bpp, (1 Cr & Cb sample per 2x1 Y & A samples, big-endian),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA422P16LE, ///< planar YUV 4:2:2 48bpp, (1 Cr & Cb sample per 2x1 Y & A samples, little-endian),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA444P16BE, ///< planar YUV 4:4:4 64bpp, (1 Cr & Cb sample per 1x1 Y & A samples, big-endian),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA444P16LE, ///< planar YUV 4:4:4 64bpp, (1 Cr & Cb sample per 1x1 Y & A samples, little-endian)


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    VDPAU, ///< HW acceleration through VDPAU, Picture.data[3] contains a VdpVideoSurface


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    XYZ12LE, ///< packed XYZ 4:4:4, 36 bpp, (msb) 12X, 12Y, 12Z (lsb), the 2-byte value for each X/Y/Z is stored as little-endian, the 4 lower bits are set to 0,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    XYZ12BE, ///< packed XYZ 4:4:4, 36 bpp, (msb) 12X, 12Y, 12Z (lsb), the 2-byte value for each X/Y/Z is stored as big-endian, the 4 lower bits are set to 0,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    NV16, ///< interleaved chroma YUV 4:2:2, 16bpp, (1 Cr & Cb sample per 2x1 Y samples),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    NV20LE, ///< interleaved chroma YUV 4:2:2, 20bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    NV20BE, ///< interleaved chroma YUV 4:2:2, 20bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGBA64BE, ///< packed RGBA 16:16:16:16, 64bpp, 16R, 16G, 16B, 16A, the 2-byte value for each R/G/B/A component is stored as big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGBA64LE, ///< packed RGBA 16:16:16:16, 64bpp, 16R, 16G, 16B, 16A, the 2-byte value for each R/G/B/A component is stored as little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGRA64BE, ///< packed RGBA 16:16:16:16, 64bpp, 16B, 16G, 16R, 16A, the 2-byte value for each R/G/B/A component is stored as big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGRA64LE, ///< packed RGBA 16:16:16:16, 64bpp, 16B, 16G, 16R, 16A, the 2-byte value for each R/G/B/A component is stored as little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YVYU422, ///< packed YUV 4:2:2, 16bpp, Y0 Cr Y1 Cb


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YA16BE, ///< 16 bits gray, 16 bits alpha (big-endian),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YA16LE, ///< 16 bits gray, 16 bits alpha (little-endian)


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRAP, ///< planar GBRA 4:4:4:4 32bpp,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRAP16BE, ///< planar GBRA 4:4:4:4 64bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRAP16LE, ///< planar GBRA 4:4:4:4 64bpp, little-endian

    /**
    HW acceleration through QSV, data[3] contains a pointer to the
    mfxFrameSurface1 structure.

    Before FFmpeg 5.0:
    mfxFrameSurface1.Data.MemId contains a pointer when importing
    the following frames as QSV frames:

    VAAPI:
    mfxFrameSurface1.Data.MemId contains a pointer to VASurfaceID

    DXVA2:
    mfxFrameSurface1.Data.MemId contains a pointer to IDirect3DSurface9

    FFmpeg 5.0 and above:
    mfxFrameSurface1.Data.MemId contains a pointer to the mfxHDLPair
    structure when importing the following frames as QSV frames:

    VAAPI:
    mfxHDLPair.first contains a VASurfaceID pointer.
    mfxHDLPair.second is always MFX_INFINITE.

    DXVA2:
    mfxHDLPair.first contains IDirect3DSurface9 pointer.
    mfxHDLPair.second is always MFX_INFINITE.

    D3D11:
    mfxHDLPair.first contains a ID3D11Texture2D pointer.
    mfxHDLPair.second contains the texture array index of the frame if the
    ID3D11Texture2D is an array texture, or always MFX_INFINITE if it is a
    normal texture.
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    QSV,
    /***********************************************************
    HW acceleration though MMAL, data[3] contains a pointer to the
    MMAL_BUFFER_HEADER_T structure.
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    MMAL,


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    D3D11VA_VLD, ///< HW decoding through Direct3D11 via old API, Picture.data[3] contains a ID3D11VideoDecoderOutputView pointer,

    /***********************************************************
    HW acceleration through CUDA. data[i] contain CUdeviceptr pointers
    exactly as for system memory frames.
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    CUDA,


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    0RGB, ///< packed RGB 8:8:8, 32bpp, XRGBXRGB...   X=unused/undefined,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGB0, ///< packed RGB 8:8:8, 32bpp, RGBXRGBX...   X=unused/undefined,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    0BGR, ///< packed BGR 8:8:8, 32bpp, XBGRXBGR...   X=unused/undefined,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BGR0, ///< packed BGR 8:8:8, 32bpp, BGRXBGRX...   X=unused/undefined


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV420P12BE, ///< planar YUV 4:2:0,18bpp, (1 Cr & Cb sample per 2x2 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV420P12LE, ///< planar YUV 4:2:0,18bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV420P14BE, ///< planar YUV 4:2:0,21bpp, (1 Cr & Cb sample per 2x2 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV420P14LE, ///< planar YUV 4:2:0,21bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV422P12BE, ///< planar YUV 4:2:2,24bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV422P12LE, ///< planar YUV 4:2:2,24bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV422P14BE, ///< planar YUV 4:2:2,28bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV422P14LE, ///< planar YUV 4:2:2,28bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV444P12BE, ///< planar YUV 4:4:4,36bpp, (1 Cr & Cb sample per 1x1 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV444P12LE, ///< planar YUV 4:4:4,36bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV444P14BE, ///< planar YUV 4:4:4,42bpp, (1 Cr & Cb sample per 1x1 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV444P14LE, ///< planar YUV 4:4:4,42bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRP12BE, ///< planar GBR 4:4:4 36bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRP12LE, ///< planar GBR 4:4:4 36bpp, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRP14BE, ///< planar GBR 4:4:4 42bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRP14LE, ///< planar GBR 4:4:4 42bpp, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVJ411P, ///< planar YUV 4:1:1, 12bpp, (1 Cr & Cb sample per 4x1 Y samples) full scale (JPEG), deprecated in favor of, // LibAVUtil.PixelFormat.YUV411P and setting color_range


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BAYER_BGGR8, ///< bayer, BGBG..(odd line), GRGR..(even line), 8-bit samples,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BAYER_RGGB8, ///< bayer, RGRG..(odd line), GBGB..(even line), 8-bit samples,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BAYER_GBRG8, ///< bayer, GBGB..(odd line), RGRG..(even line), 8-bit samples,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BAYER_GRBG8, ///< bayer, GRGR..(odd line), BGBG..(even line), 8-bit samples,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BAYER_BGGR16LE, ///< bayer, BGBG..(odd line), GRGR..(even line), 16-bit samples, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BAYER_BGGR16BE, ///< bayer, BGBG..(odd line), GRGR..(even line), 16-bit samples, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BAYER_RGGB16LE, ///< bayer, RGRG..(odd line), GBGB..(even line), 16-bit samples, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BAYER_RGGB16BE, ///< bayer, RGRG..(odd line), GBGB..(even line), 16-bit samples, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BAYER_GBRG16LE, ///< bayer, GBGB..(odd line), RGRG..(even line), 16-bit samples, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BAYER_GBRG16BE, ///< bayer, GBGB..(odd line), RGRG..(even line), 16-bit samples, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BAYER_GRBG16LE, ///< bayer, GRGR..(odd line), BGBG..(even line), 16-bit samples, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    BAYER_GRBG16BE, ///< bayer, GRGR..(odd line), BGBG..(even line), 16-bit samples, big-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV440P10LE, ///< planar YUV 4:4:0,20bpp, (1 Cr & Cb sample per 1x2 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV440P10BE, ///< planar YUV 4:4:0,20bpp, (1 Cr & Cb sample per 1x2 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV440P12LE, ///< planar YUV 4:4:0,24bpp, (1 Cr & Cb sample per 1x2 Y samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV440P12BE, ///< planar YUV 4:4:0,24bpp, (1 Cr & Cb sample per 1x2 Y samples), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    AYUV64LE, ///< packed AYUV 4:4:4,64bpp (1 Cr & Cb sample per 1x1 Y & A samples), little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    AYUV64BE, ///< packed AYUV 4:4:4,64bpp (1 Cr & Cb sample per 1x1 Y & A samples), big-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    VIDEOTOOLBOX, ///< hardware decoding through Videotoolbox


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P010LE, ///< like NV12, with 10bpp per component, data in the high bits, zeros in the low bits, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P010BE, ///< like NV12, with 10bpp per component, data in the high bits, zeros in the low bits, big-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRAP12BE, ///< planar GBR 4:4:4:4 48bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRAP12LE, ///< planar GBR 4:4:4:4 48bpp, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRAP10BE, ///< planar GBR 4:4:4:4 40bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRAP10LE, ///< planar GBR 4:4:4:4 40bpp, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    MEDIACODEC, ///< hardware decoding through MediaCodec


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAY12BE, ///<        Y        , 12bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAY12LE, ///<        Y        , 12bpp, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAY10BE, ///<        Y        , 10bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAY10LE, ///<        Y        , 10bpp, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P016LE, ///< like NV12, with 16bpp per component, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P016BE, ///< like NV12, with 16bpp per component, big-endian,

    /***********************************************************
    Hardware surfaces for Direct3D11.

    This is preferred over the legacy, // LibAVUtil.PixelFormat.D3D11VA_VLD. The new D3D11
    hwaccel API and filtering support, // LibAVUtil.PixelFormat.D3D11 only.

    data[0] contains a ID3D11Texture2D pointer, and data[1] contains the
    texture array index of the frame as intptr_t if the ID3D11Texture2D is
    an array texture (or always 0 if it's a normal texture).
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    D3D11,


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAY9BE, ///<        Y        , 9bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAY9LE, ///<        Y        , 9bpp, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRPF32BE, ///< IEEE-754 single precision planar GBR 4:4:4,     96bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRPF32LE, ///< IEEE-754 single precision planar GBR 4:4:4,     96bpp, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRAPF32BE, ///< IEEE-754 single precision planar GBRA 4:4:4:4, 128bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRAPF32LE, ///< IEEE-754 single precision planar GBRA 4:4:4:4, 128bpp, little-endian,

    /***********************************************************
    DRM-managed buffers exposed through PRIME buffer sharing.

    data[0] points to an AVDRMFrameDescriptor.
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    DRM_PRIME,

    /***********************************************************
    Hardware surfaces for OpenCL.

    data[i] contain 2D image objects (typed in C as cl_mem, used
    in OpenCL as image2d_t) for each plane of the surface.
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    OPENCL,


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAY14BE, ///<        Y        , 14bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAY14LE, ///<        Y        , 14bpp, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAYF32BE, ///< IEEE-754 single precision Y, 32bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAYF32LE, ///< IEEE-754 single precision Y, 32bpp, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA422P12BE, ///< planar YUV 4:2:2,24bpp, (1 Cr & Cb sample per 2x1 Y samples), 12b alpha, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA422P12LE, ///< planar YUV 4:2:2,24bpp, (1 Cr & Cb sample per 2x1 Y samples), 12b alpha, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA444P12BE, ///< planar YUV 4:4:4,36bpp, (1 Cr & Cb sample per 1x1 Y samples), 12b alpha, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUVA444P12LE, ///< planar YUV 4:4:4,36bpp, (1 Cr & Cb sample per 1x1 Y samples), 12b alpha, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    NV24, ///< planar YUV 4:4:4, 24bpp, 1 plane for Y and 1 plane for the UV components, which are interleaved (first byte U and the following byte V),

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    NV42, ///< as above, but U and V bytes are swapped,

    /***********************************************************
    Vulkan hardware images.

    data[0] points to an AVVkFrame
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    VULKAN,


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    Y210BE, ///< packed YUV 4:2:2 like YUYV422, 20bpp, data in the high bits, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    Y210LE, ///< packed YUV 4:2:2 like YUYV422, 20bpp, data in the high bits, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    X2RGB10LE, ///< packed RGB 10:10:10, 30bpp, (msb)2X 10R 10G 10B (lsb), little-endian, X=unused/undefined,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    X2RGB10BE, ///< packed RGB 10:10:10, 30bpp, (msb)2X 10R 10G 10B (lsb), big-endian, X=unused/undefined,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    X2BGR10LE, ///< packed BGR 10:10:10, 30bpp, (msb)2X 10B 10G 10R (lsb), little-endian, X=unused/undefined,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    X2BGR10BE, ///< packed BGR 10:10:10, 30bpp, (msb)2X 10B 10G 10R (lsb), big-endian, X=unused/undefined


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P210BE, ///< interleaved chroma YUV 4:2:2, 20bpp, data in the high bits, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P210LE, ///< interleaved chroma YUV 4:2:2, 20bpp, data in the high bits, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P410BE, ///< interleaved chroma YUV 4:4:4, 30bpp, data in the high bits, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P410LE, ///< interleaved chroma YUV 4:4:4, 30bpp, data in the high bits, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P216BE, ///< interleaved chroma YUV 4:2:2, 32bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P216LE, ///< interleaved chroma YUV 4:2:2, 32bpp, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P416BE, ///< interleaved chroma YUV 4:4:4, 48bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P416LE, ///< interleaved chroma YUV 4:4:4, 48bpp, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    VUYA, ///< packed VUYA 4:4:4:4, 32bpp (1 Cr & Cb sample per 1x1 Y & A samples), VUYAVUYA...


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGBAF16BE, ///< IEEE-754 half precision packed RGBA 16:16:16:16, 64bpp, RGBARGBA..., big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGBAF16LE, ///< IEEE-754 half precision packed RGBA 16:16:16:16, 64bpp, RGBARGBA..., little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    VUYX, ///< packed VUYX 4:4:4:4, 32bpp, Variant of VUYA where alpha channel is left undefined


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P012LE, ///< like NV12, with 12bpp per component, data in the high bits, zeros in the low bits, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P012BE, ///< like NV12, with 12bpp per component, data in the high bits, zeros in the low bits, big-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    Y212BE, ///< packed YUV 4:2:2 like YUYV422, 24bpp, data in the high bits, zeros in the low bits, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    Y212LE, ///< packed YUV 4:2:2 like YUYV422, 24bpp, data in the high bits, zeros in the low bits, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    XV30BE, ///< packed XVYU 4:4:4, 32bpp, (msb)2X 10V 10Y 10U (lsb), big-endian, variant of Y410 where alpha channel is left undefined,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    XV30LE, ///< packed XVYU 4:4:4, 32bpp, (msb)2X 10V 10Y 10U (lsb), little-endian, variant of Y410 where alpha channel is left undefined


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    XV36BE, ///< packed XVYU 4:4:4, 48bpp, data in the high bits, zeros in the low bits, big-endian, variant of Y412 where alpha channel is left undefined,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    XV36LE, ///< packed XVYU 4:4:4, 48bpp, data in the high bits, zeros in the low bits, little-endian, variant of Y412 where alpha channel is left undefined


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGBF32BE, ///< IEEE-754 single precision packed RGB 32:32:32, 96bpp, RGBRGB..., big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGBF32LE, ///< IEEE-754 single precision packed RGB 32:32:32, 96bpp, RGBRGB..., little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGBAF32BE, ///< IEEE-754 single precision packed RGBA 32:32:32:32, 128bpp, RGBARGBA..., big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGBAF32LE, ///< IEEE-754 single precision packed RGBA 32:32:32:32, 128bpp, RGBARGBA..., little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P212BE, ///< interleaved chroma YUV 4:2:2, 24bpp, data in the high bits, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P212LE, ///< interleaved chroma YUV 4:2:2, 24bpp, data in the high bits, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P412BE, ///< interleaved chroma YUV 4:4:4, 36bpp, data in the high bits, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    P412LE, ///< interleaved chroma YUV 4:4:4, 36bpp, data in the high bits, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRAP14BE, ///< planar GBR 4:4:4:4 56bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRAP14LE, ///< planar GBR 4:4:4:4 56bpp, little-endian,

    /***********************************************************
    Hardware surfaces for Direct3D 12.

    data[0] points to an AVD3D12VAFrame
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    D3D12,


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    AYUV, ///< packed AYUV 4:4:4:4, 32bpp (1 Cr & Cb sample per 1x1 Y & A samples), AYUVAYUV...


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    UYVA, ///< packed UYVA 4:4:4:4, 32bpp (1 Cr & Cb sample per 1x1 Y & A samples), UYVAUYVA...


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    VYU444, ///< packed VYU 4:4:4, 24bpp (1 Cr & Cb sample per 1x1 Y), VYUVYU...


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    V30XBE, ///< packed VYUX 4:4:4 like XV30, 32bpp, (msb)10V 10Y 10U 2X (lsb), big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    V30XLE, ///< packed VYUX 4:4:4 like XV30, 32bpp, (msb)10V 10Y 10U 2X (lsb), little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGBF16BE, ///< IEEE-754 half precision packed RGB 16:16:16, 48bpp, RGBRGB..., big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGBF16LE, ///< IEEE-754 half precision packed RGB 16:16:16, 48bpp, RGBRGB..., little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGBA128BE, ///< packed RGBA 32:32:32:32, 128bpp, RGBARGBA..., big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGBA128LE, ///< packed RGBA 32:32:32:32, 128bpp, RGBARGBA..., little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGB96BE, ///< packed RGBA 32:32:32, 96bpp, RGBRGB..., big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    RGB96LE, ///< packed RGBA 32:32:32, 96bpp, RGBRGB..., little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    Y216BE, ///< packed YUV 4:2:2 like YUYV422, 32bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    Y216LE, ///< packed YUV 4:2:2 like YUYV422, 32bpp, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    XV48BE, ///< packed XVYU 4:4:4, 64bpp, big-endian, variant of Y416 where alpha channel is left undefined,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    XV48LE, ///< packed XVYU 4:4:4, 64bpp, little-endian, variant of Y416 where alpha channel is left undefined


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRPF16BE, ///< IEEE-754 half precision planer GBR 4:4:4, 48bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRPF16LE, ///< IEEE-754 half precision planer GBR 4:4:4, 48bpp, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRAPF16BE, ///< IEEE-754 half precision planar GBRA 4:4:4:4, 64bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRAPF16LE, ///< IEEE-754 half precision planar GBRA 4:4:4:4, 64bpp, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAYF16BE, ///< IEEE-754 half precision Y, 16bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAYF16LE, ///< IEEE-754 half precision Y, 16bpp, little-endian,

    /***********************************************************
    HW acceleration through AMF. data[0] contain AMFSurface pointer
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    AMF_SURFACE,


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAY32BE, ///<         Y        , 32bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GRAY32LE, ///<         Y        , 32bpp, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YAF32BE, ///< IEEE-754 single precision packed YA, 32 bits gray, 32 bits alpha, 64bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YAF32LE, ///< IEEE-754 single precision packed YA, 32 bits gray, 32 bits alpha, 64bpp, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YAF16BE, ///< IEEE-754 half precision packed YA, 16 bits gray, 16 bits alpha, 32bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YAF16LE, ///< IEEE-754 half precision packed YA, 16 bits gray, 16 bits alpha, 32bpp, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRAP32BE, ///< planar GBRA 4:4:4:4 128bpp, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRAP32LE, ///< planar GBRA 4:4:4:4 128bpp, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV444P10MSBBE, ///< planar YUV 4:4:4, 30bpp, (1 Cr & Cb sample per 1x1 Y samples), lowest bits zero, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV444P10MSBLE, ///< planar YUV 4:4:4, 30bpp, (1 Cr & Cb sample per 1x1 Y samples), lowest bits zero, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV444P12MSBBE, ///< planar YUV 4:4:4, 30bpp, (1 Cr & Cb sample per 1x1 Y samples), lowest bits zero, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    YUV444P12MSBLE, ///< planar YUV 4:4:4, 30bpp, (1 Cr & Cb sample per 1x1 Y samples), lowest bits zero, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRP10MSBBE, ///< planar GBR 4:4:4 30bpp, lowest bits zero, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRP10MSBLE, ///< planar GBR 4:4:4 30bpp, lowest bits zero, little-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRP12MSBBE, ///< planar GBR 4:4:4 36bpp, lowest bits zero, big-endian,

    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    GBRP12MSBLE, ///< planar GBR 4:4:4 36bpp, lowest bits zero, little-endian


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    OHCODEC, /// hardware decoding through openharmony


    /***********************************************************
    @brief
    ***********************************************************/
    //  [CCode (cname="AV_PIX_FMT_")]
    NB, ///< number of pixel formats, DO NOT USE THIS if you want to link with shared libav* because the number of formats might differ between versions


    //  #if AV_HAVE_BIGENDIAN
    //  #   define LibAVUtil.PixelFormat.NE (be, le), // LibAVUtil.PixelFormat.##be
    //  #else
    //  #   define LibAVUtil.PixelFormat.NE (be, le), // LibAVUtil.PixelFormat.##le
    //  #endif

    RGB32, // LibAVUtil.PixelFormat.NE (ARGB, BGRA)
    RGB32_1, // LibAVUtil.PixelFormat.NE (RGBA, ABGR)
    BGR32, // LibAVUtil.PixelFormat.NE (ABGR, RGBA)
    BGR32_1, // LibAVUtil.PixelFormat.NE (BGRA, ARGB)
    0RGB32, // LibAVUtil.PixelFormat.NE (0RGB, BGR0)
    0BGR32, // LibAVUtil.PixelFormat.NE (0BGR, RGB0)

    GRAY9, // LibAVUtil.PixelFormat.NE (GRAY9BE,  GRAY9LE)
    GRAY10, // LibAVUtil.PixelFormat.NE (GRAY10BE, GRAY10LE)
    GRAY12, // LibAVUtil.PixelFormat.NE (GRAY12BE, GRAY12LE)
    GRAY14, // LibAVUtil.PixelFormat.NE (GRAY14BE, GRAY14LE)
    GRAY16, // LibAVUtil.PixelFormat.NE (GRAY16BE, GRAY16LE)
    GRAY32, // LibAVUtil.PixelFormat.NE (GRAY32BE, GRAY32LE)
    YA16, // LibAVUtil.PixelFormat.NE (YA16BE,   YA16LE)
    RGB48, // LibAVUtil.PixelFormat.NE (RGB48BE,  RGB48LE)
    RGB565, // LibAVUtil.PixelFormat.NE (RGB565BE, RGB565LE)
    RGB555, // LibAVUtil.PixelFormat.NE (RGB555BE, RGB555LE)
    RGB444, // LibAVUtil.PixelFormat.NE (RGB444BE, RGB444LE)
    RGBA64, // LibAVUtil.PixelFormat.NE (RGBA64BE, RGBA64LE)
    BGR48, // LibAVUtil.PixelFormat.NE (BGR48BE,  BGR48LE)
    BGR565, // LibAVUtil.PixelFormat.NE (BGR565BE, BGR565LE)
    BGR555, // LibAVUtil.PixelFormat.NE (BGR555BE, BGR555LE)
    BGR444, // LibAVUtil.PixelFormat.NE (BGR444BE, BGR444LE)
    BGRA64, // LibAVUtil.PixelFormat.NE (BGRA64BE, BGRA64LE)

    YUV420P9, // LibAVUtil.PixelFormat.NE (YUV420P9BE , YUV420P9LE)
    YUV422P9, // LibAVUtil.PixelFormat.NE (YUV422P9BE , YUV422P9LE)
    YUV444P9, // LibAVUtil.PixelFormat.NE (YUV444P9BE , YUV444P9LE)
    YUV420P10, // LibAVUtil.PixelFormat.NE (YUV420P10BE, YUV420P10LE)
    YUV422P10, // LibAVUtil.PixelFormat.NE (YUV422P10BE, YUV422P10LE)
    YUV440P10, // LibAVUtil.PixelFormat.NE (YUV440P10BE, YUV440P10LE)
    YUV444P10, // LibAVUtil.PixelFormat.NE (YUV444P10BE, YUV444P10LE)
    YUV420P12, // LibAVUtil.PixelFormat.NE (YUV420P12BE, YUV420P12LE)
    YUV422P12, // LibAVUtil.PixelFormat.NE (YUV422P12BE, YUV422P12LE)
    YUV440P12, // LibAVUtil.PixelFormat.NE (YUV440P12BE, YUV440P12LE)
    YUV444P12, // LibAVUtil.PixelFormat.NE (YUV444P12BE, YUV444P12LE)
    YUV420P14, // LibAVUtil.PixelFormat.NE (YUV420P14BE, YUV420P14LE)
    YUV422P14, // LibAVUtil.PixelFormat.NE (YUV422P14BE, YUV422P14LE)
    YUV444P14, // LibAVUtil.PixelFormat.NE (YUV444P14BE, YUV444P14LE)
    YUV420P16, // LibAVUtil.PixelFormat.NE (YUV420P16BE, YUV420P16LE)
    YUV422P16, // LibAVUtil.PixelFormat.NE (YUV422P16BE, YUV422P16LE)
    YUV444P16, // LibAVUtil.PixelFormat.NE (YUV444P16BE, YUV444P16LE)

    YUV444P10MSB, // LibAVUtil.PixelFormat.NE (YUV444P10MSBBE, YUV444P10MSBLE)
    YUV444P12MSB, // LibAVUtil.PixelFormat.NE (YUV444P12MSBBE, YUV444P12MSBLE)

    GBRP9, // LibAVUtil.PixelFormat.NE (GBRP9BE ,    GBRP9LE)
    GBRP10, // LibAVUtil.PixelFormat.NE (GBRP10BE,    GBRP10LE)
    GBRP12, // LibAVUtil.PixelFormat.NE (GBRP12BE,    GBRP12LE)
    GBRP14, // LibAVUtil.PixelFormat.NE (GBRP14BE,    GBRP14LE)
    GBRP16, // LibAVUtil.PixelFormat.NE (GBRP16BE,    GBRP16LE)
    GBRAP10, // LibAVUtil.PixelFormat.NE (GBRAP10BE,   GBRAP10LE)
    GBRAP12, // LibAVUtil.PixelFormat.NE (GBRAP12BE,   GBRAP12LE)
    GBRAP14, // LibAVUtil.PixelFormat.NE (GBRAP14BE,   GBRAP14LE)
    GBRAP16, // LibAVUtil.PixelFormat.NE (GBRAP16BE,   GBRAP16LE)
    GBRAP32, // LibAVUtil.PixelFormat.NE (GBRAP32BE,   GBRAP32LE)

    GBRP10MSB, // LibAVUtil.PixelFormat.NE (GBRP10MSBBE, GBRP10MSBLE)
    GBRP12MSB, // LibAVUtil.PixelFormat.NE (GBRP12MSBBE, GBRP12MSBLE)

    BAYER_BGGR16, // LibAVUtil.PixelFormat.NE (BAYER_BGGR16BE,    BAYER_BGGR16LE)
    BAYER_RGGB16, // LibAVUtil.PixelFormat.NE (BAYER_RGGB16BE,    BAYER_RGGB16LE)
    BAYER_GBRG16, // LibAVUtil.PixelFormat.NE (BAYER_GBRG16BE,    BAYER_GBRG16LE)
    BAYER_GRBG16, // LibAVUtil.PixelFormat.NE (BAYER_GRBG16BE,    BAYER_GRBG16LE)

    GBRPF16, // LibAVUtil.PixelFormat.NE (GBRPF16BE,  GBRPF16LE)
    GBRAPF16, // LibAVUtil.PixelFormat.NE (GBRAPF16BE, GBRAPF16LE)
    GBRPF32, // LibAVUtil.PixelFormat.NE (GBRPF32BE,  GBRPF32LE)
    GBRAPF32, // LibAVUtil.PixelFormat.NE (GBRAPF32BE, GBRAPF32LE)

    GRAYF16, // LibAVUtil.PixelFormat.NE (GRAYF16BE, GRAYF16LE)
    GRAYF32, // LibAVUtil.PixelFormat.NE (GRAYF32BE, GRAYF32LE)

    YAF16, // LibAVUtil.PixelFormat.NE (YAF16BE, YAF16LE)
    YAF32, // LibAVUtil.PixelFormat.NE (YAF32BE, YAF32LE)

    YUVA420P9, // LibAVUtil.PixelFormat.NE (YUVA420P9BE , YUVA420P9LE)
    YUVA422P9, // LibAVUtil.PixelFormat.NE (YUVA422P9BE , YUVA422P9LE)
    YUVA444P9, // LibAVUtil.PixelFormat.NE (YUVA444P9BE , YUVA444P9LE)
    YUVA420P10, // LibAVUtil.PixelFormat.NE (YUVA420P10BE, YUVA420P10LE)
    YUVA422P10, // LibAVUtil.PixelFormat.NE (YUVA422P10BE, YUVA422P10LE)
    YUVA444P10, // LibAVUtil.PixelFormat.NE (YUVA444P10BE, YUVA444P10LE)
    YUVA422P12, // LibAVUtil.PixelFormat.NE (YUVA422P12BE, YUVA422P12LE)
    YUVA444P12, // LibAVUtil.PixelFormat.NE (YUVA444P12BE, YUVA444P12LE)
    YUVA420P16, // LibAVUtil.PixelFormat.NE (YUVA420P16BE, YUVA420P16LE)
    YUVA422P16, // LibAVUtil.PixelFormat.NE (YUVA422P16BE, YUVA422P16LE)
    YUVA444P16, // LibAVUtil.PixelFormat.NE (YUVA444P16BE, YUVA444P16LE)

    XYZ12, // LibAVUtil.PixelFormat.NE (XYZ12BE, XYZ12LE)
    NV20, // LibAVUtil.PixelFormat.NE (NV20BE,  NV20LE)
    AYUV64, // LibAVUtil.PixelFormat.NE (AYUV64BE, AYUV64LE)
    P010, // LibAVUtil.PixelFormat.NE (P010BE,  P010LE)
    P012, // LibAVUtil.PixelFormat.NE (P012BE,  P012LE)
    P016, // LibAVUtil.PixelFormat.NE (P016BE,  P016LE)

    Y210, // LibAVUtil.PixelFormat.NE (Y210BE,  Y210LE)
    Y212, // LibAVUtil.PixelFormat.NE (Y212BE,  Y212LE)
    Y216, // LibAVUtil.PixelFormat.NE (Y216BE,  Y216LE)
    XV30, // LibAVUtil.PixelFormat.NE (XV30BE,  XV30LE)
    XV36, // LibAVUtil.PixelFormat.NE (XV36BE,  XV36LE)
    XV48, // LibAVUtil.PixelFormat.NE (XV48BE,  XV48LE)
    V30X, // LibAVUtil.PixelFormat.NE (V30XBE,  V30XLE)
    X2RGB10, // LibAVUtil.PixelFormat.NE (X2RGB10BE, X2RGB10LE)
    X2BGR10, // LibAVUtil.PixelFormat.NE (X2BGR10BE, X2BGR10LE)

    P210, // LibAVUtil.PixelFormat.NE (P210BE, P210LE)
    P410, // LibAVUtil.PixelFormat.NE (P410BE, P410LE)
    P212, // LibAVUtil.PixelFormat.NE (P212BE, P212LE)
    P412, // LibAVUtil.PixelFormat.NE (P412BE, P412LE)
    P216, // LibAVUtil.PixelFormat.NE (P216BE, P216LE)
    P416, // LibAVUtil.PixelFormat.NE (P416BE, P416LE)

    RGBF16, // LibAVUtil.PixelFormat.NE (RGBF16BE, RGBF16LE)
    RGBAF16, // LibAVUtil.PixelFormat.NE (RGBAF16BE, RGBAF16LE)

    RGBF32, // LibAVUtil.PixelFormat.NE (RGBF32BE, RGBF32LE)
    RGBAF32, // LibAVUtil.PixelFormat.NE (RGBAF32BE, RGBAF32LE)

    RGB96, // LibAVUtil.PixelFormat.NE (RGB96BE, RGB96LE)
    RGBA128; // LibAVUtil.PixelFormat.NE (RGBA128BE, RGBA128LE)
}

} // namespace LibAVUtil
