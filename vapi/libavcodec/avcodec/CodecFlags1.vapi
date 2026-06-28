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
@brief Encoding support

These flags can be passed in CodecContext.flags before initialization.

@note Not everything is supported yet.
***********************************************************/

[Flags]
[CCode (cprefix="AV_CODEC_FLAG_",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
public enum CodecFlags1 {
    /***********************************************************
    @brief Allow decoders to produce frames with data planes that are not aligned
    to CPU requirements (e.g. due to cropping).
    ***********************************************************/
    UNALIGNED,

    /***********************************************************
    @brief Use fixed qscale.
    ***********************************************************/
    QSCALE,

    /***********************************************************
    @brief 4 MV per MB allowed / advanced prediction for H.263.
    ***********************************************************/
    4MV,

    /***********************************************************
    @brief Output even those frames that might be corrupted.
    ***********************************************************/
    OUTPUT_CORRUPT,

    /***********************************************************
    @brief Use qpel MC.
    ***********************************************************/
    QPEL,

    /***********************************************************
    @brief Don't output frames whose parameters differ from first
    decoded frame in stream.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_DROPCHANGED")]
    DROP_CHANGED,

    /***********************************************************
    @brief Use internal 2pass ratecontrol in first pass mode.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_PASS1")]
    PASS_1,

    /***********************************************************
    @brief Use internal 2pass ratecontrol in second pass mode.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_PASS2")]
    PASS_2,

    /***********************************************************
    @brief Loop filter.
    ***********************************************************/
    LOOP_FILTER,

    /***********************************************************
    @brief Only decode/encode grayscale.
    ***********************************************************/
    GRAY,

    /***********************************************************
    @brief Error[?] variables will be set during encoding.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_PSNR")]
    PSNR,

    /***********************************************************
    @brief Input bitstream might be truncated at a random location
    instead of only at frame boundaries.
    ***********************************************************/
    TRUNCATED,

    /***********************************************************
    @brief Use interlaced DCT.
    ***********************************************************/
    INTERLACED_DCT,

    /***********************************************************
    @brief Force low delay.
    ***********************************************************/
    LOW_DELAY,

    /***********************************************************
    @brief Place global headers in extradata instead of every keyframe.
    ***********************************************************/
    GLOBAL_HEADER,

    /***********************************************************
    @brief Use only bitexact stuff (except (I)DCT).
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_BITEXACT")]
    BITEXACT,

    /***********************************************************
    @brief Fx : Flag for H.263+ extra options
    ***********************************************************/

    /***********************************************************
    @brief H.263 advanced intra coding / MPEG-4 AC prediction
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_AC_PRED")]
    AC_PREDICTION,

    /***********************************************************
    @brief Interlaced motion estimation
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_INTERLACED_M")]
    INTERLACED_MOTION_ESTIMATION,

    [CCode (cname="AV_CODEC_FLAG_CLOSED_GOP")]
    CLOSED_GOP;
}

} // namespace LibAVCodec
