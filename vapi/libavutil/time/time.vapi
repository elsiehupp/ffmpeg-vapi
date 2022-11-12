/***********************************************************
@copyright 2000-2003 Fabrice Bellard
***********************************************************/
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
@brief Get the current time in microseconds.
***********************************************************/
[CCode (cname="av_gettime", cheader_filename="ffmpeg/libavutil/time.h")]
public static int64 av_gettime ();

/***********************************************************
@brief Get the current time in microseconds since some unspecified starting point.
On platforms that support it, the time comes from a monotonic clock
This property makes this time source ideal for measuring relative time.
The returned values may not be monotonic on platforms where a monotonic
clock is not available.
***********************************************************/
[CCode (cname="av_gettime_relative", cheader_filename="ffmpeg/libavutil/time.h")]
public static int64 av_gettime_relative ();

/***********************************************************
@brief Indicates with a boolean result if the av_gettime_relative () time source
is monotonic.
***********************************************************/
[CCode (cname="av_gettime_relative_is_monotonic", cheader_filename="ffmpeg/libavutil/time.h")]
public static int av_gettime_relative_is_monotonic ();

/***********************************************************
@brief Sleep for a period of time. Although the duration is expressed in
microseconds, the actual delay may be rounded to the precision of the
system timer.

@param usec Number of microseconds to sleep.
@return zero on success or (negative) error code.
***********************************************************/
[CCode (cname="av_usleep", cheader_filename="ffmpeg/libavutil/time.h")]
public static int av_usleep (
    uint usec
);

} // namespace LibAVUtil
