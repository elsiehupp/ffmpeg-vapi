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
@brief Unsupported options :
    Syntax Arithmetic coding (SAC)
    Reference Picture Selection
    Independent Segment Decoding
********************************************************/
[Flags]
[CCode (cprefix="AV_CODEC_FLAG2_",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
public enum CodecFlags2 {
    /***********************************************************
    @brief Allow non spec compliant speedup tricks.
    ***********************************************************/
    FAST,

    /***********************************************************
    @brief Skip bitstream encoding.
    ***********************************************************/
    NO_OUTPUT,

    /***********************************************************
    @brief Place global headers at every keyframe instead of in extradata.
    ***********************************************************/
    LOCAL_HEADER,

    /***********************************************************
    @brief Timecode is in drop frame format. DEPRECATED!!!!
    ***********************************************************/
    //  AV_CODEC_FLAG2_DROP_FRAME_TIMECODE,

    /***********************************************************
    @brief Input bitstream might be truncated at a packet boundaries
    instead of only at frame boundaries.
    ***********************************************************/
    CHUNKS,

    /***********************************************************
    @brief Discard cropping information from SPS.
    ***********************************************************/
    IGNORE_CROP,

    /***********************************************************
    @brief Show all frames before the first keyframe
    ***********************************************************/
    SHOW_ALL,

    /***********************************************************
    @brief Export motion vectors through frame side data
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG2_EXPORT_MVS")]
    EXPORT_MOTION_VECTORS,

    /***********************************************************
    @brief Do not skip samples and export skip information as frame side data
    ***********************************************************/
    SKIP_MANUAL,

    /***********************************************************
    @brief Do not reset ASS ReadOrder field on flush (subtitles decoding)
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG2_RO_FLUSH_NOOP")]
    READ_ONLY_FLUSH_NOOP;
}

} // namespace LibAVCodec
