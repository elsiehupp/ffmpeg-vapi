/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>

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
@file
pixel format definitions
***********************************************************/

[CCode (cname="AVPALETTE_SIZE", cheader_filename="ffmpeg/libavutil/pixfmt.h")]
public const size_t AVPALETTE_SIZE;

[CCode (cname="AVPALETTE_COUNT", cheader_filename="ffmpeg/libavutil/pixfmt.h")]
public const size_t AVPALETTE_COUNT;

/***********************************************************
@brief Pixel format.

@note
PixelFormat.RGB32 is handled in an endian-specific manner. An RGBA
color is put together as:
 (A << 24) | (R << 16) | (G << 8) | B
This is stored as BGRA on little-endian CPU architectures and ARGB on
big-endian CPUs.

@note
If the resolution is not a multiple of the chroma subsampling factor
then the chroma plane resolution must be rounded up.

@par
When the pixel format is palettized RGB32 (PixelFormat.PAL8), the palettized
image data is stored in Frame.data[0]. The palette is transported in
Frame.data[1], is 1024 bytes long (256 4-byte entries) and is
formatted the same as in PixelFormat.RGB32 described above (i.e., it is
also endian-specific). Note also that the individual RGB32 palette
components stored in Frame.data[1] should be in the range 0..255.
This is important as many custom PAL8 video codecs that were designed
to run on the IBM VGA graphics adapter use 6-bit palette components.

@par
For all the 8 bits per pixel formats, an RGB32 palette is in data[1] like
for pal8. This palette is filled in automatically by the function
allocating the picture.
***********************************************************/
[CCode (cname="enum AVPixelFormat", cprefix="AV_PIX_FMT_", cheader_filename="ffmpeg/libavutil/pixfmt.h")]
public enum PixelFormat {
    NONE,
    /***********************************************************
    @brief Planar YUV 4:2:0, 12-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y samples)
    ***********************************************************/
    YUV420P,
    /***********************************************************
    @brief Packed YUV 4:2:2, 16-bit-per-pixel, Y0 Cb Y1 Cr
    ***********************************************************/
    YUYV422,
    /***********************************************************
    @brief Packed RGB 8:8:8, 24-bit-per-pixel, RGBRGB...
    ***********************************************************/
    RGB24,
    /***********************************************************
    @brief Packed RGB 8:8:8, 24-bit-per-pixel, BGRBGR...
    ***********************************************************/
    BGR24,
    /***********************************************************
    @brief Planar YUV 4:2:2, 16-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples)
    ***********************************************************/
    YUV422P,
    /***********************************************************
    @brief Planar YUV 4:4:4, 24-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y samples)
    ***********************************************************/
    YUV444P,
    /***********************************************************
    @brief Planar YUV 4:1:0, 9-bit-per-pixel, (1 Cr & Cb sample per 4x4 Y samples)
    ***********************************************************/
    YUV410P,
    /***********************************************************
    @brief Planar YUV 4:1:1, 12-bit-per-pixel, (1 Cr & Cb sample per 4x1 Y samples)
    ***********************************************************/
    YUV411P,
    /***********************************************************
    @brief Y, 8-bit-per-pixel
    ***********************************************************/
    GRAY8,
    /***********************************************************
    @brief Y, 1-bit-per-pixel, 0 is white, 1 is black, in each byte pixels are ordered from the msb to the lsb
    ***********************************************************/
    MONOWHITE,
    /***********************************************************
    @brief Y, 1-bit-per-pixel, 0 is black, 1 is white, in each byte pixels are ordered from the msb to the lsb
    ***********************************************************/
    MONOBLACK,
    /***********************************************************
    @brief 8-bit-per-pixel with PixelFormat.RGB32 palette
    ***********************************************************/
    PAL8,
    /***********************************************************
    @brief Planar YUV 4:2:0, 12-bit-per-pixel, full scale (JPEG), deprecated in favor of PixelFormat.YUV420P and setting color_range
    ***********************************************************/
    YUVJ420P,
    /***********************************************************
    @brief Planar YUV 4:2:2, 16-bit-per-pixel, full scale (JPEG), deprecated in favor of PixelFormat.YUV422P and setting color_range
    ***********************************************************/
    YUVJ422P,
    /***********************************************************
    @brief Planar YUV 4:4:4, 24-bit-per-pixel, full scale (JPEG), deprecated in favor of PixelFormat.YUV444P and setting color_range
    ***********************************************************/
    YUVJ444P,
    /***********************************************************
    @brief Packed YUV 4:2:2, 16-bit-per-pixel, Cb Y0 Cr Y1
    ***********************************************************/
    UYVY422,
    /***********************************************************
    @brief Packed YUV 4:1:1, 12-bit-per-pixel, Cb Y0 Y1 Cr Y2 Y3
    ***********************************************************/
    UYYVYY411,
    /***********************************************************
    @brief Packed RGB 3:3:2, 8-bit-per-pixel, (msb) 2B 3G 3R (lsb)
    ***********************************************************/
    BGR8,
    /***********************************************************
    @brief Packed RGB 1:2:1 bitstream, 4-bit-per-pixel, (msb) 1B 2G 1R (lsb), a byte contains two pixels, the first pixel in the byte is the one composed by the 4 msb bits
    ***********************************************************/
    BGR4,
    /***********************************************************
    @brief Packed RGB 1:2:1, 8-bit-per-pixel, (msb) 1B 2G 1R (lsb)
    ***********************************************************/
    BGR4_BYTE,
    /***********************************************************
    @brief Packed RGB 3:3:2, 8-bit-per-pixel, (msb) 2R 3G 3B (lsb)
    ***********************************************************/
    RGB8,
    /***********************************************************
    @brief Packed RGB 1:2:1 bitstream, 4-bit-per-pixel, (msb) 1R 2G 1B (lsb), a byte contains two pixels, the first pixel in the byte is the one composed by the 4 msb bits
    ***********************************************************/
    RGB4,
    /***********************************************************
    @brief Packed RGB 1:2:1, 8-bit-per-pixel, (msb) 1R 2G 1B (lsb)
    ***********************************************************/
    RGB4_BYTE,
    /***********************************************************
    @brief Planar YUV 4:2:0, 12-bit-per-pixel, 1 plane for Y and 1 plane for the UV components, which are interleaved (first byte U and the following byte V)
    ***********************************************************/
    NV12,
    /***********************************************************
    @brief PixelFormat.NV12, but U and V bytes are swapped
    ***********************************************************/
    NV21,

    /***********************************************************
    @brief Packed ARGB 8:8:8:8, 32-bit-per-pixel, ARGBARGB...
    ***********************************************************/
    ARGB,
    /***********************************************************
    @brief Packed RGBA 8:8:8:8, 32-bit-per-pixel, RGBARGBA...
    ***********************************************************/
    RGBA,
    /***********************************************************
    @brief Packed ABGR 8:8:8:8, 32-bit-per-pixel, ABGRABGR...
    ***********************************************************/
    ABGR,
    /***********************************************************
    @brief Packed BGRA 8:8:8:8, 32-bit-per-pixel, BGRABGRA...
    ***********************************************************/
    BGRA,

    /***********************************************************
    @brief Y, 16-bit-per-pixel, big-endian
    ***********************************************************/
    GRAY16BE,
    /***********************************************************
    @brief Y, 16-bit-per-pixel, little-endian
    ***********************************************************/
    GRAY16LE,
    /***********************************************************
    @brief Planar YUV 4:4:0 (1 Cr & Cb sample per 1x2 Y samples)
    ***********************************************************/
    YUV440P,
    /***********************************************************
    @brief Planar YUV 4:4:0 full scale (JPEG), deprecated in favor of PixelFormat.YUV440P and setting color_range
    ***********************************************************/
    YUVJ440P,
    /***********************************************************
    @brief Planar YUV 4:2:0, 20-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y & A samples)
    ***********************************************************/
    YUVA420P,
    /***********************************************************
    @brief Packed RGB 16:16:16, 48-bit-per-pixel, 16R, 16G, 16B, the 2-byte value for each R/G/B component is stored as big-endian
    ***********************************************************/
    RGB48BE,
    /***********************************************************
    @brief Packed RGB 16:16:16, 48-bit-per-pixel, 16R, 16G, 16B, the 2-byte value for each R/G/B component is stored as little-endian
    ***********************************************************/
    RGB48LE,

    /***********************************************************
    @brief Packed RGB 5:6:5, 16-bit-per-pixel, (msb) 5R 6G 5B (lsb), big-endian
    ***********************************************************/
    RGB565BE,
    /***********************************************************
    @brief Packed RGB 5:6:5, 16-bit-per-pixel, (msb) 5R 6G 5B (lsb), little-endian
    ***********************************************************/
    RGB565LE,
    /***********************************************************
    @brief Packed RGB 5:5:5, 16-bit-per-pixel, (msb) 1X 5R 5G 5B (lsb), big-endian, X=unused/undefined
    ***********************************************************/
    RGB555BE,
    /***********************************************************
    @brief Packed RGB 5:5:5, 16-bit-per-pixel, (msb) 1X 5R 5G 5B (lsb), little-endian, X=unused/undefined
    ***********************************************************/
    RGB555LE,

    /***********************************************************
    @brief Packed BGR 5:6:5, 16-bit-per-pixel, (msb) 5B 6G 5R (lsb), big-endian
    ***********************************************************/
    BGR565BE,
    /***********************************************************
    @brief Packed BGR 5:6:5, 16-bit-per-pixel, (msb) 5B 6G 5R (lsb), little-endian
    ***********************************************************/
    BGR565LE,
    /***********************************************************
    @brief Packed BGR 5:5:5, 16-bit-per-pixel, (msb) 1X 5B 5G 5R (lsb), big-endian, X=unused/undefined
    ***********************************************************/
    BGR555BE,
    /***********************************************************
    @brief Packed BGR 5:5:5, 16-bit-per-pixel, (msb) 1X 5B 5G 5R (lsb), little-endian, X=unused/undefined
    ***********************************************************/
    BGR555LE,
#if FF_API_VAAPI
    /***********************************************************
    @deprecated
    Hardware acceleration through VA API at motion compensation entry-point, Picture.data[3] contains a vaapi_render_state struct which contains macroblocks as well as various fields extracted from headers
    ***********************************************************/
    VAAPI_MOCO,
    /***********************************************************
    @deprecated
    Hardware acceleration through VA API at IDCT entry-point, Picture.data[3] contains a vaapi_render_state struct which contains fields extracted from headers
    ***********************************************************/
    VAAPI_IDCT,
    /***********************************************************
    @deprecated
    Hardware decoding through VA API, Picture.data[3] contains a VASurfaceID
    ***********************************************************/
    VAAPI_VLD,
    /***********************************************************
    @deprecated
    VAAPI = PixelFormat.VAAPI_VLD
    ***********************************************************/
    VAAPI,
#else
    /***********************************************************
    @brief Hardware acceleration through VA-API, data[3] contains a
    VASurfaceID.
    ***********************************************************/
    VAAPI,
#endif
    /***********************************************************
    @brief Planar YUV 4:2:0, 24-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y samples), little-endian
    ***********************************************************/
    YUV420P16LE,
    /***********************************************************
    @brief Planar YUV 4:2:0, 24-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y samples), big-endian
    ***********************************************************/
    YUV420P16BE,
    /***********************************************************
    @brief Planar YUV 4:2:2, 32-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples), little-endian
    ***********************************************************/
    YUV422P16LE,
    /***********************************************************
    @brief Planar YUV 4:2:2, 32-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples), big-endian
    ***********************************************************/
    YUV422P16BE,
    /***********************************************************
    @brief Planar YUV 4:4:4, 48-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y samples), little-endian
    ***********************************************************/
    YUV444P16LE,
    /***********************************************************
    @brief Planar YUV 4:4:4, 48-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y samples), big-endian
    ***********************************************************/
    YUV444P16BE,
    /***********************************************************
    @brief Hardware decoding through DXVA2, Picture.data[3] contains a LPDIRECT3DSURFACE9 pointer
    ***********************************************************/
    DXVA2_VLD,

    /***********************************************************
    @brief Packed RGB 4:4:4, 16-bit-per-pixel, (msb) 4X 4R 4G 4B (lsb), little-endian, X=unused/undefined
    ***********************************************************/
    RGB444LE,
    /***********************************************************
    @brief Packed RGB 4:4:4, 16-bit-per-pixel, (msb) 4X 4R 4G 4B (lsb), big-endian, X=unused/undefined
    ***********************************************************/
    RGB444BE,
    /***********************************************************
    @brief Packed BGR 4:4:4, 16-bit-per-pixel, (msb) 4X 4B 4G 4R (lsb), little-endian, X=unused/undefined
    ***********************************************************/
    BGR444LE,
    /***********************************************************
    @brief Packed BGR 4:4:4, 16-bit-per-pixel, (msb) 4X 4B 4G 4R (lsb), big-endian, X=unused/undefined
    ***********************************************************/
    BGR444BE,
    /***********************************************************
    @brief 8 bits gray, 8 bits alpha
    ***********************************************************/
    YA8,

    /***********************************************************
    @brief Alias for PixelFormat.YA8
    ***********************************************************/
    Y400A,
    /***********************************************************
    @brief Alias for PixelFormat.YA8
    ***********************************************************/
    GRAY8A,

    /***********************************************************
    @brief Packed RGB 16:16:16, 48-bit-per-pixel, 16B, 16G, 16R, the 2-byte value for each R/G/B component is stored as big-endian
    ***********************************************************/
    BGR48BE,
    /***********************************************************
    @brief Packed RGB 16:16:16, 48-bit-per-pixel, 16B, 16G, 16R, the 2-byte value for each R/G/B component is stored as little-endian
    ***********************************************************/
    BGR48LE,

    /***********************************************************
    @brief The following 12 formats have the disadvantage of needing 1
    format for each bit depth. Notice that each 9/10 bits sample
    is stored in 16 bits with extra padding. If you want to
    support multiple bit depths, then using PixelFormat.YUV420P16*
    with the -bit-per-pixel stored separately is better.
    ***********************************************************/

    /***********************************************************
    @brief Planar YUV 4:2:0, 13.5-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y samples), big-endian
    ***********************************************************/
    YUV420P9BE,
    /***********************************************************
    @brief Planar YUV 4:2:0, 13.5-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y samples), little-endian
    ***********************************************************/
    YUV420P9LE,
    /***********************************************************
    @brief Planar YUV 4:2:0, 15-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y samples), big-endian
    ***********************************************************/
    YUV420P10BE,
    /***********************************************************
    @brief Planar YUV 4:2:0, 15-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y samples), little-endian
    ***********************************************************/
    YUV420P10LE,
    /***********************************************************
    @brief Planar YUV 4:2:2, 20-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples), big-endian
    ***********************************************************/
    YUV422P10BE,
    /***********************************************************
    @brief Planar YUV 4:2:2, 20-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples), little-endian
    ***********************************************************/
    YUV422P10LE,
    /***********************************************************
    @brief Planar YUV 4:4:4, 27-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y samples), big-endian
    ***********************************************************/
    YUV444P9BE,
    /***********************************************************
    @brief Planar YUV 4:4:4, 27-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y samples), little-endian
    ***********************************************************/
    YUV444P9LE,
    /***********************************************************
    @brief Planar YUV 4:4:4, 30-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y samples), big-endian
    ***********************************************************/
    YUV444P10BE,
    /***********************************************************
    @brief Planar YUV 4:4:4, 30-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y samples), little-endian
    ***********************************************************/
    YUV444P10LE,
    /***********************************************************
    @brief Planar YUV 4:2:2, 18-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples), big-endian
    ***********************************************************/
    YUV422P9BE,
    /***********************************************************
    @brief Planar YUV 4:2:2, 18-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples), little-endian
    ***********************************************************/
    YUV422P9LE,
    /***********************************************************
    @brief Planar GBR 4:4:4 24-bit-per-pixel
    ***********************************************************/
    GBRP,
    /***********************************************************
    @brief Alias for PixelFormat.GBRP
    ***********************************************************/
    GBR24P, // 
    /***********************************************************
    @brief Planar GBR 4:4:4 27-bit-per-pixel, big-endian
    ***********************************************************/
    GBRP9BE,
    /***********************************************************
    @brief Planar GBR 4:4:4 27-bit-per-pixel, little-endian
    ***********************************************************/
    GBRP9LE,
    /***********************************************************
    @brief Planar GBR 4:4:4 30-bit-per-pixel, big-endian
    ***********************************************************/
    GBRP10BE,
    /***********************************************************
    @brief Planar GBR 4:4:4 30-bit-per-pixel, little-endian
    ***********************************************************/
    GBRP10LE,
    /***********************************************************
    @brief Planar GBR 4:4:4 48-bit-per-pixel, big-endian
    ***********************************************************/
    GBRP16BE,
    /***********************************************************
    @brief Planar GBR 4:4:4 48-bit-per-pixel, little-endian
    ***********************************************************/
    GBRP16LE,
    /***********************************************************
    @brief Planar YUV 4:2:2 24-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y & A samples)
    ***********************************************************/
    YUVA422P,
    /***********************************************************
    @brief Planar YUV 4:4:4 32-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y & A samples)
    ***********************************************************/
    YUVA444P,
    /***********************************************************
    @brief Planar YUV 4:2:0 22.5-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y & A samples), big-endian
    ***********************************************************/
    YUVA420P9BE,
    /***********************************************************
    @brief Planar YUV 4:2:0 22.5-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y & A samples), little-endian
    ***********************************************************/
    YUVA420P9LE,
    /***********************************************************
    @brief Planar YUV 4:2:2 27-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y & A samples), big-endian
    ***********************************************************/
    YUVA422P9BE,
    /***********************************************************
    @brief Planar YUV 4:2:2 27-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y & A samples), little-endian
    ***********************************************************/
    YUVA422P9LE,
    /***********************************************************
    @brief Planar YUV 4:4:4 36-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y & A samples), big-endian
    ***********************************************************/
    YUVA444P9BE,
    /***********************************************************
    @brief Planar YUV 4:4:4 36-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y & A samples), little-endian
    ***********************************************************/
    YUVA444P9LE,
    /***********************************************************
    @brief Planar YUV 4:2:0 25-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y & A samples, big-endian)
    ***********************************************************/
    YUVA420P10BE,
    /***********************************************************
    @brief Planar YUV 4:2:0 25-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y & A samples, little-endian)
    ***********************************************************/
    YUVA420P10LE,
    /***********************************************************
    @brief Planar YUV 4:2:2 30-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y & A samples, big-endian)
    ***********************************************************/
    YUVA422P10BE,
    /***********************************************************
    @brief Planar YUV 4:2:2 30-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y & A samples, little-endian)
    ***********************************************************/
    YUVA422P10LE,
    /***********************************************************
    @brief Planar YUV 4:4:4 40-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y & A samples, big-endian)
    ***********************************************************/
    YUVA444P10BE,
    /***********************************************************
    @brief Planar YUV 4:4:4 40-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y & A samples, little-endian)
    ***********************************************************/
    YUVA444P10LE,
    /***********************************************************
    @brief Planar YUV 4:2:0 40-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y & A samples, big-endian)
    ***********************************************************/
    YUVA420P16BE,
    /***********************************************************
    @brief Planar YUV 4:2:0 40-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y & A samples, little-endian)
    ***********************************************************/
    YUVA420P16LE,
    /***********************************************************
    @brief Planar YUV 4:2:2 48-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y & A samples, big-endian)
    ***********************************************************/
    YUVA422P16BE,
    /***********************************************************
    @brief Planar YUV 4:2:2 48-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y & A samples, little-endian)
    ***********************************************************/
    YUVA422P16LE,
    /***********************************************************
    @brief Planar YUV 4:4:4 64-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y & A samples, big-endian)
    ***********************************************************/
    YUVA444P16BE,
    /***********************************************************
    @brief Planar YUV 4:4:4 64-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y & A samples, little-endian)
    ***********************************************************/
    YUVA444P16LE,

    /***********************************************************
    @brief Hardware acceleration through VDPAU, Picture.data[3] contains a VdpVideoSurface
    ***********************************************************/
    VDPAU,

    /***********************************************************
    @brief Packed XYZ 4:4:4, 36 -bit-per-pixel, (msb) 12X, 12Y, 12Z (lsb), the 2-byte value for each X/Y/Z is stored as little-endian, the 4 lower bits are set to 0
    ***********************************************************/
    XYZ12LE,
    /***********************************************************
    @brief Packed XYZ 4:4:4, 36 -bit-per-pixel, (msb) 12X, 12Y, 12Z (lsb), the 2-byte value for each X/Y/Z is stored as big-endian, the 4 lower bits are set to 0
    ***********************************************************/
    XYZ12BE,
    /***********************************************************
    @brief Interleaved chroma YUV 4:2:2, 16-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples)
    ***********************************************************/
    NV16,
    /***********************************************************
    @brief Interleaved chroma YUV 4:2:2, 20-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples), little-endian
    ***********************************************************/
    NV20LE,
    /***********************************************************
    @brief Interleaved chroma YUV 4:2:2, 20-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples), big-endian
    ***********************************************************/
    NV20BE,

    /***********************************************************
    @brief Packed RGBA 16:16:16:16, 64-bit-per-pixel, 16R, 16G, 16B, 16A, the 2-byte value for each R/G/B/A component is stored as big-endian
    ***********************************************************/
    RGBA64BE,
    /***********************************************************
    @brief Packed RGBA 16:16:16:16, 64-bit-per-pixel, 16R, 16G, 16B, 16A, the 2-byte value for each R/G/B/A component is stored as little-endian
    ***********************************************************/
    RGBA64LE,
    /***********************************************************
    @brief Packed RGBA 16:16:16:16, 64-bit-per-pixel, 16B, 16G, 16R, 16A, the 2-byte value for each R/G/B/A component is stored as big-endian
    ***********************************************************/
    BGRA64BE,
    /***********************************************************
    @brief Packed RGBA 16:16:16:16, 64-bit-per-pixel, 16B, 16G, 16R, 16A, the 2-byte value for each R/G/B/A component is stored as little-endian
    ***********************************************************/
    BGRA64LE,

    /***********************************************************
    @brief Packed YUV 4:2:2, 16-bit-per-pixel, Y0 Cr Y1 Cb
    ***********************************************************/
    YVYU422,

    /***********************************************************
    @brief 16 bits gray, 16 bits alpha (big-endian)
    ***********************************************************/
    YA16BE,
    /***********************************************************
    @brief 16 bits gray, 16 bits alpha (little-endian)
    ***********************************************************/
    YA16LE,

    /***********************************************************
    @brief Planar GBRA 4:4:4:4 32-bit-per-pixel
    ***********************************************************/
    GBRAP,
    /***********************************************************
    @brief Planar GBRA 4:4:4:4 64-bit-per-pixel, big-endian
    ***********************************************************/
    GBRAP16BE,
    /***********************************************************
    @brief Planar GBRA 4:4:4:4 64-bit-per-pixel, little-endian
    ***********************************************************/
    GBRAP16LE,
    /***********************************************************
    @brief Hardware acceleration through QSV, data[3] contains a
    pointer to the mfxFrameSurface1 structure.
    ***********************************************************/
    QSV,
    /***********************************************************
    @brief Hardware acceleration though MMAL, data[3] contains a
    pointer to the MMAL_BUFFER_HEADER_T structure.
    ***********************************************************/
    MMAL,

    /***********************************************************
    @brief Hardware decoding through Direct3D11 via old API,
    Picture.data[3] contains a ID3D11VideoDecoderOutputView pointer
    ***********************************************************/
    D3D11VA_VLD,

    /***********************************************************
    @brief Hardware acceleration through CUDA. data[i] contain
    CUdeviceptr pointers exactly as for system memory frames.
    ***********************************************************/
    CUDA,

    /***********************************************************
    @brief Packed RGB 8:8:8, 32-bit-per-pixel, XRGBXRGB... X=unused/undefined
    ***********************************************************/
    0RGB,
    /***********************************************************
    @brief Packed RGB 8:8:8, 32-bit-per-pixel, RGBXRGBX... X=unused/undefined
    ***********************************************************/
    RGB0,
    /***********************************************************
    @brief Packed BGR 8:8:8, 32-bit-per-pixel, XBGRXBGR... X=unused/undefined
    ***********************************************************/
    0BGR,
    /***********************************************************
    @brief Packed BGR 8:8:8, 32-bit-per-pixel, BGRXBGRX... X=unused/undefined
    ***********************************************************/
    BGR0,

    /***********************************************************
    @brief Planar YUV 4:2:0,18-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y samples), big-endian
    ***********************************************************/
    YUV420P12BE,
    /***********************************************************
    @brief Planar YUV 4:2:0,18-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y samples), little-endian
    ***********************************************************/
    YUV420P12LE,
    /***********************************************************
    @brief Planar YUV 4:2:0,21-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y samples), big-endian
    ***********************************************************/
    YUV420P14BE,
    /***********************************************************
    @brief Planar YUV 4:2:0,21-bit-per-pixel, (1 Cr & Cb sample per 2x2 Y samples), little-endian
    ***********************************************************/
    YUV420P14LE,
    /***********************************************************
    @brief Planar YUV 4:2:2,24-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples), big-endian
    ***********************************************************/
    YUV422P12BE,
    /***********************************************************
    @brief Planar YUV 4:2:2,24-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples), little-endian
    ***********************************************************/
    YUV422P12LE,
    /***********************************************************
    @brief Planar YUV 4:2:2,28-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples), big-endian
    ***********************************************************/
    YUV422P14BE,
    /***********************************************************
    @brief Planar YUV 4:2:2,28-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples), little-endian
    ***********************************************************/
    YUV422P14LE,
    /***********************************************************
    @brief Planar YUV 4:4:4,36-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y samples), big-endian
    ***********************************************************/
    YUV444P12BE,
    /***********************************************************
    @brief Planar YUV 4:4:4,36-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y samples), little-endian
    ***********************************************************/
    YUV444P12LE,
    /***********************************************************
    @brief Planar YUV 4:4:4,42-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y samples), big-endian
    ***********************************************************/
    YUV444P14BE,
    /***********************************************************
    @brief Planar YUV 4:4:4,42-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y samples), little-endian
    ***********************************************************/
    YUV444P14LE,
    /***********************************************************
    @brief Planar GBR 4:4:4 36-bit-per-pixel, big-endian
    ***********************************************************/
    GBRP12BE,
    /***********************************************************
    @brief Planar GBR 4:4:4 36-bit-per-pixel, little-endian
    ***********************************************************/
    GBRP12LE,
    /***********************************************************
    @brief Planar GBR 4:4:4 42-bit-per-pixel, big-endian
    ***********************************************************/
    GBRP14BE,
    /***********************************************************
    @brief Planar GBR 4:4:4 42-bit-per-pixel, little-endian
    ***********************************************************/
    GBRP14LE,
    /***********************************************************
    @brief Planar YUV 4:1:1, 12-bit-per-pixel, (1 Cr & Cb sample per 4x1 Y samples) full scale (JPEG), deprecated in favor of PixelFormat.YUV411P and setting color_range
    ***********************************************************/
    YUVJ411P,

    /***********************************************************
    @brief Bayer, BGBG..(odd line), GRGR..(even line), 8-bit samples
    ***********************************************************/
    BAYER_BGGR8,
    /***********************************************************
    @brief Bayer, RGRG..(odd line), GBGB..(even line), 8-bit samples
    ***********************************************************/
    BAYER_RGGB8,
    /***********************************************************
    @brief Bayer, GBGB..(odd line), RGRG..(even line), 8-bit samples
    ***********************************************************/
    BAYER_GBRG8,
    /***********************************************************
    @brief Bayer, GRGR..(odd line), BGBG..(even line), 8-bit samples
    ***********************************************************/
    BAYER_GRBG8,
    /***********************************************************
    @brief Bayer, BGBG..(odd line), GRGR..(even line), 16-bit samples, little-endian
    ***********************************************************/
    BAYER_BGGR16LE,
    /***********************************************************
    @brief Bayer, BGBG..(odd line), GRGR..(even line), 16-bit samples, big-endian
    ***********************************************************/
    BAYER_BGGR16BE,
    /***********************************************************
    @brief Bayer, RGRG..(odd line), GBGB..(even line), 16-bit samples, little-endian
    ***********************************************************/
    BAYER_RGGB16LE,
    /***********************************************************
    @brief Bayer, RGRG..(odd line), GBGB..(even line), 16-bit samples, big-endian
    ***********************************************************/
    BAYER_RGGB16BE,
    /***********************************************************
    @brief Bayer, GBGB..(odd line), RGRG..(even line), 16-bit samples, little-endian
    ***********************************************************/
    BAYER_GBRG16LE,
    /***********************************************************
    @brief Bayer, GBGB..(odd line), RGRG..(even line), 16-bit samples, big-endian
    ***********************************************************/
    BAYER_GBRG16BE,
    /***********************************************************
    @brief Bayer, GRGR..(odd line), BGBG..(even line), 16-bit samples, little-endian
    ***********************************************************/
    BAYER_GRBG16LE,
    /***********************************************************
    @brief Bayer, GRGR..(odd line), BGBG..(even line), 16-bit samples, big-endian
    ***********************************************************/
    BAYER_GRBG16BE,

    /***********************************************************
    @brief XVideo Motion Acceleration via common packet passing
    ***********************************************************/
    XVMC,

    /***********************************************************
    @brief Planar YUV 4:4:0,20-bit-per-pixel, (1 Cr & Cb sample per 1x2 Y samples), little-endian
    ***********************************************************/
    YUV440P10LE,
    /***********************************************************
    @brief Planar YUV 4:4:0,20-bit-per-pixel, (1 Cr & Cb sample per 1x2 Y samples), big-endian
    ***********************************************************/
    YUV440P10BE,
    /***********************************************************
    @brief Planar YUV 4:4:0,24-bit-per-pixel, (1 Cr & Cb sample per 1x2 Y samples), little-endian
    ***********************************************************/
    YUV440P12LE,
    /***********************************************************
    @brief Planar YUV 4:4:0,24-bit-per-pixel, (1 Cr & Cb sample per 1x2 Y samples), big-endian
    ***********************************************************/
    YUV440P12BE,
    /***********************************************************
    @brief Packed AYUV 4:4:4,64-bit-per-pixel (1 Cr & Cb sample per 1x1 Y & A samples), little-endian
    ***********************************************************/
    AYUV64LE,
    /***********************************************************
    @brief Packed AYUV 4:4:4,64-bit-per-pixel (1 Cr & Cb sample per 1x1 Y & A samples), big-endian
    ***********************************************************/
    AYUV64BE,

    /***********************************************************
    @brief Hardware decoding through Videotoolbox
    ***********************************************************/
    VIDEOTOOLBOX,

    /***********************************************************
    @brief Like NV12, with 10-bit-per-pixel per component, data in the high bits, zeros in the low bits, little-endian
    ***********************************************************/
    P010LE,
    /***********************************************************
    @brief Like NV12, with 10-bit-per-pixel per component, data in the high bits, zeros in the low bits, big-endian
    ***********************************************************/
    P010BE,

    /***********************************************************
    @brief Planar GBR 4:4:4:4 48-bit-per-pixel, big-endian
    ***********************************************************/
    GBRAP12BE,
    /***********************************************************
    @brief Planar GBR 4:4:4:4 48-bit-per-pixel, little-endian
    ***********************************************************/
    GBRAP12LE,

    /***********************************************************
    @brief Planar GBR 4:4:4:4 40-bit-per-pixel, big-endian
    ***********************************************************/
    GBRAP10BE,
    /***********************************************************
    @brief Planar GBR 4:4:4:4 40-bit-per-pixel, little-endian
    ***********************************************************/
    GBRAP10LE,

    /***********************************************************
    @brief Hardware decoding through MediaCodec
    ***********************************************************/
    MEDIACODEC,

    /***********************************************************
    @brief Y, 12-bit-per-pixel, big-endian
    ***********************************************************/
    GRAY12BE,
    /***********************************************************
    @brief Y, 12-bit-per-pixel, little-endian
    ***********************************************************/
    GRAY12LE,
    /***********************************************************
    @brief Y, 10-bit-per-pixel, big-endian
    ***********************************************************/
    GRAY10BE,
    /***********************************************************
    @brief Y, 10-bit-per-pixel, little-endian
    ***********************************************************/
    GRAY10LE,

    /***********************************************************
    @brief Like NV12, with 16-bit-per-pixel per component, little-endian
    ***********************************************************/
    P016LE,
    /***********************************************************
    @brief Like NV12, with 16-bit-per-pixel per component, big-endian
    ***********************************************************/
    P016BE,

    /***********************************************************
    @brief Hardware surfaces for Direct3D11.

    This is preferred over the legacy PixelFormat.D3D11VA_VLD. The new D3D11
    hwaccel API and filtering support PixelFormat.D3D11 only.

    data[0] contains a ID3D11Texture2D pointer, and data[1] contains the
    texture array index of the frame as intptr_t if the ID3D11Texture2D is
    an array texture (or always 0 if it's a normal texture).
    ***********************************************************/
    D3D11,

    /***********************************************************
    @brief Y, 9-bit-per-pixel, big-endian
    ***********************************************************/
    GRAY9BE,
    /***********************************************************
    @brief Y, 9-bit-per-pixel, little-endian
    ***********************************************************/
    GRAY9LE,

    /***********************************************************
    @brief IEEE-754 single precision planar GBR 4:4:4, 96-bit-per-pixel, big-endian
    ***********************************************************/
    GBRPF32BE,
    /***********************************************************
    @brief IEEE-754 single precision planar GBR 4:4:4, 96-bit-per-pixel, little-endian
    ***********************************************************/
    GBRPF32LE,
    /***********************************************************
    @brief IEEE-754 single precision planar GBRA 4:4:4:4, 128-bit-per-pixel, big-endian
    ***********************************************************/
    GBRAPF32BE,
    /***********************************************************
    @brief IEEE-754 single precision planar GBRA 4:4:4:4, 128-bit-per-pixel, little-endian
    ***********************************************************/
    GBRAPF32LE,

    /***********************************************************
    @brief DRM-managed buffers exposed through PRIME buffer sharing.

    data[0] points to an DRMFrameDescriptor.
    ***********************************************************/
    DRM_PRIME,
    /***********************************************************
    @brief Hardware surfaces for OpenCL.

    data[i] contain 2D image objects (typed in C as cl_mem, used
    in OpenCL as image2d_t) for each plane of the surface.
    ***********************************************************/
    OPENCL,

    /***********************************************************
    @brief Y, 14-bit-per-pixel, big-endian
    ***********************************************************/
    GRAY14BE,
    /***********************************************************
    @brief Y, 14-bit-per-pixel, little-endian
    ***********************************************************/
    GRAY14LE,

    /***********************************************************
    @brief IEEE-754 single precision Y, 32-bit-per-pixel, big-endian
    ***********************************************************/
    GRAYF32BE,
    /***********************************************************
    @brief IEEE-754 single precision Y, 32-bit-per-pixel, little-endian
    ***********************************************************/
    GRAYF32LE,

    /***********************************************************
    @brief Planar YUV 4:2:2,24-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples), 12b alpha, big-endian
    ***********************************************************/
    YUVA422P12BE,
    /***********************************************************
    @brief Planar YUV 4:2:2,24-bit-per-pixel, (1 Cr & Cb sample per 2x1 Y samples), 12b alpha, little-endian
    ***********************************************************/
    YUVA422P12LE,
    /***********************************************************
    @brief Planar YUV 4:4:4,36-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y samples), 12b alpha, big-endian
    ***********************************************************/
    YUVA444P12BE,
    /***********************************************************
    @brief Planar YUV 4:4:4,36-bit-per-pixel, (1 Cr & Cb sample per 1x1 Y samples), 12b alpha, little-endian
    ***********************************************************/
    YUVA444P12LE,

    /***********************************************************
    @brief Planar YUV 4:4:4, 24-bit-per-pixel, 1 plane for Y and 1 plane for the UV components, which are interleaved (first byte U and the following byte V)
    ***********************************************************/
    NV24,
    /***********************************************************
    @brief As above, but U and V bytes are swapped
    ***********************************************************/
    NV42,

    /***********************************************************
    @brief Number of pixel formats, DO NOT USE THIS if you want to link with shared libav* because the number of formats might differ between versions
    ***********************************************************/
    //  PixelFormat.NB,

    RGB32,
    RGB32_1,
    BGR32,
    BGR32_1,
    @0RGB32,
    @0BGR32,

    GRAY9,
    GRAY10,
    GRAY12,
    GRAY14,
    GRAY16,
    YA16,
    RGB48,
    RGB565,
    RGB555,
    RGB444,
    RGBA64,
    BGR48,
    BGR565,
    BGR555,
    BGR444,
    BGRA64,

    YUV420P9,
    YUV422P9,
    YUV444P9,
    YUV420P10,
    YUV422P10,
    YUV440P10,
    YUV444P10,
    YUV420P12,
    YUV422P12,
    YUV440P12,
    YUV444P12,
    YUV420P14,
    YUV422P14,
    YUV444P14,
    YUV420P16,
    YUV422P16,
    YUV444P16,

    GBRP9,
    GBRP10,
    GBRP12,
    GBRP14,
    GBRP16,
    GBRAP10,
    GBRAP12,
    GBRAP16,

    BAYER_BGGR16,
    BAYER_RGGB16,
    BAYER_GBRG16,
    BAYER_GRBG16,

    GBRPF32,
    GBRAPF32,

    GRAYF32,

    YUVA420P9,
    YUVA422P9,
    YUVA444P9,
    YUVA420P10,
    YUVA422P10,
    YUVA444P10,
    YUVA422P12,
    YUVA444P12,
    YUVA420P16,
    YUVA422P16,
    YUVA444P16,

    XYZ12,
    NV20,
    AYUV64,
    P010,
    P016;

    /***********************************************************
    @brief Utility function to access log2_chroma_w log2_chroma_h from
    the pixel format PixelFormatDescriptor.

    @param[in] pixel_format the pixel format
    @param[out] h_shift store log2_chroma_w (horizontal/width shift)
    @param[out] v_shift store log2_chroma_h (vertical/height shift)

    @return 0 on success, LibAVUtil.ErrorCode (ENOSYS) on invalid or unknown pixel format
    ***********************************************************/
    [CCode (cname="av_pix_fmt_get_chroma_sub_sample", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static int av_pix_fmt_get_chroma_sub_sample (
        PixelFormat pixel_format,
        out int h_shift,
        out int v_shift
    );

    /***********************************************************
    @return number of planes in pixel_format, a negative LibAVUtil.ErrorCode if pixel_format is not a
    valid pixel format.
    ***********************************************************/
    [CCode (cname="av_pix_fmt_count_planes", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static int av_pix_fmt_count_planes (
        PixelFormat pixel_format
    );


    /***********************************************************
    @brief Return the pixel format corresponding to name.

    If there is no pixel format with name name, then looks for a
    pixel format with the name corresponding to the native endian
    format of name.
    For example in a little-endian system, first looks for "gray16",
    then for "gray16le".

    Finally if no pixel format has been found, returns PixelFormat.NONE.
    ***********************************************************/
    [CCode (cname="av_get_pix_fmt", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static PixelFormat av_get_pix_fmt (
        string name
    );

    /***********************************************************
    @brief Return the short name for a pixel format, null in case pixel_format is
    unknown.

    @see @link av_get_pix_fmt (), av_get_pix_fmt_string ()
    ***********************************************************/
    [CCode (cname="av_get_pix_fmt_name", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static string av_get_pix_fmt_name (
        PixelFormat pixel_format
    );

    /***********************************************************
    @return a pixel format descriptor for provided pixel format or null if
    this pixel format is unknown.
    ***********************************************************/
    [CCode (cname="av_pix_fmt_desc_get", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public PixelFormatDescriptor av_pix_fmt_desc_get (
        PixelFormat pixel_format
    );

    /***********************************************************
    @brief Print in buf the string corresponding to the pixel format with
    number pixel_format, or a header if pixel_format is negative.

    @param buf the buffer where to write the string
    @param buf_size the size of buf
    @param pixel_format the number of the pixel format to print the
    corresponding info string, or a negative value to print the
    corresponding header.
    ***********************************************************/
    [CCode (cname="av_get_pix_fmt_string", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static string av_get_pix_fmt_string (
        string buf,
        int buf_size,
        PixelFormat pixel_format
    );

    /***********************************************************
    @brief Utility function to swap the endianness of a pixel format.

    @param[in] pixel_format the pixel format

    @return pixel format with swapped endianness if it exists,
    otherwise PixelFormat.NONE
    ***********************************************************/
    [CCode (cname="av_pix_fmt_swap_endianness", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static PixelFormat av_pix_fmt_swap_endianness (
        PixelFormat pixel_format
    );

}

} // namespace LibAVUtil
