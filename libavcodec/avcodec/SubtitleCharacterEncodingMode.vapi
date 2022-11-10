/***********************************************************
@copyright 2001 Fabrice Bellard
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

namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file @ingroup libavc
LibAVCodec external API header
***********************************************************/

[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum SubtitleCharacterEncodingMode {
    /***********************************************************
    @brief Do nothing (demuxer outputs a stream supposed to be already
    in UTF-8, or the codec is bitmap for instance).
    ***********************************************************/
    FF_SUB_CHARENC_MODE_DO_NOTHING,
    /***********************************************************
    @brief LibAVCodec will select the mode itself
    ***********************************************************/
    FF_SUB_CHARENC_MODE_AUTOMATIC,
    /***********************************************************
    @brief The Packet data needs to be recoded to UTF-8 before being
    fed to the decoder, requires iconv
    ***********************************************************/
    FF_SUB_CHARENC_MODE_PRE_DECODER,
    /***********************************************************
    @brief Neither convert the subtitles, nor check them for valid UTF-8
    ***********************************************************/
    FF_SUB_CHARENC_MODE_IGNORE,
}

} // namespace LibAVCodec
