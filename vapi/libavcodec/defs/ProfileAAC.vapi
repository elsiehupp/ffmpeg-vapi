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
namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file @ingroup libavc
Misc types and constants that do not belong anywhere else.
***********************************************************/

[CCode (cheader_filename="subprojects/ffmpeg/libavcodec/defs.h")]
public enum ProfileAAC {
    [CCode (cname="AV_PROFILE_AAC_MAIN")]
    MAIN,

    [CCode (cname="AV_PROFILE_AAC_LOW")]
    LOW,

    [CCode (cname="AV_PROFILE_AAC_SSR")]
    SSR,

    [CCode (cname="AV_PROFILE_AAC_LTP")]
    LTP,

    [CCode (cname="AV_PROFILE_AAC_HE")]
    HE,

    [CCode (cname="AV_PROFILE_AAC_HE_V2")]
    HE_V2,

    [CCode (cname="AV_PROFILE_AAC_LD")]
    LD,

    [CCode (cname="AV_PROFILE_AAC_ELD")]
    ELD,

    [CCode (cname="AV_PROFILE_MPEG2_AAC_LOW")]
    MPEG2_AAC_LOW,

    [CCode (cname="AV_PROFILE_MPEG2_AAC_HE")]
    MPEG2_AAC_HE;
}

} // namespace LibAVCodec
