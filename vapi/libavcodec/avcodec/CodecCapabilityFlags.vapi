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
@brief Codec capabilities
***********************************************************/
[Flags]
[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum CodecCapabilityFlags {
    /***********************************************************
    @brief Decoder can use draw_horiz_band callback.
    ***********************************************************/
    AV_CODEC_CAP_DRAW_HORIZ_BAND,
    /***********************************************************
    @brief Codec uses get_buffer () for allocating buffers and supports
    custom allocators. If not set, it might not use get_buffer ()
    at all or use operations that assume the buffer was
    allocated by avcodec_default_get_buffer.
    ***********************************************************/
    AV_CODEC_CAP_DR1,
    AV_CODEC_CAP_TRUNCATED,
    /***********************************************************
    @brief Encoder or decoder requires flushing with null input at the
    end in order to give the complete and correct output.

    NOTE: If this flag is not set, the codec is guaranteed to
        never be fed with with null data. The user can still
        send null data to the public encode or decode function,
        but LibAVCodec will not pass it along to the codec
        unless this flag is set.

    Decoders:
    The decoder has a non-zero delay and needs to be fed with
    avpkt.data=null, avpkt.size=0 at the end to get the
    delayed data until the decoder no longer returns frames.

    Encoders:
    The encoder needs to be fed with null data at the end of
    encoding until the encoder no longer returns data.

    NOTE: For encoders implementing the Codec.encode2 ()
        function, setting this flag also means that the encoder
        must set the pts and duration for each output packet.
        If this flag is not set, the pts and duration will be
        determined by LibAVCodec from the input frame.
    ***********************************************************/
    AV_CODEC_CAP_DELAY,
    /***********************************************************
    @brief Codec can be fed a final frame with a smaller size. This can
    be used to prevent truncation of the last audio samples.
    ***********************************************************/
    AV_CODEC_CAP_SMALL_LAST_FRAME,

    /***********************************************************
    @brief Codec can output multiple frames per Packet. Normally
    demuxers return one frame at a time, demuxers which do not do
    are connected to a parser to split what they return into
    proper frames. This flag is reserved to the very rare
    category of codecs which have a bitstream that cannot be
    split into frames without timeconsuming operations like full
    decoding. Demuxers carrying such bitstreams thus may return
    multiple frames in a packet. This has many disadvantages
    like prohibiting stream copy in many cases thus it should
    only be considered as a last resort.
    ***********************************************************/
    AV_CODEC_CAP_SUBFRAMES,
    /***********************************************************
    @brief Codec is experimental and is thus avoided in favor of non-
    experimental encoders.
    ***********************************************************/
    AV_CODEC_CAP_EXPERIMENTAL,
    /***********************************************************
    @brief Codec should fill in channel configuration and samplerate
    instead of container.
    ***********************************************************/
    AV_CODEC_CAP_CHANNEL_CONF,
    /***********************************************************
    @brief Codec supports frame-level multithreading.
    ***********************************************************/
    AV_CODEC_CAP_FRAME_THREADS,
    /***********************************************************
    @brief Codec supports slice-based (or partition-based) multithreading.
    ***********************************************************/
    AV_CODEC_CAP_SLICE_THREADS,
    /***********************************************************
    @brief Codec supports changed parameters at any point.
    ***********************************************************/
    AV_CODEC_CAP_PARAM_CHANGE,
    /***********************************************************
    @brief Codec supports avctx.thread_count == 0 (auto).
    ***********************************************************/
    AV_CODEC_CAP_AUTO_THREADS,
    /***********************************************************
    @brief Audio encoder supports receiving a different number of
    samples in each call.
    ***********************************************************/
    AV_CODEC_CAP_VARIABLE_FRAME_SIZE,
    /***********************************************************
    @brief Decoder is not a preferred choice for probing. This
    indicates that the decoder is not a good choice for probing.
    It could for example be an expensive to spin up hardware
    decoder, or it could simply not provide a lot of useful
    information about the stream. A decoder marked with this
    flag should only be used as last resort choice for probing.
    ***********************************************************/
    AV_CODEC_CAP_AVOID_PROBING,
    /***********************************************************
    @brief Codec is intra only.
    ***********************************************************/
    AV_CODEC_CAP_INTRA_ONLY,
    /***********************************************************
    @brief Codec is lossless.
    ***********************************************************/
    AV_CODEC_CAP_LOSSLESS,

    /***********************************************************
    @brief Codec is backed by a hardware implementation. Typically used
    to identify a non-hwaccel hardware decoder. For information
    about hwaccels, use avcodec_get_hw_config () instead.
    ***********************************************************/
    AV_CODEC_CAP_HARDWARE,

    /***********************************************************
    @brief Codec is potentially backed by a hardware implementation,
    but not necessarily. This is used instead of AV_CODEC_CAP_HARDWARE,
    if the implementation provides some sort of internal fallback.
    ***********************************************************/
    AV_CODEC_CAP_HYBRID,

    /***********************************************************
    @brief This codec takes the reordered_opaque field from input
    LibAVUtil.Frame and returns it in the corresponding field in
    CodecContext after encoding.
    ***********************************************************/
    AV_CODEC_CAP_ENCODER_REORDERED_OPAQUE;
}

} // namespace LibAVCodec
