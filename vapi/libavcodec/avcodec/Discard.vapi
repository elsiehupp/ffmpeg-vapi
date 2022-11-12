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
@ingroup lavc_decoding

We leave some space between these for extensions (drop some
keyframes for intra-only or drop just some bidir frames).
***********************************************************/
[CCode (cname="AVDiscard", cprefix="AVDISCARD_", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum Discard {
    /***********************************************************
    @brief Discard nothing
        ***********************************************************/
    NONE,
    /***********************************************************
    @brief Discard useless packets like 0 size packets in avi
        ***********************************************************/
    DEFAULT,
    /***********************************************************
    @brief Discard all non reference
        ***********************************************************/
    NONREF,
    /***********************************************************
    @brief Discard all bidirectional frames
        ***********************************************************/
    BIDIR,
    /***********************************************************
    @brief Discard all non intra frames
        ***********************************************************/
    NONINTRA,
    /***********************************************************
    @brief Discard all frames except keyframes
        ***********************************************************/
    NONKEY,
    /***********************************************************
    @brief Discard all
        ***********************************************************/
    ALL,
}

} // namespace LibAVCodec
