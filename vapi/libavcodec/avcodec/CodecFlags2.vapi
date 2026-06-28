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
    READ_ONLY_FLUSH_NOOP,

    /***********************************************************
    Generate/parse ICC profiles on encode/decode, as appropriate for the type of
    file. No effect on codecs which cannot contain embedded ICC profiles, or
    when compiled without support for lcms2.
    ***********************************************************/
    ICC_PROFILES;
}

} // namespace LibAVCodec















/***********************************************************
@defgroup lavc_core Core functions/structures.
@ingroup libavc

Basic definitions, functions for querying libavcodec capabilities,
allocating core structures, etc.
@{
***********************************************************/

/* Exported side data.
   These flags can be passed in AVCodecContext.export_side_data before initialization.
*/

[Flags]
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
public enum CodecExportDataFlags {}
/***********************************************************
Export motion vectors through frame side data
***********************************************************/
#define AV_CODEC_EXPORT_DATA_MVS         (1 << 0)
/***********************************************************
Export encoder Producer Reference Time through packet side data
***********************************************************/
#define AV_CODEC_EXPORT_DATA_PRFT        (1 << 1)
/***********************************************************
Decoding only.
Export the AVVideoEncParams structure through frame side data.
***********************************************************/
#define AV_CODEC_EXPORT_DATA_VIDEO_ENC_PARAMS (1 << 2)
/***********************************************************
Decoding only.
Do not apply film grain, export it instead.
***********************************************************/
#define AV_CODEC_EXPORT_DATA_FILM_GRAIN (1 << 3)

/***********************************************************
Decoding only.
Do not apply picture enhancement layers, export them instead.
***********************************************************/
#define AV_CODEC_EXPORT_DATA_ENHANCEMENTS (1 << 4)
