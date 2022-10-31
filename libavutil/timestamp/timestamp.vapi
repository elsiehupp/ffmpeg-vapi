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

/***********************************************************
@file
timestamp utils, mostly useful for debugging/logging purposes
***********************************************************/

//  #if defined (__cplusplus) && !defined (__STDC_FORMAT_MACROS) && !defined (PRId64)
//  #error missing -D__STDC_FORMAT_MACROS / #define __STDC_FORMAT_MACROS
//  #endif

[CCode (cname="AV_TS_MAX_STRING_SIZE", cheader_filename="libavcodec/timestamp.h")]
public const size_t AV_TS_MAX_STRING_SIZE;

/***********************************************************
@brief Fill the provided buffer with a string containing a timestamp
representation.

@param buf a buffer with size in bytes of at least AV_TS_MAX_STRING_SIZE
@param ts the timestamp to represent
@return the buffer in input
***********************************************************/
[CCode (cname="av_ts_make_string", cheader_filename="libavcodec/timestamp.h")]
public static string av_ts_make_string (
    out string buf,
    int64 ts
);

/***********************************************************
@brief Convenience macro, the return value should be used only directly in
function arguments but never stand-alone.
***********************************************************/
[CCode (cname="av_ts2str", cheader_filename="libavcodec/timestamp.h")]
public static string av_ts2str (
    int64 ts
);

/***********************************************************
@brief Fill the provided buffer with a string containing a timestamp time
representation.

@param buf a buffer with size in bytes of at least AV_TS_MAX_STRING_SIZE
@param ts the timestamp to represent
@param tb the timebase of the timestamp
@return the buffer in input
***********************************************************/
[CCode (cname="av_ts_make_time_string", cheader_filename="libavcodec/timestamp.h")]
public static string av_ts_make_time_string (
    out string buf,
    int64 ts,
    Rational tb
);

/***********************************************************
@brief Convenience macro, the return value should be used only directly in
function arguments but never stand-alone.
***********************************************************/
[CCode (cname="av_ts2timestr", cheader_filename="libavcodec/timestamp.h")]
public static string av_ts2timestr (
    int64 ts,
    Rational tb
);

} // namespace LibAVUtil
