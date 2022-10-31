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
public enum IDCTAlgorithm {
    FF_IDCT_AUTO,
    FF_IDCT_INT,
    FF_IDCT_SIMPLE,
    FF_IDCT_SIMPLEMMX,
    FF_IDCT_ARM,
    FF_IDCT_ALTIVEC,
    FF_IDCT_SIMPLEARM,
    FF_IDCT_XVID,
    FF_IDCT_SIMPLEARMV5TE,
    FF_IDCT_SIMPLEARMV6,
    FF_IDCT_FAAN,
    FF_IDCT_SIMPLENEON,
    /***********************************************************
    @brief Used by XvMC to extract IDCT coefficients with FF_IDCT_PERM_NONE
    ***********************************************************/
    FF_IDCT_NONE,
    FF_IDCT_SIMPLEAUTO,
}

} // namespace LibAVCodec
