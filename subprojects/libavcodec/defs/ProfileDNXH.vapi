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

/***********************************************************
@file @ingroup libavc
Misc types and constants that do not belong anywhere else.
***********************************************************/

[CCode (cheader_filename="subprojects/ffmpeg/libavcodec/defs.h")]
public enum ProfileDNXH {
    [CCode (cname="AV_PROFILE_DNXHD")]
    DNXHD,

    [CCode (cname="AV_PROFILE_DNXHR_LB")]
    DNXHR_LB,

    [CCode (cname="AV_PROFILE_DNXHR_SQ")]
    DNXHR_SQ,

    [CCode (cname="AV_PROFILE_DNXHR_HQ")]
    DNXHR_HQ,

    [CCode (cname="AV_PROFILE_DNXHR_HQX")]
    DNXHR_HQX,

    [CCode (cname="AV_PROFILE_DNXHR_444")]
    DNXHR_444;
}

} // namespace LibAVCodec
