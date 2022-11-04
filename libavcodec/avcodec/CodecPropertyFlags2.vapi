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

[Flags]
[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum CodecPropertyFlags2 {
    /***********************************************************
    @brief Codec uses only intra compression.
    Video and audio codecs only.
    ***********************************************************/
    AV_CODEC_PROP_INTRA_ONLY,
    /***********************************************************
    @brief Codec supports lossy compression. Audio and video codecs only.
    @note a codec may support both lossy and lossless
    compression modes
    ***********************************************************/
    AV_CODEC_PROP_LOSSY,
    /***********************************************************
    @brief Codec supports lossless compression. Audio and video codecs only.
    ***********************************************************/
    AV_CODEC_PROP_LOSSLESS,
    /***********************************************************
    @brief Codec supports frame reordering. That is, the coded order (the order in which
    the encoded packets are output by the encoders / stored / input to the
    decoders) may be different from the presentation order of the corresponding
    frames.

    For codecs that do not have this property set, PTS and DTS should always be
    equal.
    ***********************************************************/
    AV_CODEC_PROP_REORDER,
    /***********************************************************
    @brief Subtitle codec is bitmap based
    Decoded Subtitle data can be read from the SubtitleRect.pict field.
    ***********************************************************/
    AV_CODEC_PROP_BITMAP_SUB,
    /***********************************************************
    @brief Subtitle codec is text based.
    Decoded Subtitle data can be read from the SubtitleRect.ass field.
    ***********************************************************/
    AV_CODEC_PROP_TEXT_SUB,
}

} // namespace LibAVCodec
