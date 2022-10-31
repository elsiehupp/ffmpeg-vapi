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
common internal and external API header
***********************************************************/

//  #if defined (__cplusplus) && !defined (__STDC_CONSTANT_MACROS) && !defined (UINT64_C)
//  #error missing -D__STDC_CONSTANT_MACROS / #define __STDC_CONSTANT_MACROS
//  #endif

//  #if AV_HAVE_BIGENDIAN
//  #define AV_NE (be, le) (be)
//  #else
//  #define AV_NE (be, le) (le)
//  #endif

//rounded division & shift
//  #define RSHIFT (a,b);
/* assume b>0 */
//  #define ROUNDED_DIV (a,b);
/* Fast a/(1<<b) rounded toward +inf. Assume a>=0 and b>=0 */
//  #define AV_CEIL_RSHIFT (a,b);
/* Backwards compat. */
//  #define FF_CEIL_RSHIFT AV_CEIL_RSHIFT

//  #define FFUDIV (a,b);
//  #define FFUMOD (a,b);

/***********************************************************
@brief Absolute value, Note, INT_MIN / INT64_MIN result in undefined behavior as they
are not representable as absolute values of their type. This is the same
as with *abs ()
@see @link FFNABS ()
***********************************************************/
//  #define FFABS (a) ((a) >= 0 ? (a) : (-(a)))
//  #define FFSIGN (a) ((a) > 0 ? 1 : -1)

/***********************************************************
@brief Negative Absolute value.
this works for all integers of all types.
As with many macros, this evaluates its argument twice, it thus must not have
a sideeffect, that is FFNABS (x++) has undefined behavior.
***********************************************************/
//  #define FFNABS (a) ((a) <= 0 ? (a) : (-(a)))

/***********************************************************
@brief Comparator.
For two numerical expressions x and y, gives 1 if x > y, -1 if x < y, and 0
if x == y. This is useful for instance in a qsort comparator callback.
Furthermore, compilers are able to optimize this to branchless code, and
there is no risk of overflow with signed types.
As with many macros, this evaluates its argument multiple times, it thus
must not have a side-effect.
***********************************************************/
//  #define FFDIFFSIGN (x,y) (((x)>(y)) - ((x)<(y)))

//  #define FFMAX (a,b) ((a) > (b) ? (a) : (b))
//  #define FFMAX3 (a,b,c) FFMAX (FFMAX (a,b),c)
//  #define FFMIN (a,b) ((a) > (b) ? (b) : (a))
//  #define FFMIN3 (a,b,c) FFMIN (FFMIN (a,b),c)

//  #define FFSWAP (type,a,b) do {type SWAP_tmp= b; b= a; a= SWAP_tmp;}while (0)
//  #define FF_ARRAY_ELEMS (a) (sizeof (a) / sizeof ((a)[0]))

/* misc math functions */

[CCode (cname="av_log2", cheader_filename="ffmpeg/libavutil/common.h")]
public int av_log2 (
    uint v
);

[CCode (cname="av_log2_16bit", cheader_filename="ffmpeg/libavutil/common.h")]
public int av_log2_16bit (
    uint v
);

/***********************************************************
@brief Clip a signed integer value into the amin-amax range.
@param a value to clip
@param amin minimum value of the clip range
@param amax maximum value of the clip range
@return clipped value
***********************************************************/
[CCode (cname="av_clip_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static int av_clip_c (
    int a,
    int amin,
    int amax
);

/***********************************************************
@brief Clip a signed 64bit integer value into the amin-amax range.
@param a value to clip
@param amin minimum value of the clip range
@param amax maximum value of the clip range
@return clipped value
***********************************************************/
[CCode (cname="av_clip64_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static int64 av_clip64_c (
    int64 a,
    int64 amin,
    int64 amax
);

/***********************************************************
@brief Clip a signed integer value into the 0-255 range.
@param a value to clip
@return clipped value
***********************************************************/
[CCode (cname="av_clip_uint8_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static uint8 av_clip_uint8_c (
    int a
);

/***********************************************************
@brief Clip a signed integer value into the -128,127 range.
@param a value to clip
@return clipped value
***********************************************************/
[CCode (cname="av_clip_int8_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static int8 av_clip_int8_c (
    int a
);

/***********************************************************
@brief Clip a signed integer value into the 0-65535 range.
@param a value to clip
@return clipped value
***********************************************************/
[CCode (cname="av_clip_uint16_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static uint16 av_clip_uint16_c (
    int a
);

/***********************************************************
@brief Clip a signed integer value into the -32768,32767 range.
@param a value to clip
@return clipped value
***********************************************************/
[CCode (cname="av_clip_int16_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static int16 av_clip_int16_c (
    int a
);

/***********************************************************
@brief Clip a signed 64-bit integer value into the -2147483648,2147483647 range.
@param a value to clip
@return clipped value
***********************************************************/
[CCode (cname="av_clipl_int32_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static int32 av_clipl_int32_c (
    int64 a
);

/***********************************************************
@brief Clip a signed integer into the -(2^p),(2^p-1) range.
@param a value to clip
@param p bit position to clip at
@return clipped value
***********************************************************/
[CCode (cname="av_clip_intp2_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static int av_clip_intp2_c (
    int a,
    int p
);

/***********************************************************
@brief Clip a signed integer to an uint power of two range.
@param a value to clip
@param p bit position to clip at
@return clipped value
***********************************************************/
[CCode (cname="av_clip_uintp2_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static uint av_clip_uintp2_c (
    int a,
    int p
);

/***********************************************************
@brief Clear high bits from an uint integer starting with specific bit position
@param a value to clip
@param p bit position to clip at
@return clipped value
***********************************************************/
[CCode (cname="av_mod_uintp2_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static uint av_mod_uintp2_c (
    uint a,
    uint p
);

/***********************************************************
@brief Add two signed 32-bit values with saturation.

@param a one value
@param b another value
@return sum with signed saturation
***********************************************************/
[CCode (cname="av_sat_add32_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static int av_sat_add32_c (
    int a,
    int b
);

/***********************************************************
@brief Add a doubled value to another value with saturation at both stages.

@param a first value
@param b value doubled and added to a
@return sum sat (a + sat (2*b)) with signed saturation
***********************************************************/
[CCode (cname="av_sat_dadd32_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static int av_sat_dadd32_c (
    int a,
    int b
);

/***********************************************************
@brief Subtract two signed 32-bit values with saturation.

@param a one value
@param b another value
@return difference with signed saturation
***********************************************************/
[CCode (cname="av_sat_sub32_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static int av_sat_sub32_c (
    int a,
    int b
);

/***********************************************************
@brief Subtract a doubled value from another value with saturation at both stages.

@param a first value
@param b value doubled and subtracted from a
@return difference sat (a - sat (2*b)) with signed saturation
***********************************************************/
[CCode (cname="av_sat_dsub32_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static int av_sat_dsub32_c (
    int a,
    int b
);

/***********************************************************
@brief Clip a float value into the amin-amax range.
@param a value to clip
@param amin minimum value of the clip range
@param amax maximum value of the clip range
@return clipped value
***********************************************************/
[CCode (cname="av_clipf_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static float av_clipf_c (
    float a,
    float amin,
    float amax
);

/***********************************************************
@brief Clip a double value into the amin-amax range.
@param a value to clip
@param amin minimum value of the clip range
@param amax maximum value of the clip range
@return clipped value
***********************************************************/
[CCode (cname="av_clipd_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static double av_clipd_c (
    double a,
    double amin,
    double amax
);

/***********************************************************
@brief Compute ceil (log2 (x)).
@param x value used to compute ceil (log2 (x))
@return computed ceiling of log2 (x)
***********************************************************/
[CCode (cname="av_ceil_log2_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static int av_ceil_log2_c (
    int x
);

/***********************************************************
@brief Count number of bits set to one in x
@param x value to count bits of
@return the number of bits set to one in x
***********************************************************/
[CCode (cname="av_popcount_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static int av_popcount_c (
    uint32 x
);

/***********************************************************
@brief Count number of bits set to one in x
@param x value to count bits of
@return the number of bits set to one in x
***********************************************************/
[CCode (cname="av_popcount64_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static int av_popcount64_c (
    uint64 x
);

[CCode (cname="av_parity_c", cheader_filename="ffmpeg/libavutil/common.h")]
public static int av_parity_c (
    uint32 v
);

//  #define MKTAG (a,b,c,d) ((a) | ((b) << 8) | ((c) << 16) | ((uint)(d) << 24))
//  #define MKBETAG (a,b,c,d) ((d) | ((c) << 8) | ((b) << 16) | ((uint)(a) << 24))

/***********************************************************
@brief Convert a UTF-8 character (up to 4 bytes) to its 32-bit UCS-4 encoded form.

@param val Output value, must be an lvalue of type uint32.
@param GET_BYTE Expression reading one byte from the input.
    Evaluated up to 7 times (4 for the currently
    assigned Unicode range). With a memory buffer
    input, this could be *ptr++.
@param ERROR Expression to be evaluated on invalid input,
    typically a goto statement.

@warning ERROR should not contain a loop control statement which
could interact with the internal while loop, and should force an
exit from the macro code (e.g. through a goto or a return) in order
to prevent undefined results.
***********************************************************/
//  #define GET_UTF8 (val, GET_BYTE, ERROR)

/***********************************************************
@brief Convert a UTF-16 character (2 or 4 bytes) to its 32-bit UCS-4 encoded form.

@param val Output value, must be an lvalue of type uint32.
@param GET_16BIT Expression returning two bytes of UTF-16 data converted
    to native byte order. Evaluated one or two times.
@param ERROR Expression to be evaluated on invalid input,
    typically a goto statement.
***********************************************************/
//  #define GET_UTF16 (val, GET_16BIT, ERROR);

/***********************************************************
@def PUT_UTF8 (val, tmp, PUT_BYTE)
Convert a 32-bit Unicode character to its UTF-8 encoded form (up to 4 bytes long).
@param val is an input-only argument and should be of type uint32. It holds
a UCS-4 encoded Unicode character that is to be converted to UTF-8. If
val is given as a function it is executed only once.
@param tmp is a temporary variable and should be of type uint8. It
represents an intermediate value during conversion that is to be
output by PUT_BYTE.
@param PUT_BYTE writes the converted UTF-8 bytes to any proper destination.
It could be a function or a statement, and uses tmp as the input byte.
For example, PUT_BYTE could be "*output++ = tmp;" PUT_BYTE will be
executed up to 4 times for values in the valid UTF-8 range and up to
7 times in the general case, depending on the length of the converted
Unicode character.
***********************************************************/
//  #define PUT_UTF8 (val, tmp, PUT_BYTE)

/***********************************************************
@def PUT_UTF16 (val, tmp, PUT_16BIT)
Convert a 32-bit Unicode character to its UTF-16 encoded form (2 or 4 bytes).
@param val is an input-only argument and should be of type uint32. It holds
a UCS-4 encoded Unicode character that is to be converted to UTF-16. If
val is given as a function it is executed only once.
@param tmp is a temporary variable and should be of type uint16. It
represents an intermediate value during conversion that is to be
output by PUT_16BIT.
@param PUT_16BIT writes the converted UTF-16 data to any proper destination
in desired endianness. It could be a function or a statement, and uses tmp
as the input byte. For example, PUT_BYTE could be "*output++ = tmp;"
PUT_BYTE will be executed 1 or 2 times depending on input character.
***********************************************************/
//  #define PUT_UTF16 (val, tmp, PUT_16BIT)

/***********************************************************
@brief The following definitions are outside the multiple inclusion guard
to ensure they are immediately available in intmath.h.
***********************************************************/

//  #if !av_ceil_log2
//  #define av_ceil_log2 av_ceil_log2_c
//  #endif
//  #if !av_clip
//  #define av_clip av_clip_c
//  #endif
//  #if !av_clip64
//  #define av_clip64 av_clip64_c
//  #endif
//  #if !av_clip_uint8
//  #define av_clip_uint8 av_clip_uint8_c
//  #endif
//  #if !av_clip_int8
//  #define av_clip_int8 av_clip_int8_c
//  #endif
//  #if !av_clip_uint16
//  #define av_clip_uint16 av_clip_uint16_c
//  #endif
//  #if !av_clip_int16
//  #define av_clip_int16 av_clip_int16_c
//  #endif
//  #if !av_clipl_int32
//  #define av_clipl_int32 av_clipl_int32_c
//  #endif
//  #if !av_clip_intp2
//  #define av_clip_intp2 av_clip_intp2_c
//  #endif
//  #if !av_clip_uintp2
//  #define av_clip_uintp2 av_clip_uintp2_c
//  #endif
//  #if !av_mod_uintp2
//  #define av_mod_uintp2 av_mod_uintp2_c
//  #endif
//  #if !av_sat_add32
//  #define av_sat_add32 av_sat_add32_c
//  #endif
//  #if !av_sat_dadd32
//  #define av_sat_dadd32 av_sat_dadd32_c
//  #endif
//  #if !av_sat_sub32
//  #define av_sat_sub32 av_sat_sub32_c
//  #endif
//  #if !av_sat_dsub32
//  #define av_sat_dsub32 av_sat_dsub32_c
//  #endif
//  #if !av_clipf
//  #define av_clipf av_clipf_c
//  #endif
//  #if !av_clipd
//  #define av_clipd av_clipd_c
//  #endif
//  #if !av_popcount
//  #define av_popcount av_popcount_c
//  #endif
//  #if !av_popcount64
//  #define av_popcount64 av_popcount64_c
//  #endif
//  #if !av_parity
//  #define av_parity av_parity_c
//  #endif

} // namespace LibAVUtil
