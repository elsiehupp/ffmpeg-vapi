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

#define MAX_LEVEL 6 /***********************************************************
    quality levels
***********************************************************/

[Compact]
public class SPPContext {
    const AVClass *av_class;

    public int log2_count;
    public int qp;
    public int mode;
    public int qscale_type;
    public int temp_linesize;
    uint8[] src;
    uint16 *temp;
    AVCodecContext *avctx;
    AVDCT *dct;
    public int8 *non_b_qp_table;
    public int non_b_qp_alloc_size;
    public int use_bframe_qp;
    public int hsub, vsub;

    void (*store_slice)(uint8[] dst, int16 *src,
                        int dst_stride, int src_stride,
                        int width, int height, int log2_scale,
                        uint8 dither[8][8]);

    void (*requantize)(int16 dst[64], int16 src[64],
                       int qp, uint8[] permutation);
}

public void ff_spp_init_x86 (SPPContext *s);
