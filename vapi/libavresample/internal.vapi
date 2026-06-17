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

[Compact]
public class AudioData AudioData;
[Compact]
public class AudioConvert AudioConvert;
[Compact]
public class AudioMix AudioMix;
[Compact]
public class ResampleContext ResampleContext;

public enum RemapPoint {
    REMAP_NONE,
    REMAP_IN_COPY,
    REMAP_IN_CONVERT,
    REMAP_OUT_COPY,
    REMAP_OUT_CONVERT,
}

[Compact]
public class ChannelMapInfo {
    /***********************************************************
    source index of each output channel, -1 if not remapped
    ***********************************************************/
    public int channel_map[AVRESAMPLE_MAX_CHANNELS];
    /***********************************************************
    remap needed
    ***********************************************************/
    public int do_remap;
    /***********************************************************
    dest index to copy from
    ***********************************************************/
    public int channel_copy[AVRESAMPLE_MAX_CHANNELS];
    /***********************************************************
    copy needed
    ***********************************************************/
    public int do_copy;
    /***********************************************************
    dest index to zero
    ***********************************************************/
    public int channel_zero[AVRESAMPLE_MAX_CHANNELS];
    /***********************************************************
    zeroing needed
    ***********************************************************/
    public int do_zero;
    /***********************************************************
    dest index of each input channel
    ***********************************************************/
    public int input_map[AVRESAMPLE_MAX_CHANNELS];
}

[Compact]
public class AVAudioResampleContext {
    /***********************************************************
    AVClass for logging and AVOptions
    ***********************************************************/
    public AVClass av_class;

    /***********************************************************
    input channel layout
    ***********************************************************/
    public uint64 in_channel_layout;
    /***********************************************************
    input sample format
    ***********************************************************/
    public AVSampleFormat in_sample_fmt;
    /***********************************************************
    input sample rate
    ***********************************************************/
    public int in_sample_rate;
    /***********************************************************
    output channel layout
    ***********************************************************/
    public uint64 out_channel_layout;
    /***********************************************************
    output sample format
    ***********************************************************/
    public AVSampleFormat out_sample_fmt;
    /***********************************************************
    output sample rate
    ***********************************************************/
    public int out_sample_rate;
    /***********************************************************
    public internal sample format
    ***********************************************************/
    public AVSampleFormat internal_sample_fmt;
    /***********************************************************
    mixing coefficient type
    ***********************************************************/
    public AVMixCoeffType mix_coeff_type;
    /***********************************************************
    center mix level
    ***********************************************************/
    double center_mix_level;
    /***********************************************************
    surround mix level
    ***********************************************************/
    double surround_mix_level;
    /***********************************************************
    lfe mix level
    ***********************************************************/
    double lfe_mix_level;
    /***********************************************************
    enable mix level normalization
    ***********************************************************/
    public int normalize_mix_level;
    /***********************************************************
    force resampling
    ***********************************************************/
    public int force_resampling;
    /***********************************************************
    length of each FIR filter in the resampling filterbank relative to the cutoff frequency
    ***********************************************************/
    public int filter_size;
    /***********************************************************
    log2 of the number of entries in the resampling polyphase filterbank
    ***********************************************************/
    public int phase_shift;
    /***********************************************************
    if 1 then the resampling FIR filter will be linearly interpolated
    ***********************************************************/
    public int linear_interp;
    /***********************************************************
    resampling cutoff frequency. 1.0 corresponds to half the output sample rate
    ***********************************************************/
    double cutoff;
    /***********************************************************
    resampling filter type
    ***********************************************************/
    public AVResampleFilterType filter_type;
    /***********************************************************
    beta value for Kaiser window (only applicable if filter_type == AV_FILTER_TYPE_KAISER)
    ***********************************************************/
    public int kaiser_beta;
    /***********************************************************
    dither method
    ***********************************************************/
    public AVResampleDitherMethod dither_method;

    /***********************************************************
    number of input channels
    ***********************************************************/
    public int in_channels;
    /***********************************************************
    number of output channels
    ***********************************************************/
    public int out_channels;
    /***********************************************************
    number of channels used for resampling
    ***********************************************************/
    public int resample_channels;
    /***********************************************************
    downmixing is needed
    ***********************************************************/
    public int downmix_needed;
    /***********************************************************
    upmixing is needed
    ***********************************************************/
    public int upmix_needed;
    /***********************************************************
    either upmixing or downmixing is needed
    ***********************************************************/
    public int mixing_needed;
    /***********************************************************
    resampling is needed
    ***********************************************************/
    public int resample_needed;
    /***********************************************************
    input sample format conversion is needed
    ***********************************************************/
    public int in_convert_needed;
    /***********************************************************
    output sample format conversion is needed
    ***********************************************************/
    public int out_convert_needed;
    /***********************************************************
    input data copy is needed
    ***********************************************************/
    public int in_copy_needed;

    /***********************************************************
    buffer for converted input
    ***********************************************************/
    AudioData *in_buffer;
    /***********************************************************
    buffer for output from resampler
    ***********************************************************/
    AudioData *resample_out_buffer;
    /***********************************************************
    buffer for converted output
    ***********************************************************/
    AudioData *out_buffer;
    /***********************************************************
    FIFO for output samples
    ***********************************************************/
    AVAudioFifo *out_fifo;

    /***********************************************************
    input sample format conversion context
    ***********************************************************/
    AudioConvert *ac_in;
    /***********************************************************
    output sample format conversion context
    ***********************************************************/
    AudioConvert *ac_out;
    /***********************************************************
    resampling context
    ***********************************************************/
    ResampleContext *resample;
    /***********************************************************
    channel mixing context
    ***********************************************************/
    AudioMix *am;
    /***********************************************************
    matrixed stereo encoding
    ***********************************************************/
    public AVMatrixEncoding matrix_encoding;

    /***********************************************************
    mix matrix
    only used if avresample_set_matrix () is called before avresample_open ()
    ***********************************************************/
    double[] mix_matrix;

    public int use_channel_map;
    public RemapPoint remap_point;
    ChannelMapInfo ch_map_info;
};


public void ff_audio_resample_init_aarch64 (ResampleContext *c,
                                    AVSampleFormat sample_fmt);
public void ff_audio_resample_init_arm (ResampleContext *c,
                                AVSampleFormat sample_fmt);
