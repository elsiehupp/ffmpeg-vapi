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
public enum ProfileMPEG4 {
    FF_PROFILE_MPEG4_SIMPLE,
    FF_PROFILE_MPEG4_SIMPLE_SCALABLE,
    FF_PROFILE_MPEG4_CORE,
    FF_PROFILE_MPEG4_MAIN,
    FF_PROFILE_MPEG4_N_BIT,
    FF_PROFILE_MPEG4_SCALABLE_TEXTURE,
    FF_PROFILE_MPEG4_SIMPLE_FACE_ANIMATION,
    FF_PROFILE_MPEG4_BASIC_ANIMATED_TEXTURE,
    FF_PROFILE_MPEG4_HYBRID,
    FF_PROFILE_MPEG4_ADVANCED_REAL_TIME,
    FF_PROFILE_MPEG4_CORE_SCALABLE,
    FF_PROFILE_MPEG4_ADVANCED_CODING,
    FF_PROFILE_MPEG4_ADVANCED_CORE,
    FF_PROFILE_MPEG4_ADVANCED_SCALABLE_TEXTURE,
    FF_PROFILE_MPEG4_SIMPLE_STUDIO,
    FF_PROFILE_MPEG4_ADVANCED_SIMPLE,
}

} // namespace LibAVCodec
