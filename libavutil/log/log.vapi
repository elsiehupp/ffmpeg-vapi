/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>
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
@brief Send the specified message to the log if the level is less than or equal
to the current av_log_level. By default, all logging messages are sent to
stderr. This behavior can be altered by setting a different logging callback
function.
@see @link av_log_set_callback

@param avcl A pointer to an arbitrary struct of which the first field is a
    pointer to an Class struct or null if general log.
@param level The importance level of the message expressed using a @ref
    lavu_log_constants "Logging Constant".
@param fmt The format string (printf-compatible) that specifies how
    subsequent arguments are converted to output.
***********************************************************/
[CCode (cname="av_log", cheader_filename="ffmpeg/libavutil/log.h")]
public void av_log (
    void *avcl,
    int level,
    string fmt,
    ...
); // av_printf_format (3, 4);

/***********************************************************
@brief Send the specified message to the log if the level is less than or equal
to the current av_log_level. By default, all logging messages are sent to
stderr. This behavior can be altered by setting a different logging callback
function.
@see @link av_log_set_callback

@param avcl A pointer to an arbitrary struct of which the first field is a
    pointer to an Class struct.
@param level The importance level of the message expressed using a @ref
    lavu_log_constants "Logging Constant".
@param fmt The format string (printf-compatible) that specifies how
    subsequent arguments are converted to output.
@param vl The arguments referenced by the format string.
***********************************************************/
[CCode (cname="av_vlog", cheader_filename="ffmpeg/libavutil/log.h")]
public void av_vlog (
    void *avcl,
    int level,
    string fmt,
    va_list vl
);

/***********************************************************
@brief Get the current log level

@see @link lavu_log_constants

@return Current log level
***********************************************************/
[CCode (cname="av_log_get_level", cheader_filename="ffmpeg/libavutil/log.h")]
public int av_log_get_level ();

/***********************************************************
@brief Set the log level

@see @link lavu_log_constants

@param level Logging level
***********************************************************/
[CCode (cname="av_log_set_level", cheader_filename="ffmpeg/libavutil/log.h")]
public void av_log_set_level (
    int level
);

[CCode (cname="", cheader_filename="")]
public delegate void CallbackDelegate (
    void *arg0,
    int arg1,
    string arg2,
    va_list arg3
);

/***********************************************************
@brief Set the logging callback

@note The callback must be thread safe, even if the application does not use
      threads itself as some codecs are multithreaded.

@see @link av_log_default_callback

@param callback A logging function with a compatible signature.
***********************************************************/
[CCode (cname="av_log_set_callback", cheader_filename="ffmpeg/libavutil/log.h")]
public void av_log_set_callback (
    CallbackDelegate callback
);

/***********************************************************
@brief Default logging callback

It prints the message to stderr, optionally colorizing it.

@param avcl A pointer to an arbitrary struct of which the first field is a
    pointer to an Class struct.
@param level The importance level of the message expressed using a @ref
    lavu_log_constants "Logging Constant".
@param fmt The format string (printf-compatible) that specifies how
    subsequent arguments are converted to output.
@param vl The arguments referenced by the format string.
***********************************************************/
[CCode (cname="av_log_default_callback", cheader_filename="ffmpeg/libavutil/log.h")]
public void av_log_default_callback (
    void *avcl,
    int level,
    string fmt,
    va_list vl
);

/***********************************************************
@brief Format a line of log the same way as the default callback.
@param line buffer to receive the formatted line
@param line_size size of the buffer
@param print_prefix used to store whether the prefix must be printed;
    must point to a persistent integer initially set to 1
***********************************************************/
[CCode (cname="av_log_format_line", cheader_filename="ffmpeg/libavutil/log.h")]
public void av_log_format_line (
    void *ptr,
    int level,
    string fmt,
    va_list vl,
    string line,
    int line_size,
    out int print_prefix
);

/***********************************************************
@brief Format a line of log the same way as the default callback.
@param line buffer to receive the formatted line;
    may be null if line_size is 0
@param line_size size of the buffer; at most line_size-1 characters will
    be written to the buffer, plus one null terminator
@param print_prefix used to store whether the prefix must be printed;
    must point to a persistent integer initially set to 1
@return Returns a negative value if an error occurred, otherwise returns
    the number of characters that would have been written for a
    sufficiently large buffer, not including the terminating null
    character. If the return value is not less than line_size, it means
    that the log message was truncated to fit the buffer.
***********************************************************/
[CCode (cname="av_log_format_line2", cheader_filename="ffmpeg/libavutil/log.h")]
public int av_log_format_line2 (
    void *ptr,
    int level,
    string fmt,
    va_list vl,
    string line,
    int line_size,
    out int print_prefix
);

} // namespace LibAVUtil
