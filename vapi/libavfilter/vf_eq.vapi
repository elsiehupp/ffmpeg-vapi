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

public enum var_name {
    VAR_N,
    VAR_POS,
    VAR_R,
    VAR_T,
    VAR_NB
}

[Compact]
public class EQParameters {
    [CCode (cname="adjust")]
    public void (*adjust)(
        EQParameters *eq, uint8[] dst, int dst_stride,
        uint8[] src, int src_stride, int w, int h
    );

    public uint8 lut[256];

    double brightness, contrast, gamma, gamma_weight;
    public int lut_clean;

}

public enum EvalMode {
    EVAL_MODE_INIT,
    EVAL_MODE_FRAME,
    EVAL_MODE_NB
}

[Compact]
public class EQContext {
    const AVClass *class;

    EQParameters param[3];

    public char   *contrast_expr;
    AVExpr *contrast_pexpr;
    double  contrast;

    public char   *brightness_expr;
    AVExpr *brightness_pexpr;
    double  brightness;

    public char   *saturation_expr;
    AVExpr *saturation_pexpr;
    double  saturation;

    public char   *gamma_expr;
    AVExpr *gamma_pexpr;
    double  gamma;

    public char   *gamma_weight_expr;
    AVExpr *gamma_weight_pexpr;
    double  gamma_weight;

    public char   *gamma_r_expr;
    AVExpr *gamma_r_pexpr;
    double  gamma_r;

    public char   *gamma_g_expr;
    AVExpr *gamma_g_pexpr;
    double  gamma_g;

    public char   *gamma_b_expr;
    AVExpr *gamma_b_pexpr;
    double  gamma_b;

    double var_values[VAR_NB];

    [CCode (cname="")]
    public void (*process)(EQParameters *par, uint8[] dst, int dst_stride,
                    uint8[] src, int src_stride, int w, int h);
    EvalMode eval_mode;
}

public void ff_eq_init_x86 (EQContext *eq);
