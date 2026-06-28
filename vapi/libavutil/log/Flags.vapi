/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>
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
namespace Log {

[Flags]
[CCode (cprefix="AV_LOG_",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
public enum LibAVUtil.Log.Flags {
    /***********************************************************
    @brief Skip repeated messages, this requires the user app to use av_log () instead of
    (f)printf as the 2 would otherwise interfere and lead to
    "Last message repeated x times" messages below (f)printf messages with some
    bad luck.
    Also to receive the last, "last repeated" line if any, the user app must
    call av_log (null, LibAVUtil.Log.Level.QUIET, "%s", ""); at the end
    ***********************************************************/
    SKIP_REPEATED,

    /***********************************************************
    @brief Include the log severity in messages originating from codecs.

    Results in messages such as:
    [rawvideo @ 0xDEADBEEF] [error] encode did not produce valid pts
    ***********************************************************/
    PRINT_LEVEL,

    /***********************************************************
    Include system time in log output.
    ***********************************************************/
    PRINT_TIME,

    /***********************************************************
    Include system date and time in log output.
    ***********************************************************/
    [CCode (cname="AV_LOG_PRINT_DATETIME")]
    PRINT_DATE_TIME;


    [CCode (cname="av_log_set_flags",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
    public static void set_flags (
        LibAVUtil.Log.Flags arg
    );

    [CCode (cname="av_log_get_flags",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
    public static LibAVUtil.Log.Flags get_flags ();
}

} // namespace Log
} // namespace LibAVUtil
