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

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
public enum CodecPropertyFlags2 {
    /***********************************************************
    @brief Codec uses only intra compression.
    Video and audio codecs only.
    ***********************************************************/
    [CCode (cname="AV_CODEC_PROP_INTRA_ONLY")]
    INTRA_ONLY_COMPRESSION,

    /***********************************************************
    @brief Codec supports lossy compression. Audio and video codecs only.
    @note a codec may support both lossy and lossless
    compression modes
    ***********************************************************/
    [CCode (cname="AV_CODEC_PROP_LOSSY")]
    LOSSY_COMPRESSION,

    /***********************************************************
    @brief Codec supports lossless compression. Audio and video codecs only.
    ***********************************************************/
    [CCode (cname="AV_CODEC_PROP_LOSSLESS")]
    LOSSLESS_COMPRESSION,

    /***********************************************************
    @brief Codec supports frame reordering. That is, the coded order (the order in which
    the encoded packets are output by the encoders / stored / input to the
    decoders) may be different from the presentation order of the corresponding
    frames.

    For codecs that do not have this property set, PTS and DTS should always be
    equal.
    ***********************************************************/
    [CCode (cname="AV_CODEC_PROP_REORDER")]
    SUPPORTS_FRAME_REORDERING,

    /***********************************************************
    @brief Subtitle codec is bitmap based
    Decoded Subtitle data can be read from the SubtitleRect.pict field.
    ***********************************************************/
    [CCode (cname="AV_CODEC_PROP_BITMAP_SUB")]
    BITMAP_SUBTITLE,

    /***********************************************************
    @brief Subtitle codec is text based.
    Decoded Subtitle data can be read from the SubtitleRect.ass field.
    ***********************************************************/
    [CCode (cname="AV_CODEC_PROP_TEXT_SUB")]
    TEXT_SUBTITLE;
}

} // namespace LibAVCodec
