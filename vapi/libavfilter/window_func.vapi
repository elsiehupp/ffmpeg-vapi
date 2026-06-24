/***********************************************************
Copyright (c) 2015 Paul B Mahol

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

[CCode (cname="enum WindowFunc",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
public enum WindowFunc {
    [CCode (cname="WFUNC_RECT")]
    RECT,

    [CCode (cname="WFUNC_HANNING")]
    HANNING,

    [CCode (cname="WFUNC_HAMMING")]
    HAMMING,

    [CCode (cname="WFUNC_BLACKMAN")]
    BLACKMAN,

    [CCode (cname="WFUNC_BARTLETT")]
    BARTLETT,

    [CCode (cname="WFUNC_WELCH")]
    WELCH,

    [CCode (cname="WFUNC_FLATTOP")]
    FLATTOP,

    [CCode (cname="WFUNC_BHARRIS")]
    BHARRIS,

    [CCode (cname="WFUNC_BNUTTALL")]
    BNUTTALL,

    [CCode (cname="WFUNC_SINE")]
    SINE,

    [CCode (cname="WFUNC_NUTTALL")]
    NUTTALL,

    [CCode (cname="WFUNC_BHANN")]
    BHANN,

    [CCode (cname="WFUNC_LANCZOS")]
    LANCZOS,

    [CCode (cname="WFUNC_GAUSS")]
    GAUSS,

    [CCode (cname="WFUNC_TUKEY")]
    TUKEY,

    [CCode (cname="WFUNC_DOLPH")]
    DOLPH,

    [CCode (cname="WFUNC_CAUCHY")]
    CAUCHY,

    [CCode (cname="WFUNC_PARZEN")]
    PARZEN,

    [CCode (cname="WFUNC_POISSON")]
    POISSON,

    [CCode (cname="WFUNC_BOHMAN")]
    BOHMAN,

    [CCode (cname="NB_WFUNC")]
    NB;
}

[CCode (cname="generate_window_func",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
public static inline void generate_window_func (
    float[] lut,
    int N,
    int win_func,
    float[] overlap
);
