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

[CCode (cname="struct AVCodecHWConfig", cheader_filename="libavcodec/avcodec.h")]
public struct CodecHardwareConfig {
    /***********************************************************
    @brief A hardware pixel format which the codec can use.
    ***********************************************************/
    [CCode (cname="pix_fmt")]
    public LibAVUtil.PixelFormat pixel_format;

    /***********************************************************
    @brief Bit set of CodecHardwareConfigMethod, describing the possible
    setup methods which can be used with this configuration.
    ***********************************************************/
    [CCode (cname="methods")]
    public CodecHardwareConfigMethod methods;

    /***********************************************************
    @brief The device type associated with the configuration.

    Must be set for AV_CODEC_HW_CONFIG_METHOD_HW_DEVICE_CTX and
    AV_CODEC_HW_CONFIG_METHOD_HW_FRAMES_CTX, otherwise unused.
    ***********************************************************/
    [CCode (cname="device_type")]
    public LibAVUtil.HardwareDeviceType device_type;
}

} // namespace LibAVCodec
