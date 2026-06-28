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

[CCode (cprefix="AV_PROFILE_PRORES_",cheader_filename="subprojects/ffmpeg/libavcodec/defs.h")]
public enum ProfileProRes {
    PROXY,

    [CCode (cname="AV_PROFILE_PRORES_LT")]
    LT,
    STANDARD,

    [CCode (cname="AV_PROFILE_PRORES_HQ")]
    HQ,
    @4444,

    [CCode (cname="AV_PROFILE_PRORES_XQ")]
    XQ;
}

} // namespace LibAVCodec

[CCode (cprefix="",cheader_filename="subprojects/ffmpeg/libavcodec/defs.h")]
public enum FooBar {
    AV_PROFILE_PRORES_PROXY, // 0
    AV_PROFILE_PRORES_LT, // 1
    AV_PROFILE_PRORES_STANDARD, // 2
    AV_PROFILE_PRORES_HQ, // 3
    AV_PROFILE_PRORES_4444, // 4
    AV_PROFILE_PRORES_XQ; // 5
}

[CCode (cprefix="",cheader_filename="subprojects/ffmpeg/libavcodec/defs.h")]
public enum FooBar {
    AV_PROFILE_PRORES_RAW, // 0
    AV_PROFILE_PRORES_RAW_HQ; // 1
}
