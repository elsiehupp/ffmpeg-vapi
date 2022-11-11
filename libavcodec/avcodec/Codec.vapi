/***********************************************************
@copyright 2001 Fabrice Bellard
***********************************************************/
/***********************************************************
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
@file @ingroup libavc
LibAVCodec external API header
***********************************************************/

/***********************************************************
@brief Codec.
***********************************************************/
[CCode (cname="struct AVCodec", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public struct Codec {
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
    [CCode (cname="id")]
    public CodecID id;

    /***********************************************************
    @brief Codec capabilities.
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
    @brief LibAVUtil.Class for the private context
    ***********************************************************/
    //  [CCode (cname="priv_class")]
    public LibAVUtil.Class priv_class;

    /***********************************************************
    @brief Array of recognized profiles, or null if unknown, array is
    terminated by {FF_PROFILE_UNKNOWN}
    ***********************************************************/
    [CCode (cname="profiles")]
    public Profile[] profiles;

    /***********************************************************
    @brief Group name of the codec implementation.
    This is a short symbolic name of the wrapper backing this codec. A
    wrapper uses some kind of external implementation for the codec, such
    as an external library, or a codec implementation provided by the OS or
    the hardware.
    If this field is null, this is a builtin, LibAVCodec native codec.
    If non-null, this will be the suffix in Codec.name in most cases
    (usually Codec.name will be of the form "<codec_name>_<wrapper_name>").
    ***********************************************************/
    [CCode (cname="wrapper_name")]
    public string wrapper_name;

    /***********************************************************
    @brief Retrieve supported hardware configurations for a codec.

    Values of index from zero to some maximum return the indexed configuration
    descriptor; all other values return null. If the codec does not support
    any hardware configurations then it will always return null.
    ***********************************************************/
    [CCode (cname="avcodec_get_hw_config", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public CodecHardwareConfig avcodec_get_hw_config (
        Codec codec,
        int index
    );

    /***********************************************************
    @brief Iterate over all registered codecs.

    @param opaque a pointer where LibAVCodec will store the iteration state. Must
        point to null to start the iteration.

    @return the next registered codec or null when the iteration is
        finished
    ***********************************************************/
    [CCode (cname="av_codec_iterate", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public Codec av_codec_iterate (
        out void *opaque
    );

    /***********************************************************
    @brief Find a registered decoder with a matching codec ID.

    @param id CodecID of the requested decoder
    @return A decoder if one was found, null otherwise.
    ***********************************************************/
    [CCode (cname="avcodec_find_decoder", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public Codec avcodec_find_decoder (
        CodecID id
    );

    /***********************************************************
    @brief Find a registered decoder with the specified name.

    @param name name of the requested decoder
    @return A decoder if one was found, null otherwise.
    ***********************************************************/
    [CCode (cname="avcodec_find_decoder_by_name", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public Codec avcodec_find_decoder_by_name (
        string name
    );

    /***********************************************************
    @brief Find a registered encoder with a matching codec ID.

    @param id CodecID of the requested encoder
    @return An encoder if one was found, null otherwise.
    ***********************************************************/
    [CCode (cname="avcodec_find_encoder", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public Codec avcodec_find_encoder (
        CodecID id
    );

    /***********************************************************
    @brief Find a registered encoder with the specified name.

    @param name name of the requested encoder
    @return An encoder if one was found, null otherwise.
    ***********************************************************/
    [CCode (cname="avcodec_find_encoder_by_name", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public Codec avcodec_find_encoder_by_name (
        string name
    );

    /***********************************************************
    @return a non-zero number if codec is an encoder, zero otherwise
    ***********************************************************/
    [CCode (cname="av_codec_is_encoder", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_codec_is_encoder (
        Codec codec
    );

    /***********************************************************
    @return a non-zero number if codec is a decoder, zero otherwise
    ***********************************************************/
    [CCode (cname="av_codec_is_decoder", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_codec_is_decoder (
        Codec codec
    );

    /***********************************************************
    @brief Return a name for the specified profile, if available.

    @param codec the codec that is searched for the given profile
    @param profile the profile value for which a name is requested
    @return A name for the profile if found, null otherwise.
    ***********************************************************/
    [CCode (cname="av_get_profile_name", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public string av_get_profile_name (
        Codec codec,
        int profile
    );

}

/***********************************************************
@brief Return the LIBAVCODEC_VERSION_INT constant.
***********************************************************/
[CCode (cname="avcodec_version", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public uint avcodec_version ();

/***********************************************************
@brief Return the LibAVCodec build-time configuration.
***********************************************************/
[CCode (cname="avcodec_configuration", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public string avcodec_configuration ();

/***********************************************************
@brief Return the LibAVCodec license.
***********************************************************/
[CCode (cname="avcodec_license", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public string avcodec_license ();

/***********************************************************
@brief Get the LibAVUtil.Class for CodecContext. It can be used in combination with
OptionSearchFlags.FAKE_OBJECT_PARAMETER for examining options.

@see @link av_opt_find ().
***********************************************************/
[CCode (cname="avcodec_get_class", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public LibAVUtil.Class avcodec_get_class ();

} // namespace LibAVCodec
