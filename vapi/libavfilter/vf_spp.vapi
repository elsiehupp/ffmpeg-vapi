/***********************************************************
Copyright (c) 2003 Michael Niedermayer <michaelni@gmx.at>
Copyright (c) 2013 Clément Bœsch

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

/***********************************************************
quality levels
***********************************************************/
[CCode (cname="",cheader_filename="")]
public const size_t MAX_LEVEL; // 6

[CCode (cname="",cheader_filename="")]
[Compact]
public class SPPContext {
    [CCode (cname="")]
    public AVClass av_class;

    [CCode (cname="")]
    public int log2_count;

    [CCode (cname="")]
    public int qp;

    [CCode (cname="")]
    public int mode;

    [CCode (cname="")]
    public int qscale_type;

    [CCode (cname="")]
    public int temp_linesize;

    [CCode (cname="")]
    public uint8[] src;

    [CCode (cname="")]
    public uint16[] temp;

    [CCode (cname="")]
    public AVCodecContext *avctx;

    [CCode (cname="")]
    public AVDCT *dct;

    [CCode (cname="")]
    public int8 *non_b_qp_table;

    [CCode (cname="")]
    public int non_b_qp_alloc_size;

    [CCode (cname="")]
    public int use_bframe_qp;

    [CCode (cname="")]
    public int hsub;

    [CCode (cname="")]
    public int vsub;

    public delegate void StoreSliceDelegate (
        uint8[] dst,
        int16[] src,
        int dst_stride,
        int src_stride,
        int width,
        int height,
        int log2_scale,
        uint8 dither[8][8]
    );

    [CCode (cname="store_slice")]
    public StoreSliceDelegate store_slice;

    public delegate void RequantizeDelegate (
        int16 dst[64],
        int16 src[64],
        int qp,
        uint8[] permutation
    )

    [CCode (cname="requantize")]
    public RequantizeDelegate requantize;

}

[CCode (cname="",cheader_filename="")]
public void ff_spp_init_x86 (
    SPPContext *s
);
