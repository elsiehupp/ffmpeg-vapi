/***********************************************************
Copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at>

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
namespace LibAVUtil {
namespace Log {

    /***********************************************************
    @brief Format a line of log the same way as the default callback.
    @param line buffer to receive the formatted line
    @param line_size size of the buffer
    @param print_prefix used to store whether the prefix must be printed;
        must point to a persistent integer initially set to 1
    ***********************************************************/
    [CCode (cname="av_log_format_line",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
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
    [CCode (cname="av_log_format_line2",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
    public int av_log_format_line2 (
        void *ptr,
        int level,
        string fmt,
        va_list vl,
        string line,
        int line_size,
        out int print_prefix
    );

} // namespace Log
} // namespace LibAVUtil
