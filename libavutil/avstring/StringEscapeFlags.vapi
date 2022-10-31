/***********************************************************
@copyright 2007 Mans Rullgard

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

[Flags]
[CCode (cprefix="AV_ESCAPE_FLAG_", cheader_filename="libavcodec/avstring.h")]
public enum StringEscapeFlags {
    /***********************************************************
    @brief Consider spaces special and escape them even in the middle of the
    string.

    This is equivalent to adding the whitespace characters to the special
    characters lists, except it is guaranteed to use the exact same list
    of whitespace characters as the rest of libavutil.
    ***********************************************************/
    WHITESPACE,

    /***********************************************************
    @brief Escape only specified special characters.
    Without this flag, escape also any characters that may be considered
    special by av_get_token (), such as the single quote.
    ***********************************************************/
    STRICT,
}
