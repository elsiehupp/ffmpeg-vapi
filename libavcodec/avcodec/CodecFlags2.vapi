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

/***********************************************************
@brief Unsupported options :
    Syntax Arithmetic coding (SAC)
    Reference Picture Selection
    Independent Segment Decoding
********************************************************/
[Flags]
[CCode (cprefix="", cheader_filename="libavcodec/avcodec.h")]
public enum CodecFlags2 {
    /***********************************************************
    @brief Allow non spec compliant speedup tricks.
    ***********************************************************/
    AV_CODEC_FLAG2_FAST,
    /***********************************************************
    @brief Skip bitstream encoding.
    ***********************************************************/
    AV_CODEC_FLAG2_NO_OUTPUT,
    /***********************************************************
    @brief Place global headers at every keyframe instead of in extradata.
    ***********************************************************/
    AV_CODEC_FLAG2_LOCAL_HEADER,

    /***********************************************************
    @brief Timecode is in drop frame format. DEPRECATED!!!!
    ***********************************************************/
    //  AV_CODEC_FLAG2_DROP_FRAME_TIMECODE,

    /***********************************************************
    @brief Input bitstream might be truncated at a packet boundaries
    instead of only at frame boundaries.
    ***********************************************************/
    AV_CODEC_FLAG2_CHUNKS,
    /***********************************************************
    @brief Discard cropping information from SPS.
    ***********************************************************/
    AV_CODEC_FLAG2_IGNORE_CROP,

    /***********************************************************
    @brief Show all frames before the first keyframe
    ***********************************************************/
    AV_CODEC_FLAG2_SHOW_ALL,
    /***********************************************************
    @brief Export motion vectors through frame side data
    ***********************************************************/
    AV_CODEC_FLAG2_EXPORT_MVS,
    /***********************************************************
    @brief Do not skip samples and export skip information as frame side data
    ***********************************************************/
    AV_CODEC_FLAG2_SKIP_MANUAL,
    /***********************************************************
    @brief Do not reset ASS ReadOrder field on flush (subtitles decoding)
    ***********************************************************/
    AV_CODEC_FLAG2_RO_FLUSH_NOOP,
}

} // namespace LibAVCodec
