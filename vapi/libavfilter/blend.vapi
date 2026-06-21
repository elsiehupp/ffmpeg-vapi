/***********************************************************
Copyright (c) 2013 Paul B Mahol

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

[CCode (cname="",cheader_filename="")]
public enum BlendMode {
    [CCode (cname="")]
    BLEND_UNSET = -1,

    [CCode (cname="")]
    BLEND_NORMAL,

    [CCode (cname="")]
    BLEND_ADDITION,

    [CCode (cname="")]
    BLEND_AND,

    [CCode (cname="")]
    BLEND_AVERAGE,

    [CCode (cname="")]
    BLEND_BURN,

    [CCode (cname="")]
    BLEND_DARKEN,

    [CCode (cname="")]
    BLEND_DIFFERENCE,

    [CCode (cname="")]
    BLEND_GRAINEXTRACT,

    [CCode (cname="")]
    BLEND_DIVIDE,

    [CCode (cname="")]
    BLEND_DODGE,

    [CCode (cname="")]
    BLEND_EXCLUSION,

    [CCode (cname="")]
    BLEND_HARDLIGHT,

    [CCode (cname="")]
    BLEND_LIGHTEN,

    [CCode (cname="")]
    BLEND_MULTIPLY,

    [CCode (cname="")]
    BLEND_NEGATION,

    [CCode (cname="")]
    BLEND_OR,

    [CCode (cname="")]
    BLEND_OVERLAY,

    [CCode (cname="")]
    BLEND_PHOENIX,

    [CCode (cname="")]
    BLEND_PINLIGHT,

    [CCode (cname="")]
    BLEND_REFLECT,

    [CCode (cname="")]
    BLEND_SCREEN,

    [CCode (cname="")]
    BLEND_SOFTLIGHT,

    [CCode (cname="")]
    BLEND_SUBTRACT,

    [CCode (cname="")]
    BLEND_VIVIDLIGHT,

    [CCode (cname="")]
    BLEND_XOR,

    [CCode (cname="")]
    BLEND_HARDMIX,

    [CCode (cname="")]
    BLEND_LINEARLIGHT,

    [CCode (cname="")]
    BLEND_GLOW,

    [CCode (cname="")]
    BLEND_GRAINMERGE,

    [CCode (cname="")]
    BLEND_MULTIPLY128,

    [CCode (cname="")]
    BLEND_HEAT,

    [CCode (cname="")]
    BLEND_FREEZE,

    [CCode (cname="")]
    BLEND_EXTREMITY,

    [CCode (cname="")]
    BLEND_NB
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class FilterParams {
    [CCode (cname="")]
    public BlendMode mode;

    [CCode (cname="")]
    public double opacity;

    [CCode (cname="")]
    public AVExpr *e;

    [CCode (cname="")]
    public string expr_str;

    public delegate void BlendDelegate (
        uint8[] top,
        ptrdiff_t top_linesize,
        uint8[] bottom,
        ptrdiff_t bottom_linesize,
        uint8[] dst,
        ptrdiff_t dst_linesize,
        ptrdiff_t width,
        ptrdiff_t height,
        struct FilterParams *param,
        double[] values,
        int starty
    );

    [CCode (cname="blend")]
    public BlendDelegate blend;

}

[CCode (cname="",cheader_filename="")]
public void ff_blend_init (
    FilterParams *param,
    int depth
);

[CCode (cname="",cheader_filename="")]
public void ff_blend_init_x86 (
    FilterParams *param,
    int depth
);
