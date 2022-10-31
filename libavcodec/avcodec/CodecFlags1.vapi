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
@brief Encoding support

These flags can be passed in CodecContext.flags before initialization.

@note Not everything is supported yet.
***********************************************************/

[Flags]
[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum CodecFlags1 {
    /***********************************************************
    @brief Allow decoders to produce frames with data planes that are not aligned
    to CPU requirements (e.g. due to cropping).
    ***********************************************************/
    AV_CODEC_FLAG_UNALIGNED,
    /***********************************************************
    @brief Use fixed qscale.
    ***********************************************************/
    AV_CODEC_FLAG_QSCALE,
    /***********************************************************
    @brief 4 MV per MB allowed / advanced prediction for H.263.
    ***********************************************************/
    AV_CODEC_FLAG_4MV,
    /***********************************************************
    @brief Output even those frames that might be corrupted.
    ***********************************************************/
    AV_CODEC_FLAG_OUTPUT_CORRUPT,
    /***********************************************************
    @brief Use qpel MC.
    ***********************************************************/
    AV_CODEC_FLAG_QPEL,
    /***********************************************************
    @brief Don't output frames whose parameters differ from first
    decoded frame in stream.
    ***********************************************************/
    AV_CODEC_FLAG_DROPCHANGED,
    /***********************************************************
    @brief Use internal 2pass ratecontrol in first pass mode.
    ***********************************************************/
    AV_CODEC_FLAG_PASS1,
    /***********************************************************
    @brief Use internal 2pass ratecontrol in second pass mode.
    ***********************************************************/
    AV_CODEC_FLAG_PASS2,
    /***********************************************************
    @brief Loop filter.
    ***********************************************************/
    AV_CODEC_FLAG_LOOP_FILTER,
    /***********************************************************
    @brief Only decode/encode grayscale.
    ***********************************************************/
    AV_CODEC_FLAG_GRAY,
    /***********************************************************
    @brief Error[?] variables will be set during encoding.
    ***********************************************************/
    AV_CODEC_FLAG_PSNR,
    /***********************************************************
    @brief Input bitstream might be truncated at a random location
    instead of only at frame boundaries.
    ***********************************************************/
    AV_CODEC_FLAG_TRUNCATED,
    /***********************************************************
    @brief Use interlaced DCT.
    ***********************************************************/
    AV_CODEC_FLAG_INTERLACED_DCT,
    /***********************************************************
    @brief Force low delay.
    ***********************************************************/
    AV_CODEC_FLAG_LOW_DELAY,
    /***********************************************************
    @brief Place global headers in extradata instead of every keyframe.
    ***********************************************************/
    AV_CODEC_FLAG_GLOBAL_HEADER,
    /***********************************************************
    @brief Use only bitexact stuff (except (I)DCT).
    ***********************************************************/
    AV_CODEC_FLAG_BITEXACT,

    /***********************************************************
    @brief Fx : Flag for H.263+ extra options
    ***********************************************************/

    /***********************************************************
    @brief H.263 advanced intra coding / MPEG-4 AC prediction
    ***********************************************************/
    AV_CODEC_FLAG_AC_PRED,
    /***********************************************************
    @brief Interlaced motion estimation
    ***********************************************************/
    AV_CODEC_FLAG_INTERLACED_M,
    AV_CODEC_FLAG_CLOSED_GOP;
}

} // namespace LibAVCodec
