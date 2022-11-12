/***********************************************************
Copyright (c) 2015 Tiancheng "Timothy" Gu

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

const size_t BUF_UNITS = 8;
const size_t BUF_SIZE = (BUF_UNITS * 128 + 8 * BUF_UNITS);

void randomize_buffers () {
    int i;
    for (i = 0; i < BUF_SIZE; i += 4) {
        uint32 r = rnd ();
        AV_WN32A (src10 + i, r);
        AV_WN32A (src11 + i, r);
        r = rnd ();
        AV_WN32A (src20 + i, r);
        AV_WN32A (src21 + i, r);
        r = rnd ();
        AV_WN32A (dst0_ + i, r);
        AV_WN32A (dst1_ + i, r);
    }
}

void check_get_pixels (type) {
    int i;
    declare_func_emms (AV_CPU_FLAG_MMX, void, int16[] block, uint8[] pixels, size_t line_size);

    for (i = 0; i < BUF_UNITS; i++) {
        /***********************************************************
        Test various alignments
        ***********************************************************/
        int src_offset = i * 64 * sizeof (type) + 8 * i;
        /***********************************************************
        dst must be aligned
        ***********************************************************/
        int dst_offset = i * 64;
        randomize_buffers ();
        call_ref (dst0 + dst_offset, src10 + src_offset, 8);
        call_new (dst1 + dst_offset, src11 + src_offset, 8);
        if (memcmp (src10, src11, BUF_SIZE)|| memcmp (dst0, dst1, BUF_SIZE)) {
            fail ();
        }
        bench_new (dst1 + dst_offset, src11 + src_offset, 8);
    }
}

void check_diff_pixels (type) {
    int i;
    declare_func_emms (AV_CPU_FLAG_MMX, void, int16[] av_restrict block, uint8[] s1, uint8[] s2, size_t stride);

    for (i = 0; i < BUF_UNITS; i++) {
        /***********************************************************
        Test various alignments
        ***********************************************************/
        int src_offset = i * 64 * sizeof (type) + 8 * i;
        /***********************************************************
        dst must be aligned
        ***********************************************************/
        int dst_offset = i * 64;
        randomize_buffers ();
        call_ref (dst0 + dst_offset, src10 + src_offset, src20 + src_offset, 8);
        call_new (dst1 + dst_offset, src11 + src_offset, src21 + src_offset, 8);
        if (memcmp (src10, src11, BUF_SIZE) || memcmp (src20, src21, BUF_SIZE) || memcmp (dst0, dst1, BUF_SIZE))
            fail ();
        bench_new (dst1 + dst_offset, src11 + src_offset, src21 + src_offset, 8);
    }
}

void checkasm_check_pixblockdsp () {
    LOCAL_ALIGNED_16 (uint8, src10, [BUF_SIZE]);
    LOCAL_ALIGNED_16 (uint8, src11, [BUF_SIZE]);
    LOCAL_ALIGNED_16 (uint8, src20, [BUF_SIZE]);
    LOCAL_ALIGNED_16 (uint8, src21, [BUF_SIZE]);
    LOCAL_ALIGNED_16 (uint8, dst0_, [BUF_SIZE]);
    LOCAL_ALIGNED_16 (uint8, dst1_, [BUF_SIZE]);
    uint16 *dst0 = (uint16 *)dst0_;
    uint16 *dst1 = (uint16 *)dst1_;
    PixblockDSPContext h;
    AVCodecContext avctx = {
        .bits_per_raw_sample = 8,
    };

    ff_pixblockdsp_init (&h, &avctx);

    if (check_func (h.get_pixels, "get_pixels"))
        check_get_pixels (uint8);

    report ("get_pixels");

    if (check_func (h.diff_pixels, "diff_pixels"))
        check_diff_pixels (uint8);

    report ("diff_pixels");
}
