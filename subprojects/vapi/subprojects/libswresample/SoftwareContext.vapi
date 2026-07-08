/***********************************************************
Copyright (C) 2011-2013 Michael Niedermayer (michaelni@gmx.at)

This file is part of libswresample

libswresample is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

libswresample is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with libswresample; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/
namespace LibSoftwareResample {

/***********************************************************
@defgroup lswr libswresample
@{

Audio resampling, sample format conversion and mixing library.

Interaction with lswr is done through LibSoftwareResample.SoftwareContext, which is
allocated with swr_alloc () or swr_alloc_set_opts (). It is opaque, so all parameters
must be set with the @ref avoptions API.

The first thing you will need to do in order to use lswr is to allocate
LibSoftwareResample.SoftwareContext. This can be done with swr_alloc () or swr_alloc_set_opts (). If you
are using the former, you must set options through the @ref avoptions API.
The latter function provides the same feature, but it allows you to set some
common options in the same statement.

For example the following code will setup conversion from planar float sample
format to interleaved signed 16-bit integer, downsampling from 48kHz to
44.1kHz and downmixing from 5.1 channels to stereo (using the default mixing
matrix). This is using the swr_alloc () function.
@code
LibSoftwareResample.SoftwareContext? swr = swr_alloc ();
av_opt_set_channel_layout (swr, "in_channel_layout", AV_CH_LAYOUT_5POINT1, 0);
av_opt_set_channel_layout (swr, "out_channel_layout", AV_CH_LAYOUT_STEREO, 0);
av_opt_set_int (swr, "in_sample_rate", 48000, 0);
av_opt_set_int (swr, "out_sample_rate", 44100, 0);
av_opt_set_sample_fmt (swr, "in_sample_fmt", LibAVUtil.SampleFormat.FLOAT_PLANAR, 0);
av_opt_set_sample_fmt (swr, "out_sample_fmt", LibAVUtil.SampleFormat.SIGNED_16_BIT, 0);
@endcode

The same job can be done using swr_alloc_set_opts () as well:
@code
LibSoftwareResample.SoftwareContext? swr = swr_alloc_set_opts (NULL, // we're allocating a new context
                        AV_CH_LAYOUT_STEREO, // out_ch_layout
                        LibAVUtil.SampleFormat.SIGNED_16_BIT, // out_sample_fmt
                        44100, // out_sample_rate
                        AV_CH_LAYOUT_5POINT1, // in_ch_layout
                        LibAVUtil.SampleFormat.FLOAT_PLANAR, // in_sample_fmt
                        48000, // in_sample_rate
                        0, // log_offset
                        NULL); // log_ctx
@endcode

Once all values have been set, it must be initialized with swr_init (). If
you need to change the conversion parameters, you can change the parameters
using @ref AVOptions, as described above in the first example; or by using
swr_alloc_set_opts (), but with the first argument the allocated context.
You must then call swr_init () again.

The conversion itself is done by repeatedly calling swr_convert ().
Note that the samples may get buffered in swr if you provide insufficient
output space or if sample rate conversion is done, which requires "future"
samples. Samples that do not require future input can be retrieved at any
time by using swr_convert () (in_count can be set to 0).
At the end of conversion the resampling buffer can be flushed by calling
swr_convert () with NULL in and 0 in_count.

The samples used in the conversion process can be managed with the libavutil
@ref lavu_sampmanip "samples manipulation" API, including av_samples_alloc ()
function used in the following example.

The delay between input and output, can at any time be found by using
swr_get_delay ().

The following code demonstrates the conversion loop assuming the parameters
from above and caller-defined functions get_input () and handle_output ():
@code
uint8[][] input;
public int in_samples;

while (get_input (&input, &in_samples)) {
    uint8[] output;
    public int out_samples = av_rescale_rnd (swr_get_delay (swr, 48000) +
                                        in_samples, 44100, 48000, AV_ROUND_UP);
    av_samples_alloc (&output, NULL, 2, out_samples,
                        LibAVUtil.SampleFormat.SIGNED_16_BIT, 0);
    out_samples = swr_convert (
        swr, &output, out_samples,
        input, in_samples
    );
    handle_output (output, out_samples);
    av_freep (&output);
}
@endcode

When the conversion is finished, the conversion
context and everything associated with it must be freed with swr_free ().
A swr_close () function is also available, but it exists mainly for
compatibility with libavresample, and is not required to be called.

There will be no memory leak if the data is not completely flushed before
swr_free ().
***********************************************************/

/***********************************************************
The libswresample context. Unlike libavcodec and libavformat, this structure
is opaque. This means that if you would like to set options, you must use
the @ref avoptions API and cannot directly set values to members of the
structure.
***********************************************************/
[CCode (cname="struct SwrContext",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
[Compact]
public class LibSoftwareResample.SoftwareContext {
    /***********************************************************
    LibAVUtil.Log.Class used for LibAVUtil.Option and av_log ()
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVUtil.Log.Class? av_class;

    /***********************************************************
    logging level offset
    ***********************************************************/
    [CCode (cname="")]
    internal int log_level_offset;

    /***********************************************************
    parent logging context
    ***********************************************************/
    [CCode (cname="")]
    internal void *log_ctx;

    /***********************************************************
    input sample format
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVUtil.SampleFormat in_sample_fmt;

    /***********************************************************
    internal internal sample format (LibAVUtil.SampleFormat.FLOAT_PLANAR or LibAVUtil.SampleFormat.SIGNED_16_BIT_PLANAR)
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVUtil.SampleFormat int_sample_fmt;

    /***********************************************************
    output sample format
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVUtil.SampleFormat out_sample_fmt;

    /***********************************************************
    input channel layout
    ***********************************************************/
    [CCode (cname="")]
    internal int64 in_ch_layout;

    /***********************************************************
    output channel layout
    ***********************************************************/
    [CCode (cname="")]
    internal int64 out_ch_layout;

    /***********************************************************
    input sample rate
    ***********************************************************/
    [CCode (cname="")]
    internal int in_sample_rate;

    /***********************************************************
    output sample rate
    ***********************************************************/
    [CCode (cname="")]
    internal int out_sample_rate;

    /***********************************************************
    miscellaneous flags such as SoftwareResampleFlags.FORCE_RESAMPLE
    ***********************************************************/
    [CCode (cname="")]
    internal int flags;

    /***********************************************************
    surround mixing level
    ***********************************************************/
    [CCode (cname="")]
    internal float slev;

    /***********************************************************
    center mixing level
    ***********************************************************/
    [CCode (cname="")]
    internal float clev;

    /***********************************************************
    LFE mixing level
    ***********************************************************/
    [CCode (cname="")]
    internal float lfe_mix_level;

    /***********************************************************
    rematrixing volume coefficient
    ***********************************************************/
    [CCode (cname="")]
    internal float rematrix_volume;

    /***********************************************************
    maximum value for rematrixing output
    ***********************************************************/
    [CCode (cname="")]
    internal float rematrix_maxval;

    /***********************************************************
    matrixed stereo encoding
    ***********************************************************/
    [CCode (cname="")]
    internal int matrix_encoding;

    /***********************************************************
    channel index (or -1 if muted channel) map
    ***********************************************************/
    [CCode (cname="")]
    internal int[] channel_map;

    /***********************************************************
    number of used input channels (mapped channel count if channel_map, otherwise in.ch_count)
    ***********************************************************/
    [CCode (cname="")]
    internal int used_ch_count;

    [CCode (cname="")]
    internal int engine;

    /***********************************************************
    User set input channel count
    ***********************************************************/
    [CCode (cname="")]
    internal int user_in_ch_count;

    /***********************************************************
    User set output channel count
    ***********************************************************/
    [CCode (cname="")]
    internal int user_out_ch_count;

    /***********************************************************
    User set used channel count
    ***********************************************************/
    [CCode (cname="")]
    internal int user_used_ch_count;

    /***********************************************************
    User set input channel layout
    ***********************************************************/
    [CCode (cname="")]
    internal int64 user_in_ch_layout;

    /***********************************************************
    User set output channel layout
    ***********************************************************/
    [CCode (cname="")]
    internal int64 user_out_ch_layout;

    /***********************************************************
    User set internal sample format
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVUtil.SampleFormat user_int_sample_fmt;

    /***********************************************************
    User set dither method
    ***********************************************************/
    [CCode (cname="")]
    internal int user_dither_method;

    [CCode (cname="")]
    internal LibSoftwareResample.DitherContext dither;

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
    if 1 then enable non power of 2 phase_count
    ***********************************************************/
    [CCode (cname="")]
    internal int exact_rational;

    /***********************************************************
    resampling cutoff frequency (swr: 6dB point; soxr: 0dB point). 1.0 corresponds to half the output sample rate
    ***********************************************************/
    [CCode (cname="")]
    internal double cutoff;

    /***********************************************************
    swr resampling filter type
    ***********************************************************/
    [CCode (cname="")]
    internal int filter_type;

    /***********************************************************
    swr beta value for Kaiser window (only applicable if filter_type == AV_FILTER_TYPE_KAISER)
    ***********************************************************/
    [CCode (cname="")]
    internal double kaiser_beta;

    /***********************************************************
    soxr resampling precision (in bits)
    ***********************************************************/
    [CCode (cname="")]
    internal double precision;

    /***********************************************************
    soxr: if 1 then passband rolloff will be none (Chebyshev) & irrational ratio approximation precision will be higher
    ***********************************************************/
    [CCode (cname="")]
    internal int cheby;

    /***********************************************************
    swr minimum below which no compensation will happen
    ***********************************************************/
    [CCode (cname="")]
    internal float min_compensation;

    /***********************************************************
    swr minimum below which no silence inject / sample drop will happen
    ***********************************************************/
    [CCode (cname="")]
    internal float min_hard_compensation;

    /***********************************************************
    swr duration over which soft compensation is applied
    ***********************************************************/
    [CCode (cname="")]
    internal float soft_compensation_duration;

    /***********************************************************
    swr maximum soft compensation in seconds over soft_compensation_duration
    ***********************************************************/
    [CCode (cname="")]
    internal float max_soft_compensation;

    /***********************************************************
    swr simple 1 parameter async, similar to ffmpegs -async
    ***********************************************************/
    [CCode (cname="")]
    internal float async;

    /***********************************************************
    swr first pts in samples
    ***********************************************************/
    [CCode (cname="")]
    internal int64 firstpts_in_samples;

    /***********************************************************
    1 if resampling must come first, 0 if rematrixing
    ***********************************************************/
    [CCode (cname="")]
    internal int resample_first;

    /***********************************************************
    flag to indicate if rematrixing is needed (basically if input and output layouts mismatch)
    ***********************************************************/
    [CCode (cname="")]
    internal int rematrix;

    /***********************************************************
    flag to indicate that a custom matrix has been defined
    ***********************************************************/
    [CCode (cname="")]
    internal int rematrix_custom;

    /***********************************************************
    input audio data
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareResample.AudioData in;

    /***********************************************************
    post-input audio data: used for rematrix/resample
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareResample.AudioData postin;

    /***********************************************************
    internal intermediate audio data (postin/preout)
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareResample.AudioData midbuf;

    /***********************************************************
    pre-output audio data: used for rematrix/resample
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareResample.AudioData preout;

    /***********************************************************
    converted output audio data
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareResample.AudioData out;

    /***********************************************************
    cached audio data (convert and resample purpose)
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareResample.AudioData in_buffer;

    /***********************************************************
    temporary with silence
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareResample.AudioData silence;

    /***********************************************************
    temporary used to discard output
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareResample.AudioData drop_temp;

    /***********************************************************
    cached buffer position
    ***********************************************************/
    [CCode (cname="")]
    internal int in_buffer_index;

    /***********************************************************
    cached buffer length
    ***********************************************************/
    [CCode (cname="")]
    internal int in_buffer_count;

    /***********************************************************
    1 if the input end was reach before the output end, 0 otherwise
    ***********************************************************/
    [CCode (cname="")]
    internal int resample_in_constraint;

    /***********************************************************
    1 if data is to be flushed and no further input is expected
    ***********************************************************/
    [CCode (cname="")]
    internal int flushed;

    /***********************************************************
    output PTS
    ***********************************************************/
    [CCode (cname="")]
    internal int64 outpts;

    /***********************************************************
    first PTS
    ***********************************************************/
    [CCode (cname="")]
    internal int64 firstpts;

    /***********************************************************
    number of output samples to drop
    ***********************************************************/
    [CCode (cname="")]
    internal int drop_output;

    /***********************************************************
    soxr 0.1.1: needed to fixup delayed_samples after flush has been called.
    ***********************************************************/
    [CCode (cname="")]
    internal double delayed_samples_fixup;

    /***********************************************************
    input conversion context
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareResample.AudioConvert? in_convert;

    /***********************************************************
    output conversion context
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareResample.AudioConvert? out_convert;

    /***********************************************************
    full conversion context (single conversion for input and output)
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareResample.AudioConvert? full_convert;

    /***********************************************************
    resampling context
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareResample.LibAVResample.ResampleContext? resample;

    /***********************************************************
    resampler virtual function table
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareResample.Resampler[] resampler;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal const size_t SWR_CH_MAX; // 64

    /***********************************************************
    floating point rematrixing coefficients
    ***********************************************************/
    [CCode (cname="")]
    internal double[] matrix; // [SWR_CH_MAX][SWR_CH_MAX];

    /***********************************************************
    single precision floating point rematrixing coefficients
    ***********************************************************/
    [CCode (cname="")]
    internal float[] matrix_flt; // [SWR_CH_MAX][SWR_CH_MAX];

    [CCode (cname="")]
    internal uint8[] native_matrix;

    [CCode (cname="")]
    internal uint8[] native_one;

    [CCode (cname="")]
    internal uint8[] native_simd_one;

    [CCode (cname="")]
    internal uint8[] native_simd_matrix;

    /***********************************************************
    17.15 fixed point rematrixing coefficients
    ***********************************************************/
    [CCode (cname="")]
    internal int32[] matrix32; // [SWR_CH_MAX][SWR_CH_MAX];

    /***********************************************************
    Lists of input channels per output channel that have non zero rematrixing coefficients
    ***********************************************************/
    [CCode (cname="")]
    internal uint8[] matrix_ch; // [SWR_CH_MAX][SWR_CH_MAX+1];

    [CCode (cname="integer")]
    internal struct integer { }
    //  #if ARCH_X86_64
    //  internal typedef int64 integer;
    //  #else
    //  internal typedef int integer;
    //  #endif

    [CCode (cname="mix_1_1_func_type",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal delegate void Mix11Delegate (
        void *out,
        void *in,
        void *coeffp,
        integer index,
        integer len
    );

    [CCode (cname="")]
    internal Mix11Delegate? mix_1_1_f;

    [CCode (cname="")]
    internal Mix11Delegate? mix_1_1_simd;

    [CCode (cname="mix_2_1_func_type",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal delegate void Mix21Delegate (
        void *out,
        void *in1,
        void *in2,
        void *coeffp,
        integer index1,
        integer index2,
        integer len
    );

    [CCode (cname="")]
    internal Mix21Delegate? mix_2_1_f;

    [CCode (cname="")]
    internal Mix21Delegate? mix_2_1_simd;

    [CCode (cname="mix_any_func_type",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal delegate void MixAnyDelegate (
        uint8[][] out,
        uint8[][] in1,
        void *coeffp,
        integer len
    );

    [CCode (cname="")]
    internal MixAnyDelegate? mix_any_f;

    /***********************************************************
    TODO: callbacks for ASM optimizations
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal void swri_noise_shaping_int16 (
        LibSoftwareResample.SoftwareContext? s,
        LibSoftwareResample.AudioData? dsts,
        LibSoftwareResample.AudioData? srcs,
        LibSoftwareResample.AudioData? noises,
        int count
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal void swri_noise_shaping_int32 (
        LibSoftwareResample.SoftwareContext? s,
        LibSoftwareResample.AudioData? dsts,
        LibSoftwareResample.AudioData? srcs,
        LibSoftwareResample.AudioData? noises,
        int count
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal void swri_noise_shaping_float (
        LibSoftwareResample.SoftwareContext? s,
        LibSoftwareResample.AudioData? dsts,
        LibSoftwareResample.AudioData? srcs,
        LibSoftwareResample.AudioData? noises,
        int count
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal void swri_noise_shaping_double (
        LibSoftwareResample.SoftwareContext? s,
        LibSoftwareResample.AudioData? dsts,
        LibSoftwareResample.AudioData? srcs,
        LibSoftwareResample.AudioData? noises,
        int count
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    //  av_warn_unused_result
    internal int swri_rematrix_init (
        LibSoftwareResample.SoftwareContext? s
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal void swri_rematrix_free (
        LibSoftwareResample.SoftwareContext? s
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal int swri_rematrix (
        LibSoftwareResample.SoftwareContext? s,
        LibSoftwareResample.AudioData? out,
        LibSoftwareResample.AudioData? in,
        int len,
        int mustcopy
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal int swri_rematrix_init_x86 (
        LibSoftwareResample.SoftwareContext? s
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    //  av_warn_unused_result
    internal int swri_get_dither (
        LibSoftwareResample.SoftwareContext? s,
        void *dst,
        int len,
        uint seed,
        LibAVUtil.SampleFormat noise_fmt
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    //  av_warn_unused_result
    internal int swri_dither_init (
        LibSoftwareResample.SoftwareContext? s,
        LibAVUtil.SampleFormat out_fmt,
        LibAVUtil.SampleFormat in_fmt
    );






    /***********************************************************
    Get the LibAVUtil.Log.Class for LibSoftwareResample.SoftwareContext. It can be used in combination with
    OptionSearchFlags.FAKE_OBJECT_PARAMETER for examining options.

    @see av_opt_find ().
    @return the LibAVUtil.Log.Class of LibSoftwareResample.SoftwareContext
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public LibAVUtil.Log.Class? swr_get_class ();

    /***********************************************************
    @name LibSoftwareResample.SoftwareContext constructor functions
    @{
    ***********************************************************/

    /***********************************************************
    Allocate LibSoftwareResample.SoftwareContext.

    If you use this function you will need to set the parameters (manually or
    with swr_alloc_set_opts ()) before calling swr_init ().

    @see swr_alloc_set_opts (), swr_init (), swr_free ()
    @return NULL on error, allocated context otherwise
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public LibSoftwareResample.SoftwareContext? swr_alloc ();

    /***********************************************************
    Initialize context after user parameters have been set.
    @note The context must be configured using the LibAVUtil.Option API.

    @see av_opt_set_int ()
    @see av_opt_set_dict ()

    @param[in,out]   s Swr context to initialize
    @return AVERROR error code in case of failure.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public int swr_init (
        LibSoftwareResample.SoftwareContext? s
    );

    /***********************************************************
    Check whether an swr context has been initialized or not.

    @param[in]       s Swr context to check
    @see swr_init ()
    @return positive if it has been initialized, 0 if not initialized
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public int swr_is_initialized (
        LibSoftwareResample.SoftwareContext? s
    );

    /***********************************************************
    Allocate LibSoftwareResample.SoftwareContext if needed and set/reset common parameters.

    This function does not require s to be allocated with swr_alloc (). On the
    other hand, swr_alloc () can use swr_alloc_set_opts () to set the parameters
    on the allocated context.

    @param s               existing Swr context if available, or NULL if not
    @param out_ch_layout   output channel layout (AV_CH_LAYOUT_*)
    @param out_sample_fmt  output sample format (AV_SAMPLE_FMT_*).
    @param out_sample_rate output sample rate (frequency in Hz)
    @param in_ch_layout    input channel layout (AV_CH_LAYOUT_*)
    @param in_sample_fmt   input sample format (AV_SAMPLE_FMT_*).
    @param in_sample_rate  input sample rate (frequency in Hz)
    @param log_offset      logging level offset
    @param log_ctx         parent logging context, can be NULL

    @see swr_init (), swr_free ()
    @return NULL on error, allocated context otherwise
    ***********************************************************/
    public LibSoftwareResample.SoftwareContext? swr_alloc_set_opts (
        LibSoftwareResample.SoftwareContext? s,
        int64 out_ch_layout,
        LibAVUtil.SampleFormat out_sample_fmt,
        int out_sample_rate,
        int64 in_ch_layout,
        LibAVUtil.SampleFormat in_sample_fmt,
        int in_sample_rate,
        int log_offset,
        void *log_ctx
    );

    /***********************************************************
    @}

    @name LibSoftwareResample.SoftwareContext destructor functions
    @{
    ***********************************************************/

    /***********************************************************
    Free the given LibSoftwareResample.SoftwareContext and set the pointer to NULL.

    @param[in] s a pointer to a pointer to Swr context
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public void swr_free (
        LibSoftwareResample.SoftwareContext **s
    );

    /***********************************************************
    Closes the context so that swr_is_initialized () returns 0.

    The context can be brought back to life by running swr_init (),
    swr_init () can also be used without swr_close ().
    This function is mainly provided for simplifying the usecase
    where one tries to support libavresample and libswresample.

    @param[in,out] s Swr context to be closed
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public void swr_close (
        LibSoftwareResample.SoftwareContext? s
    );

    /***********************************************************
    @}

    @name Core conversion functions
    @{
    ***********************************************************/

    /***********************************************************
    Convert audio.

    in and in_count can be set to 0 to flush the last few samples out at the
    end.

    If more input is provided than output space, then the input will be buffered.
    You can avoid this buffering by using swr_get_out_samples () to retrieve an
    upper bound on the required number of output samples for the given number of
    input samples. Conversion will run directly without copying whenever possible.

    @param s         allocated Swr context, with parameters set
    @param out       output buffers, only the first one need be set in case of packed audio
    @param out_count amount of space available for output in samples per channel
    @param in        input buffers, only the first one need to be set in case of packed audio
    @param in_count  number of input samples available in one channel

    @return number of samples output per channel, negative value on error
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public int swr_convert (
        LibSoftwareResample.SoftwareContext? s,
        uint8[][] out,
        int out_count,
        uint8[][] in,
        int in_count
    );

    /***********************************************************
    Convert the next timestamp from input to output
    timestamps are in 1/(in_sample_rate * out_sample_rate) units.

    @note There are 2 slightly differently behaving modes.
          @li When automatic timestamp compensation is not used, (min_compensation >= FLT_MAX)
                 in this case timestamps will be passed through with delays compensated
          @li When automatic timestamp compensation is used, (min_compensation < FLT_MAX)
                 in this case the output timestamps will match output sample numbers.
                 @see ffmpeg-resampler (1) for the two modes of compensation.

    @param s[in]     initialized Swr context
    @param pts[in]   timestamp for the next input sample, int64.MIN if unknown
    @see swr_set_compensation (), swr_drop_output (), and swr_inject_silence () are
         function used internally for timestamp compensation.
    @return the output timestamp for the next output sample
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public int64 swr_next_pts (
        LibSoftwareResample.SoftwareContext? s,
        int64 pts
    );

    /***********************************************************
    @}

    @name Low-level option setting functions
    These functons provide a means to set low-level options that is not possible
    with the LibAVUtil.Option API.
    @{
    ***********************************************************/

    /***********************************************************
    Activate resampling compensation ("soft" compensation). This function is
    public internally called when needed in swr_next_pts ().

    @param[in,out] s             allocated Swr context. If it is not initialized,
                                 or SoftwareResampleFlags.FORCE_RESAMPLE is not set, swr_init () is
                                 called with the flag set.
    @param[in]     sample_delta  delta in PTS per sample
    @param[in]     compensation_distance number of samples to compensate for
    @return    >= 0 on success, AVERROR error codes if:
               @li @c s is NULL,
               @li @c compensation_distance is less than 0,
               @li @c compensation_distance is 0 but sample_delta is not,
               @li compensation unsupported by resampler, or
               @li swr_init () fails when called.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public int swr_set_compensation (
        LibSoftwareResample.SoftwareContext? s,
        int sample_delta,
        int compensation_distance
    );

    /***********************************************************
    Set a customized input channel mapping.

    @param[in,out] s           allocated Swr context, not yet initialized
    @param[in]     channel_map customized input channel mapping (array of channel
                               indexes, -1 for a muted channel)
    @return >= 0 on success, or AVERROR error code in case of failure.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public int swr_set_channel_mapping (
        LibSoftwareResample.SoftwareContext? s,
        int[] channel_map
    );

    /***********************************************************
    Generate a channel mixing matrix.

    This function is the one used internally by libswresample for building the
    default mixing matrix. It is made public just as a utility function for
    building custom matrices.

    @param in_layout           input channel layout
    @param out_layout          output channel layout
    @param center_mix_level    mix level for the center channel
    @param surround_mix_level  mix level for the surround channel (s)
    @param lfe_mix_level       mix level for the low-frequency effects channel
    @param rematrix_maxval     if 1.0, coefficients will be normalized to prevent
                               overflow. if int.MAX, coefficients will not be
                               normalized.
    @param[out] matrix         mixing coefficients; matrix[i + stride * o] is
                               the weight of input channel i in output channel o.
    @param stride              distance between adjacent input channels in the
                               matrix array
    @param matrix_encoding     matrixed stereo downmix mode (e.g. dplii)
    @param log_ctx             parent logging context, can be NULL
    @return                    0 on success, negative AVERROR code on failure
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public int swr_build_matrix (
        uint64 in_layout,
        uint64 out_layout,
        double center_mix_level,
        double surround_mix_level,
        double lfe_mix_level,
        double rematrix_maxval,
        double rematrix_volume,
        double[] matrix,
        int stride,
        LibAVUtil.MatrixEncoding matrix_encoding,
        void *log_ctx
    );

    /***********************************************************
    Set a customized remix matrix.

    @param s       allocated Swr context, not yet initialized
    @param matrix  remix coefficients; matrix[i + stride * o] is
                   the weight of input channel i in output channel o
    @param stride  offset between lines of the matrix
    @return  >= 0 on success, or AVERROR error code in case of failure.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public int swr_set_matrix (
        LibSoftwareResample.SoftwareContext? s,
        double[] matrix,
        int stride
    );

    /***********************************************************
    @}

    @name Sample handling functions
    @{
    ***********************************************************/

    /***********************************************************
    Drops the specified number of output samples.

    This function, along with swr_inject_silence (), is called by swr_next_pts ()
    if needed for "hard" compensation.

    @param s     allocated Swr context
    @param count number of samples to be dropped

    @return >= 0 on success, or a negative AVERROR code on failure
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public int swr_drop_output (
        LibSoftwareResample.SoftwareContext? s,
        int count
    );

    /***********************************************************
    Injects the specified number of silence samples.

    This function, along with swr_drop_output (), is called by swr_next_pts ()
    if needed for "hard" compensation.

    @param s     allocated Swr context
    @param count number of samples to be dropped

    @return >= 0 on success, or a negative AVERROR code on failure
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public int swr_inject_silence (
        LibSoftwareResample.SoftwareContext? s,
        int count
    );

    /***********************************************************
    Gets the delay the next input sample will experience relative to the next output sample.

    Swresample can buffer data if more input has been provided than available
    output space, also converting between sample rates needs a delay.
    This function returns the sum of all such delays.
    The exact delay is not necessarily an integer value in either input or
    output sample rate. Especially when downsampling by a large value, the
    output sample rate may be a poor choice to represent the delay, similarly
    for upsampling and the input sample rate.

    @param s     swr context
    @param base  timebase in which the returned delay will be:
                 @li if it's set to 1 the returned delay is in seconds
                 @li if it's set to 1000 the returned delay is in milliseconds
                 @li if it's set to the input sample rate then the returned
                     delay is in input samples
                 @li if it's set to the output sample rate then the returned
                     delay is in output samples
                 @li if it's the least common multiple of in_sample_rate and
                     out_sample_rate then an exact rounding-free delay will be
                     returned
    @returns     the delay in 1 / @c base units.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public int64 swr_get_delay (
        LibSoftwareResample.SoftwareContext? s,
        int64 base
    );

    /***********************************************************
    Find an upper bound on the number of samples that the next swr_convert
    call will output, if called with in_samples of input samples. This
    depends on the internal state, and anything changing the internal state
    (like further swr_convert () calls) will may change the number of samples
    swr_get_out_samples () returns for the same number of input samples.

    @param in_samples    number of input samples.
    @note any call to swr_inject_silence (), swr_convert (), swr_next_pts ()
          or swr_set_compensation () invalidates this limit
    @note it is recommended to pass the correct available buffer size
          to all functions like swr_convert () even if swr_get_out_samples ()
          indicates that less would be used.
    @returns an upper bound on the number of samples that the next swr_convert
             will output or a negative value to indicate an error
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public int swr_get_out_samples (
        LibSoftwareResample.SoftwareContext? s,
        int in_samples
    );

    /***********************************************************
    @}

    @name Configuration accessors
    @{
    ***********************************************************/

    /***********************************************************
    Return the @ref LibSoftwareResample.Version.INT constant.

    This is useful to check if the build-time libswresample has the same version
    as the run-time one.

    @returns     the uint-typed version
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public uint swresample_version ();

    /***********************************************************
    Return the swr build-time configuration.

    @returns     the build-time @c ./configure flags
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public string swresample_configuration ();

    /***********************************************************
    Return the swr license.

    @returns     the license of libswresample, determined at build-time
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public string swresample_license ();

    /***********************************************************
    @}

    @name LibAVFormat.Frame based API
    @{
    ***********************************************************/

    /***********************************************************
    Convert the samples in the input LibAVFormat.Frame and write them to the output LibAVFormat.Frame.

    Input and output AVFrames must have channel_layout, sample_rate and format set.

    If the output LibAVFormat.Frame does not have the data pointers allocated the nb_samples
    field will be set using av_frame_get_buffer ()
    is called to allocate the frame.

    The output LibAVFormat.Frame can be NULL or have fewer allocated samples than required.
    In this case, any remaining samples not written to the output will be added
    to an internal FIFO buffer, to be returned at the next call to this function
    or to swr_convert ().

    If converting sample rate, there may be data remaining in the internal
    resampling delay buffer. swr_get_delay () tells the number of
    remaining samples. To get this data as output, call this function or
    swr_convert () with NULL input.

    If the LibSoftwareResample.SoftwareContext configuration does not match the output and
    input LibAVFormat.Frame settings the conversion does not take place and depending on
    which LibAVFormat.Frame is not matching LibAVUtil.ErrorCode.OUTPUT_CHANGED, LibAVUtil.ErrorCode.INPUT_CHANGED
    or the result of a bitwise-OR of them is returned.

    @see swr_delay ()
    @see swr_convert ()
    @see swr_get_delay ()

    @param swr             audio resample context
    @param output          output LibAVFormat.Frame
    @param input           input LibAVFormat.Frame
    @return                0 on success, AVERROR on failure or nonmatching
                           configuration.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public int swr_convert_frame (
        LibSoftwareResample.SoftwareContext? swr,
        LibAVFormat.Frame output,
        LibAVFormat.Frame? input
    );

    /***********************************************************
    Configure or reconfigure the LibSoftwareResample.SoftwareContext using the information
    provided by the AVFrames.

    The original resampling context is reset even on failure.
    The function calls swr_close () internally if the context is open.

    @see swr_close ();

    @param swr             audio resample context
    @param output          output LibAVFormat.Frame
    @param input           input LibAVFormat.Frame
    @return                0 on success, AVERROR on failure.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
    public int swr_config_frame (
        LibSoftwareResample.SoftwareContext? swr,
        LibAVFormat.Frame? out,
        LibAVFormat.Frame? in
    );


}

} // namespace LibSoftwareResample
