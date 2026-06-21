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
@file
@ingroup libsws
external API header
***********************************************************/

/***********************************************************
@defgroup libsws libswscale
Color conversion and scaling library.

@{

Return the LIBSWSCALE_VERSION_INT constant.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public uint swscale_version ();

/***********************************************************
Return the libswscale build-time configuration.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public string swscale_configuration ();

/***********************************************************
Return the libswscale license.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public string swscale_license ();

/***********************************************************
values for the flags, the stuff on the command line is different
***********************************************************/
[Flags]
public enum FooBar {
    [CCode (cname="")]
    SWS_FAST_BILINEAR, // 1

    [CCode (cname="")]
    SWS_BILINEAR, // 2

    [CCode (cname="")]
    SWS_BICUBIC, // 4

    [CCode (cname="")]
    SWS_X, // 8

    [CCode (cname="")]
    SWS_POINT, // 0x10

    [CCode (cname="")]
    SWS_AREA, // 0x20

    [CCode (cname="")]
    SWS_BICUBLIN, // 0x40

    [CCode (cname="")]
    SWS_GAUSS, // 0x80

    [CCode (cname="")]
    SWS_SINC, // 0x100

    [CCode (cname="")]
    SWS_LANCZOS 0x200

    [CCode (cname="")]
    SWS_SPLINE, // 0x400

    [CCode (cname="")]
    SWS_SRC_V_CHR_DROP_MASK, // 0x30000

    [CCode (cname="")]
    SWS_SRC_V_CHR_DROP_SHIFT, // 16

    [CCode (cname="")]
    SWS_PARAM_DEFAULT, // 123456

    [CCode (cname="")]
    SWS_PRINT_INFO, // 0x1000

    /***********************************************************
    internal chrominance subsampling info

    this flag is not completely implemented
    ***********************************************************/
    [CCode (cname="")]
    SWS_FULL_CHR_H_INT, // 0x2000

    /***********************************************************
    input subsampling info

    this flag is not completely implemented
    ***********************************************************/
    [CCode (cname="")]
    SWS_FULL_CHR_H_INP, // 0x4000

    /***********************************************************
    this flag is not completely implemented
    ***********************************************************/
    [CCode (cname="")]
    SWS_DIRECT_BGR, // 0x8000

    [CCode (cname="")]
    SWS_ACCURATE_RND, // 0x40000

    [CCode (cname="")]
    SWS_BITEXACT, // 0x80000

    [CCode (cname="")]
    SWS_ERROR_DIFFUSION; // 0x800000
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public const float SWS_MAX_REDUCE_CUTOFF; // 0.002

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public enum FooBar {
    [CCode (cname="")]
    SWS_CS_ITU709, // 1

    [CCode (cname="")]
    SWS_CS_FCC, // 4

    [CCode (cname="")]
    SWS_CS_ITU601, // 5

    [CCode (cname="")]
    SWS_CS_ITU624, // 5

    [CCode (cname="")]
    SWS_CS_SMPTE170M, // 5

    [CCode (cname="")]
    SWS_CS_SMPTE240M, // 7

    [CCode (cname="")]
    SWS_CS_DEFAULT, // 5

    [CCode (cname="")]
    SWS_CS_BT2020; // 9
}

/***********************************************************
Return a pointer to yuv<->rgb coefficients for the given colorspace
suitable for sws_setColorspaceDetails ().

@param colorspace One of the SWS_CS_* macros. If invalid,
SWS_CS_DEFAULT is used.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public int[] sws_getCoefficients (
    int colorspace
);

/***********************************************************
when used for filters they must have an odd number of elements
coeffs cannot be shared between vectors
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
[Compact]
public class SwsVector {
    /***********************************************************
    pointer to the list of coefficients
    ***********************************************************/
    [CCode (cname="")]
    public double[] coeff;

    /***********************************************************
    number of coefficients in the vector
    ***********************************************************/
    [CCode (cname="")]
    public int length;
}

/***********************************************************
vectors can be shared
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
[Compact]
public class SwsFilter {
    [CCode (cname="")]
    public SwsVector? lumH;

    [CCode (cname="")]
    public SwsVector? lumV;

    [CCode (cname="")]
    public SwsVector? chrH;

    [CCode (cname="")]
    public SwsVector? chrV;
}

/***********************************************************
Return a positive value if pix_fmt is a supported input
format, 0 otherwise.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public int sws_isSupportedInput (
    AVPixelFormat pix_fmt
);

/***********************************************************
Return a positive value if pix_fmt is a supported output
format, 0 otherwise.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public int sws_isSupportedOutput (
    AVPixelFormat pix_fmt
);

/***********************************************************
@param[in]  pix_fmt the pixel format
@return a positive value if an endianness conversion for
    pix_fmt is supported, 0 otherwise.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public int sws_isSupportedEndiannessConversion (
    AVPixelFormat pix_fmt
);

/***********************************************************
Allocate an empty SwsContext. This must be filled and passed to
sws_init_context (). For filling see AVOptions, options.c and
sws_setColorspaceDetails ().
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public SwsContext? sws_alloc_context ();

/***********************************************************
Initialize the swscaler context sws_context.

@return zero or positive value on success, a negative value on
error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
//  av_warn_unused_result
public int sws_init_context (
    SwsContext? sws_context,
    SwsFilter? srcFilter,
    SwsFilter? dstFilter
);

/***********************************************************
Free the swscaler context swsContext.
If swsContext is NULL, then does nothing.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public void sws_freeContext (
    SwsContext? swsContext
);

/***********************************************************
Allocate and return an SwsContext. You need it to perform
scaling/conversion operations using sws_scale ().

@param srcW the width of the source image
@param srcH the height of the source image
@param srcFormat the source image format
@param dstW the width of the destination image
@param dstH the height of the destination image
@param dstFormat the destination image format
@param flags specify which algorithm and options to use for rescaling
@param param extra parameters to tune the used scaler
             For SWS_BICUBIC param[0] and [1] tune the shape of the basis
             function, param[0] tunes f (1) and param[1] f´(1)
             For SWS_GAUSS param[0] tunes the exponent and thus cutoff
             frequency
             For SWS_LANCZOS param[0] tunes the width of the window function
@return a pointer to an allocated context, or NULL in case of error
@note this function is to be removed after a saner alternative is
      written
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public SwsContext sws_getContext (
    int srcW,
    int srcH,
    AVPixelFormat srcFormat,
    int dstW,
    int dstH,
    AVPixelFormat dstFormat,
    int flags,
    SwsFilter? srcFilter,
    SwsFilter? dstFilter,
    double[] param
);

/***********************************************************
Scale the image slice in srcSlice and put the resulting scaled
slice in the image in dst. A slice is a sequence of consecutive
rows in an image.

Slices have to be provided in sequential order, either in
top-bottom or bottom-top order. If slices are provided in
non-sequential order the behavior of the function is undefined.

@param c         the scaling context previously created with
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
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public int sws_scale (
    SwsContext? c,
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
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public int sws_setColorspaceDetails (
    SwsContext? c,
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
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public int sws_getColorspaceDetails (
    SwsContext? c,
    out int[] inv_table,
    out int srcRange,
    out int[] table,
    out int dstRange,
    out int brightness,
    out int contrast,
    out int saturation
);

/***********************************************************
Allocate and return an uninitialized vector with length coefficients.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public SwsVector? sws_allocVec (
    int length
);

/***********************************************************
Return a normalized Gaussian curve used to filter stuff
quality = 3 is high quality, lower is lower quality.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public SwsVector? sws_getGaussianVec (
    double variance,
    double quality
);

/***********************************************************
Scale all the coefficients of a by the scalar value.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public void sws_scaleVec (
    SwsVector? a,
    double scalar
);

/***********************************************************
Scale all the coefficients of a so that their sum equals height.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public void sws_normalizeVec (
    SwsVector? a,
    double height
);

#if FF_API_SWS_VECTOR

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
//  attribute_deprecated
public SwsVector? sws_getConstVec (
    double c,
    int length
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
//  attribute_deprecated
public SwsVector? sws_getIdentityVec ();

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
//  attribute_deprecated
public void sws_convVec (
    SwsVector? a,
    SwsVector? b
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
//  attribute_deprecated
public void sws_addVec (
    SwsVector? a,
    SwsVector? b
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
//  attribute_deprecated
public void sws_subVec (
    SwsVector? a,
    SwsVector? b
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
//  attribute_deprecated
public void sws_shiftVec (
    SwsVector? a,
    int shift
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
//  attribute_deprecated
public SwsVector? sws_cloneVec (
    SwsVector? a
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
//  attribute_deprecated
public void sws_printVec2 (
    SwsVector? a,
    AVClass? log_ctx,
    int log_level
);

#endif

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public void sws_freeVec (
    SwsVector? a
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public SwsFilter? sws_getDefaultFilter (
    float lumaGBlur,
    float chromaGBlur,
    float lumaSharpen,
    float chromaSharpen,
    float chromaHShift,
    float chromaVShift,
    int verbose
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public void sws_freeFilter (
    SwsFilter? filter
);

/***********************************************************
Check if context can be reused, otherwise reallocate a new one.

If context is NULL, just calls sws_getContext () to get a new
context. Otherwise, checks if the parameters are the ones already
saved in context. If that is the case, returns the current
context. Otherwise, frees context and gets a new context with
the new parameters.

Be warned that srcFilter and dstFilter are not checked, they
are assumed to remain the same.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
[Compact]
public SwsContext? sws_getCachedContext (
    SwsContext? context,
    int srcW,
    int srcH,
    AVPixelFormat srcFormat,
    int dstW,
    int dstH,
    AVPixelFormat dstFormat,
    int flags,
    SwsFilter? srcFilter,
    SwsFilter? dstFilter,
    double[] param
);

/***********************************************************
Convert an 8-bit paletted frame into a frame with a color depth of 32 bits.

The output frame will have the same packed format as the palette.

@param src        source frame buffer
@param dst        destination frame buffer
@param num_pixels number of pixels to convert
@param palette    array with [256] entries, which must match color arrangement (RGB or BGR) of src
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public void sws_convertPalette8ToPacked32 (
    uint8[] src,
    uint8[] dst,
    int num_pixels,
    uint8[] palette
);

/***********************************************************
Convert an 8-bit paletted frame into a frame with a color depth of 24 bits.

With the palette format "ABCD", the destination frame ends up with the format "ABC".

@param src        source frame buffer
@param dst        destination frame buffer
@param num_pixels number of pixels to convert
@param palette    array with [256] entries, which must match color arrangement (RGB or BGR) of src
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public void sws_convertPalette8ToPacked24 (
    uint8[] src,
    uint8[] dst,
    int num_pixels,
    uint8[] palette
);

/***********************************************************
Get the AVClass for swsContext. It can be used in combination with
AV_OPT_SEARCH_FAKE_OBJ for examining options.

@see av_opt_find ().
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public AVClass? sws_get_class ();

/***********************************************************
@}
***********************************************************/
