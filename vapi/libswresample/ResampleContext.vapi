/***********************************************************
audio resampling
Copyright (c) 2004-2012 Michael Niedermayer <michaelni@gmx.at>

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
namespace LibSoftwareResample {

[CCode (cname="struct LibAVResample.ResampleContext",cheader_filename="subprojects/ffmpeg/libswresample/resample.h")]
[Compact]
internal class LibSoftwareResample.LibAVResample.ResampleContext {
    [CCode (cname="")]
    internal LibAVUtil.Log.Class? av_class;

    [CCode (cname="")]
    internal uint8[] filter_bank;

    [CCode (cname="")]
    internal int filter_length;

    [CCode (cname="")]
    internal int filter_alloc;

    [CCode (cname="")]
    internal int ideal_dst_incr;

    [CCode (cname="")]
    internal int dst_incr;

    [CCode (cname="")]
    internal int dst_incr_div;

    [CCode (cname="")]
    internal int dst_incr_mod;

    [CCode (cname="")]
    internal int index;

    [CCode (cname="")]
    internal int frac;

    [CCode (cname="")]
    internal int src_incr;

    [CCode (cname="")]
    internal int compensation_distance;

    [CCode (cname="")]
    internal int phase_count;

    [CCode (cname="")]
    internal int linear;

    [CCode (cname="")]
    internal SoftwareResampleFilterType filter_type;

    [CCode (cname="")]
    internal double kaiser_beta;

    [CCode (cname="")]
    internal double factor;

    [CCode (cname="")]
    internal AVSampleFormat format;

    [CCode (cname="")]
    internal int felem_size;

    [CCode (cname="")]
    internal int filter_shift;

    /***********************************************************
    desired phase_count when compensation is enabled
    ***********************************************************/
    [CCode (cname="")]
    internal int phase_count_compensation;

    [Compact]
    internal class DspFunctions { // not a named struct type !!!
        internal delegate void ResampleOneDelegate (
            void *dst,
            void *src,
            int n,
            int64 index,
            int64 incr
        );

        [CCode (cname="resample_one")]
        internal ResampleOneDelegate resample_one;

        internal delegate int ResampleCommonDelegate (
            LibSoftwareResample.LibAVResample.ResampleContext? resample_context,
            void *dst,
            void *src,
            int n,
            int update_ctx
        );

        [CCode (cname="resample_common")]
        internal ResampleCommonDelegate resample_common;

        internal delegate int ResambleLinearDelegate (
            LibSoftwareResample.LibAVResample.ResampleContext? resample_context,
            void *dst,
            void *src,
            int n,
            int update_ctx
        );

        [CCode (cname="resample_linear")]
        internal ResambleLinearDelegate resample_linear;
    }

    internal DspFunctions dsp;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/resample.h")]
    internal void swri_resample_dsp_init (
        LibSoftwareResample.LibAVResample.ResampleContext? resample_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/resample.h")]
    internal void swri_resample_dsp_x86_init (
        LibSoftwareResample.LibAVResample.ResampleContext? resample_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/resample.h")]
    internal void swri_resample_dsp_arm_init (
        LibSoftwareResample.LibAVResample.ResampleContext? resample_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/resample.h")]
    internal void swri_resample_dsp_aarch64_init (
        LibSoftwareResample.LibAVResample.ResampleContext? resample_context
    );

}

} // namespace LibSoftwareResample
