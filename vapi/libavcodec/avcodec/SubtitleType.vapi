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

[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum SubtitleType {
    SUBTITLE_NONE,

    /***********************************************************
    @brief A bitmap, pict will be set
    ***********************************************************/
    SUBTITLE_BITMAP,

    /***********************************************************
    @brief Plain text, the text field must be set by the decoder and is
    authoritative. ass and pict fields may contain approximations.
    ***********************************************************/
    SUBTITLE_TEXT,

    /***********************************************************
    @brief Formatted text, the ass field must be set by the decoder and is
    authoritative. pict and text fields may contain approximations.
    ***********************************************************/
    SUBTITLE_ASS,
}

} // namespace LibAVCodec
