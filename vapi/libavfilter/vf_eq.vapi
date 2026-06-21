/***********************************************************
Original MPlayer filters by Richard Felker, Hampa Hug, Daniel Moreno,
and Michael Niedermeyer.

Copyright (c) 2014 James Darnley <james.darnley@gmail.com>
Copyright (c) 2015 Arwa Arif <arwaarif1994@gmail.com>

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with FFmpeg; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
***********************************************************/

static string const var_names[] = {
    "n", // frame count
    "pos", // frame position
    "r", // frame rate
    "t", // timestamp expressed in seconds
    NULL
}

[CCode (cname="",cheader_filename="")]
public enum var_name {
    [CCode (cname="")]
    VAR_N,

    [CCode (cname="")]
    VAR_POS,

    [CCode (cname="")]
    VAR_R,

    [CCode (cname="")]
    VAR_T,

    [CCode (cname="")]
    VAR_NB;
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class EQParameters {
    public delegate void AdjustDelegate (
        EQParameters *eq,
        uint8[] dst,
        int dst_stride,
        uint8[] src,
        int src_stride,
        int w,
        int h
    );

    [CCode (cname="adjust")]
    public AdjustDelegate adjust;

    [CCode (cname="")]
    public uint8 lut[256];

    [CCode (cname="")]
    public double brightness;

    [CCode (cname="")]
    public double contrast;

    [CCode (cname="")]
    public double gamma;

    [CCode (cname="")]
    public double gamma_weight;

    [CCode (cname="")]
    public int lut_clean;

}

[CCode (cname="",cheader_filename="")]
public enum EvalMode {
    [CCode (cname="")]
    EVAL_MODE_INIT,

    [CCode (cname="")]
    EVAL_MODE_FRAME,

    [CCode (cname="")]
    EVAL_MODE_NB
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class EQContext {
    [CCode (cname="")]
    public AVClass class;

    [CCode (cname="")]
    public EQParameters param[3];

    [CCode (cname="")]
    public string contrast_expr;

    [CCode (cname="")]
    public AVExpr *contrast_pexpr;

    [CCode (cname="")]
    public double contrast;

    [CCode (cname="")]
    public string brightness_expr;

    [CCode (cname="")]
    public AVExpr *brightness_pexpr;

    [CCode (cname="")]
    public double brightness;

    [CCode (cname="")]
    public string saturation_expr;

    [CCode (cname="")]
    public AVExpr *saturation_pexpr;

    [CCode (cname="")]
    public double saturation;

    [CCode (cname="")]
    public string gamma_expr;

    [CCode (cname="")]
    public AVExpr *gamma_pexpr;

    [CCode (cname="")]
    public double gamma;

    [CCode (cname="")]
    public string gamma_weight_expr;

    [CCode (cname="")]
    public AVExpr *gamma_weight_pexpr;

    [CCode (cname="")]
    public double gamma_weight;

    [CCode (cname="")]
    public string gamma_r_expr;

    [CCode (cname="")]
    public AVExpr *gamma_r_pexpr;

    [CCode (cname="")]
    public double gamma_r;

    [CCode (cname="")]
    public string gamma_g_expr;

    [CCode (cname="")]
    public AVExpr *gamma_g_pexpr;

    [CCode (cname="")]
    public double gamma_g;

    [CCode (cname="")]
    public string gamma_b_expr;

    [CCode (cname="")]
    public AVExpr *gamma_b_pexpr;

    [CCode (cname="")]
    public double gamma_b;

    [CCode (cname="")]
    public double var_values[VAR_NB];

    public delegate void ProcessDelegate (
        EQParameters *par,
        uint8[] dst,
        int dst_stride,
        uint8[] src,
        int src_stride,
        int w,
        int h
    );

    [CCode (cname="")]
    public ProcessDelegate process;

    [CCode (cname="")]
    public EvalMode eval_mode;
}

[CCode (cname="",cheader_filename="")]
public void ff_eq_init_x86 (
    EQContext *eq
);
