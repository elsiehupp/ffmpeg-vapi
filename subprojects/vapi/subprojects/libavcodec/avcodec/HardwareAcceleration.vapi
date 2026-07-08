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

/***********************************************************
@file @ingroup libavc
LibAVCodec external API header
***********************************************************/

/***********************************************************
@defgroup lavc_hwaccel HardwareAcceleration

@note Nothing in this structure should be accessed by the user. At some
       point in future it will not be externally visible at all.
***********************************************************/
[CCode (cname="struct AVHWAccel",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
[Compact]
public class HardwareAcceleration {
    /***********************************************************
    @brief Name of the hardware accelerated codec.
    The name is globally unique among encoders and among decoders (but an
    encoder and a decoder can share the same name).
    ***********************************************************/
    [CCode (cname="name")]
    internal string name;

    /***********************************************************
    @brief Type of codec implemented by the hardware accelerator.

    @see @link LibAVUtil.MediaType
    ***********************************************************/
    [CCode (cname="type")]
    internal LibAVUtil.MediaType type;

    /***********************************************************
    @brief Codec implemented by the hardware accelerator.

    @see @link LibAVCodec.CodecID
    ***********************************************************/
    [CCode (cname="id")]
    internal LibAVCodec.CodecID id;

    /***********************************************************
    @brief Supported pixel format.

    @note Only hardware accelerated formats are supported here.
    ***********************************************************/
    [CCode (cname="pix_fmt")]
    internal LibAVUtil.PixelFormat pixel_format;

    /***********************************************************
    @brief Hardware accelerated codec capabilities.

    @see @link HardwareAccelerationCodecCapabilityFlags
    ***********************************************************/
    [CCode (cname="capabilities")]
    internal HardwareAccelerationCodecCapabilityFlags capabilities;
}

} // namespace LibAVCodec
