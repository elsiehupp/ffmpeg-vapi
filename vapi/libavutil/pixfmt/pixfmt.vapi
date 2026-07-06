/*
 * Copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at>
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#ifndef AVUTIL_PIXFMT_H
#define AVUTIL_PIXFMT_H

/**
 * @file
 * pixel format definitions
 */

#include "libavutil/avconfig.h"
#include "version.h"

#define AVPALETTE_SIZE 1024
#define AVPALETTE_COUNT 256

/**
 * Maximum number of planes in any pixel format.
 * This should be used when a maximum is needed, but code should not
 * be written to require a maximum for no good reason.
 */
#define AV_VIDEO_MAX_PLANES 4

/**
 * Pixel format.
 *
 * @note
 * LibAVUtil.PixelFormat.RGB32 is handled in an endian-specific manner. An RGBA
 * color is put together as:
 *  (A << 24) | (R << 16) | (G << 8) | B
 * This is stored as BGRA on little-endian CPU architectures and ARGB on
 * big-endian CPUs.
 *
 * @note
 * If the resolution is not a multiple of the chroma subsampling factor
 * then the chroma plane resolution must be rounded up.
 *
 * @par
 * When the pixel format is palettized RGB32 (LibAVUtil.PixelFormat.PAL8), the palettized
 * image data is stored in LibAVFormat.Frame.data[0]. The palette is transported in
 * LibAVFormat.Frame.data[1], is 1024 bytes long (256 4-byte entries) and is
 * formatted the same as in LibAVUtil.PixelFormat.RGB32 described above (i.e., it is
 * also endian-specific). Note also that the individual RGB32 palette
 * components stored in LibAVFormat.Frame.data[1] should be in the range 0..255.
 * This is important as many custom PAL8 video codecs that were designed
 * to run on the IBM VGA graphics adapter use 6-bit palette components.
 *
 * @par
 * For all the 8 bits per pixel formats, an RGB32 palette is in data[1] like
 * for pal8. This palette is filled in automatically by the function
 * allocating the picture.
 */
[CCode (cname="enum AVPixelFormat",cheader="")]
enum AVPixelFormat {
    [CCode (cname="")]
    LibAVUtil.PixelFormat.NONE = -1,
    [CCode (cname="")]
    LibAVUtil.PixelFormat.YUV420P,   ///< planar YUV 4:2:0, 12bpp, (1 Cr & Cb sample per 2x2 Y samples)
    [CCode (cname="")]
    LibAVUtil.PixelFormat.YUYV422,   ///< packed YUV 4:2:2, 16bpp, Y0 Cb Y1 Cr
    [CCode (cname="")]
    LibAVUtil.PixelFormat.RGB24,     ///< packed RGB 8:8:8, 24bpp, RGBRGB...
    [CCode (cname="")]
    LibAVUtil.PixelFormat.BGR24,     ///< packed RGB 8:8:8, 24bpp, BGRBGR...
    LibAVUtil.PixelFormat.YUV422P,   ///< planar YUV 4:2:2, 16bpp, (1 Cr & Cb sample per 2x1 Y samples)
    LibAVUtil.PixelFormat.YUV444P,   ///< planar YUV 4:4:4, 24bpp, (1 Cr & Cb sample per 1x1 Y samples)
    LibAVUtil.PixelFormat.YUV410P,   ///< planar YUV 4:1:0,  9bpp, (1 Cr & Cb sample per 4x4 Y samples)
    LibAVUtil.PixelFormat.YUV411P,   ///< planar YUV 4:1:1, 12bpp, (1 Cr & Cb sample per 4x1 Y samples)
    LibAVUtil.PixelFormat.GRAY8,     ///<        Y        ,  8bpp
    LibAVUtil.PixelFormat.MONOWHITE, ///<        Y        ,  1bpp, 0 is white, 1 is black, in each byte pixels are ordered from the msb to the lsb
    LibAVUtil.PixelFormat.MONOBLACK, ///<        Y        ,  1bpp, 0 is black, 1 is white, in each byte pixels are ordered from the msb to the lsb
    LibAVUtil.PixelFormat.PAL8,      ///< 8 bits with LibAVUtil.PixelFormat.RGB32 palette
    LibAVUtil.PixelFormat.YUVJ420P,  ///< planar YUV 4:2:0, 12bpp, full scale (JPEG), deprecated in favor of LibAVUtil.PixelFormat.YUV420P and setting color_range
    LibAVUtil.PixelFormat.YUVJ422P,  ///< planar YUV 4:2:2, 16bpp, full scale (JPEG), deprecated in favor of LibAVUtil.PixelFormat.YUV422P and setting color_range
    LibAVUtil.PixelFormat.YUVJ444P,  ///< planar YUV 4:4:4, 24bpp, full scale (JPEG), deprecated in favor of LibAVUtil.PixelFormat.YUV444P and setting color_range
    LibAVUtil.PixelFormat.UYVY422,   ///< packed YUV 4:2:2, 16bpp, Cb Y0 Cr Y1
    LibAVUtil.PixelFormat.UYYVYY411, ///< packed YUV 4:1:1, 12bpp, Cb Y0 Y1 Cr Y2 Y3
    LibAVUtil.PixelFormat.BGR8,      ///< packed RGB 3:3:2,  8bpp, (msb)2B 3G 3R (lsb)
    LibAVUtil.PixelFormat.BGR4,      ///< packed RGB 1:2:1 bitstream,  4bpp, (msb)1B 2G 1R (lsb), a byte contains two pixels, the first pixel in the byte is the one composed by the 4 msb bits
    LibAVUtil.PixelFormat.BGR4_BYTE, ///< packed RGB 1:2:1,  8bpp, (msb)1B 2G 1R (lsb)
    LibAVUtil.PixelFormat.RGB8,      ///< packed RGB 3:3:2,  8bpp, (msb)3R 3G 2B (lsb)
    LibAVUtil.PixelFormat.RGB4,      ///< packed RGB 1:2:1 bitstream,  4bpp, (msb)1R 2G 1B (lsb), a byte contains two pixels, the first pixel in the byte is the one composed by the 4 msb bits
    LibAVUtil.PixelFormat.RGB4_BYTE, ///< packed RGB 1:2:1,  8bpp, (msb)1R 2G 1B (lsb)
    LibAVUtil.PixelFormat.NV12,      ///< planar YUV 4:2:0, 12bpp, 1 plane for Y and 1 plane for the UV components, which are interleaved (first byte U and the following byte V)
    LibAVUtil.PixelFormat.NV21,      ///< as above, but U and V bytes are swapped

    LibAVUtil.PixelFormat.ARGB,      ///< packed ARGB 8:8:8:8, 32bpp, ARGBARGB...
    LibAVUtil.PixelFormat.RGBA,      ///< packed RGBA 8:8:8:8, 32bpp, RGBARGBA...
    LibAVUtil.PixelFormat.ABGR,      ///< packed ABGR 8:8:8:8, 32bpp, ABGRABGR...
    LibAVUtil.PixelFormat.BGRA,      ///< packed BGRA 8:8:8:8, 32bpp, BGRABGRA...

    LibAVUtil.PixelFormat.GRAY16BE,  ///<        Y        , 16bpp, big-endian
    LibAVUtil.PixelFormat.GRAY16LE,  ///<        Y        , 16bpp, little-endian
    LibAVUtil.PixelFormat.YUV440P,   ///< planar YUV 4:4:0 (1 Cr & Cb sample per 1x2 Y samples)
    LibAVUtil.PixelFormat.YUVJ440P,  ///< planar YUV 4:4:0 full scale (JPEG), deprecated in favor of LibAVUtil.PixelFormat.YUV440P and setting color_range
    LibAVUtil.PixelFormat.YUVA420P,  ///< planar YUV 4:2:0, 20bpp, (1 Cr & Cb sample per 2x2 Y & A samples)
    LibAVUtil.PixelFormat.RGB48BE,   ///< packed RGB 16:16:16, 48bpp, 16R, 16G, 16B, the 2-byte value for each R/G/B component is stored as big-endian
    LibAVUtil.PixelFormat.RGB48LE,   ///< packed RGB 16:16:16, 48bpp, 16R, 16G, 16B, the 2-byte value for each R/G/B component is stored as little-endian

    LibAVUtil.PixelFormat.RGB565BE,  ///< packed RGB 5:6:5, 16bpp, (msb)   5R 6G 5B (lsb), big-endian
    LibAVUtil.PixelFormat.RGB565LE,  ///< packed RGB 5:6:5, 16bpp, (msb)   5R 6G 5B (lsb), little-endian
    LibAVUtil.PixelFormat.RGB555BE,  ///< packed RGB 5:5:5, 16bpp, (msb)1X 5R 5G 5B (lsb), big-endian   , X=unused/undefined
    LibAVUtil.PixelFormat.RGB555LE,  ///< packed RGB 5:5:5, 16bpp, (msb)1X 5R 5G 5B (lsb), little-endian, X=unused/undefined

    LibAVUtil.PixelFormat.BGR565BE,  ///< packed BGR 5:6:5, 16bpp, (msb)   5B 6G 5R (lsb), big-endian
    LibAVUtil.PixelFormat.BGR565LE,  ///< packed BGR 5:6:5, 16bpp, (msb)   5B 6G 5R (lsb), little-endian
    LibAVUtil.PixelFormat.BGR555BE,  ///< packed BGR 5:5:5, 16bpp, (msb)1X 5B 5G 5R (lsb), big-endian   , X=unused/undefined
    LibAVUtil.PixelFormat.BGR555LE,  ///< packed BGR 5:5:5, 16bpp, (msb)1X 5B 5G 5R (lsb), little-endian, X=unused/undefined

    /**
     Hardware acceleration through VA-API, data[3] contains a
     VASurfaceID.
    ***********************************************************/
    LibAVUtil.PixelFormat.VAAPI,

    LibAVUtil.PixelFormat.YUV420P16LE,  ///< planar YUV 4:2:0, 24bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian
    LibAVUtil.PixelFormat.YUV420P16BE,  ///< planar YUV 4:2:0, 24bpp, (1 Cr & Cb sample per 2x2 Y samples), big-endian
    LibAVUtil.PixelFormat.YUV422P16LE,  ///< planar YUV 4:2:2, 32bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian
    LibAVUtil.PixelFormat.YUV422P16BE,  ///< planar YUV 4:2:2, 32bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian
    LibAVUtil.PixelFormat.YUV444P16LE,  ///< planar YUV 4:4:4, 48bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian
    LibAVUtil.PixelFormat.YUV444P16BE,  ///< planar YUV 4:4:4, 48bpp, (1 Cr & Cb sample per 1x1 Y samples), big-endian
    LibAVUtil.PixelFormat.DXVA2_VLD,    ///< HW decoding through DXVA2, Picture.data[3] contains a LPDIRECT3DSURFACE9 pointer

    LibAVUtil.PixelFormat.RGB444LE,  ///< packed RGB 4:4:4, 16bpp, (msb)4X 4R 4G 4B (lsb), little-endian, X=unused/undefined
    LibAVUtil.PixelFormat.RGB444BE,  ///< packed RGB 4:4:4, 16bpp, (msb)4X 4R 4G 4B (lsb), big-endian,    X=unused/undefined
    LibAVUtil.PixelFormat.BGR444LE,  ///< packed BGR 4:4:4, 16bpp, (msb)4X 4B 4G 4R (lsb), little-endian, X=unused/undefined
    LibAVUtil.PixelFormat.BGR444BE,  ///< packed BGR 4:4:4, 16bpp, (msb)4X 4B 4G 4R (lsb), big-endian,    X=unused/undefined
    LibAVUtil.PixelFormat.YA8,       ///< 8 bits gray, 8 bits alpha

    LibAVUtil.PixelFormat.Y400A = LibAVUtil.PixelFormat.YA8, ///< alias for LibAVUtil.PixelFormat.YA8
    LibAVUtil.PixelFormat.GRAY8A= LibAVUtil.PixelFormat.YA8, ///< alias for LibAVUtil.PixelFormat.YA8

    LibAVUtil.PixelFormat.BGR48BE,   ///< packed RGB 16:16:16, 48bpp, 16B, 16G, 16R, the 2-byte value for each R/G/B component is stored as big-endian
    LibAVUtil.PixelFormat.BGR48LE,   ///< packed RGB 16:16:16, 48bpp, 16B, 16G, 16R, the 2-byte value for each R/G/B component is stored as little-endian

    /**
    The following 12 formats have the disadvantage of needing 1 format for each bit depth.
    Notice that each 9/10 bits sample is stored in 16 bits with extra padding.
    If you want to support multiple bit depths, then using LibAVUtil.PixelFormat.YUV420P16* with the bpp stored separately is better.
    ***********************************************************/
    LibAVUtil.PixelFormat.YUV420P9BE, ///< planar YUV 4:2:0, 13.5bpp, (1 Cr & Cb sample per 2x2 Y samples), big-endian
    LibAVUtil.PixelFormat.YUV420P9LE, ///< planar YUV 4:2:0, 13.5bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian
    LibAVUtil.PixelFormat.YUV420P10BE,///< planar YUV 4:2:0, 15bpp, (1 Cr & Cb sample per 2x2 Y samples), big-endian
    LibAVUtil.PixelFormat.YUV420P10LE,///< planar YUV 4:2:0, 15bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian
    LibAVUtil.PixelFormat.YUV422P10BE,///< planar YUV 4:2:2, 20bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian
    LibAVUtil.PixelFormat.YUV422P10LE,///< planar YUV 4:2:2, 20bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian
    LibAVUtil.PixelFormat.YUV444P9BE, ///< planar YUV 4:4:4, 27bpp, (1 Cr & Cb sample per 1x1 Y samples), big-endian
    LibAVUtil.PixelFormat.YUV444P9LE, ///< planar YUV 4:4:4, 27bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian
    LibAVUtil.PixelFormat.YUV444P10BE,///< planar YUV 4:4:4, 30bpp, (1 Cr & Cb sample per 1x1 Y samples), big-endian
    LibAVUtil.PixelFormat.YUV444P10LE,///< planar YUV 4:4:4, 30bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian
    LibAVUtil.PixelFormat.YUV422P9BE, ///< planar YUV 4:2:2, 18bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian
    LibAVUtil.PixelFormat.YUV422P9LE, ///< planar YUV 4:2:2, 18bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian
    LibAVUtil.PixelFormat.GBRP,      ///< planar GBR 4:4:4 24bpp
    LibAVUtil.PixelFormat.GBR24P = LibAVUtil.PixelFormat.GBRP, // alias for #LibAVUtil.PixelFormat.GBRP
    LibAVUtil.PixelFormat.GBRP9BE,   ///< planar GBR 4:4:4 27bpp, big-endian
    LibAVUtil.PixelFormat.GBRP9LE,   ///< planar GBR 4:4:4 27bpp, little-endian
    LibAVUtil.PixelFormat.GBRP10BE,  ///< planar GBR 4:4:4 30bpp, big-endian
    LibAVUtil.PixelFormat.GBRP10LE,  ///< planar GBR 4:4:4 30bpp, little-endian
    LibAVUtil.PixelFormat.GBRP16BE,  ///< planar GBR 4:4:4 48bpp, big-endian
    LibAVUtil.PixelFormat.GBRP16LE,  ///< planar GBR 4:4:4 48bpp, little-endian
    LibAVUtil.PixelFormat.YUVA422P,  ///< planar YUV 4:2:2 24bpp, (1 Cr & Cb sample per 2x1 Y & A samples)
    LibAVUtil.PixelFormat.YUVA444P,  ///< planar YUV 4:4:4 32bpp, (1 Cr & Cb sample per 1x1 Y & A samples)
    LibAVUtil.PixelFormat.YUVA420P9BE,  ///< planar YUV 4:2:0 22.5bpp, (1 Cr & Cb sample per 2x2 Y & A samples), big-endian
    LibAVUtil.PixelFormat.YUVA420P9LE,  ///< planar YUV 4:2:0 22.5bpp, (1 Cr & Cb sample per 2x2 Y & A samples), little-endian
    LibAVUtil.PixelFormat.YUVA422P9BE,  ///< planar YUV 4:2:2 27bpp, (1 Cr & Cb sample per 2x1 Y & A samples), big-endian
    LibAVUtil.PixelFormat.YUVA422P9LE,  ///< planar YUV 4:2:2 27bpp, (1 Cr & Cb sample per 2x1 Y & A samples), little-endian
    LibAVUtil.PixelFormat.YUVA444P9BE,  ///< planar YUV 4:4:4 36bpp, (1 Cr & Cb sample per 1x1 Y & A samples), big-endian
    LibAVUtil.PixelFormat.YUVA444P9LE,  ///< planar YUV 4:4:4 36bpp, (1 Cr & Cb sample per 1x1 Y & A samples), little-endian
    LibAVUtil.PixelFormat.YUVA420P10BE, ///< planar YUV 4:2:0 25bpp, (1 Cr & Cb sample per 2x2 Y & A samples, big-endian)
    LibAVUtil.PixelFormat.YUVA420P10LE, ///< planar YUV 4:2:0 25bpp, (1 Cr & Cb sample per 2x2 Y & A samples, little-endian)
    LibAVUtil.PixelFormat.YUVA422P10BE, ///< planar YUV 4:2:2 30bpp, (1 Cr & Cb sample per 2x1 Y & A samples, big-endian)
    LibAVUtil.PixelFormat.YUVA422P10LE, ///< planar YUV 4:2:2 30bpp, (1 Cr & Cb sample per 2x1 Y & A samples, little-endian)
    LibAVUtil.PixelFormat.YUVA444P10BE, ///< planar YUV 4:4:4 40bpp, (1 Cr & Cb sample per 1x1 Y & A samples, big-endian)
    LibAVUtil.PixelFormat.YUVA444P10LE, ///< planar YUV 4:4:4 40bpp, (1 Cr & Cb sample per 1x1 Y & A samples, little-endian)
    LibAVUtil.PixelFormat.YUVA420P16BE, ///< planar YUV 4:2:0 40bpp, (1 Cr & Cb sample per 2x2 Y & A samples, big-endian)
    LibAVUtil.PixelFormat.YUVA420P16LE, ///< planar YUV 4:2:0 40bpp, (1 Cr & Cb sample per 2x2 Y & A samples, little-endian)
    LibAVUtil.PixelFormat.YUVA422P16BE, ///< planar YUV 4:2:2 48bpp, (1 Cr & Cb sample per 2x1 Y & A samples, big-endian)
    LibAVUtil.PixelFormat.YUVA422P16LE, ///< planar YUV 4:2:2 48bpp, (1 Cr & Cb sample per 2x1 Y & A samples, little-endian)
    LibAVUtil.PixelFormat.YUVA444P16BE, ///< planar YUV 4:4:4 64bpp, (1 Cr & Cb sample per 1x1 Y & A samples, big-endian)
    LibAVUtil.PixelFormat.YUVA444P16LE, ///< planar YUV 4:4:4 64bpp, (1 Cr & Cb sample per 1x1 Y & A samples, little-endian)

    LibAVUtil.PixelFormat.VDPAU,     ///< HW acceleration through VDPAU, Picture.data[3] contains a VdpVideoSurface

    LibAVUtil.PixelFormat.XYZ12LE,      ///< packed XYZ 4:4:4, 36 bpp, (msb) 12X, 12Y, 12Z (lsb), the 2-byte value for each X/Y/Z is stored as little-endian, the 4 lower bits are set to 0
    LibAVUtil.PixelFormat.XYZ12BE,      ///< packed XYZ 4:4:4, 36 bpp, (msb) 12X, 12Y, 12Z (lsb), the 2-byte value for each X/Y/Z is stored as big-endian, the 4 lower bits are set to 0
    LibAVUtil.PixelFormat.NV16,         ///< interleaved chroma YUV 4:2:2, 16bpp, (1 Cr & Cb sample per 2x1 Y samples)
    LibAVUtil.PixelFormat.NV20LE,       ///< interleaved chroma YUV 4:2:2, 20bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian
    LibAVUtil.PixelFormat.NV20BE,       ///< interleaved chroma YUV 4:2:2, 20bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian

    LibAVUtil.PixelFormat.RGBA64BE,     ///< packed RGBA 16:16:16:16, 64bpp, 16R, 16G, 16B, 16A, the 2-byte value for each R/G/B/A component is stored as big-endian
    LibAVUtil.PixelFormat.RGBA64LE,     ///< packed RGBA 16:16:16:16, 64bpp, 16R, 16G, 16B, 16A, the 2-byte value for each R/G/B/A component is stored as little-endian
    LibAVUtil.PixelFormat.BGRA64BE,     ///< packed RGBA 16:16:16:16, 64bpp, 16B, 16G, 16R, 16A, the 2-byte value for each R/G/B/A component is stored as big-endian
    LibAVUtil.PixelFormat.BGRA64LE,     ///< packed RGBA 16:16:16:16, 64bpp, 16B, 16G, 16R, 16A, the 2-byte value for each R/G/B/A component is stored as little-endian

    LibAVUtil.PixelFormat.YVYU422,   ///< packed YUV 4:2:2, 16bpp, Y0 Cr Y1 Cb

    LibAVUtil.PixelFormat.YA16BE,       ///< 16 bits gray, 16 bits alpha (big-endian)
    LibAVUtil.PixelFormat.YA16LE,       ///< 16 bits gray, 16 bits alpha (little-endian)

    LibAVUtil.PixelFormat.GBRAP,        ///< planar GBRA 4:4:4:4 32bpp
    LibAVUtil.PixelFormat.GBRAP16BE,    ///< planar GBRA 4:4:4:4 64bpp, big-endian
    LibAVUtil.PixelFormat.GBRAP16LE,    ///< planar GBRA 4:4:4:4 64bpp, little-endian
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
    LibAVUtil.PixelFormat.QSV,
    /**
    HW acceleration though MMAL, data[3] contains a pointer to the
    MMAL_BUFFER_HEADER_T structure.
    ***********************************************************/
    LibAVUtil.PixelFormat.MMAL,

    LibAVUtil.PixelFormat.D3D11VA_VLD,  ///< HW decoding through Direct3D11 via old API, Picture.data[3] contains a ID3D11VideoDecoderOutputView pointer

    /**
    HW acceleration through CUDA. data[i] contain CUdeviceptr pointers
    exactly as for system memory frames.
    ***********************************************************/
    LibAVUtil.PixelFormat.CUDA,

    LibAVUtil.PixelFormat.0RGB,        ///< packed RGB 8:8:8, 32bpp, XRGBXRGB...   X=unused/undefined
    LibAVUtil.PixelFormat.RGB0,        ///< packed RGB 8:8:8, 32bpp, RGBXRGBX...   X=unused/undefined
    LibAVUtil.PixelFormat.0BGR,        ///< packed BGR 8:8:8, 32bpp, XBGRXBGR...   X=unused/undefined
    LibAVUtil.PixelFormat.BGR0,        ///< packed BGR 8:8:8, 32bpp, BGRXBGRX...   X=unused/undefined

    LibAVUtil.PixelFormat.YUV420P12BE, ///< planar YUV 4:2:0,18bpp, (1 Cr & Cb sample per 2x2 Y samples), big-endian
    LibAVUtil.PixelFormat.YUV420P12LE, ///< planar YUV 4:2:0,18bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian
    LibAVUtil.PixelFormat.YUV420P14BE, ///< planar YUV 4:2:0,21bpp, (1 Cr & Cb sample per 2x2 Y samples), big-endian
    LibAVUtil.PixelFormat.YUV420P14LE, ///< planar YUV 4:2:0,21bpp, (1 Cr & Cb sample per 2x2 Y samples), little-endian
    LibAVUtil.PixelFormat.YUV422P12BE, ///< planar YUV 4:2:2,24bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian
    LibAVUtil.PixelFormat.YUV422P12LE, ///< planar YUV 4:2:2,24bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian
    LibAVUtil.PixelFormat.YUV422P14BE, ///< planar YUV 4:2:2,28bpp, (1 Cr & Cb sample per 2x1 Y samples), big-endian
    LibAVUtil.PixelFormat.YUV422P14LE, ///< planar YUV 4:2:2,28bpp, (1 Cr & Cb sample per 2x1 Y samples), little-endian
    LibAVUtil.PixelFormat.YUV444P12BE, ///< planar YUV 4:4:4,36bpp, (1 Cr & Cb sample per 1x1 Y samples), big-endian
    LibAVUtil.PixelFormat.YUV444P12LE, ///< planar YUV 4:4:4,36bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian
    LibAVUtil.PixelFormat.YUV444P14BE, ///< planar YUV 4:4:4,42bpp, (1 Cr & Cb sample per 1x1 Y samples), big-endian
    LibAVUtil.PixelFormat.YUV444P14LE, ///< planar YUV 4:4:4,42bpp, (1 Cr & Cb sample per 1x1 Y samples), little-endian
    LibAVUtil.PixelFormat.GBRP12BE,    ///< planar GBR 4:4:4 36bpp, big-endian
    LibAVUtil.PixelFormat.GBRP12LE,    ///< planar GBR 4:4:4 36bpp, little-endian
    LibAVUtil.PixelFormat.GBRP14BE,    ///< planar GBR 4:4:4 42bpp, big-endian
    LibAVUtil.PixelFormat.GBRP14LE,    ///< planar GBR 4:4:4 42bpp, little-endian
    LibAVUtil.PixelFormat.YUVJ411P,    ///< planar YUV 4:1:1, 12bpp, (1 Cr & Cb sample per 4x1 Y samples) full scale (JPEG), deprecated in favor of LibAVUtil.PixelFormat.YUV411P and setting color_range

    LibAVUtil.PixelFormat.BAYER_BGGR8,    ///< bayer, BGBG..(odd line), GRGR..(even line), 8-bit samples
    LibAVUtil.PixelFormat.BAYER_RGGB8,    ///< bayer, RGRG..(odd line), GBGB..(even line), 8-bit samples
    LibAVUtil.PixelFormat.BAYER_GBRG8,    ///< bayer, GBGB..(odd line), RGRG..(even line), 8-bit samples
    LibAVUtil.PixelFormat.BAYER_GRBG8,    ///< bayer, GRGR..(odd line), BGBG..(even line), 8-bit samples
    LibAVUtil.PixelFormat.BAYER_BGGR16LE, ///< bayer, BGBG..(odd line), GRGR..(even line), 16-bit samples, little-endian
    LibAVUtil.PixelFormat.BAYER_BGGR16BE, ///< bayer, BGBG..(odd line), GRGR..(even line), 16-bit samples, big-endian
    LibAVUtil.PixelFormat.BAYER_RGGB16LE, ///< bayer, RGRG..(odd line), GBGB..(even line), 16-bit samples, little-endian
    LibAVUtil.PixelFormat.BAYER_RGGB16BE, ///< bayer, RGRG..(odd line), GBGB..(even line), 16-bit samples, big-endian
    LibAVUtil.PixelFormat.BAYER_GBRG16LE, ///< bayer, GBGB..(odd line), RGRG..(even line), 16-bit samples, little-endian
    LibAVUtil.PixelFormat.BAYER_GBRG16BE, ///< bayer, GBGB..(odd line), RGRG..(even line), 16-bit samples, big-endian
    LibAVUtil.PixelFormat.BAYER_GRBG16LE, ///< bayer, GRGR..(odd line), BGBG..(even line), 16-bit samples, little-endian
    LibAVUtil.PixelFormat.BAYER_GRBG16BE, ///< bayer, GRGR..(odd line), BGBG..(even line), 16-bit samples, big-endian

    LibAVUtil.PixelFormat.YUV440P10LE, ///< planar YUV 4:4:0,20bpp, (1 Cr & Cb sample per 1x2 Y samples), little-endian
    LibAVUtil.PixelFormat.YUV440P10BE, ///< planar YUV 4:4:0,20bpp, (1 Cr & Cb sample per 1x2 Y samples), big-endian
    LibAVUtil.PixelFormat.YUV440P12LE, ///< planar YUV 4:4:0,24bpp, (1 Cr & Cb sample per 1x2 Y samples), little-endian
    LibAVUtil.PixelFormat.YUV440P12BE, ///< planar YUV 4:4:0,24bpp, (1 Cr & Cb sample per 1x2 Y samples), big-endian
    LibAVUtil.PixelFormat.AYUV64LE,    ///< packed AYUV 4:4:4,64bpp (1 Cr & Cb sample per 1x1 Y & A samples), little-endian
    LibAVUtil.PixelFormat.AYUV64BE,    ///< packed AYUV 4:4:4,64bpp (1 Cr & Cb sample per 1x1 Y & A samples), big-endian

    LibAVUtil.PixelFormat.VIDEOTOOLBOX, ///< hardware decoding through Videotoolbox

    LibAVUtil.PixelFormat.P010LE, ///< like NV12, with 10bpp per component, data in the high bits, zeros in the low bits, little-endian
    LibAVUtil.PixelFormat.P010BE, ///< like NV12, with 10bpp per component, data in the high bits, zeros in the low bits, big-endian

    LibAVUtil.PixelFormat.GBRAP12BE,  ///< planar GBR 4:4:4:4 48bpp, big-endian
    LibAVUtil.PixelFormat.GBRAP12LE,  ///< planar GBR 4:4:4:4 48bpp, little-endian

    LibAVUtil.PixelFormat.GBRAP10BE,  ///< planar GBR 4:4:4:4 40bpp, big-endian
    LibAVUtil.PixelFormat.GBRAP10LE,  ///< planar GBR 4:4:4:4 40bpp, little-endian

    LibAVUtil.PixelFormat.MEDIACODEC, ///< hardware decoding through MediaCodec

    LibAVUtil.PixelFormat.GRAY12BE,   ///<        Y        , 12bpp, big-endian
    LibAVUtil.PixelFormat.GRAY12LE,   ///<        Y        , 12bpp, little-endian
    LibAVUtil.PixelFormat.GRAY10BE,   ///<        Y        , 10bpp, big-endian
    LibAVUtil.PixelFormat.GRAY10LE,   ///<        Y        , 10bpp, little-endian

    LibAVUtil.PixelFormat.P016LE, ///< like NV12, with 16bpp per component, little-endian
    LibAVUtil.PixelFormat.P016BE, ///< like NV12, with 16bpp per component, big-endian

    /**
    Hardware surfaces for Direct3D11.

    This is preferred over the legacy LibAVUtil.PixelFormat.D3D11VA_VLD. The new D3D11
    hwaccel API and filtering support LibAVUtil.PixelFormat.D3D11 only.

    data[0] contains a ID3D11Texture2D pointer, and data[1] contains the
    texture array index of the frame as intptr_t if the ID3D11Texture2D is
    an array texture (or always 0 if it's a normal texture).
    ***********************************************************/
    LibAVUtil.PixelFormat.D3D11,

    LibAVUtil.PixelFormat.GRAY9BE,   ///<        Y        , 9bpp, big-endian
    LibAVUtil.PixelFormat.GRAY9LE,   ///<        Y        , 9bpp, little-endian

    LibAVUtil.PixelFormat.GBRPF32BE,  ///< IEEE-754 single precision planar GBR 4:4:4,     96bpp, big-endian
    LibAVUtil.PixelFormat.GBRPF32LE,  ///< IEEE-754 single precision planar GBR 4:4:4,     96bpp, little-endian
    LibAVUtil.PixelFormat.GBRAPF32BE, ///< IEEE-754 single precision planar GBRA 4:4:4:4, 128bpp, big-endian
    LibAVUtil.PixelFormat.GBRAPF32LE, ///< IEEE-754 single precision planar GBRA 4:4:4:4, 128bpp, little-endian

    /**
    DRM-managed buffers exposed through PRIME buffer sharing.

    data[0] points to an AVDRMFrameDescriptor.
    ***********************************************************/
    LibAVUtil.PixelFormat.DRM_PRIME,
    /**
    Hardware surfaces for OpenCL.

    data[i] contain 2D image objects (typed in C as cl_mem, used
    in OpenCL as image2d_t) for each plane of the surface.
    ***********************************************************/
    LibAVUtil.PixelFormat.OPENCL,

    LibAVUtil.PixelFormat.GRAY14BE,   ///<        Y        , 14bpp, big-endian
    LibAVUtil.PixelFormat.GRAY14LE,   ///<        Y        , 14bpp, little-endian

    LibAVUtil.PixelFormat.GRAYF32BE,  ///< IEEE-754 single precision Y, 32bpp, big-endian
    LibAVUtil.PixelFormat.GRAYF32LE,  ///< IEEE-754 single precision Y, 32bpp, little-endian

    LibAVUtil.PixelFormat.YUVA422P12BE, ///< planar YUV 4:2:2,24bpp, (1 Cr & Cb sample per 2x1 Y samples), 12b alpha, big-endian
    LibAVUtil.PixelFormat.YUVA422P12LE, ///< planar YUV 4:2:2,24bpp, (1 Cr & Cb sample per 2x1 Y samples), 12b alpha, little-endian
    LibAVUtil.PixelFormat.YUVA444P12BE, ///< planar YUV 4:4:4,36bpp, (1 Cr & Cb sample per 1x1 Y samples), 12b alpha, big-endian
    LibAVUtil.PixelFormat.YUVA444P12LE, ///< planar YUV 4:4:4,36bpp, (1 Cr & Cb sample per 1x1 Y samples), 12b alpha, little-endian

    LibAVUtil.PixelFormat.NV24,      ///< planar YUV 4:4:4, 24bpp, 1 plane for Y and 1 plane for the UV components, which are interleaved (first byte U and the following byte V)
    LibAVUtil.PixelFormat.NV42,      ///< as above, but U and V bytes are swapped

    /**
    Vulkan hardware images.

    data[0] points to an AVVkFrame
    ***********************************************************/
    LibAVUtil.PixelFormat.VULKAN,

    LibAVUtil.PixelFormat.Y210BE,    ///< packed YUV 4:2:2 like YUYV422, 20bpp, data in the high bits, big-endian
    LibAVUtil.PixelFormat.Y210LE,    ///< packed YUV 4:2:2 like YUYV422, 20bpp, data in the high bits, little-endian

    LibAVUtil.PixelFormat.X2RGB10LE, ///< packed RGB 10:10:10, 30bpp, (msb)2X 10R 10G 10B (lsb), little-endian, X=unused/undefined
    LibAVUtil.PixelFormat.X2RGB10BE, ///< packed RGB 10:10:10, 30bpp, (msb)2X 10R 10G 10B (lsb), big-endian, X=unused/undefined
    LibAVUtil.PixelFormat.X2BGR10LE, ///< packed BGR 10:10:10, 30bpp, (msb)2X 10B 10G 10R (lsb), little-endian, X=unused/undefined
    LibAVUtil.PixelFormat.X2BGR10BE, ///< packed BGR 10:10:10, 30bpp, (msb)2X 10B 10G 10R (lsb), big-endian, X=unused/undefined

    LibAVUtil.PixelFormat.P210BE,      ///< interleaved chroma YUV 4:2:2, 20bpp, data in the high bits, big-endian
    LibAVUtil.PixelFormat.P210LE,      ///< interleaved chroma YUV 4:2:2, 20bpp, data in the high bits, little-endian

    LibAVUtil.PixelFormat.P410BE,      ///< interleaved chroma YUV 4:4:4, 30bpp, data in the high bits, big-endian
    LibAVUtil.PixelFormat.P410LE,      ///< interleaved chroma YUV 4:4:4, 30bpp, data in the high bits, little-endian

    LibAVUtil.PixelFormat.P216BE,      ///< interleaved chroma YUV 4:2:2, 32bpp, big-endian
    LibAVUtil.PixelFormat.P216LE,      ///< interleaved chroma YUV 4:2:2, 32bpp, little-endian

    LibAVUtil.PixelFormat.P416BE,      ///< interleaved chroma YUV 4:4:4, 48bpp, big-endian
    LibAVUtil.PixelFormat.P416LE,      ///< interleaved chroma YUV 4:4:4, 48bpp, little-endian

    LibAVUtil.PixelFormat.VUYA,        ///< packed VUYA 4:4:4:4, 32bpp (1 Cr & Cb sample per 1x1 Y & A samples), VUYAVUYA...

    LibAVUtil.PixelFormat.RGBAF16BE,   ///< IEEE-754 half precision packed RGBA 16:16:16:16, 64bpp, RGBARGBA..., big-endian
    LibAVUtil.PixelFormat.RGBAF16LE,   ///< IEEE-754 half precision packed RGBA 16:16:16:16, 64bpp, RGBARGBA..., little-endian

    LibAVUtil.PixelFormat.VUYX,        ///< packed VUYX 4:4:4:4, 32bpp, Variant of VUYA where alpha channel is left undefined

    LibAVUtil.PixelFormat.P012LE,      ///< like NV12, with 12bpp per component, data in the high bits, zeros in the low bits, little-endian
    LibAVUtil.PixelFormat.P012BE,      ///< like NV12, with 12bpp per component, data in the high bits, zeros in the low bits, big-endian

    LibAVUtil.PixelFormat.Y212BE,      ///< packed YUV 4:2:2 like YUYV422, 24bpp, data in the high bits, zeros in the low bits, big-endian
    LibAVUtil.PixelFormat.Y212LE,      ///< packed YUV 4:2:2 like YUYV422, 24bpp, data in the high bits, zeros in the low bits, little-endian

    LibAVUtil.PixelFormat.XV30BE,      ///< packed XVYU 4:4:4, 32bpp, (msb)2X 10V 10Y 10U (lsb), big-endian, variant of Y410 where alpha channel is left undefined
    LibAVUtil.PixelFormat.XV30LE,      ///< packed XVYU 4:4:4, 32bpp, (msb)2X 10V 10Y 10U (lsb), little-endian, variant of Y410 where alpha channel is left undefined

    LibAVUtil.PixelFormat.XV36BE,      ///< packed XVYU 4:4:4, 48bpp, data in the high bits, zeros in the low bits, big-endian, variant of Y412 where alpha channel is left undefined
    LibAVUtil.PixelFormat.XV36LE,      ///< packed XVYU 4:4:4, 48bpp, data in the high bits, zeros in the low bits, little-endian, variant of Y412 where alpha channel is left undefined

    LibAVUtil.PixelFormat.RGBF32BE,    ///< IEEE-754 single precision packed RGB 32:32:32, 96bpp, RGBRGB..., big-endian
    LibAVUtil.PixelFormat.RGBF32LE,    ///< IEEE-754 single precision packed RGB 32:32:32, 96bpp, RGBRGB..., little-endian

    LibAVUtil.PixelFormat.RGBAF32BE,   ///< IEEE-754 single precision packed RGBA 32:32:32:32, 128bpp, RGBARGBA..., big-endian
    LibAVUtil.PixelFormat.RGBAF32LE,   ///< IEEE-754 single precision packed RGBA 32:32:32:32, 128bpp, RGBARGBA..., little-endian

    LibAVUtil.PixelFormat.P212BE,      ///< interleaved chroma YUV 4:2:2, 24bpp, data in the high bits, big-endian
    LibAVUtil.PixelFormat.P212LE,      ///< interleaved chroma YUV 4:2:2, 24bpp, data in the high bits, little-endian

    LibAVUtil.PixelFormat.P412BE,      ///< interleaved chroma YUV 4:4:4, 36bpp, data in the high bits, big-endian
    LibAVUtil.PixelFormat.P412LE,      ///< interleaved chroma YUV 4:4:4, 36bpp, data in the high bits, little-endian

    LibAVUtil.PixelFormat.GBRAP14BE,  ///< planar GBR 4:4:4:4 56bpp, big-endian
    LibAVUtil.PixelFormat.GBRAP14LE,  ///< planar GBR 4:4:4:4 56bpp, little-endian

    /**
    Hardware surfaces for Direct3D 12.

    data[0] points to an AVD3D12VAFrame
    ***********************************************************/
    LibAVUtil.PixelFormat.D3D12,

    LibAVUtil.PixelFormat.AYUV,        ///< packed AYUV 4:4:4:4, 32bpp (1 Cr & Cb sample per 1x1 Y & A samples), AYUVAYUV...

    LibAVUtil.PixelFormat.UYVA,        ///< packed UYVA 4:4:4:4, 32bpp (1 Cr & Cb sample per 1x1 Y & A samples), UYVAUYVA...

    LibAVUtil.PixelFormat.VYU444,      ///< packed VYU 4:4:4, 24bpp (1 Cr & Cb sample per 1x1 Y), VYUVYU...

    LibAVUtil.PixelFormat.V30XBE,      ///< packed VYUX 4:4:4 like XV30, 32bpp, (msb)10V 10Y 10U 2X (lsb), big-endian
    LibAVUtil.PixelFormat.V30XLE,      ///< packed VYUX 4:4:4 like XV30, 32bpp, (msb)10V 10Y 10U 2X (lsb), little-endian

    LibAVUtil.PixelFormat.RGBF16BE,    ///< IEEE-754 half precision packed RGB 16:16:16, 48bpp, RGBRGB..., big-endian
    LibAVUtil.PixelFormat.RGBF16LE,    ///< IEEE-754 half precision packed RGB 16:16:16, 48bpp, RGBRGB..., little-endian

    LibAVUtil.PixelFormat.RGBA128BE,   ///< packed RGBA 32:32:32:32, 128bpp, RGBARGBA..., big-endian
    LibAVUtil.PixelFormat.RGBA128LE,   ///< packed RGBA 32:32:32:32, 128bpp, RGBARGBA..., little-endian

    LibAVUtil.PixelFormat.RGB96BE,     ///< packed RGBA 32:32:32, 96bpp, RGBRGB..., big-endian
    LibAVUtil.PixelFormat.RGB96LE,     ///< packed RGBA 32:32:32, 96bpp, RGBRGB..., little-endian

    LibAVUtil.PixelFormat.Y216BE,      ///< packed YUV 4:2:2 like YUYV422, 32bpp, big-endian
    LibAVUtil.PixelFormat.Y216LE,      ///< packed YUV 4:2:2 like YUYV422, 32bpp, little-endian

    LibAVUtil.PixelFormat.XV48BE,      ///< packed XVYU 4:4:4, 64bpp, big-endian, variant of Y416 where alpha channel is left undefined
    LibAVUtil.PixelFormat.XV48LE,      ///< packed XVYU 4:4:4, 64bpp, little-endian, variant of Y416 where alpha channel is left undefined

    LibAVUtil.PixelFormat.GBRPF16BE,  ///< IEEE-754 half precision planer GBR 4:4:4, 48bpp, big-endian
    LibAVUtil.PixelFormat.GBRPF16LE,  ///< IEEE-754 half precision planer GBR 4:4:4, 48bpp, little-endian
    LibAVUtil.PixelFormat.GBRAPF16BE, ///< IEEE-754 half precision planar GBRA 4:4:4:4, 64bpp, big-endian
    LibAVUtil.PixelFormat.GBRAPF16LE, ///< IEEE-754 half precision planar GBRA 4:4:4:4, 64bpp, little-endian

    LibAVUtil.PixelFormat.GRAYF16BE,  ///< IEEE-754 half precision Y, 16bpp, big-endian
    LibAVUtil.PixelFormat.GRAYF16LE,  ///< IEEE-754 half precision Y, 16bpp, little-endian

    /**
    HW acceleration through AMF. data[0] contain AMFSurface pointer
    ***********************************************************/
    LibAVUtil.PixelFormat.AMF_SURFACE,

    LibAVUtil.PixelFormat.GRAY32BE,    ///<         Y        , 32bpp, big-endian
    LibAVUtil.PixelFormat.GRAY32LE,    ///<         Y        , 32bpp, little-endian

    LibAVUtil.PixelFormat.YAF32BE,  ///< IEEE-754 single precision packed YA, 32 bits gray, 32 bits alpha, 64bpp, big-endian
    LibAVUtil.PixelFormat.YAF32LE,  ///< IEEE-754 single precision packed YA, 32 bits gray, 32 bits alpha, 64bpp, little-endian

    LibAVUtil.PixelFormat.YAF16BE,  ///< IEEE-754 half precision packed YA, 16 bits gray, 16 bits alpha, 32bpp, big-endian
    LibAVUtil.PixelFormat.YAF16LE,  ///< IEEE-754 half precision packed YA, 16 bits gray, 16 bits alpha, 32bpp, little-endian

    LibAVUtil.PixelFormat.GBRAP32BE,   ///< planar GBRA 4:4:4:4 128bpp, big-endian
    LibAVUtil.PixelFormat.GBRAP32LE,   ///< planar GBRA 4:4:4:4 128bpp, little-endian

    LibAVUtil.PixelFormat.YUV444P10MSBBE, ///< planar YUV 4:4:4, 30bpp, (1 Cr & Cb sample per 1x1 Y samples), lowest bits zero, big-endian
    LibAVUtil.PixelFormat.YUV444P10MSBLE, ///< planar YUV 4:4:4, 30bpp, (1 Cr & Cb sample per 1x1 Y samples), lowest bits zero, little-endian
    LibAVUtil.PixelFormat.YUV444P12MSBBE, ///< planar YUV 4:4:4, 30bpp, (1 Cr & Cb sample per 1x1 Y samples), lowest bits zero, big-endian
    LibAVUtil.PixelFormat.YUV444P12MSBLE, ///< planar YUV 4:4:4, 30bpp, (1 Cr & Cb sample per 1x1 Y samples), lowest bits zero, little-endian
    LibAVUtil.PixelFormat.GBRP10MSBBE,    ///< planar GBR 4:4:4 30bpp, lowest bits zero, big-endian
    LibAVUtil.PixelFormat.GBRP10MSBLE,    ///< planar GBR 4:4:4 30bpp, lowest bits zero, little-endian
    LibAVUtil.PixelFormat.GBRP12MSBBE,    ///< planar GBR 4:4:4 36bpp, lowest bits zero, big-endian
    LibAVUtil.PixelFormat.GBRP12MSBLE,    ///< planar GBR 4:4:4 36bpp, lowest bits zero, little-endian

    LibAVUtil.PixelFormat.OHCODEC, /// hardware decoding through openharmony

    LibAVUtil.PixelFormat.NB         ///< number of pixel formats, DO NOT USE THIS if you want to link with shared libav* because the number of formats might differ between versions
};

#if AV_HAVE_BIGENDIAN
#   define LibAVUtil.PixelFormat.NE (be, le) LibAVUtil.PixelFormat.##be
#else
#   define LibAVUtil.PixelFormat.NE (be, le) LibAVUtil.PixelFormat.##le
#endif

#define LibAVUtil.PixelFormat.RGB32   LibAVUtil.PixelFormat.NE (ARGB, BGRA)
#define LibAVUtil.PixelFormat.RGB32_1 LibAVUtil.PixelFormat.NE (RGBA, ABGR)
#define LibAVUtil.PixelFormat.BGR32   LibAVUtil.PixelFormat.NE (ABGR, RGBA)
#define LibAVUtil.PixelFormat.BGR32_1 LibAVUtil.PixelFormat.NE (BGRA, ARGB)
#define LibAVUtil.PixelFormat.0RGB32  LibAVUtil.PixelFormat.NE (0RGB, BGR0)
#define LibAVUtil.PixelFormat.0BGR32  LibAVUtil.PixelFormat.NE (0BGR, RGB0)

#define LibAVUtil.PixelFormat.GRAY9  LibAVUtil.PixelFormat.NE (GRAY9BE,  GRAY9LE)
#define LibAVUtil.PixelFormat.GRAY10 LibAVUtil.PixelFormat.NE (GRAY10BE, GRAY10LE)
#define LibAVUtil.PixelFormat.GRAY12 LibAVUtil.PixelFormat.NE (GRAY12BE, GRAY12LE)
#define LibAVUtil.PixelFormat.GRAY14 LibAVUtil.PixelFormat.NE (GRAY14BE, GRAY14LE)
#define LibAVUtil.PixelFormat.GRAY16 LibAVUtil.PixelFormat.NE (GRAY16BE, GRAY16LE)
#define LibAVUtil.PixelFormat.GRAY32 LibAVUtil.PixelFormat.NE (GRAY32BE, GRAY32LE)
#define LibAVUtil.PixelFormat.YA16   LibAVUtil.PixelFormat.NE (YA16BE,   YA16LE)
#define LibAVUtil.PixelFormat.RGB48  LibAVUtil.PixelFormat.NE (RGB48BE,  RGB48LE)
#define LibAVUtil.PixelFormat.RGB565 LibAVUtil.PixelFormat.NE (RGB565BE, RGB565LE)
#define LibAVUtil.PixelFormat.RGB555 LibAVUtil.PixelFormat.NE (RGB555BE, RGB555LE)
#define LibAVUtil.PixelFormat.RGB444 LibAVUtil.PixelFormat.NE (RGB444BE, RGB444LE)
#define LibAVUtil.PixelFormat.RGBA64 LibAVUtil.PixelFormat.NE (RGBA64BE, RGBA64LE)
#define LibAVUtil.PixelFormat.BGR48  LibAVUtil.PixelFormat.NE (BGR48BE,  BGR48LE)
#define LibAVUtil.PixelFormat.BGR565 LibAVUtil.PixelFormat.NE (BGR565BE, BGR565LE)
#define LibAVUtil.PixelFormat.BGR555 LibAVUtil.PixelFormat.NE (BGR555BE, BGR555LE)
#define LibAVUtil.PixelFormat.BGR444 LibAVUtil.PixelFormat.NE (BGR444BE, BGR444LE)
#define LibAVUtil.PixelFormat.BGRA64 LibAVUtil.PixelFormat.NE (BGRA64BE, BGRA64LE)

#define LibAVUtil.PixelFormat.YUV420P9  LibAVUtil.PixelFormat.NE (YUV420P9BE , YUV420P9LE)
#define LibAVUtil.PixelFormat.YUV422P9  LibAVUtil.PixelFormat.NE (YUV422P9BE , YUV422P9LE)
#define LibAVUtil.PixelFormat.YUV444P9  LibAVUtil.PixelFormat.NE (YUV444P9BE , YUV444P9LE)
#define LibAVUtil.PixelFormat.YUV420P10 LibAVUtil.PixelFormat.NE (YUV420P10BE, YUV420P10LE)
#define LibAVUtil.PixelFormat.YUV422P10 LibAVUtil.PixelFormat.NE (YUV422P10BE, YUV422P10LE)
#define LibAVUtil.PixelFormat.YUV440P10 LibAVUtil.PixelFormat.NE (YUV440P10BE, YUV440P10LE)
#define LibAVUtil.PixelFormat.YUV444P10 LibAVUtil.PixelFormat.NE (YUV444P10BE, YUV444P10LE)
#define LibAVUtil.PixelFormat.YUV420P12 LibAVUtil.PixelFormat.NE (YUV420P12BE, YUV420P12LE)
#define LibAVUtil.PixelFormat.YUV422P12 LibAVUtil.PixelFormat.NE (YUV422P12BE, YUV422P12LE)
#define LibAVUtil.PixelFormat.YUV440P12 LibAVUtil.PixelFormat.NE (YUV440P12BE, YUV440P12LE)
#define LibAVUtil.PixelFormat.YUV444P12 LibAVUtil.PixelFormat.NE (YUV444P12BE, YUV444P12LE)
#define LibAVUtil.PixelFormat.YUV420P14 LibAVUtil.PixelFormat.NE (YUV420P14BE, YUV420P14LE)
#define LibAVUtil.PixelFormat.YUV422P14 LibAVUtil.PixelFormat.NE (YUV422P14BE, YUV422P14LE)
#define LibAVUtil.PixelFormat.YUV444P14 LibAVUtil.PixelFormat.NE (YUV444P14BE, YUV444P14LE)
#define LibAVUtil.PixelFormat.YUV420P16 LibAVUtil.PixelFormat.NE (YUV420P16BE, YUV420P16LE)
#define LibAVUtil.PixelFormat.YUV422P16 LibAVUtil.PixelFormat.NE (YUV422P16BE, YUV422P16LE)
#define LibAVUtil.PixelFormat.YUV444P16 LibAVUtil.PixelFormat.NE (YUV444P16BE, YUV444P16LE)

#define LibAVUtil.PixelFormat.YUV444P10MSB LibAVUtil.PixelFormat.NE (YUV444P10MSBBE, YUV444P10MSBLE)
#define LibAVUtil.PixelFormat.YUV444P12MSB LibAVUtil.PixelFormat.NE (YUV444P12MSBBE, YUV444P12MSBLE)

#define LibAVUtil.PixelFormat.GBRP9     LibAVUtil.PixelFormat.NE (GBRP9BE ,    GBRP9LE)
#define LibAVUtil.PixelFormat.GBRP10    LibAVUtil.PixelFormat.NE (GBRP10BE,    GBRP10LE)
#define LibAVUtil.PixelFormat.GBRP12    LibAVUtil.PixelFormat.NE (GBRP12BE,    GBRP12LE)
#define LibAVUtil.PixelFormat.GBRP14    LibAVUtil.PixelFormat.NE (GBRP14BE,    GBRP14LE)
#define LibAVUtil.PixelFormat.GBRP16    LibAVUtil.PixelFormat.NE (GBRP16BE,    GBRP16LE)
#define LibAVUtil.PixelFormat.GBRAP10   LibAVUtil.PixelFormat.NE (GBRAP10BE,   GBRAP10LE)
#define LibAVUtil.PixelFormat.GBRAP12   LibAVUtil.PixelFormat.NE (GBRAP12BE,   GBRAP12LE)
#define LibAVUtil.PixelFormat.GBRAP14   LibAVUtil.PixelFormat.NE (GBRAP14BE,   GBRAP14LE)
#define LibAVUtil.PixelFormat.GBRAP16   LibAVUtil.PixelFormat.NE (GBRAP16BE,   GBRAP16LE)
#define LibAVUtil.PixelFormat.GBRAP32   LibAVUtil.PixelFormat.NE (GBRAP32BE,   GBRAP32LE)

#define LibAVUtil.PixelFormat.GBRP10MSB LibAVUtil.PixelFormat.NE (GBRP10MSBBE, GBRP10MSBLE)
#define LibAVUtil.PixelFormat.GBRP12MSB LibAVUtil.PixelFormat.NE (GBRP12MSBBE, GBRP12MSBLE)

#define LibAVUtil.PixelFormat.BAYER_BGGR16 LibAVUtil.PixelFormat.NE (BAYER_BGGR16BE,    BAYER_BGGR16LE)
#define LibAVUtil.PixelFormat.BAYER_RGGB16 LibAVUtil.PixelFormat.NE (BAYER_RGGB16BE,    BAYER_RGGB16LE)
#define LibAVUtil.PixelFormat.BAYER_GBRG16 LibAVUtil.PixelFormat.NE (BAYER_GBRG16BE,    BAYER_GBRG16LE)
#define LibAVUtil.PixelFormat.BAYER_GRBG16 LibAVUtil.PixelFormat.NE (BAYER_GRBG16BE,    BAYER_GRBG16LE)

#define LibAVUtil.PixelFormat.GBRPF16    LibAVUtil.PixelFormat.NE (GBRPF16BE,  GBRPF16LE)
#define LibAVUtil.PixelFormat.GBRAPF16   LibAVUtil.PixelFormat.NE (GBRAPF16BE, GBRAPF16LE)
#define LibAVUtil.PixelFormat.GBRPF32    LibAVUtil.PixelFormat.NE (GBRPF32BE,  GBRPF32LE)
#define LibAVUtil.PixelFormat.GBRAPF32   LibAVUtil.PixelFormat.NE (GBRAPF32BE, GBRAPF32LE)

#define LibAVUtil.PixelFormat.GRAYF16    LibAVUtil.PixelFormat.NE (GRAYF16BE, GRAYF16LE)
#define LibAVUtil.PixelFormat.GRAYF32    LibAVUtil.PixelFormat.NE (GRAYF32BE, GRAYF32LE)

#define LibAVUtil.PixelFormat.YAF16      LibAVUtil.PixelFormat.NE (YAF16BE, YAF16LE)
#define LibAVUtil.PixelFormat.YAF32      LibAVUtil.PixelFormat.NE (YAF32BE, YAF32LE)

#define LibAVUtil.PixelFormat.YUVA420P9  LibAVUtil.PixelFormat.NE (YUVA420P9BE , YUVA420P9LE)
#define LibAVUtil.PixelFormat.YUVA422P9  LibAVUtil.PixelFormat.NE (YUVA422P9BE , YUVA422P9LE)
#define LibAVUtil.PixelFormat.YUVA444P9  LibAVUtil.PixelFormat.NE (YUVA444P9BE , YUVA444P9LE)
#define LibAVUtil.PixelFormat.YUVA420P10 LibAVUtil.PixelFormat.NE (YUVA420P10BE, YUVA420P10LE)
#define LibAVUtil.PixelFormat.YUVA422P10 LibAVUtil.PixelFormat.NE (YUVA422P10BE, YUVA422P10LE)
#define LibAVUtil.PixelFormat.YUVA444P10 LibAVUtil.PixelFormat.NE (YUVA444P10BE, YUVA444P10LE)
#define LibAVUtil.PixelFormat.YUVA422P12 LibAVUtil.PixelFormat.NE (YUVA422P12BE, YUVA422P12LE)
#define LibAVUtil.PixelFormat.YUVA444P12 LibAVUtil.PixelFormat.NE (YUVA444P12BE, YUVA444P12LE)
#define LibAVUtil.PixelFormat.YUVA420P16 LibAVUtil.PixelFormat.NE (YUVA420P16BE, YUVA420P16LE)
#define LibAVUtil.PixelFormat.YUVA422P16 LibAVUtil.PixelFormat.NE (YUVA422P16BE, YUVA422P16LE)
#define LibAVUtil.PixelFormat.YUVA444P16 LibAVUtil.PixelFormat.NE (YUVA444P16BE, YUVA444P16LE)

#define LibAVUtil.PixelFormat.XYZ12      LibAVUtil.PixelFormat.NE (XYZ12BE, XYZ12LE)
#define LibAVUtil.PixelFormat.NV20       LibAVUtil.PixelFormat.NE (NV20BE,  NV20LE)
#define LibAVUtil.PixelFormat.AYUV64     LibAVUtil.PixelFormat.NE (AYUV64BE, AYUV64LE)
#define LibAVUtil.PixelFormat.P010       LibAVUtil.PixelFormat.NE (P010BE,  P010LE)
#define LibAVUtil.PixelFormat.P012       LibAVUtil.PixelFormat.NE (P012BE,  P012LE)
#define LibAVUtil.PixelFormat.P016       LibAVUtil.PixelFormat.NE (P016BE,  P016LE)

#define LibAVUtil.PixelFormat.Y210       LibAVUtil.PixelFormat.NE (Y210BE,  Y210LE)
#define LibAVUtil.PixelFormat.Y212       LibAVUtil.PixelFormat.NE (Y212BE,  Y212LE)
#define LibAVUtil.PixelFormat.Y216       LibAVUtil.PixelFormat.NE (Y216BE,  Y216LE)
#define LibAVUtil.PixelFormat.XV30       LibAVUtil.PixelFormat.NE (XV30BE,  XV30LE)
#define LibAVUtil.PixelFormat.XV36       LibAVUtil.PixelFormat.NE (XV36BE,  XV36LE)
#define LibAVUtil.PixelFormat.XV48       LibAVUtil.PixelFormat.NE (XV48BE,  XV48LE)
#define LibAVUtil.PixelFormat.V30X       LibAVUtil.PixelFormat.NE (V30XBE,  V30XLE)
#define LibAVUtil.PixelFormat.X2RGB10    LibAVUtil.PixelFormat.NE (X2RGB10BE, X2RGB10LE)
#define LibAVUtil.PixelFormat.X2BGR10    LibAVUtil.PixelFormat.NE (X2BGR10BE, X2BGR10LE)

#define LibAVUtil.PixelFormat.P210       LibAVUtil.PixelFormat.NE (P210BE, P210LE)
#define LibAVUtil.PixelFormat.P410       LibAVUtil.PixelFormat.NE (P410BE, P410LE)
#define LibAVUtil.PixelFormat.P212       LibAVUtil.PixelFormat.NE (P212BE, P212LE)
#define LibAVUtil.PixelFormat.P412       LibAVUtil.PixelFormat.NE (P412BE, P412LE)
#define LibAVUtil.PixelFormat.P216       LibAVUtil.PixelFormat.NE (P216BE, P216LE)
#define LibAVUtil.PixelFormat.P416       LibAVUtil.PixelFormat.NE (P416BE, P416LE)

#define LibAVUtil.PixelFormat.RGBF16     LibAVUtil.PixelFormat.NE (RGBF16BE, RGBF16LE)
#define LibAVUtil.PixelFormat.RGBAF16    LibAVUtil.PixelFormat.NE (RGBAF16BE, RGBAF16LE)

#define LibAVUtil.PixelFormat.RGBF32     LibAVUtil.PixelFormat.NE (RGBF32BE, RGBF32LE)
#define LibAVUtil.PixelFormat.RGBAF32    LibAVUtil.PixelFormat.NE (RGBAF32BE, RGBAF32LE)

#define LibAVUtil.PixelFormat.RGB96      LibAVUtil.PixelFormat.NE (RGB96BE, RGB96LE)
#define LibAVUtil.PixelFormat.RGBA128    LibAVUtil.PixelFormat.NE (RGBA128BE, RGBA128LE)

/**
  * Chromaticity coordinates of the source primaries.
  * These values match the ones defined by ISO/IEC 23091-2_2019 subclause 8.1 and ITU-T H.273.
  */
enum AVColorPrimaries {
    AVCOL_PRI_RESERVED0   = 0,
    AVCOL_PRI_BT709       = 1,  ///< also ITU-R BT1361 / IEC 61966-2-4 / SMPTE RP 177 Annex B
    AVCOL_PRI_UNSPECIFIED = 2,
    AVCOL_PRI_RESERVED    = 3,
    AVCOL_PRI_BT470M      = 4,  ///< also FCC Title 47 Code of Federal Regulations 73.682 (a)(20)

    AVCOL_PRI_BT470BG     = 5,  ///< also ITU-R BT601-6 625 / ITU-R BT1358 625 / ITU-R BT1700 625 PAL & SECAM
    AVCOL_PRI_SMPTE170M   = 6,  ///< also ITU-R BT601-6 525 / ITU-R BT1358 525 / ITU-R BT1700 NTSC
    AVCOL_PRI_SMPTE240M   = 7,  ///< identical to above, also called "SMPTE C" even though it uses D65
    AVCOL_PRI_FILM        = 8,  ///< colour filters using Illuminant C
    AVCOL_PRI_BT2020      = 9,  ///< ITU-R BT2020
    AVCOL_PRI_SMPTE428    = 10, ///< SMPTE ST 428-1 (CIE 1931 XYZ)
    AVCOL_PRI_SMPTEST428_1 = AVCOL_PRI_SMPTE428,
    AVCOL_PRI_SMPTE431    = 11, ///< SMPTE ST 431-2 (2011) / DCI P3
    AVCOL_PRI_SMPTE432    = 12, ///< SMPTE ST 432-1 (2010) / P3 D65 / Display P3
    AVCOL_PRI_EBU3213     = 22, ///< EBU Tech. 3213-E (nothing there) / one of JEDEC P22 group phosphors
    AVCOL_PRI_JEDEC_P22   = AVCOL_PRI_EBU3213,
    AVCOL_PRI_NB,               ///< Not part of ABI

    /* The following entries are not part of H.273, but custom extensions */
    AVCOL_PRI_EXT_BASE     = 256,
    AVCOL_PRI_V_GAMUT      = AVCOL_PRI_EXT_BASE,
    AVCOL_PRI_EXT_NB            ///< Not part of ABI
};

/**
 * Color Transfer Characteristic.
 * These values match the ones defined by ISO/IEC 23091-2_2019 subclause 8.2.
 */
enum AVColorTransferCharacteristic {
    AVCOL_TRC_RESERVED0    = 0,
    AVCOL_TRC_BT709        = 1,  ///< also ITU-R BT1361
    AVCOL_TRC_UNSPECIFIED  = 2,
    AVCOL_TRC_RESERVED     = 3,
    AVCOL_TRC_GAMMA22      = 4,  ///< also ITU-R BT470M / ITU-R BT1700 625 PAL & SECAM
    AVCOL_TRC_GAMMA28      = 5,  ///< also ITU-R BT470BG
    AVCOL_TRC_SMPTE170M    = 6,  ///< also ITU-R BT601-6 525 or 625 / ITU-R BT1358 525 or 625 / ITU-R BT1700 NTSC
    AVCOL_TRC_SMPTE240M    = 7,
    AVCOL_TRC_LINEAR       = 8,  ///< "Linear transfer characteristics"
    AVCOL_TRC_LOG          = 9,  ///< "Logarithmic transfer characteristic (100:1 range)"
    AVCOL_TRC_LOG_SQRT     = 10, ///< "Logarithmic transfer characteristic (100 * Sqrt (10) : 1 range)"
    AVCOL_TRC_IEC61966_2_4 = 11, ///< IEC 61966-2-4
    AVCOL_TRC_BT1361_ECG   = 12, ///< ITU-R BT1361 Extended Colour Gamut
    AVCOL_TRC_IEC61966_2_1 = 13, ///< IEC 61966-2-1 (sRGB or sYCC)
    AVCOL_TRC_BT2020_10    = 14, ///< ITU-R BT2020 for 10-bit system
    AVCOL_TRC_BT2020_12    = 15, ///< ITU-R BT2020 for 12-bit system
    AVCOL_TRC_SMPTE2084    = 16, ///< SMPTE ST 2084 for 10-, 12-, 14- and 16-bit systems
    AVCOL_TRC_SMPTEST2084  = AVCOL_TRC_SMPTE2084,
    AVCOL_TRC_SMPTE428     = 17, ///< SMPTE ST 428-1
    AVCOL_TRC_SMPTEST428_1 = AVCOL_TRC_SMPTE428,
    AVCOL_TRC_ARIB_STD_B67 = 18, ///< ARIB STD-B67, known as "Hybrid log-gamma"
    AVCOL_TRC_NB,                ///< Not part of ABI

    /* The following entries are not part of H.273, but custom extensions */
    AVCOL_TRC_EXT_BASE     = 256,
    AVCOL_TRC_V_LOG        = AVCOL_TRC_EXT_BASE,
    AVCOL_TRC_EXT_NB             ///< Not part of ABI
};

/**
 * YUV colorspace type.
 * These values match the ones defined by ISO/IEC 23091-2_2019 subclause 8.3.
 */
enum AVColorSpace {
    AVCOL_SPC_RGB         = 0,  ///< order of coefficients is actually GBR, also IEC 61966-2-1 (sRGB), YZX and ST 428-1
    AVCOL_SPC_BT709       = 1,  ///< also ITU-R BT1361 / IEC 61966-2-4 xvYCC709 / derived in SMPTE RP 177 Annex B
    AVCOL_SPC_UNSPECIFIED = 2,
    AVCOL_SPC_RESERVED    = 3,  ///< reserved for future use by ITU-T and ISO/IEC just like 15-255 are
    AVCOL_SPC_FCC         = 4,  ///< FCC Title 47 Code of Federal Regulations 73.682 (a)(20)
    AVCOL_SPC_BT470BG     = 5,  ///< also ITU-R BT601-6 625 / ITU-R BT1358 625 / ITU-R BT1700 625 PAL & SECAM / IEC 61966-2-4 xvYCC601
    AVCOL_SPC_SMPTE170M   = 6,  ///< also ITU-R BT601-6 525 / ITU-R BT1358 525 / ITU-R BT1700 NTSC / functionally identical to above
    AVCOL_SPC_SMPTE240M   = 7,  ///< derived from 170M primaries and D65 white point, 170M is derived from BT470 System M's primaries
    AVCOL_SPC_YCGCO       = 8,  ///< used by Dirac / VC-2 and H.264 FRext, see ITU-T SG16
    AVCOL_SPC_YCOCG       = AVCOL_SPC_YCGCO,
    AVCOL_SPC_BT2020_NCL  = 9,  ///< ITU-R BT2020 non-constant luminance system
    AVCOL_SPC_BT2020_CL   = 10, ///< ITU-R BT2020 constant luminance system
    AVCOL_SPC_SMPTE2085   = 11, ///< SMPTE 2085, Y'D'zD'x
    AVCOL_SPC_CHROMA_DERIVED_NCL = 12, ///< Chromaticity-derived non-constant luminance system
    AVCOL_SPC_CHROMA_DERIVED_CL = 13, ///< Chromaticity-derived constant luminance system
    AVCOL_SPC_ICTCP       = 14, ///< ITU-R BT.2100-0, ICtCp
    AVCOL_SPC_IPT_C2      = 15, ///< SMPTE ST 2128, IPT-C2
    AVCOL_SPC_YCGCO_RE    = 16, ///< YCgCo-R, even addition of bits
    AVCOL_SPC_YCGCO_RO    = 17, ///< YCgCo-R, odd addition of bits
    AVCOL_SPC_NB                ///< Not part of ABI
};

/**
 * Visual content value range.
 *
 * These values are based on definitions that can be found in multiple
 * specifications, such as ITU-T BT.709 (3.4 - Quantization of RGB, luminance
 * and colour-difference signals), ITU-T BT.2020 (Table 5 - Digital
 * Representation) as well as ITU-T BT.2100 (Table 9 - Digital 10- and 12-bit
 * integer representation). At the time of writing, the BT.2100 one is
 * recommended, as it also defines the full range representation.
 *
 * Common definitions:
 *   - For RGB and luma planes such as Y in YCbCr and I in ICtCp,
 *     'E' is the original value in range of 0.0 to 1.0.
 *   - For chroma planes such as Cb,Cr and Ct,Cp, 'E' is the original
 *     value in range of -0.5 to 0.5.
 *   - 'n' is the output bit depth.
 *   - For additional definitions such as rounding and clipping to valid n
 *     bit unsigned integer range, please refer to BT.2100 (Table 9).
 */
enum AVColorRange {
    AVCOL_RANGE_UNSPECIFIED = 0,

    /**
    Narrow or limited range content.

    - For luma planes:

          (219 * E + 16) * 2^(n-8)

      F.ex. the range of 16-235 for 8 bits

    - For chroma planes:

          (224 * E + 128) * 2^(n-8)

      F.ex. the range of 16-240 for 8 bits
    ***********************************************************/
    AVCOL_RANGE_MPEG        = 1,

    /**
    Full range content.

    - For RGB and luma planes:

          (2^n - 1) * E

      F.ex. the range of 0-255 for 8 bits

    - For chroma planes:

          (2^n - 1) * E + 2^(n - 1)

      F.ex. the range of 1-255 for 8 bits
    ***********************************************************/
    AVCOL_RANGE_JPEG        = 2,
    AVCOL_RANGE_NB               ///< Not part of ABI
};

/**
 * Location of chroma samples.
 *
 * Illustration showing the location of the first (top left) chroma sample of the
 * image, the left shows only luma, the right
 * shows the location of the chroma sample, the 2 could be imagined to overlay
 * each other but are drawn separately due to limitations of ASCII
 *
 *                1st 2nd       1st 2nd horizontal luma sample positions
 *                 v   v         v   v
 *                 ______        ______
 *1st luma line > |X   X ...    |3 4 X ...     X are luma samples,
 *                |             |1 2           1-6 are possible chroma positions
 *2nd luma line > |X   X ...    |5 6 X ...     0 is undefined/unknown position
 */
enum AVChromaLocation {
    AVCHROMA_LOC_UNSPECIFIED = 0,
    AVCHROMA_LOC_LEFT        = 1, ///< MPEG-2/4 4:2:0, H.264 default for 4:2:0
    AVCHROMA_LOC_CENTER      = 2, ///< MPEG-1 4:2:0, JPEG 4:2:0, H.263 4:2:0
    AVCHROMA_LOC_TOPLEFT     = 3, ///< ITU-R 601, SMPTE 274M 296M S314M (DV 4:1:1), mpeg2 4:2:2
    AVCHROMA_LOC_TOP         = 4,
    AVCHROMA_LOC_BOTTOMLEFT  = 5,
    AVCHROMA_LOC_BOTTOM      = 6,
    AVCHROMA_LOC_NB               ///< Not part of ABI
};

/**
 * Correlation between the alpha channel and color values.
 */
enum AVAlphaMode {
    AVALPHA_MODE_UNSPECIFIED   = 0, ///< Unknown alpha handling, or no alpha channel
    AVALPHA_MODE_PREMULTIPLIED = 1, ///< Alpha channel is multiplied into color values
    AVALPHA_MODE_STRAIGHT      = 2, ///< Alpha channel is independent of color values
    AVALPHA_MODE_NB                 ///< Not part of ABI
};

#endif /* AVUTIL_PIXFMT_H */
