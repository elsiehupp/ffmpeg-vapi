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
public class AudioData { }

[CCode (cname="struct AudioConvert",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
[Compact]
public class AudioConvert { }

[CCode (cname="struct AudioMix",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
[Compact]
public class AudioMix { }

[CCode (cname="struct ResampleContext",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
[Compact]
public class ResampleContext { }

[CCode (cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
public enum RemapPoint {
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
public class ChannelMapInfo {
    /***********************************************************
    source index of each output channel, -1 if not remapped
    ***********************************************************/
    [CCode (cname="")]
    public int channel_map[AVRESAMPLE_MAX_CHANNELS];

    /***********************************************************
    remap needed
    ***********************************************************/
    [CCode (cname="")]
    public int do_remap;

    /***********************************************************
    dest index to copy from
    ***********************************************************/
    [CCode (cname="")]
    public int channel_copy[AVRESAMPLE_MAX_CHANNELS];

    /***********************************************************
    copy needed
    ***********************************************************/
    [CCode (cname="")]
    public int do_copy;

    /***********************************************************
    dest index to zero
    ***********************************************************/
    [CCode (cname="")]
    public int channel_zero[AVRESAMPLE_MAX_CHANNELS];

    /***********************************************************
    zeroing needed
    ***********************************************************/
    [CCode (cname="")]
    public int do_zero;

    /***********************************************************
    dest index of each input channel
    ***********************************************************/
    [CCode (cname="")]
    public int input_map[AVRESAMPLE_MAX_CHANNELS];
}

[CCode (cname="struct AVAudioResampleContext",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
[Compact]
public class AVAudioResampleContext {
    /***********************************************************
    AVClass for logging and AVOptions
    ***********************************************************/
    [CCode (cname="")]
    public AVClass? av_class;

    /***********************************************************
    input channel layout
    ***********************************************************/
    [CCode (cname="")]
    public uint64 in_channel_layout;

    /***********************************************************
    input sample format
    ***********************************************************/
    [CCode (cname="")]
    public AVSampleFormat in_sample_fmt;

    /***********************************************************
    input sample rate
    ***********************************************************/
    [CCode (cname="")]
    public int in_sample_rate;

    /***********************************************************
    output channel layout
    ***********************************************************/
    [CCode (cname="")]
    public uint64 out_channel_layout;

    /***********************************************************
    output sample format
    ***********************************************************/
    [CCode (cname="")]
    public AVSampleFormat out_sample_fmt;

    /***********************************************************
    output sample rate
    ***********************************************************/
    [CCode (cname="")]
    public int out_sample_rate;

    /***********************************************************
    public internal sample format
    ***********************************************************/
    [CCode (cname="")]
    public AVSampleFormat internal_sample_fmt;

    /***********************************************************
    mixing coefficient type
    ***********************************************************/
    [CCode (cname="")]
    public AVMixCoeffType mix_coeff_type;

    /***********************************************************
    center mix level
    ***********************************************************/
    [CCode (cname="")]
    public double center_mix_level;

    /***********************************************************
    surround mix level
    ***********************************************************/
    [CCode (cname="")]
    public double surround_mix_level;

    /***********************************************************
    lfe mix level
    ***********************************************************/
    [CCode (cname="")]
    public double lfe_mix_level;

    /***********************************************************
    enable mix level normalization
    ***********************************************************/
    [CCode (cname="")]
    public int normalize_mix_level;

    /***********************************************************
    force resampling
    ***********************************************************/
    [CCode (cname="")]
    public int force_resampling;

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
    resampling cutoff frequency. 1.0 corresponds to half the output sample rate
    ***********************************************************/
    [CCode (cname="")]
    public double cutoff;

    /***********************************************************
    resampling filter type
    ***********************************************************/
    [CCode (cname="")]
    public AVResampleFilterType filter_type;

    /***********************************************************
    beta value for Kaiser window (only applicable if filter_type == AV_FILTER_TYPE_KAISER)
    ***********************************************************/
    [CCode (cname="")]
    public int kaiser_beta;

    /***********************************************************
    dither method
    ***********************************************************/
    [CCode (cname="")]
    public AVResampleDitherMethod dither_method;

    /***********************************************************
    number of input channels
    ***********************************************************/
    [CCode (cname="")]
    public int in_channels;

    /***********************************************************
    number of output channels
    ***********************************************************/
    [CCode (cname="")]
    public int out_channels;

    /***********************************************************
    number of channels used for resampling
    ***********************************************************/
    [CCode (cname="")]
    public int resample_channels;

    /***********************************************************
    downmixing is needed
    ***********************************************************/
    [CCode (cname="")]
    public int downmix_needed;

    /***********************************************************
    upmixing is needed
    ***********************************************************/
    [CCode (cname="")]
    public int upmix_needed;

    /***********************************************************
    either upmixing or downmixing is needed
    ***********************************************************/
    [CCode (cname="")]
    public int mixing_needed;

    /***********************************************************
    resampling is needed
    ***********************************************************/
    [CCode (cname="")]
    public int resample_needed;

    /***********************************************************
    input sample format conversion is needed
    ***********************************************************/
    [CCode (cname="")]
    public int in_convert_needed;

    /***********************************************************
    output sample format conversion is needed
    ***********************************************************/
    [CCode (cname="")]
    public int out_convert_needed;

    /***********************************************************
    input data copy is needed
    ***********************************************************/
    [CCode (cname="")]
    public int in_copy_needed;

    /***********************************************************
    buffer for converted input
    ***********************************************************/
    [CCode (cname="")]
    public AudioData? in_buffer;

    /***********************************************************
    buffer for output from resampler
    ***********************************************************/
    [CCode (cname="")]
    public AudioData? resample_out_buffer;

    /***********************************************************
    buffer for converted output
    ***********************************************************/
    [CCode (cname="")]
    public AudioData? out_buffer;

    /***********************************************************
    FIFO for output samples
    ***********************************************************/
    [CCode (cname="")]
    public AVAudioFifo? out_fifo;

    /***********************************************************
    input sample format conversion context
    ***********************************************************/
    [CCode (cname="")]
    public AudioConvert? ac_in;

    /***********************************************************
    output sample format conversion context
    ***********************************************************/
    [CCode (cname="")]
    public AudioConvert? ac_out;

    /***********************************************************
    resampling context
    ***********************************************************/
    [CCode (cname="")]
    public ResampleContext? resample;

    /***********************************************************
    channel mixing context
    ***********************************************************/
    [CCode (cname="")]
    public AudioMix? am;

    /***********************************************************
    matrixed stereo encoding
    ***********************************************************/
    [CCode (cname="")]
    public AVMatrixEncoding matrix_encoding;

    /***********************************************************
    mix matrix
    only used if avresample_set_matrix () is called before avresample_open ()
    ***********************************************************/
    [CCode (cname="")]
    public double[] mix_matrix;

    [CCode (cname="")]
    public int use_channel_map;

    [CCode (cname="")]
    public RemapPoint remap_point;

    [CCode (cname="")]
    public ChannelMapInfo ch_map_info;
};


[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
public void ff_audio_resample_init_aarch64 (
    ResampleContext? c,
    AVSampleFormat sample_fmt
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
public void ff_audio_resample_init_arm (
    ResampleContext? c,
    AVSampleFormat sample_fmt
);

} // namespace LibAVResample
