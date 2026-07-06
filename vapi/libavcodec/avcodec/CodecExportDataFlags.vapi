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
Exported side data.

These flags can be passed in AVCodecContext.export_side_data before initialization.
***********************************************************/

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
public enum LibAVCodec.CodecExportDataFlags {
    /***********************************************************
    Export motion vectors through frame side data
    ***********************************************************/
    [CCode (cname="AV_CODEC_EXPORT_DATA_MVS")]
    MOTION_VECTORS,

    /***********************************************************
    Export encoder Producer Reference Time through packet side data
    ***********************************************************/
    [CCode (cname="AV_CODEC_EXPORT_DATA_PRFT")]
    PRODUCER_REFERENCE_TIME,

    /***********************************************************
    Decoding only.
    Export the AVVideoEncParams structure through frame side data.
    ***********************************************************/
    [CCode (cname="AV_CODEC_EXPORT_DATA_VIDEO_ENC_PARAMS")]
    VIDEO_ENCODING_PARAMS,

    /***********************************************************
    Decoding only.
    Do not apply film grain, export it instead.
    ***********************************************************/
    [CCode (cname="AV_CODEC_EXPORT_DATA_FILM_GRAIN")]
    FILM_GRAIN,

    /***********************************************************
    Decoding only.
    Do not apply picture enhancement layers, export them instead.
    ***********************************************************/
    [CCode (cname="AV_CODEC_EXPORT_DATA_ENHANCEMENTS")]
    ENHANCEMENTS;
}

} // namespace LibAVCodec
