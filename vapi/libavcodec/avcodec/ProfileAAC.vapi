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
public enum ProfileAAC {
    FF_PROFILE_AAC_MAIN,
    FF_PROFILE_AAC_LOW,
    FF_PROFILE_AAC_SSR,
    FF_PROFILE_AAC_LTP,
    FF_PROFILE_AAC_HE,
    FF_PROFILE_AAC_HE_V2,
    FF_PROFILE_AAC_LD,
    FF_PROFILE_AAC_ELD,
    FF_PROFILE_MPEG2_AAC_LOW,
    FF_PROFILE_MPEG2_AAC_HE,
}

} // namespace LibAVCodec
