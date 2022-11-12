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

/***********************************************************
@addtogroup LibAVUtil.Logging


@defgroup lavu_log_constants Logging Constants
***********************************************************/
[CCode (cprefix="", cheader_filename="ffmpeg/libavutil/log.h")]
public enum LogLevel {
    /***********************************************************
    @brief Print no output.
        ***********************************************************/
    AV_LOG_QUIET,

    /***********************************************************
    @brief Something went really wrong and we will crash now.
        ***********************************************************/
    AV_LOG_PANIC,

    /***********************************************************
    @brief Something went wrong and recovery is not possible.
    For example, no header was found for a format which depends
    on headers or an illegal combination of parameters is used.
        ***********************************************************/
    AV_LOG_FATAL,

    /***********************************************************
    @brief Something went wrong and cannot losslessly be recovered.
    However, not all future data is affected.
        ***********************************************************/
    AV_LOG_ERROR,

    /***********************************************************
    @brief Something somehow does not look correct. This may or may not
    lead to problems. An example would be the use of '-vstrict -2'.
        ***********************************************************/
    AV_LOG_WARNING,

    /***********************************************************
    @brief Standard information.
        ***********************************************************/
    AV_LOG_INFO,

    /***********************************************************
    @brief Detailed information.
        ***********************************************************/
    AV_LOG_VERBOSE,

    /***********************************************************
    @brief Stuff which is only useful for libav* developers.
        ***********************************************************/
    AV_LOG_DEBUG,

    /***********************************************************
    @brief Extremely verbose debugging, useful for libav* development.
        ***********************************************************/
    AV_LOG_TRACE;

    /***********************************************************
    @brief Sets additional colors for extended debugging sessions.
    @code
       av_log (class_context, AV_LOG_DEBUG|AV_LOG_COLOR (134), "Message in purple\n");
       @endcode
    Requires 256color terminal support. Uses outside debugging is not
    recommended.
        ***********************************************************/
    [CCode (cname="AV_LOG_C", cheader_filename="ffmpeg/libavutil/log.h")]
    public static LogLevel AV_LOG_COLOR (
        int color
    );
}

} // namespace LibAVUtil
