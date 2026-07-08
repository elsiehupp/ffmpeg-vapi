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

/***********************************************************
@file @ingroup libavc
LibAVCodec external API header
***********************************************************/

/***********************************************************
@brief LibAVCodec.Codec.
***********************************************************/
[CCode (cname="struct AVCodec",cheader_filename="subprojects/ffmpeg/libavcodec/codec.h")]
[Compact]
internal class LibAVCodec.Codec {
    /***********************************************************
    @brief Name of the codec implementation.
    The name is globally unique among encoders and among decoders (but an
    encoder and a decoder can share the same name).
    This is the primary way to find a codec from the user perspective.
    ***********************************************************/
    [CCode (cname="name")]
    public string name;

    /***********************************************************
    @brief Descriptive name for the codec, meant to be more human readable than name.
    You should use the NULL_IF_CONFIG_SMALL () macro to define it.
    ***********************************************************/
    [CCode (cname="long_name")]
    public string long_name;

    [CCode (cname="type")]
    public LibAVUtil.MediaType type;

    //  [CCode (cname="id")]
    //  public LibAVCodec.CodecID id;

    /***********************************************************
    @brief LibAVCodec.Codec capabilities
    ***********************************************************/
    [Flags]
    [CCode (cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    internal enum CodecCapabilityFlags {
        /***********************************************************
        @brief Decoder can use draw_horiz_band callback.
        ***********************************************************/
        [CCode (cname="AV_CODEC_CAP_DRAW_HORIZ_BAND")]
        DRAW_HORIZONTAL_BAND,

        /***********************************************************
        @brief LibAVCodec.Codec uses get_buffer () for allocating buffers and supports
        custom allocators. If not set, it might not use get_buffer ()
        at all or use operations that assume the buffer was
        allocated by avcodec_default_get_buffer.
        ***********************************************************/
        [CCode (cname="AV_CODEC_CAP_DR1")]
        DR1,
        TRUNCATED,

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

        NOTE: For encoders implementing the LibAVCodec.Codec.encode2 ()
            function, setting this flag also means that the encoder
            must set the pts and duration for each output packet.
            If this flag is not set, the pts and duration will be
            determined by LibAVCodec from the input frame.
        ***********************************************************/
        DELAY,

        /***********************************************************
        @brief LibAVCodec.Codec can be fed a final frame with a smaller size. This can
        be used to prevent truncation of the last audio samples.
        ***********************************************************/
        SMALL_LAST_FRAME,

        /***********************************************************
        @brief LibAVCodec.Codec can output multiple frames per Packet. Normally
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
        SUBFRAMES,

        /***********************************************************
        @brief LibAVCodec.Codec is experimental and is thus avoided in favor of non-
        experimental encoders.
        ***********************************************************/
        EXPERIMENTAL,

        /***********************************************************
        @brief LibAVCodec.Codec should fill in channel configuration and samplerate
        instead of container.
        ***********************************************************/
        [CCode (cname="AV_CODEC_CAP_CHANNEL_CONF")]
        CHANNEL_CONFIGURATION,

        /***********************************************************
        @brief LibAVCodec.Codec supports frame-level multithreading.
        ***********************************************************/
        FRAME_THREADS,

        /***********************************************************
        @brief LibAVCodec.Codec supports slice-based (or partition-based) multithreading.
        ***********************************************************/
        SLICE_THREADS,

        /***********************************************************
        @brief LibAVCodec.Codec supports changed parameters at any point.
        ***********************************************************/
        PARAMETER_CHANGE,

        /***********************************************************
        @brief LibAVCodec.Codec supports avctx.thread_count == 0 (auto).
        ***********************************************************/
        AUTO_THREADS,

        /***********************************************************
        @brief Audio encoder supports receiving a different number of
        samples in each call.
        ***********************************************************/
        VARIABLE_FRAME_SIZE,

        /***********************************************************
        @brief Decoder is not a preferred choice for probing. This
        indicates that the decoder is not a good choice for probing.
        It could for example be an expensive to spin up hardware
        decoder, or it could simply not provide a lot of useful
        information about the stream. A decoder marked with this
        flag should only be used as last resort choice for probing.
        ***********************************************************/
        AVOID_PROBING,

        /***********************************************************
        @brief LibAVCodec.Codec is intra only.
        ***********************************************************/
        INTRA_ONLY,

        /***********************************************************
        @brief LibAVCodec.Codec is lossless.
        ***********************************************************/
        LOSSLESS,

        /***********************************************************
        @brief LibAVCodec.Codec is backed by a hardware implementation. Typically used
        to identify a non-hwaccel hardware decoder. For information
        about hwaccels, use avcodec_get_hw_config () instead.
        ***********************************************************/
        HARDWARE,

        /***********************************************************
        @brief LibAVCodec.Codec is potentially backed by a hardware implementation,
        but not necessarily. This is used instead of AV_CODEC_CAP_HARDWARE,
        if the implementation provides some sort of internal fallback.
        ***********************************************************/
        HYBRID,

        /***********************************************************
        @brief This codec takes the reordered_opaque field from input
        LibAVUtil.Frame and returns it in the corresponding field in
        LibAVCodec.CodecContext after encoding.
        ***********************************************************/
        ENCODER_REORDERED_OPAQUE;
    }

    /***********************************************************
    @brief LibAVCodec.Codec capabilities.
    ***********************************************************/
    [CCode (cname="capabilities")]
    public CodecCapabilityFlags capabilities;

    /***********************************************************
    @brief Array of supported framerates, or null if any, array is
    terminated by {0,0}
    ***********************************************************/
    [CCode (cname="supported_framerates")]
    public LibAVUtil.Rational[] supported_framerates;

    /***********************************************************
    @brief Array of supported pixel formats, or null if unknown, array
    is terminated by -1
    ***********************************************************/
    [CCode (cname="pix_fmts")]
    public LibAVUtil.PixelFormat[] pix_fmts;

    /***********************************************************
    @brief Array of supported audio samplerates, or null if unknown,
    array is terminated by 0
    ***********************************************************/
    [CCode (cname="supported_samplerates")]
    public int[] supported_samplerates;

    /***********************************************************
    @brief Array of supported sample formats, or null if unknown, array
    is terminated by -1
    ***********************************************************/
    [CCode (cname="sample_fmts")]
    public LibAVUtil.SampleFormat[] sample_fmts;

    /***********************************************************
    @brief Array of support channel layouts, or null if unknown. array
    is terminated by 0
    ***********************************************************/
    [CCode (cname="channel_layouts")]
    public uint64[] channel_layouts;

    /***********************************************************
    @brief Maximum value for lowres supported by the decoder
    ***********************************************************/
    [CCode (cname="max_lowres")]
    public uint8 max_lowres;

    /***********************************************************
    @brief LibAVUtil.Log.Class for the private context
    ***********************************************************/
    //  [CCode (cname="priv_class")]
    public LibAVUtil.Log.Class priv_class;

    /***********************************************************
    @brief Array of recognized profiles, or null if unknown, array is
    terminated by {ProfileType.UNKNOWN}
    ***********************************************************/
    //  [CCode (cname="profiles")]
    //  public  LibAVCodec.Profile[] profiles;

    /***********************************************************
    @brief Group name of the codec implementation.
    This is a short symbolic name of the wrapper backing this codec. A
    wrapper uses some kind of external implementation for the codec, such
    as an external library, or a codec implementation provided by the OS or
    the hardware.
    If this field is null, this is a builtin, LibAVCodec native codec.
    If non-null, this will be the suffix in LibAVCodec.Codec.name in most cases
    (usually LibAVCodec.Codec.name will be of the form "<codec_name>_<wrapper_name>").
    ***********************************************************/
    [CCode (cname="wrapper_name")]
    public string wrapper_name;

    /***********************************************************
    @brief Retrieve supported hardware configurations for a codec.

    Values of index from zero to some maximum return the indexed configuration
    descriptor; all other values return null. If the codec does not support
    any hardware configurations then it will always return null.
    ***********************************************************/
    [CCode (cname="avcodec_get_hw_config",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public LibAVCodec.CodecHardwareConfig avcodec_get_hw_config (
        LibAVCodec.Codec codec,
        int index
    );

    /***********************************************************
    @brief Iterate over all registered codecs.

    @param opaque a pointer where LibAVCodec will store the iteration state. Must
        point to null to start the iteration.

    @return the next registered codec or null when the iteration is
        finished
    ***********************************************************/
    [CCode (cname="av_codec_iterate",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public LibAVCodec.Codec av_codec_iterate (
        out void *opaque
    );

    /***********************************************************
    @brief Find a registered decoder with a matching codec ID.

    @param id LibAVCodec.CodecID of the requested decoder
    @return A decoder if one was found, null otherwise.
    ***********************************************************/
    [CCode (cname="avcodec_find_decoder",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public LibAVCodec.Codec avcodec_find_decoder (
        LibAVCodec.CodecID id
    );

    /***********************************************************
    @brief Find a registered decoder with the specified name.

    @param name name of the requested decoder
    @return A decoder if one was found, null otherwise.
    ***********************************************************/
    [CCode (cname="avcodec_find_decoder_by_name",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public LibAVCodec.Codec avcodec_find_decoder_by_name (
        string name
    );

    /***********************************************************
    @brief Find a registered encoder with a matching codec ID.

    @param id LibAVCodec.CodecID of the requested encoder
    @return An encoder if one was found, null otherwise.
    ***********************************************************/
    [CCode (cname="avcodec_find_encoder",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public LibAVCodec.Codec avcodec_find_encoder (
        LibAVCodec.CodecID id
    );

    /***********************************************************
    @brief Find a registered encoder with the specified name.

    @param name name of the requested encoder
    @return An encoder if one was found, null otherwise.
    ***********************************************************/
    [CCode (cname="avcodec_find_encoder_by_name",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public LibAVCodec.Codec avcodec_find_encoder_by_name (
        string name
    );

    /***********************************************************
    @return a non-zero number if codec is an encoder, zero otherwise
    ***********************************************************/
    [CCode (cname="av_codec_is_encoder",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public int av_codec_is_encoder (
        LibAVCodec.Codec codec
    );

    /***********************************************************
    @return a non-zero number if codec is a decoder, zero otherwise
    ***********************************************************/
    [CCode (cname="av_codec_is_decoder",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public int av_codec_is_decoder (
        LibAVCodec.Codec codec
    );

    /***********************************************************
    @brief Return a name for the specified profile, if available.

    @param codec the codec that is searched for the given profile
    @param profile the profile value for which a name is requested
    @return A name for the profile if found, null otherwise.
    ***********************************************************/
    [CCode (cname="av_get_profile_name",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public string av_get_profile_name (
        LibAVCodec.Codec codec,
        int profile
    );

}

} // namespace LibAVCodec
