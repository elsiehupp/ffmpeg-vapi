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
@brief This struct describes the properties of an encoded stream.

sizeof (CodecParameters) is not a part of the public ABI, this struct must
be allocated with avcodec_parameters_alloc () and freed with
avcodec_parameters_free ().
***********************************************************/
[CCode (cname="struct AVCodecParameters", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public struct CodecParameters {
    /***********************************************************
    @brief General type of the encoded data.
    ***********************************************************/
    [CCode (cname="codec_type")]
    public LibAVUtil.MediaType codec_type;

    /***********************************************************
    @brief Specific type of the encoded data (the codec used).
    ***********************************************************/
    [CCode (cname="codec_id")]
    public CodecID codec_id;

    /***********************************************************
    @brief Additional information about the codec (corresponds to the AVI FOURCC).
    ***********************************************************/
    [CCode (cname="codec_tag")]
    public uint32 codec_tag;

    /***********************************************************
    @brief Extra binary data needed for initializing the decoder, codec-dependent.

    Must be allocated with av_malloc () and will be freed by
    avcodec_parameters_free (). The allocated size of extradata must be at
    least extradata_size + AV_INPUT_BUFFER_PADDING_SIZE, with the padding
    bytes zeroed.
    ***********************************************************/
    [CCode (cname="extradata")]
    public uint8[] extradata;

    /***********************************************************
    @brief Size of the extradata content in bytes.
    ***********************************************************/
    [CCode (cname="extradata_size")]
    public int extradata_size;

    /***********************************************************
    @brief Pixel format or sample format
    - video: the pixel format, the value corresponds to enum LibAVUtil.PixelFormat.
    - audio: the sample format, the value corresponds to enum LibAVUtil.SampleFormat.
    ***********************************************************/
    [CCode (cname="format")]
    public int format;

    /***********************************************************
    @brief The average bitrate of the encoded data (in bits per second).
    ***********************************************************/
    [CCode (cname="bit_rate")]
    public int64 bit_rate;

    /***********************************************************
    @brief The number of bits per sample in the codedwords.

    This is basically the bitrate per sample. It is mandatory for a bunch of
    formats to actually decode them. It's the number of bits for one sample in
    the actual coded bitstream.

    This could be for example 4 for ADPCM
    For PCM formats this matches bits_per_raw_sample
    Can be 0
    ***********************************************************/
    [CCode (cname="bits_per_coded_sample")]
    public int bits_per_coded_sample;

    /***********************************************************
    @brief This is the number of valid bits in each output sample. If the
    sample format has more bits, the least significant bits are additional
    padding bits, which are always 0. Use right shifts to reduce the sample
    to its actual size. For example, audio formats with 24 bit samples will
    have bits_per_raw_sample set to 24, and format set to LibAVUtil.SampleFormat.SIGNED_32_BIT.
    To get the original sample use "(int32)sample >> 8"."

    For ADPCM this might be 12 or 16 or similar
    Can be 0
    ***********************************************************/
    [CCode (cname="bits_per_raw_sample")]
    public int bits_per_raw_sample;

    /***********************************************************
    @brief Codec-specific bitstream restrictions that the stream conforms to.
    ***********************************************************/
    [CCode (cname="profile")]
    public int profile;

    /***********************************************************
    @brief Codec-specific bitstream restrictions that the stream conforms to.
    ***********************************************************/
    [CCode (cname="level")]
    public int level;

    /***********************************************************
    @brief Video only. The dimensions of the video frame in pixels.
    ***********************************************************/
    [CCode (cname="width")]
    public int width;

    /***********************************************************
    @brief Video only. The dimensions of the video frame in pixels.
    ***********************************************************/
    [CCode (cname="height")]
    public int height;

    /***********************************************************
    @brief Video only. The aspect ratio (width / height) which a single pixel
    should have when displayed.

    When the aspect ratio is unknown / undefined, the numerator should be
    set to 0 (the denominator may have any value).
    ***********************************************************/
    [CCode (cname="sample_aspect_ratio")]
    public LibAVUtil.Rational sample_aspect_ratio;

    /***********************************************************
    @brief Video only. The order of the fields in interlaced video.
    ***********************************************************/
    [CCode (cname="field_order")]
    public FieldOrder field_order;

    /***********************************************************
    @brief Video only. Additional colorspace characteristics.
    ***********************************************************/
    [CCode (cname="color_range")]
    public LibAVUtil.ColorRange color_range;

    /***********************************************************
    @brief Video only. Additional colorspace characteristics.
    ***********************************************************/
    [CCode (cname="color_primaries")]
    public LibAVUtil.ColorPrimaries color_primaries;

    /***********************************************************
    @brief Video only. Additional colorspace characteristics.
    ***********************************************************/
    [CCode (cname="color_trc")]
    public LibAVUtil.ColorTransferCharacteristic color_trc;

    /***********************************************************
    @brief Video only. Additional colorspace characteristics.
    ***********************************************************/
    [CCode (cname="color_space")]
    public LibAVUtil.ColorSpace color_space;

    /***********************************************************
    @brief Video only. Additional colorspace characteristics.
    ***********************************************************/
    [CCode (cname="chroma_location")]
    public LibAVUtil.ChromaLocation chroma_location;

    /***********************************************************
    @brief Video only. Number of delayed frames.
    ***********************************************************/
    [CCode (cname="video_delay")]
    public int video_delay;

    /***********************************************************
    @brief Audio only. The channel layout bitmask. May be 0 if the channel layout is
    unknown or unspecified, otherwise the number of bits set must be equal to
    the channels field.
    ***********************************************************/
    [CCode (cname="channel_layout")]
    public uint64 channel_layout;

    /***********************************************************
    @brief Audio only. The number of audio channels.
    ***********************************************************/
    [CCode (cname="channels")]
    public int channels;

    /***********************************************************
    @brief Audio only. The number of audio samples per second.
    ***********************************************************/
    [CCode (cname="sample_rate")]
    public int sample_rate;

    /***********************************************************
    @brief Audio only. The number of bytes per coded audio frame, required by some
    formats.

    Corresponds to nBlockAlign in WAVEFORMATEX.
    ***********************************************************/
    [CCode (cname="block_align")]
    public int block_align;

    /***********************************************************
    @brief Audio only. Audio frame size, if known. Required by some formats to be static.
    ***********************************************************/
    [CCode (cname="frame_size")]
    public int frame_size;

    /***********************************************************
    @brief Audio only. The amount of padding (in samples) inserted by the encoder at
    the beginning of the audio. I.e. this number of leading decoded samples
    must be discarded by the caller to get the original audio without leading
    padding.
    ***********************************************************/
    [CCode (cname="initial_padding")]
    public int initial_padding;

    /***********************************************************
    @brief Audio only. The amount of padding (in samples) appended by the encoder to
    the end of the audio. I.e. this number of decoded samples must be
    discarded by the caller from the end of the stream to get the original
    audio without any trailing padding.
    ***********************************************************/
    [CCode (cname="trailing_padding")]
    public int trailing_padding;

    /***********************************************************
    @brief Audio only. Number of samples to skip after a discontinuity.
    ***********************************************************/
    [CCode (cname="seek_preroll")]
    public int seek_preroll;

    /***********************************************************
    @brief Allocate a new CodecParameters and set its fields to default values
    (unknown/invalid/0). The returned struct must be freed with
    avcodec_parameters_free ().
    ***********************************************************/
    [CCode (cname="avcodec_parameters_alloc", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public CodecParameters avcodec_parameters_alloc ();

    /***********************************************************
    @brief Free an CodecParameters instance and everything associated with it and
    write null to the supplied pointer.
    ***********************************************************/
    [CCode (cname="avcodec_parameters_free", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void avcodec_parameters_free (
        CodecParameters par
    );

    /***********************************************************
    @brief Copy the contents of input_parameters to output_parameters. Any allocated fields in output_parameters are freed and
    replaced with newly allocated duplicates of the corresponding fields in input_parameters.

    @return >= 0 on success, a negative LibAVUtil.ErrorCode code on failure.
    ***********************************************************/
    [CCode (cname="avcodec_parameters_copy", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int avcodec_parameters_copy (
        CodecParameters output_parameters,
        CodecParameters input_parameters
    );

    /***********************************************************
    @brief Fill the parameters struct based on the values from the supplied codec
    context. Any allocated fields in par are freed and replaced with duplicates
    of the corresponding fields in codec.

    @return >= 0 on success, a negative LibAVUtil.ErrorCode code on failure
    ***********************************************************/
    [CCode (cname="avcodec_parameters_from_context", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int avcodec_parameters_from_context (
        CodecParameters par,
        CodecContext codec
    );

    /***********************************************************
    @brief Fill the codec context based on the values from the supplied codec
    parameters. Any allocated fields in codec that have a corresponding field in
    par are freed and replaced with duplicates of the corresponding field in par.
    Fields in codec that do not have a counterpart in par are not touched.

    @return >= 0 on success, a negative LibAVUtil.ErrorCode code on failure.
    ***********************************************************/
    [CCode (cname="avcodec_parameters_to_context", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int avcodec_parameters_to_context (
        CodecContext codec,
        CodecParameters par
    );

    /***********************************************************
    @brief This function is the same as av_get_audio_frame_duration (), except it works
    with CodecParameters instead of an CodecContext.
    ***********************************************************/
    [CCode (cname="av_get_audio_frame_duration2", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_get_audio_frame_duration2 (
        CodecParameters par,
        int frame_bytes
    );

}

} // namespace LibAVCodec
