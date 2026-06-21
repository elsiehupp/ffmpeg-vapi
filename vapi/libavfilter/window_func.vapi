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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
public enum WindowFunc {
    WFUNC_RECT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_HANNING,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_HAMMING,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_BLACKMAN,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_BARTLETT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_WELCH,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_FLATTOP,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_BHARRIS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_BNUTTALL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_SINE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_NUTTALL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_BHANN,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_LANCZOS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_GAUSS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_TUKEY,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_DOLPH,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_CAUCHY,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_PARZEN,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_POISSON,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    WFUNC_BOHMAN,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
    NB_WFUNC;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/window_func.h")]
public static inline void generate_window_func (
    float[] lut,
    int N,
    int win_func,
    float[] overlap
);
