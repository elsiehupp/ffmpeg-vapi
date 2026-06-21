/***********************************************************
Copyright (C) 2001-2011 Michael Niedermayer <michaelni@gmx.at>

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
AV_STRINGIFY is too long
***********************************************************/
[CCode (cname="",cheader_filename="")]
public string STR (
    void *s
); // AV_TOSTRING (s)

[CCode (cname="",cheader_filename="")]
public const size_t YUVRGB_TABLE_HEADROOM; // 512

[CCode (cname="",cheader_filename="")]
public const size_t YUVRGB_TABLE_LUMA_HEADROOM; // 512

[CCode (cname="",cheader_filename="")]
public const size_t MAX_FILTER_SIZE; // SWS_MAX_FILTER_SIZE

[CCode (cname="",cheader_filename="")]
public const size_t DITHER1XBPP; //

/***********************************************************
Based on HAVE_BIGENDIAN
***********************************************************/
[CCode (cname="",cheader_filename="")]
public const int ALT32_CORR;

/***********************************************************
Based on ARCH_X86_64
***********************************************************/
[CCode (cname="",cheader_filename="")]
public const size_t APCK_PTR2;

/***********************************************************
Based on ARCH_X86_64
***********************************************************/
[CCode (cname="",cheader_filename="")]
public const size_t APCK_COEF;

/***********************************************************
Based on ARCH_X86_64
***********************************************************/
[CCode (cname="",cheader_filename="")]
public const size_t APCK_SIZE;

[CCode (cname="",cheader_filename="")]
public const int RETCODE_USE_CASCADE; // -12345

[CCode (cname="",cheader_filename="")]
[Compact]
public class SwsContext { }

[CCode (cname="",cheader_filename="")]
public enum SwsDither {
    [CCode (cname="")]
    SWS_DITHER_NONE = 0,

    [CCode (cname="")]
    SWS_DITHER_AUTO,

    [CCode (cname="")]
    SWS_DITHER_BAYER,

    [CCode (cname="")]
    SWS_DITHER_ED,

    [CCode (cname="")]
    SWS_DITHER_A_DITHER,

    [CCode (cname="")]
    SWS_DITHER_X_DITHER,

    [CCode (cname="")]
    NB_SWS_DITHER;
}

[CCode (cname="",cheader_filename="")]
public enum SwsAlphaBlend {
    [CCode (cname="")]
    SWS_ALPHA_BLEND_NONE = 0,

    [CCode (cname="")]
    SWS_ALPHA_BLEND_UNIFORM,

    [CCode (cname="")]
    SWS_ALPHA_BLEND_CHECKERBOARD,

    [CCode (cname="")]
    SWS_ALPHA_BLEND_NB;
}

[CCode (cname="SwsFunc",cheader_filename="")]
public delegate int SwsDelegate (
    SwsContext? context,
    uint8[] src[],
    int srcStride[],
    int srcSliceY,
    int srcSliceH,
    uint8[] dst[],
    int dstStride[]
);

/***********************************************************
Write one line of horizontally scaled data to planar output
without any additional vertical scaling (or point-scaling).

@param src     scaled source data, 15 bits for 8-10-bit output,
               19 bits for 16-bit output (in int32)
@param dest    pointer to the output plane. For >8-bit
               output, this is in uint16
@param dstW    width of destination in pixels
@param dither  ordered dither array of type int16 and size 8
@param offset  Dither offset
***********************************************************/
[CCode (cname="yuv2planar1_fn",cheader_filename="")]
public delegate void Yuv2Planar1Delegate (
    int16[] src,
    uint8[] dest,
    int dstW,
    uint8[] dither,
    int offset
);

/***********************************************************
Write one line of horizontally scaled data to planar output
with multi-point vertical scaling between input pixels.

@param filter        vertical luma/alpha scaling coefficients, 12 bits [0,4096]
@param src           scaled luma (Y) or alpha (A) source data, 15 bits for
                     8-10-bit output, 19 bits for 16-bit output (in int32)
@param filterSize    number of vertical input lines to scale
@param dest          pointer to output plane. For >8-bit
                     output, this is in uint16
@param dstW          width of destination pixels
@param offset        Dither offset
***********************************************************/
[CCode (cname="yuv2planarX_fn",cheader_filename="")]
public delegate void Yuv2PlanarXDelegate (
    int16[] filter,
    int filterSize,
    int16[][] src,
    uint8[] dest,
    int dstW,
    uint8[] dither,
    int offset
);

/***********************************************************
Write one line of horizontally scaled chroma to interleaved output
with multi-point vertical scaling between input pixels.

@param c             SWS scaling context
@param chrFilter     vertical chroma scaling coefficients, 12 bits [0,4096]
@param chrUSrc       scaled chroma (U) source data, 15 bits for 8-10-bit
                     output, 19 bits for 16-bit output (in int32)
@param chrVSrc       scaled chroma (V) source data, 15 bits for 8-10-bit
                     output, 19 bits for 16-bit output (in int32)
@param chrFilterSize number of vertical chroma input lines to scale
@param dest          pointer to the output plane. For >8-bit
                     output, this is in uint16
@param dstW          width of chroma planes
***********************************************************/
[CCode (cname="yuv2interleavedX_fn",cheader_filename="")]
public delegate void Yuv2InterleavedXDelegate (
    SwsContext? c,
    int16[] chrFilter,
    int chrFilterSize,
    int16[][] chrUSrc,
    int16[][] chrVSrc,
    uint8[] dest,
    int dstW
);

/***********************************************************
Write one line of horizontally scaled Y/U/V/A to packed-pixel YUV/RGB
output without any additional vertical scaling (or point-scaling). Note
that this function may do chroma scaling, see the "uvalpha" argument.

@param c       SWS scaling context
@param lumSrc  scaled luma (Y) source data, 15 bits for 8-10-bit output,
               19 bits for 16-bit output (in int32)
@param chrUSrc scaled chroma (U) source data, 15 bits for 8-10-bit output,
               19 bits for 16-bit output (in int32)
@param chrVSrc scaled chroma (V) source data, 15 bits for 8-10-bit output,
               19 bits for 16-bit output (in int32)
@param alpSrc  scaled alpha (A) source data, 15 bits for 8-10-bit output,
               19 bits for 16-bit output (in int32)
@param dest    pointer to the output plane. For 16-bit output, this is
               uint16
@param dstW    width of lumSrc and alpSrc in pixels, number of pixels
               to write into dest[]
@param uvalpha chroma scaling coefficient for the second line of chroma
               pixels, either 2048 or 0. If 0, one chroma input is used
               for 2 output pixels (or if the SWS_FLAG_FULL_CHR_INT flag
               is set, it generates 1 output pixel). If 2048, two chroma
               input pixels should be averaged for 2 output pixels (this
               only happens if SWS_FLAG_FULL_CHR_INT is not set)
@param y       vertical line number for this output. This does not need
               to be used to calculate the offset in the destination,
               but can be used to generate comfort noise using dithering
               for some output formats.
***********************************************************/
[CCode (cname="yuv2packed1_fn",cheader_filename="")]
public delegate void Yuv2Packed1Delegate (
    SwsContext? c,
    int16[] lumSrc,
    int16[] chrUSrc[2],
    int16[] chrVSrc[2],
    int16[] alpSrc,
    uint8[] dest,
    int dstW,
    int uvalpha,
    int y
);

/***********************************************************
Write one line of horizontally scaled Y/U/V/A to packed-pixel YUV/RGB
output by doing bilinear scaling between two input lines.

@param c       SWS scaling context
@param lumSrc  scaled luma (Y) source data, 15 bits for 8-10-bit output,
               19 bits for 16-bit output (in int32)
@param chrUSrc scaled chroma (U) source data, 15 bits for 8-10-bit output,
               19 bits for 16-bit output (in int32)
@param chrVSrc scaled chroma (V) source data, 15 bits for 8-10-bit output,
               19 bits for 16-bit output (in int32)
@param alpSrc  scaled alpha (A) source data, 15 bits for 8-10-bit output,
               19 bits for 16-bit output (in int32)
@param dest    pointer to the output plane. For 16-bit output, this is
               uint16
@param dstW    width of lumSrc and alpSrc in pixels, number of pixels
               to write into dest[]
@param yalpha  luma/alpha scaling coefficients for the second input line.
               The first line's coefficients can be calculated by using
               4096 - yalpha
@param uvalpha chroma scaling coefficient for the second input line. The
               first line's coefficients can be calculated by using
               4096 - uvalpha
@param y       vertical line number for this output. This does not need
               to be used to calculate the offset in the destination,
               but can be used to generate comfort noise using dithering
               for some output formats.
***********************************************************/
[CCode (cname="yuv2packed2_fn",cheader_filename="")]
public delegate void Yuv2Packed2Delegate (
    SwsContext? c,
    int16[] lumSrc[2],
    int16[] chrUSrc[2],
    int16[] chrVSrc[2],
    int16[] alpSrc[2],
    uint8[] dest,
    int dstW,
    int yalpha,
    int uvalpha,
    int y
);

/***********************************************************
Write one line of horizontally scaled Y/U/V/A to packed-pixel YUV/RGB
output by doing multi-point vertical scaling between input pixels.

@param c             SWS scaling context
@param lumFilter     vertical luma/alpha scaling coefficients, 12 bits [0,4096]
@param lumSrc        scaled luma (Y) source data, 15 bits for 8-10-bit output,
                     19 bits for 16-bit output (in int32)
@param lumFilterSize number of vertical luma/alpha input lines to scale
@param chrFilter     vertical chroma scaling coefficients, 12 bits [0,4096]
@param chrUSrc       scaled chroma (U) source data, 15 bits for 8-10-bit output,
                     19 bits for 16-bit output (in int32)
@param chrVSrc       scaled chroma (V) source data, 15 bits for 8-10-bit output,
                     19 bits for 16-bit output (in int32)
@param chrFilterSize number of vertical chroma input lines to scale
@param alpSrc        scaled alpha (A) source data, 15 bits for 8-10-bit output,
                     19 bits for 16-bit output (in int32)
@param dest          pointer to the output plane. For 16-bit output, this is
                     uint16
@param dstW          width of lumSrc and alpSrc in pixels, number of pixels
                     to write into dest[]
@param y             vertical line number for this output. This does not need
                     to be used to calculate the offset in the destination,
                     but can be used to generate comfort noise using dithering
                     or some output formats.
***********************************************************/
[CCode (cname="yuv2packedX_fn",cheader_filename="")]
public delegate void Yuv2PackedXDelegate (
    SwsContext? c,
    int16[] lumFilter,
    int16[][] lumSrc,
    int lumFilterSize,
    int16[] chrFilter,
    int16[][] chrUSrc,
    int16[][] chrVSrc,
    int chrFilterSize,
    int16[][] alpSrc,
    uint8[] dest,
    int dstW,
    int y
);

/***********************************************************
Write one line of horizontally scaled Y/U/V/A to YUV/RGB
output by doing multi-point vertical scaling between input pixels.

@param c             SWS scaling context
@param lumFilter     vertical luma/alpha scaling coefficients, 12 bits [0,4096]
@param lumSrc        scaled luma (Y) source data, 15 bits for 8-10-bit output,
                     19 bits for 16-bit output (in int32)
@param lumFilterSize number of vertical luma/alpha input lines to scale
@param chrFilter     vertical chroma scaling coefficients, 12 bits [0,4096]
@param chrUSrc       scaled chroma (U) source data, 15 bits for 8-10-bit output,
                     19 bits for 16-bit output (in int32)
@param chrVSrc       scaled chroma (V) source data, 15 bits for 8-10-bit output,
                     19 bits for 16-bit output (in int32)
@param chrFilterSize number of vertical chroma input lines to scale
@param alpSrc        scaled alpha (A) source data, 15 bits for 8-10-bit output,
                     19 bits for 16-bit output (in int32)
@param dest          pointer to the output planes. For 16-bit output, this is
                     uint16
@param dstW          width of lumSrc and alpSrc in pixels, number of pixels
                     to write into dest[]
@param y             vertical line number for this output. This does not need
                     to be used to calculate the offset in the destination,
                     but can be used to generate comfort noise using dithering
                     or some output formats.
***********************************************************/
[CCode (cname="yuv2anyX_fn",cheader_filename="")]
public delegate void Yuv2AnyXDelegate (
    SwsContext? c,
    int16[] lumFilter,
    int16[][] lumSrc,
    int lumFilterSize,
    int16[] chrFilter,
    int16[][] chrUSrc,
    int16[][] chrVSrc,
    int chrFilterSize,
    int16[][] alpSrc,
    uint8[][] dest,
    int dstW,
    int y
);

/***********************************************************
This struct should be aligned on at least a 32-byte boundary.
***********************************************************/
[CCode (cname="",cheader_filename="")]
[Compact]
public class SwsContext {
    /***********************************************************
    info on struct for av_log
    ***********************************************************/
    [CCode (cname="")]
    public AVClass? av_class;

    /***********************************************************
    Note that src, dst, srcStride, dstStride will be copied in the
    sws_scale () wrapper so they can be freely modified here.
    ***********************************************************/
    [CCode (cname="")]
    public SwsFunc swscale;

    /***********************************************************
    Width of source luma/alpha planes.
    ***********************************************************/
    [CCode (cname="")]
    public int srcW;

    /***********************************************************
    Height of source luma/alpha planes.
    ***********************************************************/
    [CCode (cname="")]
    public int srcH;

    /***********************************************************
    Height of destination luma/alpha planes.
    ***********************************************************/
    [CCode (cname="")]
    public int dstH;

    /***********************************************************
    Width of source chroma planes.
    ***********************************************************/
    [CCode (cname="")]
    public int chrSrcW;

    /***********************************************************
    Height of source chroma planes.
    ***********************************************************/
    [CCode (cname="")]
    public int chrSrcH;

    /***********************************************************
    Width of destination chroma planes.
    ***********************************************************/
    [CCode (cname="")]
    public int chrDstW;

    /***********************************************************
    Height of destination chroma planes.
    ***********************************************************/
    [CCode (cname="")]
    public int chrDstH;

    [CCode (cname="")]
    public int lumXInc;

    [CCode (cname="")]
    public int chrXInc;

    [CCode (cname="")]
    public int lumYInc;

    [CCode (cname="")]
    public int chrYInc;

    /***********************************************************
    Destination pixel format.
    ***********************************************************/
    [CCode (cname="")]
    public AVPixelFormat dstFormat;

    /***********************************************************
    Source pixel format.
    ***********************************************************/
    [CCode (cname="")]
    public AVPixelFormat srcFormat;

    /***********************************************************
    Number of bits per pixel of the destination pixel format.
    ***********************************************************/
    [CCode (cname="")]
    public int dstFormatBpp;

    /***********************************************************
    Number of bits per pixel of the source pixel format.
    ***********************************************************/
    [CCode (cname="")]
    public int srcFormatBpp;

    [CCode (cname="")]
    public int dstBpc;

    [CCode (cname="")]
    public int srcBpc;

    /***********************************************************
    Binary logarithm of horizontal subsampling factor between luma/alpha and chroma planes in source image.
    ***********************************************************/
    [CCode (cname="")]
    public int chrSrcHSubSample;

    /***********************************************************
    Binary logarithm of vertical subsampling factor between luma/alpha and chroma planes in source image.
    ***********************************************************/
    [CCode (cname="")]
    public int chrSrcVSubSample;

    /***********************************************************
    Binary logarithm of horizontal subsampling factor between luma/alpha and chroma planes in destination image.
    ***********************************************************/
    [CCode (cname="")]
    public int chrDstHSubSample;

    /***********************************************************
    Binary logarithm of vertical subsampling factor between luma/alpha and chroma planes in destination image.
    ***********************************************************/
    [CCode (cname="")]
    public int chrDstVSubSample;

    /***********************************************************
    Binary logarithm of extra vertical subsampling factor in source image chroma planes specified by user.
    ***********************************************************/
    [CCode (cname="")]
    public int vChrDrop;

    /***********************************************************
    Direction that slices are fed to the scaler (1 = top-to-bottom, -1 = bottom-to-top).
    ***********************************************************/
    [CCode (cname="")]
    public int sliceDir;

    /***********************************************************
    Input parameters for scaling algorithms that need them.
    ***********************************************************/
    [CCode (cname="")]
    public double param[2];

    /***********************************************************
    The cascaded_* fields allow spliting a scaler task into multiple
    sequential steps, this is for example used to limit the maximum
    downscaling factor that needs to be supported in one scaler.
    ***********************************************************/
    [CCode (cname="")]
    public SwsContext? cascaded_context[3];

    [CCode (cname="")]
    public int cascaded_tmpStride[4];

    [CCode (cname="")]
    public uint8[] cascaded_tmp[4];

    [CCode (cname="")]
    public int cascaded1_tmpStride[4];

    [CCode (cname="")]
    public uint8[] cascaded1_tmp[4];

    [CCode (cname="")]
    public int cascaded_mainindex;

    [CCode (cname="")]
    public double gamma_value;

    [CCode (cname="")]
    public int gamma_flag;

    [CCode (cname="")]
    public int is_internal_gamma;

    [CCode (cname="")]
    public uint16[] gamma;

    [CCode (cname="")]
    public uint16[] inv_gamma;

    [CCode (cname="")]
    public int numDesc;

    [CCode (cname="")]
    public int descIndex[2];

    [CCode (cname="")]
    public int numSlice;

    [CCode (cname="")]
    public SwsSlice? slice;

    [CCode (cname="")]
    public SwsFilterDescriptor? desc;

    [CCode (cname="")]
    public uint32 pal_yuv[256];

    [CCode (cname="")]
    public uint32 pal_rgb[256];

    [CCode (cname="")]
    public float uint2float_lut[256];

    /***********************************************************
    @name Scaled horizontal lines ring buffer.
    The horizontal scaler keeps just enough scaled lines in a ring buffer
    so they may be passed to the vertical scaler. The pointers to the
    allocated buffers for each line are duplicated in sequence in the ring
    buffer to simplify indexing and avoid wrapping around between lines
    inside the vertical scaler code. The wrapping is done before the
    vertical scaler is called.
    ***********************************************************/
    //@{
    /***********************************************************
    Last scaled horizontal luma/alpha line from source in the ring buffer.
    ***********************************************************/
    [CCode (cname="")]
    public int lastInLumBuf;

    /***********************************************************
    Last scaled horizontal chroma line from source in the ring buffer.
    ***********************************************************/
    [CCode (cname="")]
    public int lastInChrBuf;

    /***********************************************************
    Index in ring buffer of the last scaled horizontal luma/alpha line from source.
    ***********************************************************/
    [CCode (cname="")]
    public int lumBufIndex;

    /***********************************************************
    Index in ring buffer of the last scaled horizontal chroma line from source.
    ***********************************************************/
    [CCode (cname="")]
    public int chrBufIndex;

    //@}

    [CCode (cname="")]
    public uint8[] formatConvBuffer;

    [CCode (cname="")]
    public int needAlpha;

    /***********************************************************
    @name Horizontal and vertical filters.
    To better understand the following fields, here is a pseudo-code of
    their usage in filtering a horizontal line:
    @code
    for (i = 0; i < width; i++) {
        dst[i] = 0;

        for (j = 0; j < filterSize; j++)
            dst[i] += src[ filterPos[i] + j ] * filter[ filterSize * i + j ];

        dst[i] >>= FRAC_BITS; // The actual implementation is fixed-point.
    }
    @endcode
    ***********************************************************/
    //@{
    /***********************************************************
    Array of horizontal filter coefficients for luma/alpha planes.
    ***********************************************************/
    [CCode (cname="")]
    public int16[] hLumFilter;

    /***********************************************************
    Array of horizontal filter coefficients for chroma planes.
    ***********************************************************/
    [CCode (cname="")]
    public int16[] hChrFilter;

    /***********************************************************
    Array of vertical filter coefficients for luma/alpha planes.
    ***********************************************************/
    [CCode (cname="")]
    public int16[] vLumFilter;

    /***********************************************************
    Array of vertical filter coefficients for chroma planes.
    ***********************************************************/
    [CCode (cname="")]
    public int16[] vChrFilter;

    /***********************************************************
    Array of horizontal filter starting positions for each dst[i] for luma/alpha planes.
    ***********************************************************/
    [CCode (cname="")]
    public int32[] hLumFilterPos;

    /***********************************************************
    Array of horizontal filter starting positions for each dst[i] for chroma planes.
    ***********************************************************/
    [CCode (cname="")]
    public int32[] hChrFilterPos;

    /***********************************************************
    Array of vertical filter starting positions for each dst[i] for luma/alpha planes.
    ***********************************************************/
    [CCode (cname="")]
    public int32[] vLumFilterPos;

    /***********************************************************
    Array of vertical filter starting positions for each dst[i] for chroma planes.
    ***********************************************************/
    [CCode (cname="")]
    public int32[] vChrFilterPos;

    /***********************************************************
    Horizontal filter size for luma/alpha pixels.
    ***********************************************************/
    [CCode (cname="")]
    public int hLumFilterSize;

    /***********************************************************
    Horizontal filter size for chroma pixels.
    ***********************************************************/
    [CCode (cname="")]
    public int hChrFilterSize;

    /***********************************************************
    Vertical filter size for luma/alpha pixels.
    ***********************************************************/
    [CCode (cname="")]
    public int vLumFilterSize;

    /***********************************************************
    Vertical filter size for chroma pixels.
    ***********************************************************/
    [CCode (cname="")]
    public int vChrFilterSize;

    //@}

    /***********************************************************
    Runtime-generated MMXEXT horizontal fast bilinear scaler code size for luma/alpha planes.
    ***********************************************************/
    [CCode (cname="")]
    public int lumMmxextFilterCodeSize;

    /***********************************************************
    Runtime-generated MMXEXT horizontal fast bilinear scaler code size for chroma planes.
    ***********************************************************/
    [CCode (cname="")]
    public int chrMmxextFilterCodeSize;

    /***********************************************************
    Runtime-generated MMXEXT horizontal fast bilinear scaler code for luma/alpha planes.
    ***********************************************************/
    [CCode (cname="")]
    public uint8[] lumMmxextFilterCode;

    /***********************************************************
    Runtime-generated MMXEXT horizontal fast bilinear scaler code for chroma planes.
    ***********************************************************/
    [CCode (cname="")]
    public uint8[] chrMmxextFilterCode;

    [CCode (cname="")]
    public int canMMXEXTBeUsed;

    [CCode (cname="")]
    public int warned_unuseable_bilinear;

    /***********************************************************
    Last destination vertical line output from last slice.
    ***********************************************************/
    [CCode (cname="")]
    public int dstY;

    /***********************************************************
    Flags passed by the user to select scaler algorithm, optimizations, subsampling, etc...
    ***********************************************************/
    [CCode (cname="")]
    public int flags;

    /***********************************************************
    pointer to the yuv->rgb table start so it can be freed ()
    alignment ensures the offset can be added in a single
    instruction on e.g. ARM
    ***********************************************************/
    [CCode (cname="")]
    public void *yuvTable;

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (16, int, table_gV)[256 + 2*YUVRGB_TABLE_HEADROOM];

    [CCode (cname="")]
    public uint8[] table_rV[256 + 2*YUVRGB_TABLE_HEADROOM];

    [CCode (cname="")]
    public uint8[] table_gU[256 + 2*YUVRGB_TABLE_HEADROOM];

    [CCode (cname="")]
    public uint8[] table_bU[256 + 2*YUVRGB_TABLE_HEADROOM];

    /***********************************************************
    This table can contain both C and SIMD formatted values, the C vales are always at the XY_IDX points
    ***********************************************************/
    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (16, int32, input_rgb2yuv_table)[16+40*4];

    public enum FooBar {
        [CCode (cname="",cheader_filename="")]
        RY_IDX, // 0

        [CCode (cname="",cheader_filename="")]
        GY_IDX, // 1

        [CCode (cname="",cheader_filename="")]
        BY_IDX, // 2

        [CCode (cname="",cheader_filename="")]
        RU_IDX, // 3

        [CCode (cname="",cheader_filename="")]
        GU_IDX, // 4

        [CCode (cname="",cheader_filename="")]
        BU_IDX, // 5

        [CCode (cname="",cheader_filename="")]
        RV_IDX, // 6

        [CCode (cname="",cheader_filename="")]
        GV_IDX, // 7

        [CCode (cname="",cheader_filename="")]
        BV_IDX, // 8

        [CCode (cname="",cheader_filename="")]
        RGB2YUV_SHIFT; // 15
    }

    [CCode (cname="")]
    public out int dither_error[4];

    /***********************************************************
    Colorspace stuff
    ***********************************************************/

    /***********************************************************
    for sws_getColorspaceDetails
    ***********************************************************/
    [CCode (cname="")]
    public int contrast;

    /***********************************************************
    for sws_getColorspaceDetails
    ***********************************************************/
    [CCode (cname="")]
    public int brightness;

    /***********************************************************
    for sws_getColorspaceDetails
    ***********************************************************/
    [CCode (cname="")]
    public int saturation;

    [CCode (cname="")]
    public int srcColorspaceTable[4];

    [CCode (cname="")]
    public int dstColorspaceTable[4];

    /***********************************************************
    0 = MPG YUV range, 1 = JPG YUV range (source image).
    ***********************************************************/
    [CCode (cname="")]
    public int srcRange;

    /***********************************************************
    0 = MPG YUV range, 1 = JPG YUV range (destination image).
    ***********************************************************/
    [CCode (cname="")]
    public int dstRange;

    [CCode (cname="")]
    public int src0Alpha;

    [CCode (cname="")]
    public int dst0Alpha;

    [CCode (cname="")]
    public int srcXYZ;

    [CCode (cname="")]
    public int dstXYZ;

    [CCode (cname="")]
    public int src_h_chr_pos;

    [CCode (cname="")]
    public int dst_h_chr_pos;

    [CCode (cname="")]
    public int src_v_chr_pos;

    [CCode (cname="")]
    public int dst_v_chr_pos;

    [CCode (cname="")]
    public int yuv2rgb_y_offset;

    [CCode (cname="")]
    public int yuv2rgb_y_coeff;

    [CCode (cname="")]
    public int yuv2rgb_v2r_coeff;

    [CCode (cname="")]
    public int yuv2rgb_v2g_coeff;

    [CCode (cname="")]
    public int yuv2rgb_u2g_coeff;

    [CCode (cname="")]
    public int yuv2rgb_u2b_coeff;

    [CCode (cname="",cheader_filename="")]
    public const string RED_DITHER; // "0*8"

    [CCode (cname="",cheader_filename="")]
    public const string GREEN_DITHER; // "1*8"

    [CCode (cname="",cheader_filename="")]
    public const string BLUE_DITHER; // "2*8"

    [CCode (cname="",cheader_filename="")]
    public const string Y_COEFF; // "3*8"

    [CCode (cname="",cheader_filename="")]
    public const string VR_COEFF; // "4*8"

    [CCode (cname="",cheader_filename="")]
    public const string UB_COEFF              "5*8"

    [CCode (cname="",cheader_filename="")]
    public const string VG_COEFF; // "6*8"

    [CCode (cname="",cheader_filename="")]
    public const string UG_COEFF; // "7*8"

    [CCode (cname="",cheader_filename="")]
    public const string Y_OFFSET; // "8*8"

    [CCode (cname="",cheader_filename="")]
    public const string U_OFFSET; // "9*8"

    [CCode (cname="",cheader_filename="")]
    public const string V_OFFSET; // "10*8"

    [CCode (cname="",cheader_filename="")]
    public const string LUM_MMX_FILTER_OFFSET; // "11*8"

    [CCode (cname="",cheader_filename="")]
    public const string CHR_MMX_FILTER_OFFSET; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)
    [CCode (cname="",cheader_filename="")]
    public const string DSTW_OFFSET; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*2"

    [CCode (cname="",cheader_filename="")]
    public const string ESP_OFFSET; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*2+8"

    [CCode (cname="",cheader_filename="")]
    public const string VROUNDER_OFFSET; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*2+16"

    [CCode (cname="",cheader_filename="")]
    public const string U_TEMP; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*2+24"

    [CCode (cname="",cheader_filename="")]
    public const string V_TEMP; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*2+32"

    [CCode (cname="",cheader_filename="")]
    public const string Y_TEMP; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*2+40"

    [CCode (cname="",cheader_filename="")]
    public const string ALP_MMX_FILTER_OFFSET; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*2+48"

    [CCode (cname="",cheader_filename="")]
    public const string UV_OFF_PX; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*3+48"

    [CCode (cname="",cheader_filename="")]
    public const string UV_OFF_BYTE; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*3+56"

    [CCode (cname="",cheader_filename="")]
    public const string DITHER16; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*3+64"

    [CCode (cname="",cheader_filename="")]
    public const string DITHER32; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*3+80"

    /***********************************************************
    value equal to above, used for checking that the struct hasn't been changed by mistake
    ***********************************************************/
    [CCode (cname="",cheader_filename="")]
    public const size_t DITHER32_INT; // (11*8+4*4*MAX_FILTER_SIZE*3+80)

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, redDither);

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, greenDither);

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, blueDither);

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, yCoeff);

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, vrCoeff);

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, ubCoeff);

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, vgCoeff);

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, ugCoeff);

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, yOffset);

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, uOffset);

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, vOffset);

    [CCode (cname="")]
    public int32 lumMmxFilter[4 * MAX_FILTER_SIZE];

    [CCode (cname="")]
    public int32 chrMmxFilter[4 * MAX_FILTER_SIZE];

    /***********************************************************
    Width of destination luma/alpha planes.
    ***********************************************************/
    [CCode (cname="")]
    public int dstW;

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, esp);

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, vRounder);

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, u_temp);

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, v_temp);

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint64, y_temp);

    [CCode (cname="")]
    public int32 alpMmxFilter[4 * MAX_FILTER_SIZE];

    // alignment of these values is not necessary, but merely here
    // to maintain the same offset across x8632 and x86-64. Once we
    // use proper offset macros in the asm, they can be removed.

    /***********************************************************
    offset (in pixels) between u and v planes
    ***********************************************************/
    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, ptrdiff_t, uv_off);

    /***********************************************************
    offset (in bytes) between u and v planes
    ***********************************************************/
    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, ptrdiff_t, uv_offx2);

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint16, dither16)[8];

    //  [CCode (cname="")]
    //  public DECLARE_ALIGNED (8, uint32, dither32)[8];

    [CCode (cname="")]
    public uint8[] chrDither8;

    [CCode (cname="")]
    public uint8[] lumDither8;

#if HAVE_ALTIVEC
    public vector signed short CY;

    [CCode (cname="")]
    public vector signed short CRV;

    [CCode (cname="")]
    public vector signed short CBU;

    [CCode (cname="")]
    public vector signed short CGU;

    [CCode (cname="")]
    public vector signed short CGV;

    [CCode (cname="")]
    public vector signed short OY;

    [CCode (cname="")]
    public vector ushort CSHIFT;

    [CCode (cname="")]
    public vector signed short[] vYCoeffsBank;

    [CCode (cname="")]
    public vector signed short[] vCCoeffsBank;
#endif

    [CCode (cname="")]
    public int use_mmx_vfilter;

    /***********************************************************
    pre defined color-spaces gamma
    ***********************************************************/
    [CCode (cname="",cheader_filename="")]
    public const float XYZ_GAMMA; // (2.6f)

    /***********************************************************
    pre defined color-spaces gamma
    ***********************************************************/
    [CCode (cname="",cheader_filename="")]
    public const float RGB_GAMMA; // (2.2f)

    public int16[] xyzgamma;

    [CCode (cname="")]
    public int16[] rgbgamma;

    [CCode (cname="")]
    public int16[] xyzgammainv;

    [CCode (cname="")]
    public int16[] rgbgammainv;

    [CCode (cname="")]
    public int16 xyz2rgb_matrix[3][4];

    [CCode (cname="")]
    public int16 rgb2xyz_matrix[3][4];

    /***********************************************************
    function pointer for swscale ()
    ***********************************************************/
    [CCode (cname="")]
    public yuv2planar1_fn yuv2plane1;

    /***********************************************************
    function pointer for swscale ()
    ***********************************************************/
    [CCode (cname="")]
    public yuv2planarX_fn yuv2planeX;

    /***********************************************************
    function pointer for swscale ()
    ***********************************************************/
    [CCode (cname="")]
    public yuv2interleavedX_fn yuv2nv12cX;

    /***********************************************************
    function pointer for swscale ()
    ***********************************************************/
    [CCode (cname="")]
    public yuv2packed1_fn yuv2packed1;

    /***********************************************************
    function pointer for swscale ()
    ***********************************************************/
    [CCode (cname="")]
    public yuv2packed2_fn yuv2packed2;

    /***********************************************************
    function pointer for swscale ()
    ***********************************************************/
    [CCode (cname="")]
    public yuv2packedX_fn yuv2packedX;

    /***********************************************************
    function pointer for swscale ()
    ***********************************************************/
    [CCode (cname="")]
    public yuv2anyX_fn yuv2anyX;

    public delegate void LumToYV12Delegate (
        uint8[] dst,
        uint8[] src,
        uint8[] src2,
        uint8[] src3,
        int width,
        uint32[] pal
    );

    /***********************************************************
    Unscaled conversion of luma plane to YV12 for horizontal scaler.
    ***********************************************************/
    [CCode (cname="lumToYV12")]
    public LumToYV12Delegate lumToYV12;

    public delegate void AlpToYV12Delegate (
        uint8[] dst,
        uint8[] src,
        uint8[] src2,
        uint8[] src3,
        int width,
        uint32[] pal
    );

    /***********************************************************
    Unscaled conversion of alpha plane to YV12 for horizontal scaler.
    ***********************************************************/
    [CCode (cname="alpToYV12")]
    public AlpToYV12Delegate alpToYV12;

    public delegate void ChrToYV12Delegate (
        uint8[] dstU,
        uint8[] dstV,
        uint8[] src1,
        uint8[] src2,
        uint8[] src3,
        int width,
        uint32[] pal
    );

    /***********************************************************
    Unscaled conversion of chroma planes to YV12 for horizontal scaler.
    ***********************************************************/
    [CCode (cname="chrToYV12")]
    public ChrToYV12Delegate chrToYV12;

    /***********************************************************
    Functions to read planar input, such as planar RGB, and convert
    public internally to Y/UV/A.
    ***********************************************************/
    /***********************************************************
    @{
    ***********************************************************/

    public delegate void ReadLumPlanarDelegate (
        uint8[] dst,
        uint8[] src[4],
        int width,
        int32[] rgb2yuv
    );

    [CCode (cname="readLumPlanar")]
    public ReadLumPlanarDelegate readLumPlanar;

    public delegate void ReadChrPlanarDelegate (
        uint8[] dstU,
        uint8[] dstV,
        uint8[] src[4],
        int width,
        int32[] rgb2yuv
    );

    [CCode (cname="readChrPlanar")]
    public ReadChrPlanarDelegate readChrPlanar;

    public delegate void ReadAlpPlanarDelegate (
        uint8[] dst,
        uint8[] src[4],
        int width,
        int32[] rgb2yuv
    );

    [CCode (cname="readAlpPlanar")]
    public ReadAlpPlanarDelegate readAlpPlanar;

    /***********************************************************
    @}
    ***********************************************************/

    /***********************************************************
    Scale one horizontal line of input data using a bilinear filter
    to produce one line of output data. Compared to SwsContext->hScale (),
    please take note of the following caveats when using these:
    - Scaling is done using only 7 bits instead of 14-bit coefficients.
    - You can use no more than 5 input pixels to produce 4 output
      pixels. Therefore, this filter should not be used for downscaling
      by more than ~20% in width (because that equals more than 5/4th
      downscaling and thus more than 5 pixels input per 4 pixels output).
    - In general, bilinear filters create artifacts during downscaling
      (even when <20%), because one output pixel will span more than one
      input pixel, and thus some pixels will need edges of both neighbor
      pixels to interpolate the output pixel. Since you can use at most
      two input pixels per output pixel in bilinear scaling, this is
      impossible and thus downscaling by any size will create artifacts.
    To enable this type of scaling, set SWS_FLAG_FAST_BILINEAR
    in SwsContext->flags.
    ***********************************************************/
    /***********************************************************
    @{
    ***********************************************************/

    public delegate void HyScaleFastDelegate (
        SwsContext? c,
        int16[] dst,
        int dstWidth,
        uint8[] src,
        int srcW,
        int xInc
    );

    [CCode (cname="hyscale_fast")]
    public HyScaleFastDelegate hyscale_fast;

    public delegate void HcScaleFastDelegate (
        SwsContext? c,
        int16[] dst1,
        int16[] dst2,
        int dstWidth,
        uint8[] src1,
        uint8[] src2,
        int srcW,
        int xInc
    );

    [CCode (cname="hcscale_fast")]
    public HcScaleFastDelegate hcscale_fast;

    /***********************************************************
    @}
    ***********************************************************/

    /***********************************************************
    Scale one horizontal line of input data using a filter over the input
    lines, to produce one (differently sized) line of output data.

    @param dst        pointer to destination buffer for horizontally scaled
                      data. If the number of bits per component of one
                      destination pixel (SwsContext->dstBpc) is <= 10, data
                      will be 15 bpc in 16 bits (int16) width. Else (i.e.
                      SwsContext->dstBpc == 16), data will be 19bpc in
                      32 bits (int32) width.
    @param dstW       width of destination image
    @param src        pointer to source data to be scaled. If the number of
                      bits per component of a source pixel (SwsContext->srcBpc)
                      is 8, this is 8bpc in 8 bits (uint8) width. Else
                      (i.e. SwsContext->dstBpc > 8), this is native depth
                      in 16 bits (uint16) width. In other words, for 9-bit
                      YUV input, this is 9bpc, for 10-bit YUV input, this is
                      10bpc, and for 16-bit RGB or YUV, this is 16bpc.
    @param filter     filter coefficients to be used per output pixel for
                      scaling. This contains 14bpp filtering coefficients.
                      Guaranteed to contain dstW * filterSize entries.
    @param filterPos  position of the first input pixel to be used for
                      each output pixel during scaling. Guaranteed to
                      contain dstW entries.
    @param filterSize the number of input coefficients to be used (and
                      thus the number of input pixels to be used) for
                      creating a single output pixel. Is aligned to 4
                      (and input coefficients thus padded with zeroes)
                      to simplify creating SIMD code.
    ***********************************************************/
    /***********************************************************
    @{
    ***********************************************************/

    public delegate void HyScaleDelegate (
        SwsContext? c,
        int16[] dst,
        int dstW,
        uint8[] src,
        int16[] filter,
        int32[] filterPos,
        int filterSize
    );

    [CCode (cname="hyScale")]
    public HyScaleDelegate hyScale;

    public delegate void HcScaleDelegate (
        SwsContext? c,
        int16[] dst,
        int dstW,
        uint8[] src,
        int16[] filter,
        int32[] filterPos,
        int filterSize
    );

    [CCode (cname="hcScale")]
    public HcScaleDelegate hcScale;

    /***********************************************************
    @}
    ***********************************************************/

    public delegate void LumConvertRangeDelegate (
        int16[] dst,
        int width
    );

    /***********************************************************
    Color range conversion function for luma plane if needed.
    ***********************************************************/
    [CCode (cname="lumConvertRange")]
    public LumConvertRangeDelegate lumConvertRange;

    public delegate void ChrConvertRangeDelegate (
        int16[] dst1,
        int16[] dst2,
        int width
    );

    /***********************************************************
    Color range conversion function for chroma planes if needed.
    ***********************************************************/
    [CCode (cname="chrConvertRange")]
    public ChrConvertRangeDelegate chrConvertRange;

    /***********************************************************
    Set if there are chroma planes to be converted.
    ***********************************************************/
    [CCode (cname="")]
    public int needs_hcscale;

    [CCode (cname="")]
    public SwsDither dither;

    [CCode (cname="")]
    public SwsAlphaBlend alphablend;
}
// FIXME check init (where 0)

[CCode (cname="",cheader_filename="")]
public SwsFunc ff_yuv2rgb_get_func_ptr (
    SwsContext? c
);

[CCode (cname="",cheader_filename="")]
public int ff_yuv2rgb_c_init_tables (
    SwsContext? c,
    int inv_table[4],
    int fullRange,
    int brightness,
    int contrast,
    int saturation
);

[CCode (cname="",cheader_filename="")]
public void ff_yuv2rgb_init_tables_ppc (
    SwsContext? c,
    int inv_table[4],
    int brightness,
    int contrast,
    int saturation
);

[CCode (cname="",cheader_filename="")]
public void ff_updateMMXDitherTables (
    SwsContext? c,
    int dstY,
    int lumBufIndex,
    int chrBufIndex,
    int lastInLumBuf,
    int lastInChrBuf
);

[CCode (cname="",cheader_filename="")]
public av_cold void ff_sws_init_range_convert (
    SwsContext? c
);

[CCode (cname="",cheader_filename="")]
public SwsFunc ff_yuv2rgb_init_x86 (
    wsContext? c
);

[CCode (cname="",cheader_filename="")]
public SwsFunc ff_yuv2rgb_init_ppc (
    SwsContext? c
);

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static bool is16BPS (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      return desc->comp[0].depth == 16;
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static bool isNBPS (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      return desc->comp[0].depth >= 9 && desc->comp[0].depth <= 14;
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static int isBE (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      return desc->flags & AV_PIX_FMT_FLAG_BE;
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static bool isYUV (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      return !(desc->flags & AV_PIX_FMT_FLAG_RGB) && desc->nb_components >= 2;
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static bool isPlanarYUV (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      return ((desc->flags & AV_PIX_FMT_FLAG_PLANAR) && isYUV (pix_fmt));
//  }

/***********************************************************
Identity semi-planar YUV formats. Specifically, those are YUV formats
where the second and third components (U & V) are on the same plane.
***********************************************************/
[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static bool isSemiPlanarYUV (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      return (isPlanarYUV (pix_fmt) && desc->comp[1].plane == desc->comp[2].plane);
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static int isRGB (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      return (desc->flags & AV_PIX_FMT_FLAG_RGB);
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static bool isGray (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      return !(desc->flags & AV_PIX_FMT_FLAG_PAL) &&
//             !(desc->flags & AV_PIX_FMT_FLAG_HWACCEL) &&
//             desc->nb_components <= 2 &&
//             pix_fmt != AV_PIX_FMT_MONOBLACK &&
//             pix_fmt != AV_PIX_FMT_MONOWHITE;
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static bool isRGBinInt (
    AVPixelFormat pix_fmt
);
//  {
//      return pix_fmt == AV_PIX_FMT_RGB48BE     ||
//             pix_fmt == AV_PIX_FMT_RGB48LE     ||
//             pix_fmt == AV_PIX_FMT_RGB32       ||
//             pix_fmt == AV_PIX_FMT_RGB32_1     ||
//             pix_fmt == AV_PIX_FMT_RGB24       ||
//             pix_fmt == AV_PIX_FMT_RGB565BE    ||
//             pix_fmt == AV_PIX_FMT_RGB565LE    ||
//             pix_fmt == AV_PIX_FMT_RGB555BE    ||
//             pix_fmt == AV_PIX_FMT_RGB555LE    ||
//             pix_fmt == AV_PIX_FMT_RGB444BE    ||
//             pix_fmt == AV_PIX_FMT_RGB444LE    ||
//             pix_fmt == AV_PIX_FMT_RGB8        ||
//             pix_fmt == AV_PIX_FMT_RGB4        ||
//             pix_fmt == AV_PIX_FMT_RGB4_BYTE   ||
//             pix_fmt == AV_PIX_FMT_RGBA64BE    ||
//             pix_fmt == AV_PIX_FMT_RGBA64LE    ||
//             pix_fmt == AV_PIX_FMT_MONOBLACK   ||
//             pix_fmt == AV_PIX_FMT_MONOWHITE;
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static bool isBGRinInt (
    AVPixelFormat pix_fmt
);
//  {
//      return pix_fmt == AV_PIX_FMT_BGR48BE     ||
//             pix_fmt == AV_PIX_FMT_BGR48LE     ||
//             pix_fmt == AV_PIX_FMT_BGR32       ||
//             pix_fmt == AV_PIX_FMT_BGR32_1     ||
//             pix_fmt == AV_PIX_FMT_BGR24       ||
//             pix_fmt == AV_PIX_FMT_BGR565BE    ||
//             pix_fmt == AV_PIX_FMT_BGR565LE    ||
//             pix_fmt == AV_PIX_FMT_BGR555BE    ||
//             pix_fmt == AV_PIX_FMT_BGR555LE    ||
//             pix_fmt == AV_PIX_FMT_BGR444BE    ||
//             pix_fmt == AV_PIX_FMT_BGR444LE    ||
//             pix_fmt == AV_PIX_FMT_BGR8        ||
//             pix_fmt == AV_PIX_FMT_BGR4        ||
//             pix_fmt == AV_PIX_FMT_BGR4_BYTE   ||
//             pix_fmt == AV_PIX_FMT_BGRA64BE    ||
//             pix_fmt == AV_PIX_FMT_BGRA64LE    ||
//             pix_fmt == AV_PIX_FMT_MONOBLACK   ||
//             pix_fmt == AV_PIX_FMT_MONOWHITE;
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static int isBayer (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      return !!(desc->flags & AV_PIX_FMT_FLAG_BAYER);
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static bool isAnyRGB (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      return (desc->flags & AV_PIX_FMT_FLAG_RGB) ||
//              pix_fmt == AV_PIX_FMT_MONOBLACK || pix_fmt == AV_PIX_FMT_MONOWHITE;
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static int isFloat (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      return desc->flags & AV_PIX_FMT_FLAG_FLOAT;
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static int isALPHA (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      if (pix_fmt == AV_PIX_FMT_PAL8)
//          return 1;

//      return desc->flags & AV_PIX_FMT_FLAG_ALPHA;
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static int isPacked (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      return (desc->nb_components >= 2 && !(desc->flags & AV_PIX_FMT_FLAG_PLANAR)) ||
//              pix_fmt == AV_PIX_FMT_PAL8 ||
//              pix_fmt == AV_PIX_FMT_MONOBLACK || pix_fmt == AV_PIX_FMT_MONOWHITE;
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static bool isPlanar (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      return (desc->nb_components >= 2 && (desc->flags & AV_PIX_FMT_FLAG_PLANAR));
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static bool isPackedRGB (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      return ((desc->flags & (AV_PIX_FMT_FLAG_PLANAR | AV_PIX_FMT_FLAG_RGB)) == AV_PIX_FMT_FLAG_RGB);
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static bool isPlanarRGB (
    AVPixelFormat pix_fmt
);
//  {
//      const AVPixFmtDescriptor? desc = av_pix_fmt_desc_get (pix_fmt);

//      av_assert0 (desc);

//      return ((desc->flags & (AV_PIX_FMT_FLAG_PLANAR | AV_PIX_FMT_FLAG_RGB)) ==
//              (AV_PIX_FMT_FLAG_PLANAR | AV_PIX_FMT_FLAG_RGB));
//  }

[CCode (cname="",cheader_filename="")]
//  av_always_inline
public static bool usePal (
    AVPixelFormat pix_fmt
);
//  {
//      switch (pix_fmt) {
//      case AV_PIX_FMT_PAL8:
//      case AV_PIX_FMT_BGR4_BYTE:
//      case AV_PIX_FMT_BGR8:
//      case AV_PIX_FMT_GRAY8:
//      case AV_PIX_FMT_RGB4_BYTE:
//      case AV_PIX_FMT_RGB8:
//          return 1;

//      default:
//          return 0;

//      }
//  }

//  extern const uint64 ff_dither4[2];
//  extern const uint64 ff_dither8[2];

//  extern const uint8 ff_dither_2x2_4[3][8];
//  extern const uint8 ff_dither_2x2_8[3][8];
//  extern const uint8 ff_dither_4x4_16[5][8];
//  extern const uint8 ff_dither_8x8_32[9][8];
//  extern const uint8 ff_dither_8x8_73[9][8];
//  extern const uint8 ff_dither_8x8_128[9][8];
//  extern const uint8 ff_dither_8x8_220[9][8];

//  extern const int32 ff_yuv2rgb_coeffs[11][4];

//  extern const AVClass ff_sws_context_class;

/***********************************************************
Set c->swscale to an unscaled converter if one exists for the specific
source and destination formats, bit depths, flags, etc.
***********************************************************/
[CCode (cname="",cheader_filename="")]
public void ff_get_unscaled_swscale (
    SwsContext? c
);

[CCode (cname="",cheader_filename="")]
public void ff_get_unscaled_swscale_ppc (
    SwsContext? c
);

[CCode (cname="",cheader_filename="")]
public void ff_get_unscaled_swscale_arm (
    SwsContext? c
);

[CCode (cname="",cheader_filename="")]
public void ff_get_unscaled_swscale_aarch64 (
    SwsContext? c
);

/***********************************************************
Return function pointer to fastest main scaler path function depending
on architecture and available optimizations.
***********************************************************/
[CCode (cname="",cheader_filename="")]
public SwsFunc ff_getSwsFunc (
    SwsContext? c
);

[CCode (cname="",cheader_filename="")]
public void ff_sws_init_input_funcs (
    SwsContext? c
);

[CCode (cname="",cheader_filename="")]
public void ff_sws_init_output_funcs (
    SwsContext? c,
    yuv2planar1_fn? yuv2plane1,
    yuv2planarX_fn? yuv2planeX,
    yuv2interleavedX_fn? yuv2nv12cX,
    yuv2packed1_fn? yuv2packed1,
    yuv2packed2_fn? yuv2packed2,
    yuv2packedX_fn? yuv2packedX,
    yuv2anyX_fn? yuv2anyX
);

[CCode (cname="",cheader_filename="")]
public void ff_sws_init_swscale_ppc (
    SwsContext? c
);

[CCode (cname="",cheader_filename="")]
public void ff_sws_init_swscale_vsx (
    SwsContext? c
);

[CCode (cname="",cheader_filename="")]
public void ff_sws_init_swscale_x86 (
    SwsContext? c
);

[CCode (cname="",cheader_filename="")]
public void ff_sws_init_swscale_aarch64 (
    SwsContext? c
);

[CCode (cname="",cheader_filename="")]
public void ff_sws_init_swscale_arm (
    SwsContext? c
);

[CCode (cname="",cheader_filename="")]
public void ff_hyscale_fast_c (
    SwsContext? c,
    int16[] dst,
    int dstWidth,
    uint8[] src,
    int srcW,
    int xInc
);

[CCode (cname="",cheader_filename="")]
public void ff_hcscale_fast_c (
    SwsContext? c,
    int16[] dst1,
    int16[] dst2,
    int dstWidth,
    uint8[] src1,
    uint8[] src2,
    int srcW,
    int xInc
);

[CCode (cname="",cheader_filename="")]
public int ff_init_hscaler_mmxext (
    int dstW,
    int xInc,
    uint8[] filterCode,
    int16[] filter,
    int32[] filterPos,
    int numSplits
);

[CCode (cname="",cheader_filename="")]
public void ff_hyscale_fast_mmxext (
    SwsContext? c,
    int16[] dst,
    int dstWidth,
    uint8[] src,
    int srcW,
    int xInc
);

[CCode (cname="",cheader_filename="")]
public void ff_hcscale_fast_mmxext (
    SwsContext? c,
    int16[] dst1,
    int16[] dst2,
    int dstWidth,
    uint8[] src1,
    uint8[] src2,
    int srcW,
    int xInc
);

/***********************************************************
Allocate and return an SwsContext.
This is like sws_getContext () but does not perform the init step, allowing
the user to set additional AVOptions.

@see sws_getContext ()
***********************************************************/
[CCode (cname="",cheader_filename="")]
public SwsContext? sws_alloc_set_opts (
    int srcW,
    int srcH,
    AVPixelFormat srcFormat,
    int dstW,
    int dstH,
    AVPixelFormat dstFormat,
    int flags,
    double[] param
);

[CCode (cname="",cheader_filename="")]
public int ff_sws_alphablendaway (
    SwsContext? c,
    uint8[] src[],
    int srcStride[],
    int srcSliceY,
    int srcSliceH,
    uint8[] dst[],
    int dstStride[]
);

[CCode (cname="",cheader_filename="")]
public static inline void fillPlane16 (
    uint8[] plane,
    int stride,
    int width,
    int height,
    int y,
    int alpha,
    int bits,
    int big_endian
);
//  {
//      int i, j;

//      uint8[] ptr = plane + stride * y;

//      [CCode (cname="")]
//      int v = alpha ? 0xFFFF>>(16-bits) : (1<<(bits-1));

//      for (i = 0; i < height; i++) {
//  public define FILL (wfunc) \
//          for (j = 0; j < width; j++) {\
//              wfunc (ptr+2*j, v);\
//          }
//          if (big_endian) {
//              FILL (AV_WB16);

//          } else {
//              FILL (AV_WL16);

//          }
//          ptr += stride;

//      }
//  }

[CCode (cname="",cheader_filename="")]
public const size_t MAX_SLICE_PLANES; // 4

/***********************************************************
Slice plane
***********************************************************/
[CCode (cname="",cheader_filename="")]
[Compact]
public class SwsPlane {
    /***********************************************************
    max number of lines that can be hold by this plane
    ***********************************************************/
    [CCode (cname="")]
    public int available_lines;

    /***********************************************************
    index of first line
    ***********************************************************/
    [CCode (cname="")]
    public int sliceY;

    /***********************************************************
    number of lines
    ***********************************************************/
    [CCode (cname="")]
    public int sliceH;

    /***********************************************************
    \line buffer
    ***********************************************************/
    [CCode (cname="")]
    public uint8[][] line;

    /***********************************************************
    Tmp line buffer used by mmx code
    ***********************************************************/
    [CCode (cname="")]
    public uint8[][] tmp;
}

/***********************************************************
Struct which defines a slice of an image to be scaled or an output for
a scaled slice.
A slice can also be used as intermediate ring buffer for scaling steps.
***********************************************************/
[CCode (cname="",cheader_filename="")]
[Compact]
public class SwsSlice {
    /***********************************************************
    Slice line width
    ***********************************************************/
    [CCode (cname="")]
    public int width;

    /***********************************************************
    horizontal chroma subsampling factor
    ***********************************************************/
    [CCode (cname="")]
    public int h_chr_sub_sample;

    /***********************************************************
    vertical chroma subsampling factor
    ***********************************************************/
    [CCode (cname="")]
    public int v_chr_sub_sample;

    /***********************************************************
    flag to identify if this slice is a ring buffer
    ***********************************************************/
    [CCode (cname="")]
    public int is_ring;

    /***********************************************************
    flag to identify if there are dynamic allocated lines
    ***********************************************************/
    [CCode (cname="")]
    public int should_free_lines;

    /***********************************************************
    planes pixel format
    ***********************************************************/
    [CCode (cname="")]
    public AVPixelFormat fmt;

    /***********************************************************
    color planes
    ***********************************************************/
    [CCode (cname="")]
    public SwsPlane plane[MAX_SLICE_PLANES];
}

/***********************************************************
Struct which holds all necessary data for processing a slice.
A processing step can be a color conversion or horizontal/vertical scaling.
***********************************************************/
[CCode (cname="",cheader_filename="")]
[Compact]
public class SwsFilterDescriptor {
    /***********************************************************
    Source slice
    ***********************************************************/
    [CCode (cname="")]
    public SwsSlice? src;

    /***********************************************************
    Output slice
    ***********************************************************/
    [CCode (cname="")]
    public SwsSlice? dst;

    /***********************************************************
    Flag for processing alpha channel
    ***********************************************************/
    [CCode (cname="")]
    public int alpha;

    /***********************************************************
    Filter instance data
    ***********************************************************/
    [CCode (cname="")]
    public void *instance;

    public delegate int ProcessDelegate (
        SwsContext? c,
        SwsFilterDescriptor? desc,
        int sliceY,
        int sliceH
    );

    /***********************************************************
    Function for processing input slice sliceH lines starting from line sliceY
    ***********************************************************/
    [CCode (cname="process")]
    public ProcessDelegate process;
}

/***********************************************************
warp input lines in the form (src + width*i + j) to slice format (line[i][j])
relative=true means first line src[x][0] otherwise first line is src[x][lum/crh Y]
***********************************************************/
[CCode (cname="",cheader_filename="")]
public int ff_init_slice_from_src (
    SwsSlice * sws_slice,
    uint8[] src[4],
    int stride[4],
    int srcW,
    int lumY,
    int lumH,
    int chrY,
    int chrH,
    int relative
);

/***********************************************************
Initialize scaler filter descriptor chain
***********************************************************/
[CCode (cname="",cheader_filename="")]
public int ff_init_filters (
    SwsContext? c
);

/***********************************************************
Free all filter data
***********************************************************/
[CCode (cname="",cheader_filename="")]
public int ff_free_filters (
    SwsContext? c
);

/***********************************************************
function for applying ring buffer logic into slice sws_slice
It checks if the slice can hold more @lum lines, if yes
do nothing otherwise remove @lum least used lines.
It applies the same procedure for @chr lines.
***********************************************************/
[CCode (cname="",cheader_filename="")]
public int ff_rotate_slice (
    SwsSlice? sws_slice,
    int lum,
    int chr
);

/***********************************************************
initializes gamma conversion descriptor
***********************************************************/
[CCode (cname="",cheader_filename="")]
public int ff_init_gamma_convert (
    SwsFilterDescriptor? desc,
    SwsSlice * src,
    uint16[] table
);

/***********************************************************
initializes lum pixel format conversion descriptor
***********************************************************/
[CCode (cname="",cheader_filename="")]
public int ff_init_desc_fmt_convert (
    SwsFilterDescriptor? desc,
    SwsSlice * src,
    SwsSlice? dst,
    uint32[] pal
);

/***********************************************************
initializes lum horizontal scaling descriptor
***********************************************************/
[CCode (cname="",cheader_filename="")]
public int ff_init_desc_hscale (
    SwsFilterDescriptor? desc,
    SwsSlice? src,
    SwsSlice? dst,
    uint16[] filter,
    int * filter_pos,
    int filter_size,
    int xInc
);

/***********************************************************
initializes chr pixel format conversion descriptor
***********************************************************/
[CCode (cname="",cheader_filename="")]
public int ff_init_desc_cfmt_convert (
    SwsFilterDescriptor? desc,
    SwsSlice * src,
    SwsSlice? dst,
    uint32[] pal
);

/***********************************************************
initializes chr horizontal scaling descriptor
***********************************************************/
[CCode (cname="",cheader_filename="")]
public int ff_init_desc_chscale (
    SwsFilterDescriptor? desc,
    SwsSlice? src,
    SwsSlice? dst,
    uint16[] filter,
    int * filter_pos,
    int filter_size,
    int xInc
);

[CCode (cname="",cheader_filename="")]
public int ff_init_desc_no_chr (
    SwsFilterDescriptor? desc,
    SwsSlice * src,
    SwsSlice? dst
);

/***********************************************************
initializes vertical scaling descriptors
***********************************************************/
[CCode (cname="",cheader_filename="")]
public int ff_init_vscale (
    SwsContext? c,
    SwsFilterDescriptor? desc,
    SwsSlice? src,
    SwsSlice? dst
);

/***********************************************************
setup vertical scaler functions
***********************************************************/
[CCode (cname="",cheader_filename="")]
public void ff_init_vscale_pfn (
    SwsContext? c,
    yuv2planar1_fn yuv2plane1,
    yuv2planarX_fn yuv2planeX,
    yuv2interleavedX_fn yuv2nv12cX,
    yuv2packed1_fn yuv2packed1,
    yuv2packed2_fn yuv2packed2,
    yuv2packedX_fn yuv2packedX,
    yuv2anyX_fn yuv2anyX,
    int use_mmx
);

/***********************************************************
number of extra lines to process
***********************************************************/
[CCode (cname="",cheader_filename="")]
public const size_t MAX_LINES_AHEAD; // 4
