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

[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum CodecHardwareConfigMethod {
    /***********************************************************
    @brief The codec supports this format via the hw_device_ctx interface.

    When selecting this format, CodecContext.hw_device_ctx should
    have been set to a device of the specified type before calling
    avcodec_open2 ().
    ***********************************************************/
    AV_CODEC_HW_CONFIG_METHOD_HW_DEVICE_CTX,
    /***********************************************************
    @brief The codec supports this format via the hw_frames_ctx interface.

    When selecting this format for a decoder,
    CodecContext.hw_frames_ctx should be set to a suitable frames
    context inside the get_format () callback. The frames context
    must have been created on a device of the specified type.
    ***********************************************************/
    AV_CODEC_HW_CONFIG_METHOD_HW_FRAMES_CTX,
    /***********************************************************
    @brief The codec supports this format by some internal method.

    This format can be selected without any additional configuration -
    no device or frames context is required.
    ***********************************************************/
    AV_CODEC_HW_CONFIG_METHOD_INTERNAL,
    /***********************************************************
    @brief The codec supports this format by some ad-hoc method.

    Additional settings and/or function calls are required. See the
    codec-specific documentation for details. (Methods requiring
    this sort of configuration are deprecated and others should be
    used in preference.)
    ***********************************************************/
    AV_CODEC_HW_CONFIG_METHOD_AD_HOC,
}

} // namespace LibAVCodec
