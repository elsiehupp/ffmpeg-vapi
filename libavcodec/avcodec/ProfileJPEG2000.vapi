/***********************************************************
@copyright 2001 Fabrice Bellard

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
@file
@ingroup libavc
LibAVCodec external API header
***********************************************************/

[CCode (cprefix="", cheader_filename="libavcodec/avcodec.h")]
public enum ProfileJPEG2000 {
    FF_PROFILE_JPEG2000_CSTREAM_RESTRICTION_0,
    FF_PROFILE_JPEG2000_CSTREAM_RESTRICTION_1,
    FF_PROFILE_JPEG2000_CSTREAM_NO_RESTRICTION,
    FF_PROFILE_JPEG2000_DCINEMA_2K,
    FF_PROFILE_JPEG2000_DCINEMA_4K,
}

} // namespace LibAVCodec
