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
[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum PacketFlags {
    /***********************************************************
    @brief The packet contains a keyframe
        ***********************************************************/
    AV_PKT_FLAG_KEY,
    /***********************************************************
    @brief The packet content is corrupted
        ***********************************************************/
    AV_PKT_FLAG_CORRUPT,

    /***********************************************************
    @brief Flag is used to discard packets which are required to maintain valid
    decoder state but are not required for output and should be dropped
    after decoding.
        ***********************************************************/
    AV_PKT_FLAG_DISCARD,
    /***********************************************************
    @brief The packet comes from a trusted source.

    Otherwise-unsafe constructs such as arbitrary pointers to data
    outside the packet may be followed.
        ***********************************************************/
    AV_PKT_FLAG_TRUSTED,
    /***********************************************************
    @brief Flag is used to indicate packets that contain frames that can
    be discarded by the decoder. I.e. Non-reference frames.
        ***********************************************************/
    AV_PKT_FLAG_DISPOSABLE,
}

} // namespace LibAVCodec
