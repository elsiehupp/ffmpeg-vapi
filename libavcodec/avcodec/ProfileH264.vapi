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
public enum ProfileH264 {
    /***********************************************************
    @note 8+1; constraint_set1_flag
    ***********************************************************/
    FF_PROFILE_H264_CONSTRAINED,
    /***********************************************************
    @note 8+3; constraint_set3_flag
    ***********************************************************/
    FF_PROFILE_H264_INTRA,

    FF_PROFILE_H264_BASELINE,
    FF_PROFILE_H264_CONSTRAINED_BASELINE,
    FF_PROFILE_H264_MAIN,
    FF_PROFILE_H264_EXTENDED,
    FF_PROFILE_H264_HIGH,
    FF_PROFILE_H264_HIGH_10,
    FF_PROFILE_H264_HIGH_10_INTRA,
    FF_PROFILE_H264_MULTIVIEW_HIGH,
    FF_PROFILE_H264_HIGH_422,
    FF_PROFILE_H264_HIGH_422_INTRA,
    FF_PROFILE_H264_STEREO_HIGH,
    FF_PROFILE_H264_HIGH_444,
    FF_PROFILE_H264_HIGH_444_PREDICTIVE,
    FF_PROFILE_H264_HIGH_444_INTRA,
    FF_PROFILE_H264_CAVLC_444,
}

} // namespace LibAVCodec
