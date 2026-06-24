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
namespace LibAVResample {

[CCode (cname="struct ResampleContext",cheader_filename="subprojects/ffmpeg/libavresample/resample.h")]
[Compact]
internal class ResampleContext {
    [CCode (cname="")]
    internal AVAudioResampleContext? avr;

    [CCode (cname="")]
    internal AudioData? buffer;

    [CCode (cname="")]
    internal uint8[] filter_bank;

    [CCode (cname="")]
    internal int filter_length;

    [CCode (cname="")]
    internal int ideal_dst_incr;

    [CCode (cname="")]
    internal int dst_incr;

    [CCode (cname="")]
    internal uint index;

    [CCode (cname="")]
    internal int frac;

    [CCode (cname="")]
    internal int src_incr;

    [CCode (cname="")]
    internal int compensation_distance;

    [CCode (cname="")]
    internal int phase_shift;

    [CCode (cname="")]
    internal int phase_mask;

    [CCode (cname="")]
    internal int linear;

    [CCode (cname="")]
    internal AVResampleFilterType filter_type;

    [CCode (cname="")]
    internal int kaiser_beta;

    internal delegate void SetFilterDelegate (
        void *filter,
        double[] tab,
        int phase,
        int tap_count
    );

    [CCode (cname="set_filter")]
    internal SetFilterDelegate set_filter;

    internal delegate void ResampleOneDelegate (
        ResampleContext? resample_context,
        void *dst0,
        int dst_index,
        void *src0,
        uint index,
        int frac
    );

    [CCode (cname="resample_one")]
    internal ResampleOneDelegate resample_one;

    internal delegate void ResampleNearestDelegate (
        void *dst0,
        int dst_index,
        void *src0,
        uint index
    );

    [CCode (cname="resample_nearest")]
    internal ResampleNearestDelegate resample_nearest;

    [CCode (cname="")]
    internal int padding_size;

    [CCode (cname="")]
    internal int initial_padding_filled;

    [CCode (cname="")]
    internal int initial_padding_samples;

    [CCode (cname="")]
    internal int final_padding_filled;

    [CCode (cname="")]
    internal int final_padding_samples;
}

/***********************************************************
Allocate and initialize a ResampleContext.

The parameters in the AVAudioResampleContext are used to initialize the
ResampleContext.

@param avr  AVAudioResampleContext
@return     newly-allocated ResampleContext
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/resample.h")]
internal ResampleContext? ff_audio_resample_init (
    AVAudioResampleContext? avr
);

/***********************************************************
Free a ResampleContext.

@param resample_context  ResampleContext
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/resample.h")]
internal void ff_audio_resample_free (
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
internal int ff_audio_resample (
    ResampleContext? resample_context,
    AudioData? dst,
    AudioData? src
);

} // namespace LibAVResample
