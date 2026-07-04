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
@@copyright 2001 Fabrice Bellard
***********************************************************/
namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file @ingroup libavc
LibAVCodec external API header
***********************************************************/

/***********************************************************
@addtogroup lavc_decoding
@{
***********************************************************/

[CCode (cname="enum AVCodecConfig",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
public enum CodecConfig {
    /***********************************************************
    AVPixelFormat, terminated by LibAVUtil.PixelFormat.NONE
    ***********************************************************/
    [CCode (cname="AV_CODEC_CONFIG_PIX_FORMAT")]
    PIXEL_FORMAT,

    /***********************************************************
    LibAVUtil.Rational, terminated by {0, 0}
    ***********************************************************/
    [CCode (cname="AV_CODEC_CONFIG_FRAME_RATE")]
    FRAME_RATE,

    /***********************************************************
    int, terminated by 0
    ***********************************************************/
    [CCode (cname="AV_CODEC_CONFIG_SAMPLE_RATE")]
    SAMPLE_RATE,

    /***********************************************************
    LibAVUtil.SampleFormat, terminated by LibAVUtil.SampleFormat.NONE
    ***********************************************************/
    [CCode (cname="AV_CODEC_CONFIG_SAMPLE_FORMAT")]
    SAMPLE_FORMAT,

    /***********************************************************
    AVChannelLayout, terminated by {0}
    ***********************************************************/
    [CCode (cname="AV_CODEC_CONFIG_CHANNEL_LAYOUT")]
    CHANNEL_LAYOUT,

    /***********************************************************
    LibAVUtil.ColorRange, terminated by AVCOL_RANGE_UNSPECIFIED
    ***********************************************************/
    [CCode (cname="AV_CODEC_CONFIG_COLOR_RANGE")]
    COLOR_RANGE,

    /***********************************************************
    LibAVUtil.ColorSpace, terminated by AVCOL_SPC_UNSPECIFIED
    ***********************************************************/
    [CCode (cname="AV_CODEC_CONFIG_COLOR_SPACE")]
    COLOR_SPACE,

    /***********************************************************
    AVAlphaMode, terminated by AVALPHA_MODE_UNSPECIFIED
    ***********************************************************/
    [CCode (cname="AV_CODEC_CONFIG_ALPHA_MODE")]
    ALPHA_MODE;
}

/***********************************************************
@}
***********************************************************/

} // namespace LibAVCodec
