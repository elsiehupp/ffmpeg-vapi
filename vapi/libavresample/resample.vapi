/***********************************************************
Copyright (c) 2004 Michael Niedermayer <michaelni@gmx.at>

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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/resample.h")]
[Compact]
public class ResampleContext {
    [CCode (cname="")]
    public AVAudioResampleContext? avr;

    [CCode (cname="")]
    public AudioData? buffer;

    [CCode (cname="")]
    public uint8[] filter_bank;

    [CCode (cname="")]
    public int filter_length;

    [CCode (cname="")]
    public int ideal_dst_incr;

    [CCode (cname="")]
    public int dst_incr;

    [CCode (cname="")]
    public uint index;

    [CCode (cname="")]
    public int frac;

    [CCode (cname="")]
    public int src_incr;

    [CCode (cname="")]
    public int compensation_distance;

    [CCode (cname="")]
    public int phase_shift;

    [CCode (cname="")]
    public int phase_mask;

    [CCode (cname="")]
    public int linear;

    [CCode (cname="")]
    public AVResampleFilterType filter_type;

    [CCode (cname="")]
    public int kaiser_beta;

    public delegate void SetFilterDelegate (
        void *filter,
        double[] tab,
        int phase,
        int tap_count
    );

    [CCode (cname="set_filter")]
    public SetFilterDelegate set_filter;

    public delegate void ResampleOneDelegate (
        ResampleContext? resample_context,
        void *dst0,
        int dst_index,
        void *src0,
        uint index,
        int frac
    );

    [CCode (cname="resample_one")]
    public ResampleOneDelegate resample_one;

    public delegate void ResampleNearestDelegate (
        void *dst0,
        int dst_index,
        void *src0,
        uint index
    );

    [CCode (cname="resample_nearest")]
    public ResampleNearestDelegate resample_nearest;

    [CCode (cname="")]
    public int padding_size;

    [CCode (cname="")]
    public int initial_padding_filled;

    [CCode (cname="")]
    public int initial_padding_samples;

    [CCode (cname="")]
    public int final_padding_filled;

    [CCode (cname="")]
    public int final_padding_samples;
}

/***********************************************************
Allocate and initialize a ResampleContext.

The parameters in the AVAudioResampleContext are used to initialize the
ResampleContext.

@param avr  AVAudioResampleContext
@return     newly-allocated ResampleContext
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/resample.h")]
public ResampleContext? ff_audio_resample_init (
    AVAudioResampleContext? avr
);

/***********************************************************
Free a ResampleContext.

@param resample_context  ResampleContext
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/resample.h")]
public void ff_audio_resample_free (
    ResampleContext **resample_context
);

/***********************************************************
Resample audio data.

Changes the sample rate.

@par
All samples in the source data may not be consumed depending on the
resampling parameters and the size of the output buffer. The unconsumed
samples are automatically added to the start of the source in the next call.
If the destination data can be reallocated, that may be done in this function
in order to fit all available output. If it cannot be reallocated, fewer
input samples will be consumed in order to have the output fit in the
destination data buffers.

@param resample_context         ResampleContext
@param dst       destination audio data
@param src       source audio data
@return          0 on success, negative AVERROR code on failure
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/resample.h")]
public int ff_audio_resample (
    ResampleContext? resample_context,
    AudioData? dst,
    AudioData? src
);
