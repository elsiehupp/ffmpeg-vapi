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

[CCode (cname="struct Resampler",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
[Compact]
internal class LibSoftwareResample.Resampler {
    [CCode (cname="resample_init_func",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal delegate LibSoftwareResample.LibAVResample.ResampleContext ResampleInitDelegate (
        LibSoftwareResample.LibAVResample.ResampleContext? c,
        int out_rate,
        int in_rate,
        int filter_size,
        int phase_shift,
        int linear,
        double cutoff,
        AVSampleFormat format,
        SoftwareResampleFilterType filter_type,
        double kaiser_beta,
        double precision,
        int cheby,
        int exact_rational
    );

    [CCode (cname="")]
    internal ResampleInitDelegate init;

    [CCode (cname="resample_free_func",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal delegate void ResampleFreeDelegate (
        LibSoftwareResample.LibAVResample.ResampleContext **c
    );

    [CCode (cname="")]
    internal ResampleFreeDelegate free;

    [CCode (cname="multiple_resample_func",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal delegate int MultipleResampleDelegate (
        LibSoftwareResample.LibAVResample.ResampleContext? c,
        LibSoftwareResample.AudioData? dst,
        int dst_size,
        LibSoftwareResample.AudioData? src,
        int src_size,
        out int consumed
    );

    [CCode (cname="")]
    internal MultipleResampleDelegate multiple_resample;

    [CCode (cname="resample_flush_func",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal delegate int ResampleFlushDelegate (
        LibSoftwareResample.SoftwareContext? c
    );

    [CCode (cname="")]
    internal ResampleFlushDelegate flush;

    [CCode (cname="set_compensation_func",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal delegate int SetCompensationDelegate (
        LibSoftwareResample.LibAVResample.ResampleContext? c,
        int sample_delta,
        int compensation_distance
    );

    [CCode (cname="")]
    internal SetCompensationDelegate set_compensation;

    [CCode (cname="get_delay_func",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal delegate int64 GetDelayDelegate (
        LibSoftwareResample.SoftwareContext? s,
        int64 base
    );

    [CCode (cname="")]
    internal GetDelayDelegate get_delay;

    [CCode (cname="invert_initial_buffer_func",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal delegate int InvertInitialBufferDelegate (
        LibSoftwareResample.LibAVResample.ResampleContext? c,
        LibSoftwareResample.AudioData? dst,
        LibSoftwareResample.AudioData? src,
        int src_size,
        out int dst_idx,
        out int dst_count
    );

    [CCode (cname="")]
    internal InvertInitialBufferDelegate invert_initial_buffer;

    [CCode (cname="get_out_samples_func",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal delegate int64 GetOutSamplesDelegate (
        LibSoftwareResample.SoftwareContext? s,
        int in_samples
    );

    [CCode (cname="")]
    internal GetOutSamplesDelegate get_out_samples;
}

//  extern struct LibSoftwareResample.Resampler const swri_resampler;
//  extern struct LibSoftwareResample.Resampler const swri_soxr_resampler;

} // namespace LibSoftwareResample
