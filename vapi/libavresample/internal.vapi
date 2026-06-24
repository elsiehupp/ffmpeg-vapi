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

[CCode (cname="struct AudioData",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
[Compact]
internal class AudioData { }

[CCode (cname="struct AudioConvert",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
[Compact]
internal class AudioConvert { }

[CCode (cname="struct AudioMix",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
[Compact]
internal class AudioMix { }

[CCode (cname="struct ResampleContext",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
[Compact]
internal class ResampleContext { }

[CCode (cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
internal enum RemapPoint {
    [CCode (cname="REMAP_NONE")]
    NONE,

    [CCode (cname="REMAP_IN_COPY")]
    INPUT_COPY,

    [CCode (cname="REMAP_IN_CONVERT")]
    INPUT_CONVERT,

    [CCode (cname="REMAP_OUT_COPY")]
    OUTPUT_COPY,

    [CCode (cname="REMAP_OUT_CONVERT")]
    OUTPUT_CONVERT;
}

[CCode (cname="struct ChannelMapInfo",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
[Compact]
internal class ChannelMapInfo {
    /***********************************************************
    source index of each output channel, -1 if not remapped
    ***********************************************************/
    [CCode (cname="")]
    internal int channel_map[AVRESAMPLE_MAX_CHANNELS];

    /***********************************************************
    remap needed
    ***********************************************************/
    [CCode (cname="")]
    internal int do_remap;

    /***********************************************************
    dest index to copy from
    ***********************************************************/
    [CCode (cname="")]
    internal int channel_copy[AVRESAMPLE_MAX_CHANNELS];

    /***********************************************************
    copy needed
    ***********************************************************/
    [CCode (cname="")]
    internal int do_copy;

    /***********************************************************
    dest index to zero
    ***********************************************************/
    [CCode (cname="")]
    internal int channel_zero[AVRESAMPLE_MAX_CHANNELS];

    /***********************************************************
    zeroing needed
    ***********************************************************/
    [CCode (cname="")]
    internal int do_zero;

    /***********************************************************
    dest index of each input channel
    ***********************************************************/
    [CCode (cname="")]
    internal int input_map[AVRESAMPLE_MAX_CHANNELS];
}

[CCode (cname="struct AVAudioResampleContext",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
[Compact]
internal class AVAudioResampleContext {
    /***********************************************************
    AVClass for logging and AVOptions
    ***********************************************************/
    [CCode (cname="")]
    internal AVClass? av_class;

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
    internal AVMixCoeffType mix_coeff_type;

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
    internal AVResampleFilterType filter_type;

    /***********************************************************
    beta value for Kaiser window (only applicable if filter_type == AV_FILTER_TYPE_KAISER)
    ***********************************************************/
    [CCode (cname="")]
    internal int kaiser_beta;

    /***********************************************************
    dither method
    ***********************************************************/
    [CCode (cname="")]
    internal AVResampleDitherMethod dither_method;

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
    internal AudioData? in_buffer;

    /***********************************************************
    buffer for output from resampler
    ***********************************************************/
    [CCode (cname="")]
    internal AudioData? resample_out_buffer;

    /***********************************************************
    buffer for converted output
    ***********************************************************/
    [CCode (cname="")]
    internal AudioData? out_buffer;

    /***********************************************************
    FIFO for output samples
    ***********************************************************/
    [CCode (cname="")]
    internal AVAudioFifo? out_fifo;

    /***********************************************************
    input sample format conversion context
    ***********************************************************/
    [CCode (cname="")]
    internal AudioConvert? ac_in;

    /***********************************************************
    output sample format conversion context
    ***********************************************************/
    [CCode (cname="")]
    internal AudioConvert? ac_out;

    /***********************************************************
    resampling context
    ***********************************************************/
    [CCode (cname="")]
    internal ResampleContext? resample;

    /***********************************************************
    channel mixing context
    ***********************************************************/
    [CCode (cname="")]
    internal AudioMix? am;

    /***********************************************************
    matrixed stereo encoding
    ***********************************************************/
    [CCode (cname="")]
    internal AVMatrixEncoding matrix_encoding;

    /***********************************************************
    mix matrix
    only used if avresample_set_matrix () is called before avresample_open ()
    ***********************************************************/
    [CCode (cname="")]
    internal double[] mix_matrix;

    [CCode (cname="")]
    internal int use_channel_map;

    [CCode (cname="")]
    internal RemapPoint remap_point;

    [CCode (cname="")]
    internal ChannelMapInfo ch_map_info;
};


[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
internal void ff_audio_resample_init_aarch64 (
    ResampleContext? c,
    AVSampleFormat sample_fmt
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
internal void ff_audio_resample_init_arm (
    ResampleContext? c,
    AVSampleFormat sample_fmt
);

} // namespace LibAVResample
