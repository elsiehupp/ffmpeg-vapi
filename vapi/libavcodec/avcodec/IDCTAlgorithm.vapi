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

[CCode (cprefix="FF_IDCT_",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
public enum IDCTAlgorithm {
    AUTO,

    [CCode (cname="FF_IDCT_INT")]
    INT,

    [CCode (cname="FF_IDCT_SIMPLE")]
    SIMPLE,

    [CCode (cname="FF_IDCT_SIMPLEMMX")]
    SIMPLE_MMX,
    ARM,
    ALTIVEC,

    [CCode (cname="FF_IDCT_SIMPLEARM")]
    SIMPLE_ARM,
    XVID,

    [CCode (cname="FF_IDCT_SIMPLEARMV5TE")]
    SIMPLE_ARM_V5_TE,

    [CCode (cname="FF_IDCT_SIMPLEARMV6")]
    SIMPLE_ARM_V6,

    [CCode (cname="FF_IDCT_FAAN")]
    FAAN,

    [CCode (cname="FF_IDCT_SIMPLENEON")]
    SIMPLE_NEON,

    /***********************************************************
    @brief Used by XvMC to extract IDCT coefficients with FF_IDCT_PERM_NONE
    ***********************************************************/
    NONE,

    [CCode (cname="FF_IDCT_SIMPLEAUTO")]
    SIMPLE_AUTO;
}

} // namespace LibAVCodec
