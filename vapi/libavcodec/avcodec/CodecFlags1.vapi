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
[CCode (cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
public enum LibAVCodec.CodecFlags1 {
    /***********************************************************
    @brief Allow decoders to produce frames with data planes that are not aligned
    to CPU requirements (e.g. due to cropping).
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_UNALIGNED")]
    UNALIGNED,

    /***********************************************************
    @brief Use fixed qscale.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_QSCALE")]
    QSCALE,

    /***********************************************************
    @brief 4 MV per MB allowed / advanced prediction for H.263.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_4MV")]
    @4MV,

    /***********************************************************
    @brief Output even those frames that might be corrupted.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_OUTPUT_CORRUPT")]
    OUTPUT_CORRUPT,

    /***********************************************************
    @brief Use qpel MC.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_QPEL")]
    QPEL,

    /***********************************************************
    Request the encoder to output reconstructed frames, i.e. frames that would
    be produced by decoding the encoded bitstream. These frames may be retrieved
    by calling avcodec_receive_frame () immediately after a successful call to
    avcodec_receive_packet ().

    Should only be used with encoders flagged with the
    @ref AV_CODEC_CAP_ENCODER_RECON_FRAME capability.

    @note
    Each reconstructed frame returned by the encoder corresponds to the last
    encoded packet, i.e. the frames are returned in coded order rather than
    presentation order.

    @note
    Frame parameters (like pixel format or dimensions) do not have to match the
    AVCodecContext values. Make sure to use the values from the returned frame.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_RECON_FRAME")]
    RECONSTRUCTED_FRAMES,

    /***********************************************************
    @par decoding
    Request the decoder to propagate each packet's AVPacket.opaque and
    AVPacket.opaque_ref to its corresponding output AVFrame.

    @par encoding:
    Request the encoder to propagate each frame's AVFrame.opaque and
    AVFrame.opaque_ref values to its corresponding output AVPacket.

    @par
    May only be set on encoders that have the
    @ref AV_CODEC_CAP_ENCODER_REORDERED_OPAQUE capability flag.

    @note
    While in typical cases one input frame produces exactly one output packet
    (perhaps after a delay), in general the mapping of frames to packets is
    M-to-N, so
    - Any number of input frames may be associated with any given output packet.
      This includes zero - e.g. some encoders may output packets that carry only
      metadata about the whole stream.
    - A given input frame may be associated with any number of output packets.
      Again this includes zero - e.g. some encoders may drop frames under certain
      conditions.
    .
    This implies that when using this flag, the caller must NOT assume that
    - a given input frame's opaques will necessarily appear on some output packet;
    - every output packet will have some non-NULL opaque value.
    .
    When an output packet contains multiple frames, the opaque values will be
    taken from the first of those.

    @note
    The converse holds for decoders, with frames and packets switched.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_COPY_OPAQUE")]
    COPY_OPAQUE,

    /***********************************************************
    Signal to the encoder that the values of AVFrame.duration are valid and
    should be used (typically for transferring them to output packets).

    If this flag is not set, frame durations are ignored.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_FRAME_DURATION")]
    FRAME_DURATION,

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
    [CCode (cname="AV_CODEC_FLAG_LOOP_FILTER")]
    LOOP_FILTER,

    /***********************************************************
    @brief Only decode/encode grayscale.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_GRAY")]
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
    [CCode (cname="AV_CODEC_FLAG_TRUNCATED")]
    TRUNCATED,

    /***********************************************************
    @brief Use interlaced DCT.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_INTERLACED_DCT")]
    INTERLACED_DCT,

    /***********************************************************
    @brief Force low delay.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_LOW_DELAY")]
    LOW_DELAY,

    /***********************************************************
    @brief Place global headers in extradata instead of every keyframe.
    ***********************************************************/
    [CCode (cname="AV_CODEC_FLAG_GLOBAL_HEADER")]
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
    [CCode (cname="AV_CODEC_FLAG_INTERLACED_ME")]
    INTERLACED_MOTION_ESTIMATION,

    [CCode (cname="AV_CODEC_FLAG_CLOSED_GOP")]
    CLOSED_GOP;
}

} // namespace LibAVCodec
