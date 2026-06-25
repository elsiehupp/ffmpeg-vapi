/***********************************************************
Copyright (c) 2012 Justin Ruggles <justin.ruggles@gmail.com>

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/
namespace LibAVResample {

/***********************************************************
@file
@ingroup lavr
external API header
***********************************************************/
/***********************************************************
@defgroup lavr libavresample
@{

Libavresample (lavr) is a library that handles audio resampling, sample
format conversion and mixing.

Interaction with lavr is done through LibAVResample.AudioResampleContext, which is
allocated with avresample_alloc_context (). It is opaque, so all parameters
must be set with the @ref avoptions API.

For example the following code will setup conversion from planar float sample
format to interleaved signed 16-bit integer, downsampling from 48kHz to
44.1kHz and downmixing from 5.1 channels to stereo (using the default mixing
matrix):
@code
LibAVResample.AudioResampleContext? avr = avresample_alloc_context ();
av_opt_set_int (avr, "in_channel_layout", AV_CH_LAYOUT_5POINT1, 0);
av_opt_set_int (avr, "out_channel_layout", AV_CH_LAYOUT_STEREO, 0);
av_opt_set_int (avr, "in_sample_rate", 48000, 0);
av_opt_set_int (avr, "out_sample_rate", 44100, 0);
av_opt_set_int (avr, "in_sample_fmt", AV_SAMPLE_FMT_FLTP, 0);
av_opt_set_int (avr, "out_sample_fmt", AV_SAMPLE_FMT_S16, 0);
@endcode

Once the context is initialized, it must be opened with avresample_open (). If
you need to change the conversion parameters, you must close the context with
avresample_close (), change the parameters as described above, then reopen it
again.

The conversion itself is done by repeatedly calling avresample_convert ().
Note that the samples may get buffered in two places in lavr. The first one
is the output FIFO, where the samples end up if the output buffer is not
large enough. The data stored in there may be retrieved at any time with
avresample_read (). The second place is the resampling delay buffer,
applicable only when resampling is done. The samples in it require more input
before they can be processed. Their current amount is returned by
avresample_get_delay (). At the end of conversion the resampling buffer can be
flushed by calling avresample_convert () with NULL input.

The following code demonstrates the conversion loop assuming the parameters
from above and caller-defined functions get_input () and handle_output ():
@code
uint8[][] input;
public int in_linesize, in_samples;

while (get_input (&input, &in_linesize, &in_samples)) {
    uint8[] output
    int out_linesize;
    int out_samples = avresample_get_out_samples (avr, in_samples);

    av_samples_alloc (&output, &out_linesize, 2, out_samples,
                        AV_SAMPLE_FMT_S16, 0);
    out_samples = avresample_convert (avr, &output, out_linesize, out_samples,
                                        input, in_linesize, in_samples);
    handle_output (output, out_linesize, out_samples);
    av_freep (&output);
    }
@endcode

    When the conversion is finished and the FIFOs are flushed if required, the
    conversion context and everything associated with it must be freed with
    avresample_free ().
***********************************************************/

[CCode (cname="struct AVAudioResampleContext",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
[Compact]
public class LibAVResample.AudioResampleContext {
    /***********************************************************
    LibAVUtil.Class for logging and AVOptions
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVUtil.Class? av_class;

    /***********************************************************
    input channel layout
    ***********************************************************/
    [CCode (cname="")]
    internal uint64 in_channel_layout;

    /***********************************************************
    input sample format
    ***********************************************************/
    [CCode (cname="")]
    internal AVSampleFormat in_sample_fmt;

    /***********************************************************
    input sample rate
    ***********************************************************/
    [CCode (cname="")]
    internal int in_sample_rate;

    /***********************************************************
    output channel layout
    ***********************************************************/
    [CCode (cname="")]
    internal uint64 out_channel_layout;

    /***********************************************************
    output sample format
    ***********************************************************/
    [CCode (cname="")]
    internal AVSampleFormat out_sample_fmt;

    /***********************************************************
    output sample rate
    ***********************************************************/
    [CCode (cname="")]
    internal int out_sample_rate;

    /***********************************************************
    internal internal sample format
    ***********************************************************/
    [CCode (cname="")]
    internal AVSampleFormat internal_sample_fmt;

    /***********************************************************
    mixing coefficient type
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVResample.AudioMixCoeffType mix_coeff_type;

    /***********************************************************
    center mix level
    ***********************************************************/
    [CCode (cname="")]
    internal double center_mix_level;

    /***********************************************************
    surround mix level
    ***********************************************************/
    [CCode (cname="")]
    internal double surround_mix_level;

    /***********************************************************
    lfe mix level
    ***********************************************************/
    [CCode (cname="")]
    internal double lfe_mix_level;

    /***********************************************************
    enable mix level normalization
    ***********************************************************/
    [CCode (cname="")]
    internal int normalize_mix_level;

    /***********************************************************
    force resampling
    ***********************************************************/
    [CCode (cname="")]
    internal int force_resampling;

    /***********************************************************
    length of each FIR filter in the resampling filterbank relative to the cutoff frequency
    ***********************************************************/
    [CCode (cname="")]
    internal int filter_size;

    /***********************************************************
    log2 of the number of entries in the resampling polyphase filterbank
    ***********************************************************/
    [CCode (cname="")]
    internal int phase_shift;

    /***********************************************************
    if 1 then the resampling FIR filter will be linearly interpolated
    ***********************************************************/
    [CCode (cname="")]
    internal int linear_interp;

    /***********************************************************
    resampling cutoff frequency. 1.0 corresponds to half the output sample rate
    ***********************************************************/
    [CCode (cname="")]
    internal double cutoff;

    /***********************************************************
    resampling filter type
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVResample.ResampleFilterType filter_type;

    /***********************************************************
    beta value for Kaiser window (only applicable if filter_type == AV_FILTER_TYPE_KAISER)
    ***********************************************************/
    [CCode (cname="")]
    internal int kaiser_beta;

    /***********************************************************
    dither method
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVResample.ResampleDitherMethod dither_method;

    /***********************************************************
    number of input channels
    ***********************************************************/
    [CCode (cname="")]
    internal int in_channels;

    /***********************************************************
    number of output channels
    ***********************************************************/
    [CCode (cname="")]
    internal int out_channels;

    /***********************************************************
    number of channels used for resampling
    ***********************************************************/
    [CCode (cname="")]
    internal int resample_channels;

    /***********************************************************
    downmixing is needed
    ***********************************************************/
    [CCode (cname="")]
    internal int downmix_needed;

    /***********************************************************
    upmixing is needed
    ***********************************************************/
    [CCode (cname="")]
    internal int upmix_needed;

    /***********************************************************
    either upmixing or downmixing is needed
    ***********************************************************/
    [CCode (cname="")]
    internal int mixing_needed;

    /***********************************************************
    resampling is needed
    ***********************************************************/
    [CCode (cname="")]
    internal int resample_needed;

    /***********************************************************
    input sample format conversion is needed
    ***********************************************************/
    [CCode (cname="")]
    internal int in_convert_needed;

    /***********************************************************
    output sample format conversion is needed
    ***********************************************************/
    [CCode (cname="")]
    internal int out_convert_needed;

    /***********************************************************
    input data copy is needed
    ***********************************************************/
    [CCode (cname="")]
    internal int in_copy_needed;

    /***********************************************************
    buffer for converted input
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVResample.AudioData? in_buffer;

    /***********************************************************
    buffer for output from resampler
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVResample.AudioData? resample_out_buffer;

    /***********************************************************
    buffer for converted output
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVResample.AudioData? out_buffer;

    /***********************************************************
    FIFO for output samples
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVUtil.AudioFifo? out_fifo;

    /***********************************************************
    input sample format conversion context
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVResample.AudioConvert? ac_in;

    /***********************************************************
    output sample format conversion context
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVResample.AudioConvert? ac_out;

    /***********************************************************
    resampling context
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVResample.ResampleContext? resample;

    /***********************************************************
    channel mixing context
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVResample.AudioMix? am;

    /***********************************************************
    matrixed stereo encoding
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVUtil.MatrixEncoding matrix_encoding;

    /***********************************************************
    mix matrix
    only used if avresample_set_matrix () is called before avresample_open ()
    ***********************************************************/
    [CCode (cname="")]
    internal double[] mix_matrix;

    [CCode (cname="")]
    internal int use_channel_map;

    [CCode (cname="")]
    internal LibAVResample.RemapPoint remap_point;

    [CCode (cname="")]
    internal LibAVResample.ChannelMapInfo ch_map_info;

    /***********************************************************
    @file
    @ingroup lavr
    Libavresample version macros.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/version.h")]
    internal const int LIBAVRESAMPLE_VERSION_MAJOR; // 4

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/version.h")]
    internal const int LIBAVRESAMPLE_VERSION_MINOR; // 0

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/version.h")]
    internal const int LIBAVRESAMPLE_VERSION_MICRO; // 0

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/version.h")]
    internal const int LIBAVRESAMPLE_VERSION_INT;
    //  AV_VERSION_INT (
    //      LIBAVRESAMPLE_VERSION_MAJOR,
    //      LIBAVRESAMPLE_VERSION_MINOR,
    //      LIBAVRESAMPLE_VERSION_MICRO
    //  );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/version.h")]
    internal const string LIBAVRESAMPLE_VERSION;
    //  AV_VERSION (
    //      LIBAVRESAMPLE_VERSION_MAJOR,
    //      LIBAVRESAMPLE_VERSION_MINOR,
    //      LIBAVRESAMPLE_VERSION_MICRO
    //  );


    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/version.h")]
    internal const int LIBAVRESAMPLE_BUILD; // LIBAVRESAMPLE_VERSION_INT

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/version.h")]
    internal const string LIBAVRESAMPLE_IDENT; // "Lavr" AV_STRINGIFY (LIBAVRESAMPLE_VERSION)

    /***********************************************************
    FF_API_* defines may be placed below to indicate internal API that will be
    dropped at a future version bump. The defines themselves are not part of
    the internal API and may change, break or disappear at any time.
    ***********************************************************/

    /***********************************************************
    @deprecated use libswresample

    Return the LIBAVRESAMPLE_VERSION_INT constant.
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public uint avresample_version ();

    /***********************************************************
    @deprecated use libswresample

    Return the libavresample build-time configuration.
    @return  configure string
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public string avresample_configuration ();

    /***********************************************************
    @deprecated use libswresample

    Return the libavresample license.
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public string avresample_license ();

    /***********************************************************
    @deprecated use libswresample

    Get the LibAVUtil.Class for LibAVResample.AudioResampleContext.

    Can be used in combination with OptionSearchFlags.FAKE_OBJECT_PARAMETER for examining options
    without allocating a context.

    @see av_opt_find ().

    @return LibAVUtil.Class for LibAVResample.AudioResampleContext
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public LibAVUtil.Class? avresample_get_class ();

    /***********************************************************
    @deprecated use libswresample

    Allocate LibAVResample.AudioResampleContext and set options.

    @return  allocated audio resample context, or NULL on failure
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public LibAVResample.AudioResampleContext? avresample_alloc_context ();

    /***********************************************************
    @deprecated use libswresample

    Initialize LibAVResample.AudioResampleContext.
    @note The context must be configured using the AVOption API.
    @note The fields "in_channel_layout", "out_channel_layout",
          "in_sample_rate", "out_sample_rate", "in_sample_fmt",
          "out_sample_fmt" must be set.

    @see av_opt_set_int ()
    @see av_opt_set_dict ()
    @see av_get_default_channel_layout ()

    @param avr  audio resample context
    @return     0 on success, negative AVERROR code on failure
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public int avresample_open (
        LibAVResample.AudioResampleContext? avr
    );

    /***********************************************************
    @deprecated use libswresample

    Check whether an LibAVResample.AudioResampleContext is open or closed.

    @param avr LibAVResample.AudioResampleContext to check
    @return 1 if avr is open, 0 if avr is closed.
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public int avresample_is_open (
        LibAVResample.AudioResampleContext? avr
    );

    /***********************************************************
    @deprecated use libswresample

    Close LibAVResample.AudioResampleContext.

    This closes the context, but it does not change the parameters. The context
    can be reopened with avresample_open (). It does, however, clear the output
    FIFO and any remaining leftover samples in the resampling delay buffer. If
    there was a custom matrix being used, that is also cleared.

    @see avresample_convert ()
    @see avresample_set_matrix ()

    @param avr  audio resample context
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public void avresample_close (
        LibAVResample.AudioResampleContext? avr
    );

    /***********************************************************
    @deprecated use libswresample

    Free LibAVResample.AudioResampleContext and associated AVOption values.

    This also calls avresample_close () before freeing.

    @param avr  audio resample context
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public void avresample_free (
        LibAVResample.AudioResampleContext **avr
    );

    /***********************************************************
    @deprecated use libswresample

    Generate a channel mixing matrix.

    This function is the one used internally by libavresample for building the
    default mixing matrix. It is made public just as a utility function for
    building custom matrices.

    @param in_layout           input channel layout
    @param out_layout          output channel layout
    @param center_mix_level    mix level for the center channel
    @param surround_mix_level  mix level for the surround channel (s)
    @param lfe_mix_level       mix level for the low-frequency effects channel
    @param normalize           if 1, coefficients will be normalized to prevent
                               overflow. if 0, coefficients will not be
                               normalized.
    @param[out] matrix         mixing coefficients; matrix[i + stride * o] is
                               the weight of input channel i in output channel o.
    @param stride              distance between adjacent input channels in the
                               matrix array
    @param matrix_encoding     matrixed stereo downmix mode (e.g. dplii)
    @return                    0 on success, negative AVERROR code on failure
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public int avresample_build_matrix (
        uint64 in_layout,
        uint64 out_layout,
        double center_mix_level,
        double surround_mix_level,
        double lfe_mix_level,
        int normalize,
        double[] matrix,
        int stride,
        LibAVUtil.MatrixEncoding matrix_encoding
    );

    /***********************************************************
    @deprecated use libswresample

    Get the current channel mixing matrix.

    If no custom matrix has been previously set or the LibAVResample.AudioResampleContext is
    not open, an error is returned.

    @param avr     audio resample context
    @param matrix  mixing coefficients; matrix[i + stride * o] is the weight of
                   input channel i in output channel o.
    @param stride  distance between adjacent input channels in the matrix array
    @return        0 on success, negative AVERROR code on failure
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public int avresample_get_matrix (
        LibAVResample.AudioResampleContext? avr,
        double[] matrix,
        int stride
    );

    /***********************************************************
    @deprecated use libswresample

    Set channel mixing matrix.

    Allows for setting a custom mixing matrix, overriding the default matrix
    generated internally during avresample_open (). This function can be called
    anytime on an allocated context, either before or after calling
    avresample_open (), as long as the channel layouts have been set.
    avresample_convert () always uses the current matrix.
    Calling avresample_close () on the context will clear the current matrix.

    @see avresample_close ()

    @param avr     audio resample context
    @param matrix  mixing coefficients; matrix[i + stride * o] is the weight of
                   input channel i in output channel o.
    @param stride  distance between adjacent input channels in the matrix array
    @return        0 on success, negative AVERROR code on failure
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public int avresample_set_matrix (
        LibAVResample.AudioResampleContext? avr,
        double[] matrix,
        int stride
    );

    /***********************************************************
    @deprecated use libswresample

    Set a customized input channel mapping.

    This function can only be called when the allocated context is not open.
    Also, the input channel layout must have already been set.

    Calling avresample_close () on the context will clear the channel mapping.

    The map for each input channel specifies the channel index in the source to
    use for that particular channel, or -1 to mute the channel. Source channels
    can be duplicated by using the same index for multiple input channels.

    Examples:

    Reordering 5.1 AAC order (C,L,R,Ls,Rs,LFE) to FFmpeg order (L,R,C,LFE,Ls,Rs):
    { 1, 2, 0, 5, 3, 4 }

    Muting the 3rd channel in 4-channel input:
    { 0, 1, -1, 3 }

    Duplicating the left channel of stereo input:
    { 0, 0 }

    @param avr         audio resample context
    @param channel_map customized input channel mapping
    @return            0 on success, negative AVERROR code on failure
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public int avresample_set_channel_mapping (
        LibAVResample.AudioResampleContext? avr,
        int[] channel_map
    );

    /***********************************************************
    @deprecated use libswresample

    Set compensation for resampling.

    This can be called anytime after avresample_open (). If resampling is not
    automatically enabled because of a sample rate conversion, the
    "force_resampling" option must have been set to 1 when opening the context
    in order to use resampling compensation.

    @param avr                    audio resample context
    @param sample_delta           compensation delta, in samples
    @param compensation_distance  compensation distance, in samples
    @return                       0 on success, negative AVERROR code on failure
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public int avresample_set_compensation (
        LibAVResample.AudioResampleContext? avr,
        int sample_delta,
        int compensation_distance
    );

    /***********************************************************
    @deprecated use libswresample

    Provide the upper bound on the number of samples the configured
    conversion would output.

    @param avr           audio resample context
    @param in_nb_samples number of input samples

    @return              number of samples or AVERROR (EINVAL) if the value
                         would exceed int.MAX
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public int avresample_get_out_samples (
        LibAVResample.AudioResampleContext? avr,
        int in_nb_samples
    );

    /***********************************************************
    @deprecated use libswresample

    Convert input samples and write them to the output FIFO.

    The upper bound on the number of output samples can be obtained through
    avresample_get_out_samples ().

    The output data can be NULL or have fewer allocated samples than required.
    In this case, any remaining samples not written to the output will be added
    to an internal FIFO buffer, to be returned at the next call to this function
    or to avresample_read ().

    If converting sample rate, there may be data remaining in the internal
    resampling delay buffer. avresample_get_delay () tells the number of remaining
    samples. To get this data as output, call avresample_convert () with NULL
    input.

    At the end of the conversion process, there may be data remaining in the
    public internal FIFO buffer. avresample_available () tells the number of remaining
    samples. To get this data as output, either call avresample_convert () with
    NULL input or call avresample_read ().

    @see avresample_get_out_samples ()
    @see avresample_read ()
    @see avresample_get_delay ()

    @param avr             audio resample context
    @param output          output data pointers
    @param out_plane_size  output plane size, in bytes.
                           This can be 0 if unknown, but that will lead to
                           optimized functions not being used directly on the
                           output, which could slow down some conversions.
    @param out_samples     maximum number of samples that the output buffer can hold
    @param input           input data pointers
    @param in_plane_size   input plane size, in bytes
                           This can be 0 if unknown, but that will lead to
                           optimized functions not being used directly on the
                           input, which could slow down some conversions.
    @param in_samples      number of input samples to convert
    @return                number of samples written to the output buffer,
                           not including converted samples added to the internal
                           output FIFO
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public int avresample_convert (
        LibAVResample.AudioResampleContext? avr,
        uint8[][] output,
        int out_plane_size,
        int out_samples,
        uint8[]  const? input,
        int in_plane_size,
        int in_samples
    );

    /***********************************************************
    @deprecated use libswresample

    Return the number of samples currently in the resampling delay buffer.

    When resampling, there may be a delay between the input and output. Any
    unconverted samples in each call are stored internally in a delay buffer.
    This function allows the user to determine the current number of samples in
    the delay buffer, which can be useful for synchronization.

    @see avresample_convert ()

    @param avr  audio resample context
    @return     number of samples currently in the resampling delay buffer
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public int avresample_get_delay (
        LibAVResample.AudioResampleContext? avr
    );

    /***********************************************************
    @deprecated use libswresample

    Return the number of available samples in the output FIFO.

    During conversion, if the user does not specify an output buffer or
    specifies an output buffer that is smaller than what is needed, remaining
    samples that are not written to the output are stored to an internal FIFO
    buffer. The samples in the FIFO can be read with avresample_read () or
    avresample_convert ().

    @see avresample_read ()
    @see avresample_convert ()

    @param avr  audio resample context
    @return     number of samples available for reading
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public int avresample_available (
        LibAVResample.AudioResampleContext? avr
    );

    /***********************************************************
    @deprecated use libswresample

    Read samples from the output FIFO.

    During conversion, if the user does not specify an output buffer or
    specifies an output buffer that is smaller than what is needed, remaining
    samples that are not written to the output are stored to an internal FIFO
    buffer. This function can be used to read samples from that internal FIFO.

    @see avresample_available ()
    @see avresample_convert ()

    @param avr         audio resample context
    @param output      output data pointers. May be NULL, in which case
                       nb_samples of data is discarded from output FIFO.
    @param nb_samples  number of samples to read from the FIFO
    @return            the number of samples written to output
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public int avresample_read (
        LibAVResample.AudioResampleContext? avr,
        uint8[][] output,
        int nb_samples
    );

    /***********************************************************
    @deprecated use libswresample

    Convert the samples in the input AVFrame and write them to the output AVFrame.

    Input and output AVFrames must have channel_layout, sample_rate and format set.

    The upper bound on the number of output samples is obtained through
    avresample_get_out_samples ().

    If the output AVFrame does not have the data pointers allocated the nb_samples
    field will be set using avresample_get_out_samples () and av_frame_get_buffer ()
    is called to allocate the frame.

    The output AVFrame can be NULL or have fewer allocated samples than required.
    In this case, any remaining samples not written to the output will be added
    to an internal FIFO buffer, to be returned at the next call to this function
    or to avresample_convert () or to avresample_read ().

    If converting sample rate, there may be data remaining in the internal
    resampling delay buffer. avresample_get_delay () tells the number of
    remaining samples. To get this data as output, call this function or
    avresample_convert () with NULL input.

    At the end of the conversion process, there may be data remaining in the
    public internal FIFO buffer. avresample_available () tells the number of remaining
    samples. To get this data as output, either call this function or
    avresample_convert () with NULL input or call avresample_read ().

    If the LibAVResample.AudioResampleContext configuration does not match the output and
    input AVFrame settings the conversion does not take place and depending on
    which AVFrame is not matching LibAVUtil.ErrorCode.OUTPUT_CHANGED, LibAVUtil.ErrorCode.INPUT_CHANGED
    or LibAVUtil.ErrorCode.OUTPUT_CHANGED|LibAVUtil.ErrorCode.INPUT_CHANGED is returned.

    @see avresample_get_out_samples ()
    @see avresample_available ()
    @see avresample_convert ()
    @see avresample_read ()
    @see avresample_get_delay ()

    @param avr             audio resample context
    @param output          output AVFrame
    @param input           input AVFrame
    @return                0 on success, AVERROR on failure or nonmatching
                           configuration.
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public int avresample_convert_frame (
        LibAVResample.AudioResampleContext? avr,
        AVFrame output,
        AVFrame? input
    );

    /***********************************************************
    @deprecated use libswresample

    Configure or reconfigure the LibAVResample.AudioResampleContext using the information
    provided by the AVFrames.

    The original resampling context is reset even on failure.
    The function calls avresample_close () internally if the context is open.

    @see avresample_open ();
    @see avresample_close ();

    @param avr             audio resample context
    @param out             output AVFrame
    @param in              input AVFrame
    @return                0 on success, AVERROR on failure.
    ***********************************************************/
    //  attribute_deprecated
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public int avresample_config (
        LibAVResample.AudioResampleContext? avr,
        AVFrame? out,
        AVFrame? in
    );

}

} // namespace LibAVResample
