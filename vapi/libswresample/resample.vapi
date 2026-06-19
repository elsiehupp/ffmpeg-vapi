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

[Compact]
public class ResampleContext {
    const AVClass *av_class;
    uint8[] filter_bank;
    public int filter_length;
    public int filter_alloc;
    public int ideal_dst_incr;
    public int dst_incr;
    public int dst_incr_div;
    public int dst_incr_mod;
    public int index;
    public int frac;
    public int src_incr;
    public int compensation_distance;
    public int phase_count;
    public int linear;
    public SwrFilterType filter_type;
    double kaiser_beta;
    double factor;
    public AVSampleFormat format;
    public int felem_size;
    public int filter_shift;
    /***********************************************************
    desired phase_count when compensation is enabled
    ***********************************************************/
    public int phase_count_compensation;

    struct {
        [CCode (cname="resample_one")]
        public void (*resample_one)(
            void *dst, void *src,
            int n, int64 index, int64 incr
        );

        [CCode (cname="resample_common")]
        int (*resample_common)(
            ResampleContext *c, void *dst,
            void *src, int n, int update_ctx
        );

        [CCode (cname="resample_linear")]
        int (*resample_linear)(
            ResampleContext *c, void *dst,
            void *src, int n, int update_ctx
        );

    } dsp;
}

public void swri_resample_dsp_init (ResampleContext *c);
public void swri_resample_dsp_x86_init (ResampleContext *c);
public void swri_resample_dsp_arm_init (ResampleContext *c);
public void swri_resample_dsp_aarch64_init (ResampleContext *c);
