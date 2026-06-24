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

[CCode (cname="enum BlendMode",cprefix="BLEND_",cheader_filename="subprojects/ffmpeg/libavfilter/blend.h")]
public enum BlendMode {
    UNSET, // = -1,
    NORMAL,
    ADDITION,
    AND,
    AVERAGE,
    BURN,
    DARKEN,
    DIFFERENCE,

    [CCode (cname="BLEND_GRAINEXTRACT")]
    GRAIN_EXTRACT,
    DIVIDE,
    DODGE,
    EXCLUSION,

    [CCode (cname="BLEND_HARDLIGHT")]
    HARD_LIGHT,
    LIGHTEN,
    MULTIPLY,
    NEGATION,
    OR,
    OVERLAY,
    PHOENIX,

    [CCode (cname="BLEND_PINLIGHT")]
    PIN_LIGHT,
    REFLECT,
    SCREEN,

    [CCode (cname="BLEND_SOFTLIGHT")]
    SOF_TLIGHT,
    SUBTRACT,

    [CCode (cname="BLEND_VIVIDLIGHT")]
    VIVID_LIGHT,
    XOR,

    [CCode (cname="BLEND_HARDMIX")]
    HARD_MIX,

    [CCode (cname="BLEND_LINEARLIGHT")]
    LINEAR_LIGHT,
    GLOW,

    [CCode (cname="BLEND_GRAINMERGE")]
    GRAIN_MERGE,

    [CCode (cname="BLEND_MULTIPLY128")]
    MULTIPLY_128,
    HEAT,
    FREEZE,
    EXTREMITY,
    NB;
}

[CCode (cname="struct FilterParams",cheader_filename="subprojects/ffmpeg/libavfilter/blend.h")]
[Compact]
public class FilterParams {
    [CCode (cname="")]
    public BlendMode mode;

    [CCode (cname="")]
    public double opacity;

    [CCode (cname="")]
    public AVExpr? e;

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
        FilterParams? param,
        double[] values,
        int starty
    );

    [CCode (cname="blend")]
    public BlendDelegate blend;

}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/blend.h")]
public void ff_blend_init (
    FilterParams? param,
    int depth
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/blend.h")]
public void ff_blend_init_x86 (
    FilterParams? param,
    int depth
);
