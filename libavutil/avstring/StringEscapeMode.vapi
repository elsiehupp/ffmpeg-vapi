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

[CCode (cprefix="AV_ESCAPE_MODE_", cheader_filename="libavcodec/avstring.h")]
public enum StringEscapeMode {
    /***********************************************************
    @brief Use auto-selected escaping mode.
    ***********************************************************/
    AUTO,
    /***********************************************************
    @brief Use backslash escaping.
    ***********************************************************/
    BACKSLASH,
    /***********************************************************
    @brief Use single-quote escaping.
    ***********************************************************/
    QUOTE,
}
