/***********************************************************
@copyright 2001 Fabrice Bellard
***********************************************************/
/***********************************************************
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
@file @ingroup libavc
LibAVCodec external API header
***********************************************************/

[Flags]
[CCode (cprefix="AV_HWACCEL_FLAG_", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum HardwareAccelerationFlags {
    /***********************************************************
    @brief Hardware acceleration should be used for decoding even if the codec level
    used is unknown or higher than the maximum supported level reported by the
    hardware driver.

    It's generally a good idea to pass this flag unless you have a specific
    reason not to, as hardware tends to under-report supported levels.
    ***********************************************************/
    IGNORE_LEVEL,

    /***********************************************************
    @brief Hardware acceleration can output YUV pixel formats with a different chroma
    sampling than 4:2:0 and/or other than 8 bits per component.
    ***********************************************************/
    ALLOW_HIGH_DEPTH,

    /***********************************************************
    @brief Hardware acceleration should still be attempted for decoding when the
    codec profile does not match the reported capabilities of the hardware.

    For example, this can be used to try to decode baseline profile H.264
    streams in hardware - it will often succeed, because many streams marked
    as baseline profile actually conform to constrained baseline profile.

    @warning If the stream is actually not supported then the behaviour is
        undefined, and may include returning entirely incorrect output
        while indicating success.
    ***********************************************************/
    ALLOW_PROFILE_MISMATCH,
}

} // namespace LibAVCodec
