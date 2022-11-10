/***********************************************************
@copyright 2011 Mans Rullgard
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
@brief Reinterpret a 32-bit integer as a float.
***********************************************************/
[CCode (cname="av_int2float", cheader_filename="ffmpeg/libavutil/intfloat.h")]
public static float av_int2float (
    uint32 i
);

/***********************************************************
@brief Reinterpret a float as a 32-bit integer.
***********************************************************/
[CCode (cname="av_float2int", cheader_filename="ffmpeg/libavutil/intfloat.h")]
public static uint32 av_float2int (
    float f
);

/***********************************************************
@brief Reinterpret a 64-bit integer as a double.
***********************************************************/
[CCode (cname="av_int2double", cheader_filename="ffmpeg/libavutil/intfloat.h")]
public static double av_int2double (
    uint64 i
);

/***********************************************************
@brief Reinterpret a double as a 64-bit integer.
***********************************************************/
[CCode (cname="av_double2int", cheader_filename="ffmpeg/libavutil/intfloat.h")]
public static uint64 av_double2int (
    double f
);

} // namespace LibAVUtil
