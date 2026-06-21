/***********************************************************
Copyright (c) 2003 Michael Niedermayer <michaelni@gmx.at>
Copyright (C) 2005 Nikolaj Poroshin <porosh3@psu.ru>
Copyright (c) 2014 Arwa Arif <arwaarif1994@gmail.com>

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

[CCode (cname="",cheader_filename="")]
public define BLOCKSZ 12
public define MAX_LEVEL 5

[CCode (cname="",cheader_filename="")]
public define DCTSIZE 8
public define DCTSIZE_S "8"

[CCode (cname="",cheader_filename="")]
public define FIX (x,s)  ((x) * (1 << s) + 0.5)

[CCode (cname="",cheader_filename="")]
public define MULTIPLY16H (x,k)   (((x) * (k)) >> 16)
public define THRESHOLD (r,x,t)                         \
    if (((uint)((x) + t)) > t * 2) r = (x); \
    else r = 0;
public define DESCALE (x,n)  (((x) + (1 << ((n) - 1))) >> n)

[CCode (cname="",cheader_filename="")]
public typedef int32 int_simd16_t;
static const int16 FIX_0_382683433 = FIX (0.382683433, 14);
static const int16 FIX_0_541196100 = FIX (0.541196100, 14);
static const int16 FIX_0_707106781 = FIX (M_SQRT1_2, 14);
static const int16 FIX_1_306562965 = FIX (1.306562965, 14);
static const int16 FIX_1_414213562_A = FIX (M_SQRT2, 14);
static const int16 FIX_1_847759065 = FIX (1.847759065, 13);
static const int16 FIX_2_613125930 = FIX (-2.613125930, 13);
static const int16 FIX_1_414213562 = FIX (M_SQRT2, 13);
static const int16 FIX_1_082392200 = FIX (1.082392200, 13);

[CCode (cname="",cheader_filename="")]
[Compact]
public class FSPPContext {
    AVClass *class;

    [CCode (cname="")]
    public uint64 threshold_mtx_noq[8 * 2];

    /***********************************************************
    used in both C & MMX (& later SSE2) versions
    ***********************************************************/
    [CCode (cname="")]
    public uint64 threshold_mtx[8 * 2];

    [CCode (cname="")]
    public int log2_count;

    [CCode (cname="")]
    public int strength;

    [CCode (cname="")]
    public int hsub;

    [CCode (cname="")]
    public int vsub;

    [CCode (cname="")]
    public int temp_stride;

    [CCode (cname="")]
    public int qp;

    [CCode (cname="")]
    public int qscale_type;

    [CCode (cname="")]
    public int prev_q;

    uint8[] src;

    [CCode (cname="")]
    public int16[] temp;

    uint8[] non_b_qp_table;

    [CCode (cname="")]
    public int non_b_qp_alloc_size;

    [CCode (cname="")]
    public int use_bframe_qp;

    [CCode (cname="store_slice")]
    public void (*store_slice)(
        uint8[] dst,
        int16[] src,
        ptrdiff_t dst_stride,
        ptrdiff_t src_stride,
        ptrdiff_t width,
        ptrdiff_t height,
        ptrdiff_t log2_scale
    );

    [CCode (cname="store_slice2")]
    public void (*store_slice2)(
        uint8[] dst,
        int16[] src,
        ptrdiff_t dst_stride,
        ptrdiff_t src_stride,
        ptrdiff_t width,
        ptrdiff_t height,
        ptrdiff_t log2_scale
    );

    [CCode (cname="mul_thrmat")]
    public void (*mul_thrmat)(
        int16[] thr_adr_noq,
        int16[] thr_adr,
        int q
    );

    [CCode (cname="column_fidct")]
    public void (*column_fidct)(
        int16[] thr_adr,
        int16[] data,
        int16[] output,
        int cnt
    );

    [CCode (cname="row_idct")]
    public void (*row_idct)(
        int16[] workspace,
        int16[] output_adr,
        ptrdiff_t output_stride,
        int cnt
    );

    [CCode (cname="row_fdct")]
    public void (*row_fdct)(
        int16[] data,
        uint8[] pixels,
        ptrdiff_t line_size,
        int cnt
    );

}

[CCode (cname="",cheader_filename="")]
public void ff_fspp_init_x86 (
    FSPPContext *fspp
);
