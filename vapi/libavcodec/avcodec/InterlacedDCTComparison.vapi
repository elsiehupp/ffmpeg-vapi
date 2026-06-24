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
public enum InterlacedDCTComparison {
    [CCode (cname="FF_CMP_SAD")]
    SAD,

    [CCode (cname="FF_CMP_SSE")]
    SSE,

    [CCode (cname="FF_CMP_SATD")]
    SATD,

    [CCode (cname="FF_CMP_DCT")]
    DCT,

    [CCode (cname="FF_CMP_PSNR")]
    PSNR,

    [CCode (cname="FF_CMP_BIT")]
    BIT,

    [CCode (cname="FF_CMP_RD")]
    RD,

    [CCode (cname="FF_CMP_ZERO")]
    ZERO,

    [CCode (cname="FF_CMP_VSAD")]
    VSAD,

    [CCode (cname="FF_CMP_VSSE")]
    VSSE,

    [CCode (cname="FF_CMP_NSSE")]
    NSSE,

    [CCode (cname="FF_CMP_W53")]
    W53,

    [CCode (cname="FF_CMP_W97")]
    W97,

    [CCode (cname="FF_CMP_DCTMAX")]
    DCTMAX,

    [CCode (cname="FF_CMP_DCT264")]
    DCT264,

    [CCode (cname="FF_CMP_MEDIAN_SAD")]
    MEDIAN_SAD,

    [CCode (cname="FF_CMP_CHROMA")]
    CHROMA;
}

} // namespace LibAVCodec
