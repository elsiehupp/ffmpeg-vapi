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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/resample.h")]
[Compact]
public class ResampleContext {
    [CCode (cname="")]
    public AVClass? av_class;

    [CCode (cname="")]
    public uint8[] filter_bank;

    [CCode (cname="")]
    public int filter_length;

    [CCode (cname="")]
    public int filter_alloc;

    [CCode (cname="")]
    public int ideal_dst_incr;

    [CCode (cname="")]
    public int dst_incr;

    [CCode (cname="")]
    public int dst_incr_div;

    [CCode (cname="")]
    public int dst_incr_mod;

    [CCode (cname="")]
    public int index;

    [CCode (cname="")]
    public int frac;

    [CCode (cname="")]
    public int src_incr;

    [CCode (cname="")]
    public int compensation_distance;

    [CCode (cname="")]
    public int phase_count;

    [CCode (cname="")]
    public int linear;

    [CCode (cname="")]
    public SwrFilterType filter_type;

    [CCode (cname="")]
    public double kaiser_beta;

    [CCode (cname="")]
    public double factor;

    [CCode (cname="")]
    public AVSampleFormat format;

    [CCode (cname="")]
    public int felem_size;

    [CCode (cname="")]
    public int filter_shift;

    /***********************************************************
    desired phase_count when compensation is enabled
    ***********************************************************/
    [CCode (cname="")]
    public int phase_count_compensation;

    [Compact]
    public class FooBar {
        public delegate void ResampleOneDelegate (
            void *dst,
            void *src,
            int n,
            int64 index,
            int64 incr
        );

        [CCode (cname="resample_one")]
        public ResampleOneDelegate resample_one;

        public delegate int ResampleCommonDelegate (
            ResampleContext? resample_context,
            void *dst,
            void *src,
            int n,
            int update_ctx
        );

        [CCode (cname="resample_common")]
        public ResampleCommonDelegate resample_common;

        public delegate int ResambleLinearDelegate (
            ResampleContext? resample_context,
            void *dst,
            void *src,
            int n,
            int update_ctx
        );

        [CCode (cname="resample_linear")]
        public ResambleLinearDelegate resample_linear;

    }

    public FooBar dsp;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/resample.h")]
public void swri_resample_dsp_init (
    ResampleContext? resample_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/resample.h")]
public void swri_resample_dsp_x86_init (
    ResampleContext? resample_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/resample.h")]
public void swri_resample_dsp_arm_init (
    ResampleContext? resample_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/resample.h")]
public void swri_resample_dsp_aarch64_init (
    ResampleContext? resample_context
);
