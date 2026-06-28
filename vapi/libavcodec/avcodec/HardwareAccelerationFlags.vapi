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

[Flags]
[CCode (cprefix="AV_HWACCEL_FLAG_",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
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
    ALLOW_PROFILE_MISMATCH;
}

} // namespace LibAVCodec

/***********************************************************
@defgroup lavc_hwaccel AVHWAccel

@note  Nothing in this structure should be accessed by the user.  At some
       point in future it will not be externally visible at all.

@{
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
/***********************************************************
Hardware acceleration should be used for decoding even if the codec level
used is unknown or higher than the maximum supported level reported by the
hardware driver.

It's generally a good idea to pass this flag unless you have a specific
reason not to, as hardware tends to under-report supported levels.
***********************************************************/
#define AV_HWACCEL_FLAG_IGNORE_LEVEL (1 << 0)

/***********************************************************
Hardware acceleration can output YUV pixel formats with a different chroma
sampling than 4:2:0 and/or other than 8 bits per component.
***********************************************************/
#define AV_HWACCEL_FLAG_ALLOW_HIGH_DEPTH (1 << 1)

/***********************************************************
Hardware acceleration should still be attempted for decoding when the
codec profile does not match the reported capabilities of the hardware.

For example, this can be used to try to decode baseline profile H.264
streams in hardware - it will often succeed, because many streams marked
as baseline profile actually conform to constrained baseline profile.

@warning If the stream is actually not supported then the behaviour is
         undefined, and may include returning entirely incorrect output
         while indicating success.
***********************************************************/
#define AV_HWACCEL_FLAG_ALLOW_PROFILE_MISMATCH (1 << 2)

/***********************************************************
Some hardware decoders (namely nvdec) can either output direct decoder
surfaces, or make an on-device copy and return said copy.
There is a hard limit on how many decoder surfaces there can be, and it
cannot be accurately guessed ahead of time.
For some processing chains, this can be okay, but others will run into the
limit and in turn produce very confusing errors that require fine tuning of
more or less obscure options by the user, or in extreme cases cannot be
resolved at all without inserting an avfilter that forces a copy.

Thus, the hwaccel will by default make a copy for safety and resilience.
If a users really wants to minimize the amount of copies, they can set this
flag and ensure their processing chain does not exhaust the surface pool.
***********************************************************/
#define AV_HWACCEL_FLAG_UNSAFE_OUTPUT (1 << 3)

/***********************************************************
@}
***********************************************************/
