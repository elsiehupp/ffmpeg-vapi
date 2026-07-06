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
@defgroup lavc_core Core functions/structures.
@ingroup libavc

Basic definitions, functions for querying libavcodec capabilities,
allocating core structures, etc.
@{
***********************************************************/

/***********************************************************
@brief Unsupported options :
    Syntax Arithmetic coding (SAC)
    Reference Picture Selection
    Independent Segment Decoding
********************************************************/
[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
public enum LibAVCodec.CodecFlags2 {
    /***********************************************************
    @brief Allow non spec compliant speedup tricks.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG2_FAST")]
    FAST,

    /***********************************************************
    @brief Skip bitstream encoding.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG2_NO_OUTPUT")]
    NO_OUTPUT,

    /***********************************************************
    @brief Place global headers at every keyframe instead of in extradata.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG2_LOCAL_HEADER")]
    LOCAL_HEADER,

    /***********************************************************
    @brief Timecode is in drop frame format. DEPRECATED!!!!
    ***********************************************************/
    //  [CCode (cname="AV_CODEC_FLAG2_DROP_FRAME_TIMECODE")]
    //  DROP_FRAME_TIMECODE,

    /***********************************************************
    @brief Input bitstream might be truncated at a packet boundaries
    instead of only at frame boundaries.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG2_CHUNKS")]
    CHUNKS,

    /***********************************************************
    @brief Discard cropping information from SPS.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG2_IGNORE_CROP")]
    IGNORE_CROP,

    /***********************************************************
    @brief Show all frames before the first keyframe
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG2_SHOW_ALL")]
    SHOW_ALL,

    /***********************************************************
    @brief Export motion vectors through frame side data
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG2_EXPORT_MVS")]
    EXPORT_MOTION_VECTORS,

    /***********************************************************
    @brief Do not skip samples and export skip information as frame side data
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG2_SKIP_MANUAL")]
    SKIP_MANUAL,

    /***********************************************************
    @brief Do not reset ASS ReadOrder field on flush (subtitles decoding)
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG2_RO_FLUSH_NOOP")]
    READ_ONLY_FLUSH_NOOP,

    /***********************************************************
    Generate/parse ICC profiles on encode/decode, as appropriate for the type of
    file. No effect on codecs which cannot contain embedded ICC profiles, or
    when compiled without support for lcms2.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG2_ICC_PROFILES")]
    ICC_PROFILES;
}

} // namespace LibAVCodec
