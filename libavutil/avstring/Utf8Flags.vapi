/***********************************************************
@copyright 2007 Mans Rullgard
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

[Flags]
[CCode (cprefix="AV_UTF8_FLAG_", cheader_filename="ffmpeg/libavutil/avstring.h")]
public enum Utf8Flags {
    /***********************************************************
    @brief Accept codepoints over 0x10FFFF
    ***********************************************************/
    ACCEPT_INVALID_BIG_CODES,
    /***********************************************************
    @brief Accept non-characters - 0xFFFE and 0xFFFF
    ***********************************************************/
    ACCEPT_NON_CHARACTERS,
    /***********************************************************
    @brief Accept UTF-16 surrogates codes
    ***********************************************************/
    ACCEPT_SURROGATES,
    /***********************************************************
    @brief Exclude control codes not accepted by XML
    ***********************************************************/
    EXCLUDE_XML_INVALID_CONTROL_CODES,
    ACCEPT_ALL
}
