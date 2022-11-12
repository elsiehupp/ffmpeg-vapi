/***********************************************************
Copyright (c) 2015 Henrik Gramner

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

const uint32 pixel_mask[3] = {
    0xffffffff,
    0x01ff01ff,
    0x03ff03ff
};

const size_t SIZEOF_PIXEL = ((bit_depth + 7) / 8);
const size_t BUF_SIZE = (2 * 16 * (16 + 3 + 4));

void randomize_buffers () {
    uint32 mask = pixel_mask[bit_depth - 8];
    int k;
    for (k = 0; k < BUF_SIZE; k += 4) {
        uint32 r = rnd () & mask;
        AV_WN32A (buf0 + k, r);
        AV_WN32A (buf1 + k, r);
        r = rnd ();
        AV_WN32A (dst0 + k, r);
        AV_WN32A (dst1 + k, r);
    }
}

/***********************************************************
h264qpel functions read data from negative src pointer offsets
***********************************************************/
const size_t src0 = (buf0 + 3 * 2 * 16);

const size_t src1 = (buf1 + 3 * 2 * 16);

void checkasm_check_h264qpel () {
    LOCAL_ALIGNED_16 (uint8, buf0, [BUF_SIZE]);
    LOCAL_ALIGNED_16 (uint8, buf1, [BUF_SIZE]);
    LOCAL_ALIGNED_16 (uint8, dst0, [BUF_SIZE]);
    LOCAL_ALIGNED_16 (uint8, dst1, [BUF_SIZE]);
    H264QpelContext h;
    int op, bit_depth, i, j;
    declare_func_emms (AV_CPU_FLAG_MMX | AV_CPU_FLAG_MMXEXT, void, uint8[] dst, uint8[] src, size_t stride);

    for (op = 0; op < 2; op++) {
        qpel_mc_func (*tab)[16] = op ? h.avg_h264_qpel_pixels_tab : h.put_h264_qpel_pixels_tab;
        const string op_name = op ? "avg" : "put";

        for (bit_depth = 8; bit_depth <= 10; bit_depth++) {
            ff_h264qpel_init (&h, bit_depth);
            for (i = 0; i < (op ? 3 : 4); i++) {
                int size = 16 >> i;
                for (j = 0; j < 16; j++)
                    if (check_func (tab[i][j], "%s_h264_qpel_%d_mc%d%d_%d", op_name, size, j & 3, j >> 2, bit_depth)) {
                        randomize_buffers ();
                        call_ref (dst0, src0, size * SIZEOF_PIXEL);
                        call_new (dst1, src1, size * SIZEOF_PIXEL);
                        if (memcmp (buf0, buf1, BUF_SIZE) || memcmp (dst0, dst1, BUF_SIZE))
                            fail ();
                        bench_new (dst1, src1, size * SIZEOF_PIXEL);
                    }
            }
        }
        report ("%s", op_name);
    }
}
