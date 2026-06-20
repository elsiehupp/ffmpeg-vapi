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

[CCode (cname="",cheader_filename="")]
public define SWR_CH_MAX 64

[CCode (cname="",cheader_filename="")]
public define SQRT3_2      1.22474487139158904909  /***********************************************************
    sqrt (3/2)
***********************************************************/

[CCode (cname="",cheader_filename="")]
public define NS_TAPS 20

#if ARCH_X86_64
public typedef int64 integer;
#else
public typedef int integer;
#endif

[CCode (cname="",cheader_filename="")]
public typedef void (mix_1_1_func_type)(
    void *out,
    void *in,
    void *coeffp,
    integer index,
    integer len
);

[CCode (cname="",cheader_filename="")]
public typedef void (mix_2_1_func_type)(
    void *out,
    void *in1,
    void *in2,
    void *coeffp,
    integer index1,
    integer index2,
    integer len
);

[CCode (cname="",cheader_filename="")]
public typedef void (mix_any_func_type)(
    uint8[] *out,
    uint8[] *in1,
    void *coeffp,
    integer len
);

[CCode (cname="",cheader_filename="")]
[Compact]
public class AudioData {
    /***********************************************************
    samples buffer per channel
    ***********************************************************/
    uint8[] ch[SWR_CH_MAX];

    /***********************************************************
    samples buffer
    ***********************************************************/
    uint8[] data;

    /***********************************************************
    number of channels
    ***********************************************************/
    [CCode (cname="")]
    public int ch_count;

    /***********************************************************
    bytes per sample
    ***********************************************************/
    [CCode (cname="")]
    public int bps;

    /***********************************************************
    number of samples
    ***********************************************************/
    [CCode (cname="")]
    public int count;

    /***********************************************************
    1 if planar audio, 0 otherwise
    ***********************************************************/
    [CCode (cname="")]
    public int planar;

    /***********************************************************
    sample format
    ***********************************************************/
    [CCode (cname="")]
    public AVSampleFormat fmt;
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class DitherContext {
    [CCode (cname="")]
    public int method;

    [CCode (cname="")]
    public int noise_pos;

    [CCode (cname="")]
    public float scale;

    /***********************************************************
    Noise scale
    ***********************************************************/
    float noise_scale;

    /***********************************************************
    Noise shaping dither taps
    ***********************************************************/
    [CCode (cname="")]
    public int ns_taps;

    /***********************************************************
    Noise shaping dither scale
    ***********************************************************/
    float ns_scale;

    /***********************************************************
    Noise shaping dither scale^-1
    ***********************************************************/
    float ns_scale_1;

    /***********************************************************
    Noise shaping dither position
    ***********************************************************/
    [CCode (cname="")]
    public int ns_pos;

    /***********************************************************
    Noise shaping filter coefficients
    ***********************************************************/
    float ns_coeffs[NS_TAPS];

    [CCode (cname="")]
    public float ns_errors[SWR_CH_MAX][2*NS_TAPS];

    /***********************************************************
    noise used for dithering
    ***********************************************************/
    AudioData noise;

    /***********************************************************
    temporary storage when writing into the input buffer isn't possible
    ***********************************************************/
    AudioData temp;

    /***********************************************************
    the number of used output bits, needed to scale dither correctly
    ***********************************************************/
    [CCode (cname="")]
    public int output_sample_bits;
}

[CCode (cname="",cheader_filename="")]
public ResampleContext (* resample_init_func)(
    ResampleContext *c,
    int out_rate,
    int in_rate,
    int filter_size,
    int phase_shift,
    int linear,
    double cutoff,
    AVSampleFormat format,
    SwrFilterType filter_type,
    double kaiser_beta,
    double precision,
    int cheby,
    int exact_rational
);

[CCode (cname="",cheader_filename="")]
public typedef void    (* resample_free_func)(
    ResampleContext **c
);

[CCode (cname="",cheader_filename="")]
public typedef int     (* multiple_resample_func)(
    ResampleContext *c,
    AudioData *dst,
    int dst_size,
    AudioData *src,
    int src_size,
    int *consumed
);

[CCode (cname="",cheader_filename="")]
public typedef int     (* resample_flush_func)(
    SwrContext *c
);

[CCode (cname="",cheader_filename="")]
public typedef int     (* set_compensation_func)(
    ResampleContext *c,
    int sample_delta,
    int compensation_distance
);

[CCode (cname="",cheader_filename="")]
public typedef int64 (* get_delay_func)(
    SwrContext *s,
    int64 base
);

[CCode (cname="",cheader_filename="")]
public typedef int     (* invert_initial_buffer_func)(
    ResampleContext *c,
    AudioData *dst,
    AudioData *src,
    int src_size,
    int *dst_idx,
    int *dst_count
);

[CCode (cname="",cheader_filename="")]
public typedef int64 (* get_out_samples_func)(
    SwrContext *s,
    int in_samples
);

[CCode (cname="",cheader_filename="")]
[Compact]
public class Resampler {
  resample_init_func            init;
  resample_free_func            free;
  multiple_resample_func        multiple_resample;
  resample_flush_func           flush;
  set_compensation_func         set_compensation;
  get_delay_func                get_delay;
  invert_initial_buffer_func    invert_initial_buffer;
  get_out_samples_func          get_out_samples;
};

//  extern struct Resampler const swri_resampler;
//  extern struct Resampler const swri_soxr_resampler;

[CCode (cname="",cheader_filename="")]
[Compact]
public class SwrContext {
    /***********************************************************
    AVClass used for AVOption and av_log ()
    ***********************************************************/
    public AVClass av_class;

    /***********************************************************
    logging level offset
    ***********************************************************/
    [CCode (cname="")]
    public int log_level_offset;

    /***********************************************************
    parent logging context
    ***********************************************************/
    void *log_ctx;

    /***********************************************************
    input sample format
    ***********************************************************/
    [CCode (cname="")]
    public AVSampleFormat  in_sample_fmt;

    /***********************************************************
    public internal sample format (AV_SAMPLE_FMT_FLTP or AV_SAMPLE_FMT_S16P)
    ***********************************************************/
    [CCode (cname="")]
    public AVSampleFormat int_sample_fmt;

    /***********************************************************
    output sample format
    ***********************************************************/
    [CCode (cname="")]
    public AVSampleFormat out_sample_fmt;

    /***********************************************************
    input channel layout
    ***********************************************************/
    [CCode (cname="")]
    public int64  in_ch_layout;

    /***********************************************************
    output channel layout
    ***********************************************************/
    [CCode (cname="")]
    public int64 out_ch_layout;

    /***********************************************************
    input sample rate
    ***********************************************************/
    [CCode (cname="")]
    public int      in_sample_rate;

    /***********************************************************
    output sample rate
    ***********************************************************/
    [CCode (cname="")]
    public int     out_sample_rate;

    /***********************************************************
    miscellaneous flags such as SWR_FLAG_RESAMPLE
    ***********************************************************/
    [CCode (cname="")]
    public int flags;

    /***********************************************************
    surround mixing level
    ***********************************************************/
    float slev;

    /***********************************************************
    center mixing level
    ***********************************************************/
    float clev;

    /***********************************************************
    LFE mixing level
    ***********************************************************/
    float lfe_mix_level;

    /***********************************************************
    rematrixing volume coefficient
    ***********************************************************/
    float rematrix_volume;

    /***********************************************************
    maximum value for rematrixing output
    ***********************************************************/
    float rematrix_maxval;

    /***********************************************************
    matrixed stereo encoding
    ***********************************************************/
    [CCode (cname="")]
    public int matrix_encoding;

    /***********************************************************
    channel index (or -1 if muted channel) map
    ***********************************************************/
    [CCode (cname="")]
    public int[] channel_map;

    /***********************************************************
    number of used input channels (mapped channel count if channel_map, otherwise in.ch_count)
    ***********************************************************/
    [CCode (cname="")]
    public int used_ch_count;

    [CCode (cname="")]
    public int engine;

    /***********************************************************
    User set input channel count
    ***********************************************************/
    [CCode (cname="")]
    public int user_in_ch_count;

    /***********************************************************
    User set output channel count
    ***********************************************************/
    [CCode (cname="")]
    public int user_out_ch_count;

    /***********************************************************
    User set used channel count
    ***********************************************************/
    [CCode (cname="")]
    public int user_used_ch_count;

    /***********************************************************
    User set input channel layout
    ***********************************************************/
    [CCode (cname="")]
    public int64 user_in_ch_layout;

    /***********************************************************
    User set output channel layout
    ***********************************************************/
    [CCode (cname="")]
    public int64 user_out_ch_layout;

    /***********************************************************
    User set internal sample format
    ***********************************************************/
    [CCode (cname="")]
    public AVSampleFormat user_int_sample_fmt;

    /***********************************************************
    User set dither method
    ***********************************************************/
    [CCode (cname="")]
    public int user_dither_method;

    struct DitherContext dither;

    /***********************************************************
    length of each FIR filter in the resampling filterbank relative to the cutoff frequency
    ***********************************************************/
    [CCode (cname="")]
    public int filter_size;

    /***********************************************************
    log2 of the number of entries in the resampling polyphase filterbank
    ***********************************************************/
    [CCode (cname="")]
    public int phase_shift;

    /***********************************************************
    if 1 then the resampling FIR filter will be linearly interpolated
    ***********************************************************/
    [CCode (cname="")]
    public int linear_interp;

    /***********************************************************
    if 1 then enable non power of 2 phase_count
    ***********************************************************/
    [CCode (cname="")]
    public int exact_rational;

    /***********************************************************
    resampling cutoff frequency (swr: 6dB point; soxr: 0dB point). 1.0 corresponds to half the output sample rate
    ***********************************************************/
    double cutoff;

    /***********************************************************
    swr resampling filter type
    ***********************************************************/
    [CCode (cname="")]
    public int filter_type;

    /***********************************************************
    swr beta value for Kaiser window (only applicable if filter_type == AV_FILTER_TYPE_KAISER)
    ***********************************************************/
    double kaiser_beta;

    /***********************************************************
    soxr resampling precision (in bits)
    ***********************************************************/
    double precision;

    /***********************************************************
    soxr: if 1 then passband rolloff will be none (Chebyshev) & irrational ratio approximation precision will be higher
    ***********************************************************/
    [CCode (cname="")]
    public int cheby;

    /***********************************************************
    swr minimum below which no compensation will happen
    ***********************************************************/
    float min_compensation;

    /***********************************************************
    swr minimum below which no silence inject / sample drop will happen
    ***********************************************************/
    float min_hard_compensation;

    /***********************************************************
    swr duration over which soft compensation is applied
    ***********************************************************/
    float soft_compensation_duration;

    /***********************************************************
    swr maximum soft compensation in seconds over soft_compensation_duration
    ***********************************************************/
    float max_soft_compensation;

    /***********************************************************
    swr simple 1 parameter async, similar to ffmpegs -async
    ***********************************************************/
    float async;

    /***********************************************************
    swr first pts in samples
    ***********************************************************/
    [CCode (cname="")]
    public int64 firstpts_in_samples;

    /***********************************************************
    1 if resampling must come first, 0 if rematrixing
    ***********************************************************/
    [CCode (cname="")]
    public int resample_first;

    /***********************************************************
    flag to indicate if rematrixing is needed (basically if input and output layouts mismatch)
    ***********************************************************/
    [CCode (cname="")]
    public int rematrix;

    /***********************************************************
    flag to indicate that a custom matrix has been defined
    ***********************************************************/
    [CCode (cname="")]
    public int rematrix_custom;

    /***********************************************************
    input audio data
    ***********************************************************/
    AudioData in;

    /***********************************************************
    post-input audio data: used for rematrix/resample
    ***********************************************************/
    AudioData postin;

    /***********************************************************
    public intermediate audio data (postin/preout)
    ***********************************************************/
    AudioData midbuf;

    /***********************************************************
    pre-output audio data: used for rematrix/resample
    ***********************************************************/
    AudioData preout;

    /***********************************************************
    converted output audio data
    ***********************************************************/
    AudioData out;

    /***********************************************************
    cached audio data (convert and resample purpose)
    ***********************************************************/
    AudioData in_buffer;

    /***********************************************************
    temporary with silence
    ***********************************************************/
    AudioData silence;

    /***********************************************************
    temporary used to discard output
    ***********************************************************/
    AudioData drop_temp;

    /***********************************************************
    cached buffer position
    ***********************************************************/
    [CCode (cname="")]
    public int in_buffer_index;

    /***********************************************************
    cached buffer length
    ***********************************************************/
    [CCode (cname="")]
    public int in_buffer_count;

    /***********************************************************
    1 if the input end was reach before the output end, 0 otherwise
    ***********************************************************/
    [CCode (cname="")]
    public int resample_in_constraint;

    /***********************************************************
    1 if data is to be flushed and no further input is expected
    ***********************************************************/
    [CCode (cname="")]
    public int flushed;

    /***********************************************************
    output PTS
    ***********************************************************/
    [CCode (cname="")]
    public int64 outpts;

    /***********************************************************
    first PTS
    ***********************************************************/
    [CCode (cname="")]
    public int64 firstpts;

    /***********************************************************
    number of output samples to drop
    ***********************************************************/
    [CCode (cname="")]
    public int drop_output;

    /***********************************************************
    soxr 0.1.1: needed to fixup delayed_samples after flush has been called.
    ***********************************************************/
    double delayed_samples_fixup;

    /***********************************************************
    input conversion context
    ***********************************************************/
    struct AudioConvert *in_convert;

    /***********************************************************
    output conversion context
    ***********************************************************/
    struct AudioConvert *out_convert;

    /***********************************************************
    full conversion context (single conversion for input and output)
    ***********************************************************/
    struct AudioConvert *full_convert;

    /***********************************************************
    resampling context
    ***********************************************************/
    struct ResampleContext *resample;

    /***********************************************************
    resampler virtual function table
    ***********************************************************/
    struct Resampler const *resampler;

    /***********************************************************
    floating point rematrixing coefficients
    ***********************************************************/
    double matrix[SWR_CH_MAX][SWR_CH_MAX];

    /***********************************************************
    single precision floating point rematrixing coefficients
    ***********************************************************/
    float matrix_flt[SWR_CH_MAX][SWR_CH_MAX];

    uint8[] native_matrix;

    uint8[] native_one;

    uint8[] native_simd_one;

    uint8[] native_simd_matrix;

    /***********************************************************
    17.15 fixed point rematrixing coefficients
    ***********************************************************/
    [CCode (cname="")]
    public int32 matrix32[SWR_CH_MAX][SWR_CH_MAX];

    /***********************************************************
    Lists of input channels per output channel that have non zero rematrixing coefficients
    ***********************************************************/
    [CCode (cname="")]
    public uint8 matrix_ch[SWR_CH_MAX][SWR_CH_MAX+1];

    mix_1_1_func_type *mix_1_1_f;

    mix_1_1_func_type *mix_1_1_simd;

    mix_2_1_func_type *mix_2_1_f;

    mix_2_1_func_type *mix_2_1_simd;

    mix_any_func_type *mix_any_f;

    /***********************************************************
    TODO: callbacks for ASM optimizations
    ***********************************************************/
};

av_warn_unused_result
public int swri_realloc_audio (
    AudioData *a,
    int count
);

[CCode (cname="",cheader_filename="")]
public void swri_noise_shaping_int16 (
    SwrContext *s,
    AudioData *dsts,
    AudioData *srcs,
    AudioData *noises,
    int count
);

[CCode (cname="",cheader_filename="")]
public void swri_noise_shaping_int32 (
    SwrContext *s,
    AudioData *dsts,
    AudioData *srcs,
    AudioData *noises,
    int count
);

[CCode (cname="",cheader_filename="")]
public void swri_noise_shaping_float (
    SwrContext *s,
    AudioData *dsts,
    AudioData *srcs,
    AudioData *noises,
    int count
);

[CCode (cname="",cheader_filename="")]
public void swri_noise_shaping_double (
    SwrContext *s,
    AudioData *dsts,
    AudioData *srcs,
    AudioData *noises,
    int count
);

av_warn_unused_result
public int swri_rematrix_init (
    SwrContext *s
);

[CCode (cname="",cheader_filename="")]
public void swri_rematrix_free (
    SwrContext *s
);

[CCode (cname="",cheader_filename="")]
public int swri_rematrix (
    SwrContext *s,
    AudioData *out,
    AudioData *in,
    int len,
    int mustcopy
);

[CCode (cname="",cheader_filename="")]
public int swri_rematrix_init_x86 (
    SwrContext *s
);

av_warn_unused_result
public int swri_get_dither (
    SwrContext *s,
    void *dst,
    int len,
    uint seed,
    AVSampleFormat noise_fmt
);

av_warn_unused_result
public int swri_dither_init (
    SwrContext *s,
    AVSampleFormat out_fmt,
    AVSampleFormat in_fmt
);

[CCode (cname="",cheader_filename="")]
public void swri_audio_convert_init_aarch64 (
    AudioConvert *ac,
    AVSampleFormat out_fmt,
    AVSampleFormat in_fmt,
    int channels
);

[CCode (cname="",cheader_filename="")]
public void swri_audio_convert_init_arm (
    AudioConvert *ac,
    AVSampleFormat out_fmt,
    AVSampleFormat in_fmt,
    int channels
);

[CCode (cname="",cheader_filename="")]
public void swri_audio_convert_init_x86 (
    AudioConvert *ac,
    AVSampleFormat out_fmt,
    AVSampleFormat in_fmt,
    int channels
);

#endif
