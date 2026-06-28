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
    public string name;

    /***********************************************************
    @brief Type of codec implemented by the hardware accelerator.

    @see @link LibAVUtil.MediaType
    ***********************************************************/
    [CCode (cname="type")]
    public LibAVUtil.MediaType type;

    /***********************************************************
    @brief Codec implemented by the hardware accelerator.

    @see @link CodecID
    ***********************************************************/
    [CCode (cname="id")]
    public CodecID id;

    /***********************************************************
    @brief Supported pixel format.

    @note Only hardware accelerated formats are supported here.
    ***********************************************************/
    [CCode (cname="pix_fmt")]
    public LibAVUtil.PixelFormat pixel_format;

    /***********************************************************
    @brief Hardware accelerated codec capabilities.

    @see @link HardwareAccelerationCodecCapabilityFlags
    ***********************************************************/
    [CCode (cname="capabilities")]
    public HardwareAccelerationCodecCapabilityFlags capabilities;
}

} // namespace LibAVCodec






/***********************************************************
@defgroup lavc_hwaccel AVHWAccel

@note  Nothing in this structure should be accessed by the user.  At some
       point in future it will not be externally visible at all.

@{
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
typedef struct AVHWAccel {
    /**
     * Name of the hardware accelerated codec.
     * The name is globally unique among encoders and among decoders (but an
     * encoder and a decoder can share the same name).
     */
    const char *name;

    /**
     * Type of codec implemented by the hardware accelerator.
     *
     * See AVMEDIA_TYPE_xxx
     */
    enum AVMediaType type;

    /**
     * Codec implemented by the hardware accelerator.
     *
     * See AV_CODEC_ID_xxx
     */
    enum AVCodecID id;

    /**
     * Supported pixel format.
     *
     * Only hardware accelerated formats are supported here.
     */
    enum AVPixelFormat pix_fmt;

    /**
     * Hardware accelerated codec capabilities.
     * see AV_HWACCEL_CODEC_CAP_*
     */
    int capabilities;
} AVHWAccel;
