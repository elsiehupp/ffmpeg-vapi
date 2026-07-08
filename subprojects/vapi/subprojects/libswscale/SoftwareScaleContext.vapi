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
namespace LibSoftwareScale {

//  [CCode (cname="struct SwsContext",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
//  [Compact]
//  internal class LibSoftwareScale.SoftwareScaleContext { }

/***********************************************************
This struct should be aligned on at least a 32-byte boundary.
***********************************************************/
[CCode (cname="struct SwsContext",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
[Compact]
internal class LibSoftwareScale.SoftwareScaleContext {
    /***********************************************************
    @brief info on struct for av_log
    ***********************************************************/
    [CCode (cname="av_class")]
    internal LibAVUtil.Log.Class? av_class;

    [CCode (cname="SwsFunc",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal delegate int SoftwareScaleDelegate (
        LibSoftwareScale.SoftwareScaleContext? context,
        uint8[] src[],
        int srcStride[],
        int srcSliceY,
        int srcSliceH,
        uint8[] dst[],
        int dstStride[]
    );

    /***********************************************************
    @note that src, dst, srcStride, dstStride will be copied in the
    sws_scale () wrapper so they can be freely modified here.
    ***********************************************************/
    [CCode (cname="swscale")]
    internal LibSoftwareScale.SoftwareScaleDelegate swscale;

    /***********************************************************
    @brief Width of source luma/alpha planes.
    ***********************************************************/
    [CCode (cname="srcW")]
    internal int srcW;

    /***********************************************************
    @brief Height of source luma/alpha planes.
    ***********************************************************/
    [CCode (cname="srcH")]
    internal int srcH;

    /***********************************************************
    @brief Height of destination luma/alpha planes.
    ***********************************************************/
    [CCode (cname="dstH")]
    internal int dstH;

    /***********************************************************
    @brief Width of source chroma planes.
    ***********************************************************/
    [CCode (cname="chrSrcW")]
    internal int chrSrcW;

    /***********************************************************
    @brief Height of source chroma planes.
    ***********************************************************/
    [CCode (cname="chrSrcH")]
    internal int chrSrcH;

    /***********************************************************
    @brief Width of destination chroma planes.
    ***********************************************************/
    [CCode (cname="chrDstW")]
    internal int chrDstW;

    /***********************************************************
    @brief Height of destination chroma planes.
    ***********************************************************/
    [CCode (cname="chrDstH")]
    internal int chrDstH;

    [CCode (cname="lumXInc")]
    internal int lumXInc;

    [CCode (cname="chrXInc")]
    internal int chrXInc;

    [CCode (cname="lumYInc")]
    internal int lumYInc;

    [CCode (cname="chrYInc")]
    internal int chrYInc;

    /***********************************************************
    @brief Destination pixel format.
    ***********************************************************/
    [CCode (cname="dstFormat")]
    internal LibAVUtil.PixelFormat dstFormat;

    /***********************************************************
    @brief Source pixel format.
    ***********************************************************/
    [CCode (cname="srcFormat")]
    internal LibAVUtil.PixelFormat srcFormat;

    /***********************************************************
    @brief Number of bits per pixel of the destination pixel format.
    ***********************************************************/
    [CCode (cname="dstFormatBpp")]
    internal int dstFormatBpp;

    /***********************************************************
    @brief Number of bits per pixel of the source pixel format.
    ***********************************************************/
    [CCode (cname="srcFormatBpp")]
    internal int srcFormatBpp;

    [CCode (cname="dstBpc")]
    internal int dstBpc;

    [CCode (cname="srcBpc")]
    internal int srcBpc;

    /***********************************************************
    @brief Binary logarithm of horizontal subsampling factor between luma/alpha and chroma planes in source image.
    ***********************************************************/
    [CCode (cname="chrSrcHSubSample")]
    internal int chrSrcHSubSample;

    /***********************************************************
    @brief Binary logarithm of vertical subsampling factor between luma/alpha and chroma planes in source image.
    ***********************************************************/
    [CCode (cname="chrSrcVSubSample")]
    internal int chrSrcVSubSample;

    /***********************************************************
    @brief Binary logarithm of horizontal subsampling factor between luma/alpha and chroma planes in destination image.
    ***********************************************************/
    [CCode (cname="chrDstHSubSample")]
    internal int chrDstHSubSample;

    /***********************************************************
    @brief Binary logarithm of vertical subsampling factor between luma/alpha and chroma planes in destination image.
    ***********************************************************/
    [CCode (cname="chrDstVSubSample")]
    internal int chrDstVSubSample;

    /***********************************************************
    @brief Binary logarithm of extra vertical subsampling factor in source image chroma planes specified by user.
    ***********************************************************/
    [CCode (cname="vChrDrop")]
    internal int vChrDrop;

    /***********************************************************
    @brief Direction that slices are fed to the scaler (1 = top-to-bottom, -1 = bottom-to-top).
    ***********************************************************/
    [CCode (cname="sliceDir")]
    internal int sliceDir;

    /***********************************************************
    @brief Input parameters for scaling algorithms that need them.
    ***********************************************************/
    [CCode (cname="param")]
    internal double param[2];

    /***********************************************************
    The cascaded_* fields allow spliting a scaler task into multiple
    sequential steps, this is for example used to limit the maximum
    downscaling factor that needs to be supported in one scaler.
    ***********************************************************/
    [CCode (cname="cascaded_context")]
    internal LibSoftwareScale.SoftwareScaleContext? cascaded_context[3];

    [CCode (cname="cascaded_tmpStride")]
    internal int cascaded_tmpStride[4];

    [CCode (cname="cascaded_tmp")]
    internal uint8[] cascaded_tmp[4];

    [CCode (cname="cascaded1_tmpStride")]
    internal int cascaded1_tmpStride[4];

    [CCode (cname="cascaded1_tmp")]
    internal uint8[] cascaded1_tmp[4];

    [CCode (cname="cascaded_mainindex")]
    internal int cascaded_mainindex;

    [CCode (cname="gamma_value")]
    internal double gamma_value;

    [CCode (cname="gamma_flag")]
    internal int gamma_flag;

    [CCode (cname="is_internal_gamma")]
    internal bool is_internal_gamma;

    [CCode (cname="gamma")]
    internal uint16[] gamma;

    [CCode (cname="inv_gamma")]
    internal uint16[] inv_gamma;

    [CCode (cname="numDesc")]
    internal int numDesc;

    [CCode (cname="descIndex")]
    internal int descIndex[2];

    [CCode (cname="numSlice")]
    internal int numSlice;

    [CCode (cname="slice")]
    internal LibSoftwareScale.SoftwareScaleSlice[] slice;

    [CCode (cname="desc")]
    internal LibSoftwareScale.SoftwareScaleFilterDescriptor[] desc;

    [CCode (cname="pal_yuv")]
    internal uint32 pal_yuv[256];

    [CCode (cname="pal_rgb")]
    internal uint32 pal_rgb[256];

    [CCode (cname="uint2float_lut")]
    internal float uint2float_lut[256];

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
    @brief Last scaled horizontal luma/alpha line from source in the ring buffer.
    ***********************************************************/
    [CCode (cname="lastInLumBuf")]
    internal int lastInLumBuf;

    /***********************************************************
    @brief Last scaled horizontal chroma line from source in the ring buffer.
    ***********************************************************/
    [CCode (cname="lastInChrBuf")]
    internal int lastInChrBuf;

    /***********************************************************
    @brief Index in ring buffer of the last scaled horizontal luma/alpha line from source.
    ***********************************************************/
    [CCode (cname="lumBufIndex")]
    internal int lumBufIndex;

    /***********************************************************
    @brief Index in ring buffer of the last scaled horizontal chroma line from source.
    ***********************************************************/
    [CCode (cname="chrBufIndex")]
    internal int chrBufIndex;

    //@}

    [CCode (cname="formatConvBuffer")]
    internal uint8[] formatConvBuffer;

    [CCode (cname="needAlpha")]
    internal int needAlpha;

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
    @brief Array of horizontal filter coefficients for luma/alpha planes.
    ***********************************************************/
    [CCode (cname="hLumFilter")]
    internal int16[] hLumFilter;

    /***********************************************************
    @brief Array of horizontal filter coefficients for chroma planes.
    ***********************************************************/
    [CCode (cname="hChrFilter")]
    internal int16[] hChrFilter;

    /***********************************************************
    @brief Array of vertical filter coefficients for luma/alpha planes.
    ***********************************************************/
    [CCode (cname="vLumFilter")]
    internal int16[] vLumFilter;

    /***********************************************************
    @brief Array of vertical filter coefficients for chroma planes.
    ***********************************************************/
    [CCode (cname="vChrFilter")]
    internal int16[] vChrFilter;

    /***********************************************************
    @brief Array of horizontal filter starting positions for each dst[i] for luma/alpha planes.
    ***********************************************************/
    [CCode (cname="hLumFilterPos")]
    internal int32[] hLumFilterPos;

    /***********************************************************
    @brief Array of horizontal filter starting positions for each dst[i] for chroma planes.
    ***********************************************************/
    [CCode (cname="hChrFilterPos")]
    internal int32[] hChrFilterPos;

    /***********************************************************
    @brief Array of vertical filter starting positions for each dst[i] for luma/alpha planes.
    ***********************************************************/
    [CCode (cname="vLumFilterPos")]
    internal int32[] vLumFilterPos;

    /***********************************************************
    @brief Array of vertical filter starting positions for each dst[i] for chroma planes.
    ***********************************************************/
    [CCode (cname="vChrFilterPos")]
    internal int32[] vChrFilterPos;

    /***********************************************************
    @brief Horizontal filter size for luma/alpha pixels.
    ***********************************************************/
    [CCode (cname="hLumFilterSize")]
    internal int hLumFilterSize;

    /***********************************************************
    @brief Horizontal filter size for chroma pixels.
    ***********************************************************/
    [CCode (cname="hChrFilterSize")]
    internal int hChrFilterSize;

    /***********************************************************
    @brief Vertical filter size for luma/alpha pixels.
    ***********************************************************/
    [CCode (cname="vLumFilterSize")]
    internal int vLumFilterSize;

    /***********************************************************
    @brief Vertical filter size for chroma pixels.
    ***********************************************************/
    [CCode (cname="vChrFilterSize")]
    internal int vChrFilterSize;

    //@}

    /***********************************************************
    @brief Runtime-generated MMXEXT horizontal fast bilinear scaler code size for luma/alpha planes.
    ***********************************************************/
    [CCode (cname="lumMmxextFilterCodeSize")]
    internal int lumMmxextFilterCodeSize;

    /***********************************************************
    @brief Runtime-generated MMXEXT horizontal fast bilinear scaler code size for chroma planes.
    ***********************************************************/
    [CCode (cname="chrMmxextFilterCodeSize")]
    internal int chrMmxextFilterCodeSize;

    /***********************************************************
    @brief Runtime-generated MMXEXT horizontal fast bilinear scaler code for luma/alpha planes.
    ***********************************************************/
    [CCode (cname="lumMmxextFilterCode")]
    internal uint8[] lumMmxextFilterCode;

    /***********************************************************
    @brief Runtime-generated MMXEXT horizontal fast bilinear scaler code for chroma planes.
    ***********************************************************/
    [CCode (cname="chrMmxextFilterCode")]
    internal uint8[] chrMmxextFilterCode;

    [CCode (cname="canMMXEXTBeUsed")]
    internal int canMMXEXTBeUsed;

    [CCode (cname="warned_unuseable_bilinear")]
    internal int warned_unuseable_bilinear;

    /***********************************************************
    @brief Last destination vertical line output from last slice.
    ***********************************************************/
    [CCode (cname="dstY")]
    internal int dstY;

    /***********************************************************
    @brief Flags passed by the user to select scaler algorithm,
        optimizations, subsampling, etc...
    ***********************************************************/
    [CCode (cname="flags")]
    internal int flags;

    /***********************************************************
    @brief pointer to the yuv->rgb table start so it can be freed ()
    alignment ensures the offset can be added in a single
    instruction on e.g. ARM
    ***********************************************************/
    [CCode (cname="yuvTable")]
    internal void *yuvTable;

    [CCode (cname="YUVRGB_TABLE_HEADROOM",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const size_t YUVRGB_TABLE_HEADROOM; // 512

    [CCode (cname="YUVRGB_TABLE_LUMA_HEADROOM",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const size_t YUVRGB_TABLE_LUMA_HEADROOM; // 512

    //  internal DECLARE_ALIGNED (16, int, table_gV)[256 + 2 * YUVRGB_TABLE_HEADROOM];

    [CCode (cname="table_rV")]
    internal uint8[] table_rV[256 + 2 * YUVRGB_TABLE_HEADROOM];

    [CCode (cname="table_gU")]
    internal uint8[] table_gU[256 + 2 * YUVRGB_TABLE_HEADROOM];

    [CCode (cname="table_bU")]
    internal uint8[] table_bU[256 + 2 * YUVRGB_TABLE_HEADROOM];

    /***********************************************************
    @note This table can contain both C and SIMD formatted values, the C vales are always at the XY_IDX points
    ***********************************************************/
    //  internal DECLARE_ALIGNED (16, int32, input_rgb2yuv_table)[16+40*4];

    [CCode (cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal enum Index {
        [CCode (cname="RY_IDX")]
        RY, // 0

        [CCode (cname="GY_IDX")]
        GY, // 1

        [CCode (cname="BY_IDX")]
        BY, // 2

        [CCode (cname="RU_IDX")]
        RU, // 3

        [CCode (cname="GU_IDX")]
        GU, // 4

        [CCode (cname="BU_IDX")]
        BU, // 5

        [CCode (cname="RV_IDX")]
        RV, // 6

        [CCode (cname="GV_IDX")]
        GV, // 7

        [CCode (cname="BV_IDX")]
        BV, // 8

        [CCode (cname="RGB2YUV_SHIFT")]
        RGB2YUV_SHIFT; // 15
    }

    [CCode (cname="dither_error")]
    internal int[] dither_error[4];

    /***********************************************************
    Colorspace stuff
    ***********************************************************/

    /***********************************************************
    @brief for sws_getColorspaceDetails
    ***********************************************************/
    [CCode (cname="contrast")]
    internal int contrast;

    /***********************************************************
    @brief for sws_getColorspaceDetails
    ***********************************************************/
    [CCode (cname="brightness")]
    internal int brightness;

    /***********************************************************
    @brief for sws_getColorspaceDetails
    ***********************************************************/
    [CCode (cname="saturation")]
    internal int saturation;

    [CCode (cname="srcColorspaceTable")]
    internal int srcColorspaceTable[4];

    [CCode (cname="dstColorspaceTable")]
    internal int dstColorspaceTable[4];

    internal enum SourceRange {
        MPG_YUV = 0,
        JPG_YUV = 2;
    }

    /***********************************************************
    0 = MPG YUV range, 1 = JPG YUV range (source image).
    ***********************************************************/
    [CCode (cname="srcRange")]
    internal int srcRange;

    /***********************************************************
    0 = MPG YUV range, 1 = JPG YUV range (destination image).
    ***********************************************************/
    [CCode (cname="dstRange")]
    internal int dstRange;

    [CCode (cname="src0Alpha")]
    internal int src0Alpha;

    [CCode (cname="dst0Alpha")]
    internal int dst0Alpha;

    [CCode (cname="srcXYZ")]
    internal int srcXYZ;

    [CCode (cname="dstXYZ")]
    internal int dstXYZ;

    [CCode (cname="src_h_chr_pos")]
    internal int src_h_chr_pos;

    [CCode (cname="dst_h_chr_pos")]
    internal int dst_h_chr_pos;

    [CCode (cname="src_v_chr_pos")]
    internal int src_v_chr_pos;

    [CCode (cname="dst_v_chr_pos")]
    internal int dst_v_chr_pos;

    [CCode (cname="yuv2rgb_y_offset")]
    internal int yuv2rgb_y_offset;

    [CCode (cname="yuv2rgb_y_coeff")]
    internal int yuv2rgb_y_coeff;

    [CCode (cname="yuv2rgb_v2r_coeff")]
    internal int yuv2rgb_v2r_coeff;

    [CCode (cname="yuv2rgb_v2g_coeff")]
    internal int yuv2rgb_v2g_coeff;

    [CCode (cname="yuv2rgb_u2g_coeff")]
    internal int yuv2rgb_u2g_coeff;

    [CCode (cname="yuv2rgb_u2b_coeff")]
    internal int yuv2rgb_u2b_coeff;

    [CCode (cname="RED_DITHER",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string RED_DITHER; // "0*8"

    [CCode (cname="GREEN_DITHER",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string GREEN_DITHER; // "1*8"

    [CCode (cname="BLUE_DITHER",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string BLUE_DITHER; // "2*8"

    [CCode (cname="Y_COEFF",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string Y_COEFF; // "3*8"

    [CCode (cname="VR_COEFF",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string VR_COEFF; // "4*8"

    [CCode (cname="UB_COEFF",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string UB_COEFF; // "5*8"

    [CCode (cname="VG_COEFF",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string VG_COEFF; // "6*8"

    [CCode (cname="UG_COEFF",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string UG_COEFF; // "7*8"

    [CCode (cname="Y_OFFSET",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string Y_OFFSET; // "8*8"

    [CCode (cname="U_OFFSET",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string U_OFFSET; // "9*8"

    [CCode (cname="V_OFFSET",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string V_OFFSET; // "10*8"

    [CCode (cname="LUM_MMX_FILTER_OFFSET",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string LUM_MMX_FILTER_OFFSET; // "11*8"

    [CCode (cname="MAX_FILTER_SIZE",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const size_t MAX_FILTER_SIZE; // SWS_MAX_FILTER_SIZE

    [CCode (cname="CHR_MMX_FILTER_OFFSET",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string CHR_MMX_FILTER_OFFSET; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)

    [CCode (cname="DSTW_OFFSET",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string DSTW_OFFSET; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*2"

    [CCode (cname="ESP_OFFSET",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string ESP_OFFSET; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*2+8"

    [CCode (cname="VROUNDER_OFFSET",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string VROUNDER_OFFSET; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*2+16"

    [CCode (cname="U_TEMP",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string U_TEMP; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*2+24"

    [CCode (cname="V_TEMP",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string V_TEMP; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*2+32"

    [CCode (cname="Y_TEMP",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string Y_TEMP; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*2+40"

    [CCode (cname="ALP_MMX_FILTER_OFFSET",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string ALP_MMX_FILTER_OFFSET; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*2+48"

    [CCode (cname="UV_OFF_PX",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string UV_OFF_PX; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*3+48"

    [CCode (cname="UV_OFF_BYTE",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string UV_OFF_BYTE; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*3+56"

    [CCode (cname="DITHER16",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string DITHER16; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*3+64"

    [CCode (cname="DITHER32",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const string DITHER32; // "11*8+4*4*"AV_STRINGIFY (MAX_FILTER_SIZE)"*3+80"

    /***********************************************************
    value equal to above, used for checking that the struct hasn't been changed by mistake
    ***********************************************************/
    [CCode (cname="DITHER32_INT",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const size_t DITHER32_INT; // (11 * 8 + 4 * 4 * MAX_FILTER_SIZE * 3 + 80)

    //  internal DECLARE_ALIGNED (8, uint64, redDither);

    //  internal DECLARE_ALIGNED (8, uint64, greenDither);

    //  internal DECLARE_ALIGNED (8, uint64, blueDither);

    //  internal DECLARE_ALIGNED (8, uint64, yCoeff);

    //  internal DECLARE_ALIGNED (8, uint64, vrCoeff);

    //  internal DECLARE_ALIGNED (8, uint64, ubCoeff);

    //  internal DECLARE_ALIGNED (8, uint64, vgCoeff);

    //  internal DECLARE_ALIGNED (8, uint64, ugCoeff);

    //  internal DECLARE_ALIGNED (8, uint64, yOffset);

    //  internal DECLARE_ALIGNED (8, uint64, uOffset);

    //  internal DECLARE_ALIGNED (8, uint64, vOffset);

    [CCode (cname="lumMmxFilter")]
    internal int32 lumMmxFilter[4 * MAX_FILTER_SIZE];

    [CCode (cname="chrMmxFilter")]
    internal int32 chrMmxFilter[4 * MAX_FILTER_SIZE];

    /***********************************************************
    @brief Width of destination luma/alpha planes.
    ***********************************************************/
    [CCode (cname="dstW")]
    internal int dstW;

    //  internal DECLARE_ALIGNED (8, uint64, esp);

    //  internal DECLARE_ALIGNED (8, uint64, vRounder);

    //  internal DECLARE_ALIGNED (8, uint64, u_temp);

    //  internal DECLARE_ALIGNED (8, uint64, v_temp);

    //  internal DECLARE_ALIGNED (8, uint64, y_temp);

    [CCode (cname="alpMmxFilter")]
    internal int32 alpMmxFilter[4 * MAX_FILTER_SIZE];

    // alignment of these values is not necessary, but merely here
    // to maintain the same offset across x8632 and x86-64. Once we
    // use proper offset macros in the asm, they can be removed.

    /***********************************************************
    @brief offset (in pixels) between u and v planes
    ***********************************************************/
    //  internal DECLARE_ALIGNED (8, ptrdiff_t, uv_off);

    /***********************************************************
    @brief offset (in bytes) between u and v planes
    ***********************************************************/
    //  internal DECLARE_ALIGNED (8, ptrdiff_t, uv_offx2);

    //  internal DECLARE_ALIGNED (8, uint16, dither16)[8];

    //  internal DECLARE_ALIGNED (8, uint32, dither32)[8];

    [CCode (cname="chrDither8")]
    internal uint8[] chrDither8;

    [CCode (cname="lumDither8")]
    internal uint8[] lumDither8;

#if HAVE_ALTIVEC
    [CCode (cname="CY")]
    internal /*vector signed*/ short CY;

    [CCode (cname="CRV")]
    internal /*vector signed*/ short CRV;

    [CCode (cname="CBU")]
    internal /*vector signed*/ short CBU;

    [CCode (cname="CGU")]
    internal /*vector signed*/ short CGU;

    [CCode (cname="CGV")]
    internal /*vector signed*/ short CGV;

    [CCode (cname="OY")]
    internal /*vector signed*/ short OY;

    [CCode (cname="CSHIFT")]
    internal /*vector*/ ushort CSHIFT;

    [CCode (cname="vYCoeffsBank")]
    internal /*vector signed*/ short[] vYCoeffsBank;

    [CCode (cname="vCCoeffsBank")]
    internal /*vector signed*/ short[] vCCoeffsBank;
#endif

    [CCode (cname="use_mmx_vfilter")]
    internal bool use_mmx_vfilter;

    /***********************************************************
    @brief pre-defined color-spaces gamma
    ***********************************************************/
    [CCode (cname="XYZ_GAMMA",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const float XYZ_GAMMA; // (2.6f)

    /***********************************************************
    @brief pre-defined color-spaces gamma
    ***********************************************************/
    [CCode (cname="RGB_GAMMA",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const float RGB_GAMMA; // (2.2f)

    [CCode (cname="xyzgamma")]
    internal int16[] xyzgamma;

    [CCode (cname="rgbgamma")]
    internal int16[] rgbgamma;

    [CCode (cname="xyzgammainv")]
    internal int16[] xyzgammainv;

    [CCode (cname="rgbgammainv")]
    internal int16[] rgbgammainv;

    [CCode (cname="xyz2rgb_matrix")]
    internal int16[] xyz2rgb_matrix; // [3][4];

    [CCode (cname="rgb2xyz_matrix")]
    internal int16[] rgb2xyz_matrix; // [3][4];

    /***********************************************************
    @brief Write one line of horizontally scaled data to planar output
    without any additional vertical scaling (or point-scaling).

    @param src     scaled source data, 15 bits for 8-10-bit output,
                   19 bits for 16-bit output (in int32)
    @param dest    pointer to the output plane. For >8-bit
                   output, this is in uint16
    @param dstW    width of destination in pixels
    @param dither  ordered dither array of type int16 and size 8
    @param offset  Dither offset
    ***********************************************************/
    [CCode (cname="yuv2planar1_fn",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal delegate void Yuv2Planar1Delegate (
        int16[] src,
        uint8[] dest,
        int dstW,
        uint8[] dither,
        int offset
    );

    /***********************************************************
    @brief function pointer for swscale ()
    ***********************************************************/
    [CCode (cname="yuv2plane1")]
    internal LibSoftwareScale.Yuv2Planar1Delegate yuv2plane1;

    /***********************************************************
    @brief Write one line of horizontally scaled data to planar output
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
    [CCode (cname="yuv2planarX_fn",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal delegate void Yuv2PlanarXDelegate (
        int16[] filter,
        int filterSize,
        int16[][] src,
        uint8[] dest,
        int dstW,
        uint8[] dither,
        int offset
    );

    /***********************************************************
    @brief function pointer for swscale ()
    ***********************************************************/
    [CCode (cname="yuv2planeX")]
    internal LibSoftwareScale.Yuv2PlanarXDelegate yuv2planeX;

    /***********************************************************
    @brief Write one line of horizontally scaled chroma to interleaved output
    with multi-point vertical scaling between input pixels.

    @param software_scale_context             SWS scaling context
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
    [CCode (cname="yuv2interleavedX_fn",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal delegate void Yuv2InterleavedXDelegate (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        int16[] chrFilter,
        int chrFilterSize,
        int16[][] chrUSrc,
        int16[][] chrVSrc,
        uint8[] dest,
        int dstW
    );

    /***********************************************************
    @brief function pointer for swscale ()
    ***********************************************************/
    [CCode (cname="yuv2nv12cX")]
    internal LibSoftwareScale.Yuv2InterleavedXDelegate yuv2nv12cX;

    /***********************************************************
    @brief Write one line of horizontally scaled Y/U/V/A to packed-pixel YUV/RGB
    output without any additional vertical scaling (or point-scaling). Note
    that this function may do chroma scaling, see the "uvalpha" argument.

    @param software_scale_context       SWS scaling context
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
    [CCode (cname="yuv2packed1_fn",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal delegate void Yuv2Packed1Delegate (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
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
    @brief function pointer for swscale ()
    ***********************************************************/
    [CCode (cname="yuv2packed1")]
    internal LibSoftwareScale.Yuv2Packed1Delegate yuv2packed1;

    /***********************************************************
    @brief Write one line of horizontally scaled Y/U/V/A to packed-pixel YUV/RGB
    output by doing bilinear scaling between two input lines.

    @param software_scale_context       SWS scaling context
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
    [CCode (cname="yuv2packed2_fn",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal delegate void Yuv2Packed2Delegate (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
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
    @brief function pointer for swscale ()
    ***********************************************************/
    [CCode (cname="yuv2packed2")]
    internal LibSoftwareScale.Yuv2Packed2Delegate yuv2packed2;

    /***********************************************************
    @brief Write one line of horizontally scaled Y/U/V/A to packed-pixel YUV/RGB
    output by doing multi-point vertical scaling between input pixels.

    @param software_scale_context             SWS scaling context
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
    [CCode (cname="yuv2packedX_fn",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal delegate void Yuv2PackedXDelegate (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
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
    @brief function pointer for swscale ()
    ***********************************************************/
    [CCode (cname="yuv2packedX")]
    internal LibSoftwareScale.Yuv2PackedXDelegate yuv2packedX;

    /***********************************************************
    @brief Write one line of horizontally scaled Y/U/V/A to YUV/RGB
    output by doing multi-point vertical scaling between input pixels.

    @param software_scale_context             SWS scaling context
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
    [CCode (cname="yuv2anyX_fn",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal delegate void Yuv2AnyXDelegate (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
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
    @brief function pointer for swscale ()
    ***********************************************************/
    [CCode (cname="yuv2anyX")]
    internal LibSoftwareScale.Yuv2AnyXDelegate yuv2anyX;

    internal delegate void LumToYV12Delegate (
        uint8[] dst,
        uint8[] src,
        uint8[] src2,
        uint8[] src3,
        int width,
        uint32[] pal
    );

    /***********************************************************
    @brief Unscaled conversion of luma plane to YV12 for horizontal scaler.
    ***********************************************************/
    [CCode (cname="lumToYV12")]
    internal LumToYV12Delegate lumToYV12;

    internal delegate void AlpToYV12Delegate (
        uint8[] dst,
        uint8[] src,
        uint8[] src2,
        uint8[] src3,
        int width,
        uint32[] pal
    );

    /***********************************************************
    @brief Unscaled conversion of alpha plane to YV12 for horizontal scaler.
    ***********************************************************/
    [CCode (cname="alpToYV12")]
    internal AlpToYV12Delegate alpToYV12;

    internal delegate void ChrToYV12Delegate (
        uint8[] dstU,
        uint8[] dstV,
        uint8[] src1,
        uint8[] src2,
        uint8[] src3,
        int width,
        uint32[] pal
    );

    /***********************************************************
    @brief Unscaled conversion of chroma planes to YV12 for horizontal scaler.
    ***********************************************************/
    [CCode (cname="chrToYV12")]
    internal ChrToYV12Delegate chrToYV12;

    /***********************************************************
    Functions to read planar input, such as planar RGB, and convert
    internal internally to Y/UV/A.
    ***********************************************************/
    /***********************************************************
    @{
    ***********************************************************/

    internal delegate void ReadLumPlanarDelegate (
        uint8[] dst,
        uint8[] src[4],
        int width,
        int32[] rgb2yuv
    );

    [CCode (cname="readLumPlanar")]
    internal ReadLumPlanarDelegate readLumPlanar;

    internal delegate void ReadChrPlanarDelegate (
        uint8[] dstU,
        uint8[] dstV,
        uint8[] src[4],
        int width,
        int32[] rgb2yuv
    );

    [CCode (cname="readChrPlanar")]
    internal ReadChrPlanarDelegate readChrPlanar;

    internal delegate void ReadAlpPlanarDelegate (
        uint8[] dst,
        uint8[] src[4],
        int width,
        int32[] rgb2yuv
    );

    [CCode (cname="readAlpPlanar")]
    internal ReadAlpPlanarDelegate readAlpPlanar;

    /***********************************************************
    @}
    ***********************************************************/

    /***********************************************************
    Scale one horizontal line of input data using a bilinear filter
    to produce one line of output data. Compared to LibSoftwareScale.SoftwareScaleContext->hScale (),
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
    in LibSoftwareScale.SoftwareScaleContext->flags.
    ***********************************************************/
    /***********************************************************
    @{
    ***********************************************************/

    internal delegate void HyScaleFastDelegate (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        int16[] dst,
        int dstWidth,
        uint8[] src,
        int srcW,
        int xInc
    );

    [CCode (cname="hyscale_fast")]
    internal HyScaleFastDelegate hyscale_fast;

    internal delegate void HcScaleFastDelegate (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        int16[] dst1,
        int16[] dst2,
        int dstWidth,
        uint8[] src1,
        uint8[] src2,
        int srcW,
        int xInc
    );

    [CCode (cname="hcscale_fast")]
    internal HcScaleFastDelegate hcscale_fast;

    /***********************************************************
    @}
    ***********************************************************/

    /***********************************************************
    Scale one horizontal line of input data using a filter over the input
    lines, to produce one (differently sized) line of output data.

    @param dst        pointer to destination buffer for horizontally scaled
                      data. If the number of bits per component of one
                      destination pixel (LibSoftwareScale.SoftwareScaleContext->dstBpc) is <= 10, data
                      will be 15 bpc in 16 bits (int16) width. Else (i.e.
                      LibSoftwareScale.SoftwareScaleContext->dstBpc == 16), data will be 19bpc in
                      32 bits (int32) width.
    @param dstW       width of destination image
    @param src        pointer to source data to be scaled. If the number of
                      bits per component of a source pixel (LibSoftwareScale.SoftwareScaleContext->srcBpc)
                      is 8, this is 8bpc in 8 bits (uint8) width. Else
                      (i.e. LibSoftwareScale.SoftwareScaleContext->dstBpc > 8), this is native depth
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

    internal delegate void HyScaleDelegate (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        int16[] dst,
        int dstW,
        uint8[] src,
        int16[] filter,
        int32[] filterPos,
        int filterSize
    );

    [CCode (cname="hyScale")]
    internal HyScaleDelegate hyScale;

    internal delegate void HcScaleDelegate (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        int16[] dst,
        int dstW,
        uint8[] src,
        int16[] filter,
        int32[] filterPos,
        int filterSize
    );

    [CCode (cname="hcScale")]
    internal HcScaleDelegate hcScale;

    /***********************************************************
    @}
    ***********************************************************/

    internal delegate void LumConvertRangeDelegate (
        int16[] dst,
        int width
    );

    /***********************************************************
    Color range conversion function for luma plane if needed.
    ***********************************************************/
    [CCode (cname="lumConvertRange")]
    internal LumConvertRangeDelegate lumConvertRange;

    internal delegate void ChrConvertRangeDelegate (
        int16[] dst1,
        int16[] dst2,
        int width
    );

    /***********************************************************
    Color range conversion function for chroma planes if needed.
    ***********************************************************/
    [CCode (cname="chrConvertRange")]
    internal ChrConvertRangeDelegate chrConvertRange;

    /***********************************************************
    Set if there are chroma planes to be converted.
    ***********************************************************/
    [CCode (cname="needs_hcscale")]
    internal int needs_hcscale;

    [CCode (cname="dither")]
    internal LibSoftwareScale.SoftwareScaleDitherType dither;

    [CCode (cname="alphablend")]
    internal LibSoftwareScale.SoftwareScaleAlphaBlendType alphablend;

    /***********************************************************
    @defgroup libsws libswscale
    Color conversion and scaling library.

    @{

    Return the LibSoftwareScale.Version.INT constant.
    ***********************************************************/
    [CCode (cname="swscale_version",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public static uint swscale_version ();

    /***********************************************************
    Return the libswscale build-time configuration.
    ***********************************************************/
    [CCode (cname="swscale_configuration",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public static string swscale_configuration ();

    /***********************************************************
    Return the libswscale license.
    ***********************************************************/
    [CCode (cname="swscale_license",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public static string swscale_license ();


    [CCode (cname="ff_yuv2rgb_get_func_ptr",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal LibSoftwareScale.SoftwareScaleDelegate ff_yuv2rgb_get_func_ptr (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    [CCode (cname="ff_yuv2rgb_c_init_tables",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal int ff_yuv2rgb_c_init_tables (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        int inv_table[4],
        int fullRange,
        int brightness,
        int contrast,
        int saturation
    );

    [CCode (cname="ff_yuv2rgb_init_tables_ppc",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_yuv2rgb_init_tables_ppc (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        int inv_table[4],
        int brightness,
        int contrast,
        int saturation
    );

    [CCode (cname="ff_updateMMXDitherTables",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_updateMMXDitherTables (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        int dstY,
        int lumBufIndex,
        int chrBufIndex,
        int lastInLumBuf,
        int lastInChrBuf
    );

    [CCode (cname="ff_sws_init_range_convert",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal /*av_cold*/ void ff_sws_init_range_convert (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    [CCode (cname="ff_yuv2rgb_init_x86",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal LibSoftwareScale.SoftwareScaleDelegate ff_yuv2rgb_init_x86 (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    [CCode (cname="ff_yuv2rgb_init_ppc",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal LibSoftwareScale.SoftwareScaleDelegate ff_yuv2rgb_init_ppc (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    [CCode (cname="is16BPS",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool is16BPS (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      return pixel_format_descriptor->comp[0].depth == 16;
    //  }

    [CCode (cname="isNBPS",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isNBPS (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      return pixel_format_descriptor->comp[0].depth >= 9 && pixel_format_descriptor->comp[0].depth <= 14;
    //  }

    [CCode (cname="isBE",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isBE (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      return pixel_format_descriptor->flags & PixelFormatFlags.BIG_ENDIAN;
    //  }

    [CCode (cname="isYUV",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isYUV (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      return !(pixel_format_descriptor->flags & PixelFormatFlags.RGB) && pixel_format_descriptor->nb_components >= 2;
    //  }

    [CCode (cname="isPlanarYUV",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isPlanarYUV (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      return ((pixel_format_descriptor->flags & PixelFormatFlags.PLANAR) && isYUV (pix_fmt));
    //  }

    /***********************************************************
    Identity semi-planar YUV formats. Specifically, those are YUV formats
    where the second and third components (U & V) are on the same plane.
    ***********************************************************/
    [CCode (cname="isSemiPlanarYUV",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isSemiPlanarYUV (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      return (isPlanarYUV (pix_fmt) && pixel_format_descriptor->comp[1].plane == pixel_format_descriptor->comp[2].plane);
    //  }

    [CCode (cname="isRGB",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isRGB (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      return (pixel_format_descriptor->flags & PixelFormatFlags.RGB);
    //  }

    [CCode (cname="isGray",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isGray (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      return !(pixel_format_descriptor->flags & PixelFormatFlags.PALETTE) &&
    //             !(pixel_format_descriptor->flags & PixelFormatFlags.HARDWARE_ACCELERATED) &&
    //             pixel_format_descriptor->nb_components <= 2 &&
    //             pix_fmt != LibAVUtil.PixelFormat.MONOBLACK &&
    //             pix_fmt != LibAVUtil.PixelFormat.MONOWHITE;
    //  }

    [CCode (cname="isRGBinInt",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isRGBinInt (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      return pix_fmt == LibAVUtil.PixelFormat.RGB48BE     ||
    //             pix_fmt == LibAVUtil.PixelFormat.RGB48LE     ||
    //             pix_fmt == LibAVUtil.PixelFormat.RGB32       ||
    //             pix_fmt == LibAVUtil.PixelFormat.RGB32_1     ||
    //             pix_fmt == LibAVUtil.PixelFormat.RGB24       ||
    //             pix_fmt == LibAVUtil.PixelFormat.RGB565BE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.RGB565LE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.RGB555BE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.RGB555LE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.RGB444BE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.RGB444LE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.RGB8        ||
    //             pix_fmt == LibAVUtil.PixelFormat.RGB4        ||
    //             pix_fmt == LibAVUtil.PixelFormat.RGB4_BYTE   ||
    //             pix_fmt == LibAVUtil.PixelFormat.RGBA64BE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.RGBA64LE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.MONOBLACK   ||
    //             pix_fmt == LibAVUtil.PixelFormat.MONOWHITE;
    //  }

    [CCode (cname="isBGRinInt",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isBGRinInt (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      return pix_fmt == LibAVUtil.PixelFormat.BGR48BE     ||
    //             pix_fmt == LibAVUtil.PixelFormat.BGR48LE     ||
    //             pix_fmt == LibAVUtil.PixelFormat.BGR32       ||
    //             pix_fmt == LibAVUtil.PixelFormat.BGR32_1     ||
    //             pix_fmt == LibAVUtil.PixelFormat.BGR24       ||
    //             pix_fmt == LibAVUtil.PixelFormat.BGR565BE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.BGR565LE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.BGR555BE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.BGR555LE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.BGR444BE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.BGR444LE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.BGR8        ||
    //             pix_fmt == LibAVUtil.PixelFormat.BGR4        ||
    //             pix_fmt == LibAVUtil.PixelFormat.BGR4_BYTE   ||
    //             pix_fmt == LibAVUtil.PixelFormat.BGRA64BE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.BGRA64LE    ||
    //             pix_fmt == LibAVUtil.PixelFormat.MONOBLACK   ||
    //             pix_fmt == LibAVUtil.PixelFormat.MONOWHITE;
    //  }

    [CCode (cname="isBayer",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isBayer (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      return !!(pixel_format_descriptor->flags & PixelFormatFlags.BAYER);
    //  }

    [CCode (cname="isAnyRGB",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isAnyRGB (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      return (pixel_format_descriptor->flags & PixelFormatFlags.RGB) ||
    //              pix_fmt == LibAVUtil.PixelFormat.MONOBLACK || pix_fmt == LibAVUtil.PixelFormat.MONOWHITE;
    //  }

    [CCode (cname="isFloat",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isFloat (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      return pixel_format_descriptor->flags & PixelFormatFlags.FLOAT;
    //  }

    [CCode (cname="isALPHA",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isALPHA (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      if (pix_fmt == LibAVUtil.PixelFormat.PAL8)
    //          return 1;

    //      return pixel_format_descriptor->flags & PixelFormatFlags.ALPHA;
    //  }

    [CCode (cname="isPacked",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isPacked (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      return (pixel_format_descriptor->nb_components >= 2 && !(pixel_format_descriptor->flags & PixelFormatFlags.PLANAR)) ||
    //              pix_fmt == LibAVUtil.PixelFormat.PAL8 ||
    //              pix_fmt == LibAVUtil.PixelFormat.MONOBLACK || pix_fmt == LibAVUtil.PixelFormat.MONOWHITE;
    //  }

    [CCode (cname="isPlanar",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isPlanar (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      return (pixel_format_descriptor->nb_components >= 2 && (pixel_format_descriptor->flags & PixelFormatFlags.PLANAR));
    //  }

    [CCode (cname="isPackedRGB",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isPackedRGB (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      return ((pixel_format_descriptor->flags & (PixelFormatFlags.PLANAR | PixelFormatFlags.RGB)) == PixelFormatFlags.RGB);
    //  }

    [CCode (cname="isPlanarRGB",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool isPlanarRGB (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      const AVPixFmtDescriptor? pixel_format_descriptor = av_pix_fmt_desc_get (pix_fmt);

    //      av_assert0 (pixel_format_descriptor);

    //      return ((pixel_format_descriptor->flags & (PixelFormatFlags.PLANAR | PixelFormatFlags.RGB)) ==
    //              (PixelFormatFlags.PLANAR | PixelFormatFlags.RGB));
    //  }

    [CCode (cname="usePal",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    //  av_always_inline
    internal static bool usePal (
        LibAVUtil.PixelFormat pix_fmt
    );
    //  {
    //      switch (pix_fmt) {
    //      case LibAVUtil.PixelFormat.PAL8:
    //      case LibAVUtil.PixelFormat.BGR4_BYTE:
    //      case LibAVUtil.PixelFormat.BGR8:
    //      case LibAVUtil.PixelFormat.GRAY8:
    //      case LibAVUtil.PixelFormat.RGB4_BYTE:
    //      case LibAVUtil.PixelFormat.RGB8:
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

    //  extern const LibAVUtil.Log.Class ff_sws_context_class;

    /***********************************************************
    @brief Set software_scale_context.swscale to an unscaled converter if one exists for the specific
    source and destination formats, bit depths, flags, etc.
    ***********************************************************/
    [CCode (cname="ff_get_unscaled_swscale",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_get_unscaled_swscale (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    [CCode (cname="ff_get_unscaled_swscale_ppc",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_get_unscaled_swscale_ppc (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    [CCode (cname="ff_get_unscaled_swscale_arm",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_get_unscaled_swscale_arm (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    [CCode (cname="ff_get_unscaled_swscale_aarch64",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_get_unscaled_swscale_aarch64 (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    /***********************************************************
    @brief Return function pointer to fastest main scaler path function depending
    on architecture and available optimizations.
    ***********************************************************/
    [CCode (cname="ff_getSwsFunc",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal LibSoftwareScale.SoftwareScaleDelegate ff_getSwsFunc (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    [CCode (cname="ff_sws_init_input_funcs",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_sws_init_input_funcs (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    [CCode (cname="ff_sws_init_output_funcs",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_sws_init_output_funcs (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        LibSoftwareScale.Yuv2Planar1Delegate? yuv2plane1,
        LibSoftwareScale.Yuv2PlanarXDelegate? yuv2planeX,
        LibSoftwareScale.Yuv2InterleavedXDelegate? yuv2nv12cX,
        LibSoftwareScale.Yuv2Packed1Delegate? yuv2packed1,
        LibSoftwareScale.Yuv2Packed2Delegate? yuv2packed2,
        LibSoftwareScale.Yuv2PackedXDelegate? yuv2packedX,
        LibSoftwareScale.Yuv2AnyXDelegate? yuv2anyX
    );

    [CCode (cname="ff_sws_init_swscale_ppc",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_sws_init_swscale_ppc (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    [CCode (cname="ff_sws_init_swscale_vsx",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_sws_init_swscale_vsx (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    [CCode (cname="ff_sws_init_swscale_x86",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_sws_init_swscale_x86 (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    [CCode (cname="ff_sws_init_swscale_aarch64",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_sws_init_swscale_aarch64 (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    [CCode (cname="ff_sws_init_swscale_arm",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_sws_init_swscale_arm (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    [CCode (cname="ff_hyscale_fast_c",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_hyscale_fast_c (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        int16[] dst,
        int dstWidth,
        uint8[] src,
        int srcW,
        int xInc
    );

    [CCode (cname="ff_hcscale_fast_c",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_hcscale_fast_c (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        int16[] dst1,
        int16[] dst2,
        int dstWidth,
        uint8[] src1,
        uint8[] src2,
        int srcW,
        int xInc
    );

    [CCode (cname="ff_init_hscaler_mmxext",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal int ff_init_hscaler_mmxext (
        int dstW,
        int xInc,
        uint8[] filterCode,
        int16[] filter,
        int32[] filterPos,
        int numSplits
    );

    [CCode (cname="ff_hyscale_fast_mmxext",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_hyscale_fast_mmxext (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        int16[] dst,
        int dstWidth,
        uint8[] src,
        int srcW,
        int xInc
    );

    [CCode (cname="ff_hcscale_fast_mmxext",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_hcscale_fast_mmxext (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        int16[] dst1,
        int16[] dst2,
        int dstWidth,
        uint8[] src1,
        uint8[] src2,
        int srcW,
        int xInc
    );

    /***********************************************************
    @brief Allocate and return an LibSoftwareScale.SoftwareScaleContext.

    This is like sws_getContext () but does not perform the init step, allowing
    the user to set additional AVOptions.

    @see sws_getContext ()
    ***********************************************************/
    [CCode (cname="sws_alloc_set_opts",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal LibSoftwareScale.SoftwareScaleContext? sws_alloc_set_opts (
        int srcW,
        int srcH,
        LibAVUtil.PixelFormat srcFormat,
        int dstW,
        int dstH,
        LibAVUtil.PixelFormat dstFormat,
        int flags,
        double[] param
    );

    [CCode (cname="ff_sws_alphablendaway",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal int ff_sws_alphablendaway (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        uint8[] src[],
        int srcStride[],
        int srcSliceY,
        int srcSliceH,
        uint8[] dst[],
        int dstStride[]
    );

    /***********************************************************
    @brief Initialize scaler filter descriptor chain
    ***********************************************************/
    [CCode (cname="ff_init_filters",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal int ff_init_filters (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    /***********************************************************
    @brief Free all filter data
    ***********************************************************/
    [CCode (cname="ff_free_filters",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal int ff_free_filters (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context
    );

    /***********************************************************
    @brief function for applying ring buffer logic into slice sws_slice

    It checks if the slice can hold more @lum lines, if yes
    do nothing otherwise remove @lum least used lines.
    It applies the same procedure for @chr lines.
    ***********************************************************/
    [CCode (cname="ff_rotate_slice",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal int ff_rotate_slice (
        LibSoftwareScale.SoftwareScaleSlice? sws_slice,
        int lum,
        int chr
    );

    /***********************************************************
    @brief initializes vertical scaling descriptors
    ***********************************************************/
    [CCode (cname="ff_init_vscale",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal int ff_init_vscale (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        LibSoftwareScale.SoftwareScaleFilterDescriptor? software_scale_filter_descriptor,
        LibSoftwareScale.SoftwareScaleSlice? src,
        LibSoftwareScale.SoftwareScaleSlice? dst
    );

    /***********************************************************
    @brief setup vertical scaler functions
    ***********************************************************/
    [CCode (cname="ff_init_vscale_pfn",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal void ff_init_vscale_pfn (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        LibSoftwareScale.Yuv2Planar1Delegate yuv2plane1,
        LibSoftwareScale.Yuv2PlanarXDelegate yuv2planeX,
        LibSoftwareScale.Yuv2InterleavedXDelegate yuv2nv12cX,
        LibSoftwareScale.Yuv2Packed1Delegate yuv2packed1,
        LibSoftwareScale.Yuv2Packed2Delegate yuv2packed2,
        LibSoftwareScale.Yuv2PackedXDelegate yuv2packedX,
        LibSoftwareScale.Yuv2AnyXDelegate yuv2anyX,
        int use_mmx
    );

    [CCode (cname="SWS_MAX_REDUCE_CUTOFF",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public const float SWS_MAX_REDUCE_CUTOFF; // 0.002

    /***********************************************************
    @brief Return a positive value if pix_fmt is a supported input
    format, 0 otherwise.
    ***********************************************************/
    [CCode (cname="sws_isSupportedInput",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public int sws_isSupportedInput (
        LibAVUtil.PixelFormat pix_fmt
    );

    /***********************************************************
    @brief Return a positive value if pix_fmt is a supported output
    format, 0 otherwise.
    ***********************************************************/
    [CCode (cname="sws_isSupportedOutput",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public int sws_isSupportedOutput (
        LibAVUtil.PixelFormat pix_fmt
    );

    /***********************************************************
    @param[in]  pix_fmt the pixel format
    @return a positive value if an endianness conversion for
        pix_fmt is supported, 0 otherwise.
    ***********************************************************/
    [CCode (cname="sws_isSupportedEndiannessConversion",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public int sws_isSupportedEndiannessConversion (
        LibAVUtil.PixelFormat pix_fmt
    );

    /***********************************************************
    @brief Allocate an empty LibSoftwareScale.SoftwareScaleContext.

    This must be filled and passed to sws_init_context ().
    For filling see AVOptions, options.c and sws_setColorspaceDetails ().
    ***********************************************************/
    [CCode (cname="sws_alloc_context",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public LibSoftwareScale.SoftwareScaleContext? sws_alloc_context ();

    /***********************************************************
    @brief Initialize the swscaler context sws_context.

    @return zero or positive value on success, a negative value on
    error
    ***********************************************************/
    [CCode (cname="sws_init_context",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    //  av_warn_unused_result
    public int sws_init_context (
        LibSoftwareScale.SoftwareScaleContext? sws_context,
        LibSoftwareScale.SoftwareScaleFilter? srcFilter,
        LibSoftwareScale.SoftwareScaleFilter? dstFilter
    );

    /***********************************************************
    @brief Free the swscaler context swsContext.

    If swsContext is NULL, then does nothing.
    ***********************************************************/
    [CCode (cname="sws_freeContext",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public void sws_freeContext (
        LibSoftwareScale.SoftwareScaleContext? swsContext
    );

    /***********************************************************
    @brief Allocate and return an LibSoftwareScale.SoftwareScaleContext. You need it to perform
    scaling/conversion operations using sws_scale ().

    @param srcW the width of the source image
    @param srcH the height of the source image
    @param srcFormat the source image format
    @param dstW the width of the destination image
    @param dstH the height of the destination image
    @param dstFormat the destination image format
    @param flags specify which algorithm and options to use for rescaling
    @param param extra parameters to tune the used scaler
                 For LibSoftwareScale.SoftwareScaleFlags.BICUBIC param[0] and [1] tune the shape of the basis
                 function, param[0] tunes f (1) and param[1] f´(1)
                 For LibSoftwareScale.SoftwareScaleFlags.GAUSSIAN param[0] tunes the exponent and thus cutoff
                 frequency
                 For LibSoftwareScale.SoftwareScaleFlags.LANCZOS param[0] tunes the width of the window function
    @return a pointer to an allocated context, or NULL in case of error
    @note this function is to be removed after a saner alternative is
          written
    ***********************************************************/
    [CCode (cname="sws_getContext",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public LibSoftwareScale.SoftwareScaleContext sws_getContext (
        int srcW,
        int srcH,
        LibAVUtil.PixelFormat srcFormat,
        int dstW,
        int dstH,
        LibAVUtil.PixelFormat dstFormat,
        LibSoftwareScale.SoftwareScaleFlags flags,
        LibSoftwareScale.SoftwareScaleFilter? srcFilter,
        LibSoftwareScale.SoftwareScaleFilter? dstFilter,
        double[] param
    );

    /***********************************************************
    @brief Scale the image slice in srcSlice and put the resulting scaled
    slice in the image in dst. A slice is a sequence of consecutive
    rows in an image.

    Slices have to be provided in sequential order, either in
    top-bottom or bottom-top order. If slices are provided in
    non-sequential order the behavior of the function is undefined.

    @param software_scale_context         the scaling context previously created with
                     sws_getContext ()
    @param srcSlice  the array containing the pointers to the planes of
                     the source slice
    @param srcStride the array containing the strides for each plane of
                     the source image
    @param srcSliceY the position in the source image of the slice to
                     process, that is the number (counted starting from
                     zero) in the image of the first row of the slice
    @param srcSliceH the height of the source slice, that is the number
                     of rows in the slice
    @param dst       the array containing the pointers to the planes of
                     the destination image
    @param dstStride the array containing the strides for each plane of
                     the destination image
    @return          the height of the output slice
    ***********************************************************/
    [CCode (cname="sws_scale",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public int sws_scale (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        out uint8[] srcSlice,
        int srcStride[],
        int srcSliceY,
        int srcSliceH,
        out uint8[] dst,
        int dstStride[]
    );

    /***********************************************************
    @param dstRange flag indicating the while-black range of the output (1=jpeg / 0=mpeg)
    @param srcRange flag indicating the while-black range of the input (1=jpeg / 0=mpeg)
    @param table the yuv2rgb coefficients describing the output yuv space, normally ff_yuv2rgb_coeffs[x]
    @param inv_table the yuv2rgb coefficients describing the input yuv space, normally ff_yuv2rgb_coeffs[x]
    @param brightness 16.16 fixed point brightness correction
    @param contrast 16.16 fixed point contrast correction
    @param saturation 16.16 fixed point saturation correction
    @return -1 if not supported
    ***********************************************************/
    [CCode (cname="sws_setColorspaceDetails",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public int sws_setColorspaceDetails (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        int inv_table[4],
        int srcRange,
        int table[4],
        int dstRange,
        int brightness,
        int contrast,
        int saturation
    );

    /***********************************************************
    @return -1 if not supported
    ***********************************************************/
    [CCode (cname="sws_getColorspaceDetails",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public int sws_getColorspaceDetails (
        LibSoftwareScale.SoftwareScaleContext? software_scale_context,
        out int[] inv_table,
        out int srcRange,
        out int[] table,
        out int dstRange,
        out int brightness,
        out int contrast,
        out int saturation
    );

    /***********************************************************
    Get the LibAVUtil.Log.Class for swsContext. It can be used in combination with
    OptionSearchFlags.FAKE_OBJECT_PARAMETER for examining options.

    @see av_opt_find ().
    ***********************************************************/
    [CCode (cname="sws_get_class",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public static LibAVUtil.Log.Class? sws_get_class ();

}
// FIXME check init (where 0)

} // namespace LibSoftwareScale
