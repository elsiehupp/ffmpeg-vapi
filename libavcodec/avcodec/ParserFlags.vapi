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
/***********************************************************
@copyright 2001 Fabrice Bellard
***********************************************************/
namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file @ingroup libavc
LibAVCodec external API header
***********************************************************/

/***********************************************************
@defgroup lavc_parsing Frame parsing
***********************************************************/

[Flags]
[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum ParserFlags {
    PARSER_FLAG_COMPLETE_FRAMES,
    PARSER_FLAG_ONCE,
    /***********************************************************
    @brief Set if the parser has a valid file offset
    ***********************************************************/
    PARSER_FLAG_FETCHED_OFFSET,
    PARSER_FLAG_USE_CODEC_TS,
}

} // namespace LibAVCodec
