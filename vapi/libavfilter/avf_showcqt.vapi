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

[Compact]
public class Coeffs {
    FFTSample *val;
    public int start, len;
}

[Compact]
public class RGBFloat {
    float r, g, b;
}

[Compact]
public class YUVFloat {
    float y, u, v;
}

typedef union ColorFloat {
    RGBFloat rgb;
    YUVFloat yuv;
}

[Compact]
public class ShowCQTContext {
    const AVClass       *class;
    AVFilterContext     *ctx;
    AVFrame             *axis_frame;
    AVFrame             *sono_frame;
    public AVPixelFormat  format;
    public int                 sono_idx;
    public int                 sono_count;
    public int                 step;
    public AVRational          step_frac;
    public int                 remaining_frac;
    public int                 remaining_fill;
    public int                 remaining_fill_max;
    public int64             next_pts;
    double              *freq;
    FFTContext          *fft_ctx;
    Coeffs              *coeffs;
    FFTComplex          *fft_data;
    FFTComplex          *fft_result;
    FFTComplex          *cqt_result;
    float               *attack_data;
    public int                 fft_bits;
    public int                 fft_len;
    public int                 cqt_len;
    public int                 cqt_align;
    ColorFloat          *c_buf;
    float               *h_buf;
    float               *rcp_h_buf;
    float               *sono_v_buf;
    float               *bar_v_buf;
    float               cmatrix[3][3];
    float               cscheme_v[6];
    /***********************************************************
    callback
    ***********************************************************/
    [CCode (cname="")]
    void                (*cqt_calc)(
        FFTComplex *dst, FFTComplex *src, Coeffs *coeffs,
        int len, int fft_len
    );

    [CCode (cname="")]
    void                (*permute_coeffs)(
        float *v, int len
    );

    [CCode (cname="")]
    void                (*draw_bar)(
        AVFrame *out, float *h, float *rcp_h,
        ColorFloat *c, int bar_h, float bar_t
    );

    [CCode (cname="")]
    void                (*draw_axis)(
        AVFrame *out, AVFrame *axis, ColorFloat *c, int off
    );

    [CCode (cname="")]
    void                (*draw_sono)(
        AVFrame *out, AVFrame *sono, int off, int idx
    );

    [CCode (cname="")]
    void                (*update_sono)(
        AVFrame *sono, ColorFloat *c, int idx
    );

    /***********************************************************
    performance debugging
    ***********************************************************/
    public int64             fft_time;
    public int64             cqt_time;
    public int64             process_cqt_time;
    public int64             update_sono_time;
    public int64             alloc_time;
    public int64             bar_time;
    public int64             axis_time;
    public int64             sono_time;
    /***********************************************************
    option
    ***********************************************************/
    public int                 width, height;
    public AVRational          rate;
    public int                 bar_h;
    public int                 axis_h;
    public int                 sono_h;
    /***********************************************************
    deprecated
    ***********************************************************/
    public int                 fullhd;
    public char                *sono_v;
    public char                *bar_v;
    float               sono_g;
    float               bar_g;
    float               bar_t;
    double              timeclamp;
    double              attack;
    double              basefreq;
    double              endfreq;
    /***********************************************************
    deprecated - ignored
    ***********************************************************/
    float               coeffclamp;
    public char                *tlength;
    public int                 count;
    public int                 fcount;
    public char                *fontfile;
    public char                *font;
    public char                *fontcolor;
    public char                *axisfile;
    public int                 axis;
    public int                 csp;
    public char                *cscheme;
}

public void ff_showcqt_init_x86 (ShowCQTContext *s);
