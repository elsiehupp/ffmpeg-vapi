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

[Flags]
[CCode (cprefix="", cheader_filename="ffmpeg/libavutil/log.h")]
public enum LogFlags {
    /***********************************************************
    @brief Skip repeated messages, this requires the user app to use av_log () instead of
    (f)printf as the 2 would otherwise interfere and lead to
    "Last message repeated x times" messages below (f)printf messages with some
    bad luck.
    Also to receive the last, "last repeated" line if any, the user app must
    call av_log (null, AV_LOG_QUIET, "%s", ""); at the end
    ***********************************************************/
    AV_LOG_SKIP_REPEATED,

    /***********************************************************
    @brief Include the log severity in messages originating from codecs.

    Results in messages such as:
    [rawvideo @ 0xDEADBEEF] [error] encode did not produce valid pts
    ***********************************************************/
    AV_LOG_PRINT_LEVEL;

    [CCode (cname="av_log_set_flags", cheader_filename="ffmpeg/libavutil/log.h")]
    public static void av_log_set_flags (
        LogFlags arg
    );

    [CCode (cname="av_log_get_flags", cheader_filename="ffmpeg/libavutil/log.h")]
    public static int av_log_get_flags ();
}

} // namespace LibAVUtil
