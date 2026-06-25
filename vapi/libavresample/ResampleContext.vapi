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
internal class LibAVResample.ResampleContext {
    [CCode (cname="")]
    internal LibAVResample.AudioResampleContext? avr;

    [CCode (cname="")]
    internal LibAVResample.AudioData? buffer;

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
    internal LibAVResample.ResampleFilterType filter_type;

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
        LibAVResample.ResampleContext? resample_context,
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

    /***********************************************************
    Allocate and initialize a LibAVResample.ResampleContext.

    The parameters in the LibAVResample.AudioResampleContext are used to initialize the
    LibAVResample.ResampleContext.

    @param avr  LibAVResample.AudioResampleContext
    @return     newly-allocated LibAVResample.ResampleContext
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/resample.h")]
    internal LibAVResample.ResampleContext? ff_audio_resample_init (
        LibAVResample.AudioResampleContext? avr
    );

    /***********************************************************
    Free a LibAVResample.ResampleContext.

    @param resample_context  LibAVResample.ResampleContext
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/resample.h")]
    internal void ff_audio_resample_free (
        LibAVResample.ResampleContext **resample_context
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

    @param resample_context         LibAVResample.ResampleContext
    @param dst       destination audio data
    @param src       source audio data
    @return          0 on success, negative AVERROR code on failure
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/resample.h")]
    internal int ff_audio_resample (
        LibAVResample.ResampleContext? resample_context,
        LibAVResample.AudioData? dst,
        LibAVResample.AudioData? src
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
    internal void ff_audio_resample_init_aarch64 (
        LibAVResample.ResampleContext? c,
        AVSampleFormat sample_fmt
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
    internal void ff_audio_resample_init_arm (
        LibAVResample.ResampleContext? c,
        AVSampleFormat sample_fmt
    );

}

} // namespace LibAVResample
