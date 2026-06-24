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

[CCode (cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
public enum DCTAlgorithm {
    [CCode (cname="FF_DCT_AUTO")]
    AUTO,

    [CCode (cname="FF_DCT_FASTINT")]
    FASTINT,

    [CCode (cname="FF_DCT_INT")]
    INT,

    [CCode (cname="FF_DCT_MMX")]
    MMX,

    [CCode (cname="FF_DCT_ALTIVEC")]
    ALTIVEC,

    [CCode (cname="FF_DCT_FAAN")]
    FAAN;
}

} // namespace LibAVCodec
