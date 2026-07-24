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
namespace LibAVCodec {

/***********************************************************
@file @ingroup libavc
Misc types and constants that do not belong anywhere else.
***********************************************************/

/***********************************************************
@ingroup lavc_decoding

We leave some space between these for extensions (drop some
keyframes for intra-only or drop just some bidir frames).
***********************************************************/
[CCode (cname="enum AVDiscard",cprefix="AVDISCARD_",cheader_filename="subprojects/ffmpeg/libavcodec/defs.h")]
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
    [CCode (cname="AVDISCARD_NONREF")]
    NON_REFERENCE,

    /***********************************************************
    @brief Discard all bidirectional frames
    ***********************************************************/
    [CCode (cname="AVDISCARD_BIDIR")]
    BIDIRECTIONAL,

    /***********************************************************
    @brief Discard all non intra frames
    ***********************************************************/
    [CCode (cname="AVDISCARD_NONINTRA")]
    NON_INTRA,

    /***********************************************************
    @brief Discard all frames except keyframes
    ***********************************************************/
    [CCode (cname="AVDISCARD_NONKEY")]
    NON_KEY,

    /***********************************************************
    @brief Discard all
    ***********************************************************/
    ALL;
}

} // namespace LibAVCodec
