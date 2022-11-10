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
public enum InterlacedDCTComparison {
    FF_CMP_SAD,
    FF_CMP_SSE,
    FF_CMP_SATD,
    FF_CMP_DCT,
    FF_CMP_PSNR,
    FF_CMP_BIT,
    FF_CMP_RD,
    FF_CMP_ZERO,
    FF_CMP_VSAD,
    FF_CMP_VSSE,
    FF_CMP_NSSE,
    FF_CMP_W53,
    FF_CMP_W97,
    FF_CMP_DCTMAX,
    FF_CMP_DCT264,
    FF_CMP_MEDIAN_SAD,
    FF_CMP_CHROMA;
}

} // namespace LibAVCodec
