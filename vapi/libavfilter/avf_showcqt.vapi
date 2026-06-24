/***********************************************************
Copyright (c) 2015 Muhammad Faiz <mfcc64@gmail.com>

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

[CCode (cname="struct Coeffs",cheader_filename="subprojects/ffmpeg/libavfilter/avf_showcqt.h")]
[Compact]
public class Coeffs {
    [CCode (cname="")]
    public FFTSample? val;

    [CCode (cname="")]
    public int start;

    [CCode (cname="")]
    public int len;
}

[CCode (cname="struct RGBFloat",cheader_filename="subprojects/ffmpeg/libavfilter/avf_showcqt.h")]
[Compact]
public class RGBFloat {
    [CCode (cname="")]
    public float r;

    [CCode (cname="")]
    public float g;

    [CCode (cname="")]
    public float b;
}

[CCode (cname="struct YUVFloat",cheader_filename="subprojects/ffmpeg/libavfilter/avf_showcqt.h")]
[Compact]
public class YUVFloat {
    [CCode (cname="")]
    public float y;

    [CCode (cname="")]
    public float u;

    [CCode (cname="")]
    public float v;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/avf_showcqt.h")]
public typedef union ColorFloat {
    [CCode (cname="")]
    RGBFloat rgb;

    [CCode (cname="")]
    YUVFloat yuv;
}

[CCode (cname="struct ShowCQTContext",cheader_filename="subprojects/ffmpeg/libavfilter/avf_showcqt.h")]
[Compact]
public class ShowCQTContext {
    [CCode (cname="class")]
    public AVClass av_class;

    [CCode (cname="")]
    public AVFilterContext? ctx;

    [CCode (cname="")]
    public AVFrame? axis_frame;

    [CCode (cname="")]
    public AVFrame? sono_frame;

    [CCode (cname="")]
    public AVPixelFormat format;

    [CCode (cname="")]
    public int sono_idx;

    [CCode (cname="")]
    public int sono_count;

    [CCode (cname="")]
    public int step;

    [CCode (cname="")]
    public AVRational step_frac;

    [CCode (cname="")]
    public int remaining_frac;

    [CCode (cname="")]
    public int remaining_fill;

    [CCode (cname="")]
    public int remaining_fill_max;

    [CCode (cname="")]
    public int64 next_pts;

    [CCode (cname="")]
    public double? freq;

    [CCode (cname="")]
    public FFTContext? fft_ctx;

    [CCode (cname="")]
    public Coeffs? coeffs;

    [CCode (cname="")]
    public FFTComplex? fft_data;

    [CCode (cname="")]
    public FFTComplex? fft_result;

    [CCode (cname="")]
    public FFTComplex? cqt_result;

    [CCode (cname="")]
    public float? attack_data;

    [CCode (cname="")]
    public int fft_bits;

    [CCode (cname="")]
    public int fft_len;

    [CCode (cname="")]
    public int cqt_len;

    [CCode (cname="")]
    public int cqt_align;

    [CCode (cname="")]
    public ColorFloat? c_buf;

    [CCode (cname="")]
    public float? h_buf;

    [CCode (cname="")]
    public float? rcp_h_buf;

    [CCode (cname="")]
    public float? sono_v_buf;

    [CCode (cname="")]
    public float? bar_v_buf;

    [CCode (cname="")]
    public float cmatrix[3][3];

    [CCode (cname="")]
    public float cscheme_v[6];

    public delegate void QctCalcDelegate (
        FFTComplex? dst,
        FFTComplex? src,
        Coeffs? coeffs,
        int len,
        int fft_len
    );

    /***********************************************************
    callback
    ***********************************************************/
    [CCode (cname="cqt_calc")]
    public QctCalcDelegate cqt_calc;

    public delegate void PermuteCoeffsDelegate (
        float[] v,
        int len
    );

    [CCode (cname="permute_coeffs")]
    public PermuteCoeffsDelegate permute_coeffs;

    public delegate void DrawBarDelegate (
        AVFrame? out,
        float[] h,
        float[] rcp_h,
        ColorFloat? color_float,
        int bar_h,
        float bar_t
    );

    [CCode (cname="draw_bar")]
    public DrawBarDelegate draw_bar;

    public delegate void DrawAxisDelegate (
        AVFrame? out,
        AVFrame? axis,
        ColorFloat? color_float,
        int off
    );

    [CCode (cname="draw_axis")]
    public DrawAxisDelegate draw_axis;

    public delegate void DrawSonoDelegate (
        AVFrame? out,
        AVFrame? sono,
        int off,
        int idx
    );

    [CCode (cname="draw_sono")]
    public DrawSonoDelegate draw_sono;

    public delegate void UpdateSonoDelegate (
        AVFrame? sono,
        ColorFloat? color_float,
        int idx
    );

    [CCode (cname="update_sono")]
    public UpdateSonoDelegate update_sono;

    /***********************************************************
    performance debugging
    ***********************************************************/
    [CCode (cname="")]
    public int64 fft_time;

    [CCode (cname="")]
    public int64 cqt_time;

    [CCode (cname="")]
    public int64 process_cqt_time;

    [CCode (cname="")]
    public int64 update_sono_time;

    [CCode (cname="")]
    public int64 alloc_time;

    [CCode (cname="")]
    public int64 bar_time;

    [CCode (cname="")]
    public int64 axis_time;

    [CCode (cname="")]
    public int64 sono_time;

    /***********************************************************
    option
    ***********************************************************/
    [CCode (cname="")]
    public int width;

    [CCode (cname="")]
    public int height;

    [CCode (cname="")]
    public AVRational rate;

    [CCode (cname="")]
    public int bar_h;

    [CCode (cname="")]
    public int axis_h;

    [CCode (cname="")]
    public int sono_h;

    /***********************************************************
    deprecated
    ***********************************************************/
    [CCode (cname="")]
    public int fullhd;

    [CCode (cname="")]
    public string sono_v;

    [CCode (cname="")]
    public string bar_v;

    [CCode (cname="")]
    public float sono_g;

    [CCode (cname="")]
    public float bar_g;

    [CCode (cname="")]
    public float bar_t;

    [CCode (cname="")]
    public double timeclamp;

    [CCode (cname="")]
    public double attack;

    [CCode (cname="")]
    public double basefreq;

    [CCode (cname="")]
    public double endfreq;

    /***********************************************************
    deprecated - ignored
    ***********************************************************/
    [CCode (cname="")]
    public float coeffclamp;

    [CCode (cname="")]
    public string tlength;

    [CCode (cname="")]
    public int count;

    [CCode (cname="")]
    public int fcount;

    [CCode (cname="")]
    public string fontfile;

    [CCode (cname="")]
    public string font;

    [CCode (cname="")]
    public string fontcolor;

    [CCode (cname="")]
    public string axisfile;

    [CCode (cname="")]
    public int axis;

    [CCode (cname="")]
    public int csp;

    [CCode (cname="")]
    public string cscheme;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/avf_showcqt.h")]
public void ff_showcqt_init_x86 (
    ShowCQTContext? s
);
