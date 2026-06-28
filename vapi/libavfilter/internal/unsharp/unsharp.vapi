/***********************************************************
Copyright (C) 2013 Wei Gao <weigao@multicorewareinc.com>
Copyright (C) 2013 Lenny Wang

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
namespace LibAVFilter {

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/unsharp.h")]
public const size_t MIN_MATRIX_SIZE; // 3

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/unsharp.h")]
public const size_t MAX_MATRIX_SIZE; // 63


[CCode (cname="struct UnsharpFilterParam",cheader_filename="subprojects/ffmpeg/libavfilter/unsharp.h")]
[Compact]
public class UnsharpFilterParam {
    /***********************************************************
    matrix width
    ***********************************************************/
    [CCode (cname="")]
    public int msize_x;

    /***********************************************************
    matrix height
    ***********************************************************/
    [CCode (cname="")]
    public int msize_y;

    /***********************************************************
    effect amount
    ***********************************************************/
    [CCode (cname="")]
    public int amount;

    /***********************************************************
    horizontal step count
    ***********************************************************/
    [CCode (cname="")]
    public int steps_x;

    /***********************************************************
    vertical step count
    ***********************************************************/
    [CCode (cname="")]
    public int steps_y;

    /***********************************************************
    bits to shift pixel
    ***********************************************************/
    [CCode (cname="")]
    public int scalebits;

    /***********************************************************
    amount to add to pixel
    ***********************************************************/
    [CCode (cname="")]
    public int32 halfscale;

    /***********************************************************
    finite state machine storage within a row
    ***********************************************************/
    [CCode (cname="")]
    public uint32[] sr;

    /***********************************************************
    finite state machine storage across rows
    ***********************************************************/
    [CCode (cname="")]
    public uint32[][] sc;
}

[CCode (cname="struct UnsharpContext",cheader_filename="subprojects/ffmpeg/libavfilter/unsharp.h")]
[Compact]
public class UnsharpContext {
    [CCode (cname="class")]
    public LibAVUtil.Class av_class;

    [CCode (cname="")]
    public int lmsize_x;

    [CCode (cname="")]
    public int lmsize_y;

    [CCode (cname="")]
    public int cmsize_x;

    [CCode (cname="")]
    public int cmsize_y;

    [CCode (cname="")]
    public float lamount;

    [CCode (cname="")]
    public float camount;

    /***********************************************************
    luma parameters (width, height, amount)
    ***********************************************************/
    [CCode (cname="")]
    public UnsharpFilterParam luma;

    /***********************************************************
    chroma parameters (width, height, amount)
    ***********************************************************/
    [CCode (cname="")]
    public UnsharpFilterParam chroma;

    [CCode (cname="")]
    public int hsub;

    [CCode (cname="")]
    public int vsub;

    [CCode (cname="")]
    public int nb_threads;

    [CCode (cname="")]
    public int opencl;

    public delegate int ApplyUnsharpDeleegate (
        LibAVFilter.FilterContext? av_filter_context,
        AVFrame? in,
        AVFrame? out
    );

    [CCode (cname="apply_unsharp")]
    public ApplyUnsharpDeleegate apply_unsharp;
}

} // namespace LibAVFilter
