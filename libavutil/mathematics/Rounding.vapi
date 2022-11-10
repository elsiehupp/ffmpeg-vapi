/***********************************************************
@copyright 2005-2012 Michael Niedermayer <michaelni@gmx.at>
***********************************************************/
/***********************************************************
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
@file @addtogroup LibAVUtil.Math
Mathematical utilities for working with timestamp and time base.
***********************************************************/

//  #if !M_E
//  #define M_E 2.7182818284590452354 /* e
//  ***********************************************************/
//  #endif
//  #if !M_LN2
//  #define M_LN2 0.69314718055994530942 /* log_e 2
//  ***********************************************************/
//  #endif
//  #if !M_LN10
//  #define M_LN10 2.30258509299404568402 /* log_e 10
//  ***********************************************************/
//  #endif
//  #if !M_LOG2_10
//  #define M_LOG2_10 3.32192809488736234787 /* log_2 10
//  ***********************************************************/
//  #endif
//  #if !M_PHI
//  #define M_PHI 1.61803398874989484820 /* phi / golden ratio
//  ***********************************************************/
//  #endif
//  #if !M_PI
//  #define M_PI 3.14159265358979323846 /* pi
//  ***********************************************************/
//  #endif
//  #if !M_PI_2
//  #define M_PI_2 1.57079632679489661923 /* pi/2
//  ***********************************************************/
//  #endif
//  #if !M_SQRT1_2
//  #define M_SQRT1_2 0.70710678118654752440 /* 1/sqrt (2)
//  ***********************************************************/
//  #endif
//  #if !M_SQRT2
//  #define M_SQRT2 1.41421356237309504880 /* sqrt (2)
//  ***********************************************************/
//  #endif
//  #if !NAN
//  #define NAN av_int2float (0x7fc00000)
//  #endif
//  #if !INFINITY
//  #define INFINITY av_int2float (0x7f800000)
//  #endif

/***********************************************************
@addtogroup LibAVUtil.Math
***********************************************************/

/***********************************************************
@brief Rounding methods.
***********************************************************/
[CCode (cheader_filename="ffmpeg/libavutil/mathematics.h")]
public enum Rounding {
    /***********************************************************
    @brief Round toward zero.
    ***********************************************************/
    [CCode (cname="AV_ROUND_ZERO")]
    TOWARDS_ZERO,
    /***********************************************************
    @brief Round away from zero.
    ***********************************************************/
    [CCode (cname="AV_ROUND_INF")]
    AWAY_FROM_ZERO,
    /***********************************************************
    @brief Round toward -infinity.
    ***********************************************************/
    [CCode (cname="AV_ROUND_DOWN")]
    DOWN,
    /***********************************************************
    @brief Round toward +infinity.
    ***********************************************************/
    [CCode (cname="AV_ROUND_UP")]
    UP,
    /***********************************************************
    @brief Round to nearest and halfway cases away from zero.
    ***********************************************************/
    [CCode (cname="AV_ROUND_NEAR_INF")]
    NEAREST_THEN_AWAY_FROM_ZERO,
    /***********************************************************
    @brief Flag telling rescaling functions to pass `INT64_MIN`/`MAX` through
    unchanged, avoiding special cases for #AV_NOPTS_VALUE.

    Unlike other values of the enumeration Rounding, this value is a
    bitmask that must be used in conjunction with another value of the
    enumeration through a bitwise OR, in order to set behavior for normal
    cases.

    @code{.c}
    av_rescale_rnd (3, 1, 2, Rounding.UP | Rounding.AVOID_SPECIAL_CASE);
    // Rescaling 3:
    //     Calculating 3 * 1 / 2
    //     3 / 2 is rounded up to 2
    //     => 2

    av_rescale_rnd (AV_NOPTS_VALUE, 1, 2, Rounding.UP | Rounding.AVOID_SPECIAL_CASE);
    // Rescaling AV_NOPTS_VALUE:
    //     AV_NOPTS_VALUE == INT64_MIN
    //     AV_NOPTS_VALUE is passed through
    //     => AV_NOPTS_VALUE
    @endcode
    ***********************************************************/
    [CCode (cname="AV_ROUND_PASS_MINMAX")]
    AVOID_SPECIAL_CASE,
}

/***********************************************************
@brief Compute the greatest common divisor of two integer operands.

@param a,b Operands
@return GCD of a and b up to sign; if a >= 0 and b >= 0, return value is >= 0;
if a == 0 and b == 0, returns 0.
***********************************************************/
[CCode (cname="av_gcd", cheader_filename="ffmpeg/libavutil/mathematics.h")]
public int64 av_gcd (
    int64 a,
    int64 b
);

/***********************************************************
@brief Rescale a 64-bit integer with rounding to nearest.

The operation is mathematically equivalent to `a * b / c`, but writing that
directly can overflow.

This function is equivalent to av_rescale_rnd () with #Rounding.NEAREST_THEN_AWAY_FROM_ZERO.

@see @link av_rescale_rnd (), av_rescale_q (), av_rescale_q_rnd ()
***********************************************************/
[CCode (cname="av_rescale", cheader_filename="ffmpeg/libavutil/mathematics.h")]
public int64 av_rescale (
    int64 a,
    int64 b,
    int64 c
); // av_const;

/***********************************************************
@brief Rescale a 64-bit integer with specified rounding.

The operation is mathematically equivalent to `a * b / c`, but writing that
directly can overflow, and does not support different rounding methods.
If the result is not representable then INT64_MIN is returned.

@see @link av_rescale (), av_rescale_q (), av_rescale_q_rnd ()
***********************************************************/
[CCode (cname="av_rescale_rnd", cheader_filename="ffmpeg/libavutil/mathematics.h")]
public int64 av_rescale_rnd (
    int64 a,
    int64 b,
    int64 c,
    Rounding rnd
); // av_const;

/***********************************************************
@brief Rescale a 64-bit integer by 2 rational numbers.

The operation is mathematically equivalent to `a * bq / cq`.

This function is equivalent to av_rescale_q_rnd () with #Rounding.NEAREST_THEN_AWAY_FROM_ZERO.

@see @link av_rescale (), av_rescale_rnd (), av_rescale_q_rnd ()
***********************************************************/
[CCode (cname="av_rescale_q", cheader_filename="ffmpeg/libavutil/mathematics.h")]
public int64 av_rescale_q (
    int64 a,
    Rational bq,
    Rational cq
); // av_const;

/***********************************************************
@brief Rescale a 64-bit integer by 2 rational numbers with specified rounding.

The operation is mathematically equivalent to `a * bq / cq`.

@see @link av_rescale (), av_rescale_rnd (), av_rescale_q ()
***********************************************************/
[CCode (cname="av_rescale_q_rnd", cheader_filename="ffmpeg/libavutil/mathematics.h")]
public int64 av_rescale_q_rnd (
    int64 a,
    Rational bq,
    Rational cq,
    Rounding rnd
); // av_const;

/***********************************************************
@brief Compare two timestamps each in its own time base.

@return One of the following values:
    - -1 if `ts_a` is before `ts_b`
    - 1 if `ts_a` is after `ts_b`
    - 0 if they represent the same position

@warning
The result of the function is undefined if one of the timestamps is outside
the `int64` range when represented in the other's timebase.
***********************************************************/
[CCode (cname="av_compare_ts", cheader_filename="ffmpeg/libavutil/mathematics.h")]
public int av_compare_ts (
    int64 ts_a,
    Rational tb_a,
    int64 ts_b,
    Rational tb_b
);

/***********************************************************
@brief Compare the remainders of two integer operands divided by a common divisor.

In other words, compare the least significant `log2 (mod)` bits of integers
`a` and `b`.

@code{.c}
av_compare_mod (0x11, 0x02, 0x10) < 0 // since 0x11 % 0x10 (0x1) < 0x02 % 0x10 (0x2)
av_compare_mod (0x11, 0x02, 0x20) > 0 // since 0x11 % 0x20 (0x11) > 0x02 % 0x20 (0x02)
@endcode

@param a,b Operands
@param mod Divisor; must be a power of 2
@return
    - a negative value if `a % mod < b % mod`
    - a positive value if `a % mod > b % mod`
    - zero if `a % mod == b % mod`
***********************************************************/
[CCode (cname="av_compare_mod", cheader_filename="ffmpeg/libavutil/mathematics.h")]
public int64 av_compare_mod (
    uint64 a,
    uint64 b,
    uint64 mod
);

/***********************************************************
@brief Rescale a timestamp while preserving known durations.

This function is designed to be called per audio packet to scale the input
timestamp to a different time base. Compared to a simple av_rescale_q ()
call, this function is robust against possible inconsistent frame durations.

The `last` parameter is a state variable that must be preserved for all
subsequent calls for the same stream. For the first call, `*last` should be
initialized to #AV_NOPTS_VALUE.

@param[in] in_tb Input time base
@param[in] in_ts Input timestamp
@param[in] fs_tb Duration time base; typically this is finer-grained
    (greater) than `in_tb` and `out_tb`
@param[in] duration Duration till the next call to this function (i.e.
    duration of the current packet/frame)
@param[in,out] last Pointer to a timestamp expressed in terms of
    `fs_tb`, acting as a state variable
@param[in] out_tb Output timebase
@return Timestamp expressed in terms of `out_tb`

@note In the context of this function, "duration" is in term of samples, not
      seconds.
***********************************************************/
[CCode (cname="av_rescale_delta", cheader_filename="ffmpeg/libavutil/mathematics.h")]
public int64 av_rescale_delta (
    Rational in_tb,
    int64 in_ts,
    Rational fs_tb,
    int duration,
    out int64 last,
    Rational out_tb
);

/***********************************************************
@brief Add a value to a timestamp.

This function guarantees that when the same value is repeatly added that
no accumulation of rounding errors occurs.

@param[in] ts Input timestamp
@param[in] ts_tb Input timestamp time base
@param[in] inc Value to be added
@param[in] inc_tb Time base of `inc`
***********************************************************/
[CCode (cname="av_add_stable", cheader_filename="ffmpeg/libavutil/mathematics.h")]
public int64 av_add_stable (
    Rational ts_tb,
    int64 ts,
    Rational inc_tb,
    int64 inc
);

} // namespace LibAVUtil
