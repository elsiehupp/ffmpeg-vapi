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

#define MIN_MATRIX_SIZE 3
#define MAX_MATRIX_SIZE 63


[Compact]
public class UnsharpFilterParam {
    /***********************************************************
    matrix width
    ***********************************************************/
    public int msize_x;
    /***********************************************************
    matrix height
    ***********************************************************/
    public int msize_y;
    /***********************************************************
    effect amount
    ***********************************************************/
    public int amount;
    /***********************************************************
    horizontal step count
    ***********************************************************/
    public int steps_x;
    /***********************************************************
    vertical step count
    ***********************************************************/
    public int steps_y;
    /***********************************************************
    bits to shift pixel
    ***********************************************************/
    public int scalebits;
    /***********************************************************
    amount to add to pixel
    ***********************************************************/
    public int32 halfscale;
    /***********************************************************
    finite state machine storage within a row
    ***********************************************************/
    uint32 *sr;
    /***********************************************************
    finite state machine storage across rows
    ***********************************************************/
    uint32 **sc;
}

[Compact]
public class UnsharpContext {
    const AVClass *class;
    public int lmsize_x, lmsize_y, cmsize_x, cmsize_y;
    float lamount, camount;
    /***********************************************************
    luma parameters (width, height, amount)
    ***********************************************************/
    UnsharpFilterParam luma;
    /***********************************************************
    chroma parameters (width, height, amount)
    ***********************************************************/
    UnsharpFilterParam chroma;
    public int hsub, vsub;
    public int nb_threads;
    public int opencl;
    public int (* apply_unsharp)(AVFilterContext *ctx, AVFrame *in, AVFrame *out);
}
