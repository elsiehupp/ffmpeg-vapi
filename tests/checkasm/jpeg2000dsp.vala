/***********************************************************
Copyright (c) 2015 James Almer

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

private const size_t BUF_SIZE = 512;

private static void randomize_buffers () {
    int i;
    for (
        i = 0;
        i < BUF_SIZE * 3;
        i++
    ) {
        src[i] = rnd ();
    }

}

private static void randomize_buffers_float () {
    int i;
    for (
        i = 0;
        i < BUF_SIZE * 3;
        i++
    ) {
        src[i] = (float)rnd () / (
            UINT_MAX >> 5
        );

    }

}

private static void check_rct_int () {
    //  LOCAL_ALIGNED_32 (
    //      int32,
    //      src,
    //      [BUF_SIZE * 3]
    //  );

    //  LOCAL_ALIGNED_32 (
    //      int32,
    //      ref,
    //      [BUF_SIZE * 3]
    //  );

    //  LOCAL_ALIGNED_32 (
    //      int32,
    //      new,
    //      [BUF_SIZE * 3]
    //  );

    //  int32[] ref0 = &ref[BUF_SIZE * 0];
    //  int32[] new0 = &new[BUF_SIZE * 0];
    //  int32[] ref1 = &ref[BUF_SIZE * 1];
    //  int32[] new1 = &new[BUF_SIZE * 1];
    //  int32[] ref2 = &ref[BUF_SIZE * 2];
    //  int32[] new2 = &new[BUF_SIZE * 2];

    //  declare_func (
    //      void,
    //      void *src0,
    //      void *src1,
    //      void *src2,
    //      int csize
    //  );

    randomize_buffers ();

    //  memcpy (
    //      ref,
    //      src,
    //      BUF_SIZE * 3 * sizeof (
    //          src
    //      )
    //  );

    //  memcpy (
    //      new,
    //      src,
    //      BUF_SIZE * 3 * sizeof (
    //          src
    //      )
    //  );

    call_ref (
        ref0, ref1, ref2, BUF_SIZE
    );

    call_new (
        new0, new1, new2, BUF_SIZE
    );

    if (
        memcmp (
            ref0,
            new0,
            BUF_SIZE * sizeof (
                src
            )
        ) ||
        memcmp (
            ref1,
            new1,
            BUF_SIZE * sizeof (
                src
            )
        ) ||
        memcmp (
            ref2,
            new2,
            BUF_SIZE * sizeof (
                src
            )
        )
    ) {
        fail ();
    }

    //  memcpy (
    //      new,
    //      src,
    //      UF_SIZE * 3 * sizeof (
    //          src
    //      )
    //  );

    bench_new (
        new0, new1, new2, BUF_SIZE
    );

}

private static void check_ict_float () {
    //  LOCAL_ALIGNED_32 (
    //      float,
    //      src,
    //      [BUF_SIZE * 3]
    //  );

    //  LOCAL_ALIGNED_32 (
    //      float,
    //      ref,
    //      [BUF_SIZE * 3]
    //  );

    //  LOCAL_ALIGNED_32 (
    //      float,
    //      new,
    //      [BUF_SIZE * 3]
    //  );

    //  float[] ref0 = &ref[BUF_SIZE * 0];
    //  float[] new0 = &new[BUF_SIZE * 0];
    //  float[] ref1 = &ref[BUF_SIZE * 1];
    //  float[] new1 = &new[BUF_SIZE * 1];
    //  float[] ref2 = &ref[BUF_SIZE * 2];
    //  float[] new2 = &new[BUF_SIZE * 2];

    //  declare_func (
    //      void,
    //      void *src0,
    //      void *src1,
    //      void *src2,
    //      int csize
    //  );

    randomize_buffers_float ();

    //  memcpy (
    //      ref,
    //      src,
    //      BUF_SIZE * 3 * sizeof (
    //          src
    //      )
    //  );

    //  memcpy (
    //      new,
    //      src,
    //      BUF_SIZE * 3 * sizeof (
    //          src
    //      )
    //  );

    call_ref (
        ref0, ref1, ref2, BUF_SIZE
    );

    call_new (
        new0, new1, new2, BUF_SIZE
    );

    if (
        !float_near_abs_eps_array (
            ref0, new0, 1.0e-5, BUF_SIZE) ||
        !float_near_abs_eps_array (
            ref1, new1, 1.0e-5, BUF_SIZE) ||
        !float_near_abs_eps_array (
            ref2, new2, 1.0e-5, BUF_SIZE)
    ) {
        fail ();
    }

    //  memcpy (
    //      new,
    //      src,
    //      BUF_SIZE * 3 * sizeof (
    //          src
    //      )
    //  );

    bench_new (
        new0, new1, new2, BUF_SIZE
    );

}

private static void checkasm_check_jpeg2000dsp () {
    Jpeg2000DSPContext jpeg_2000_dsp_context;

    ff_jpeg2000dsp_init (
        &jpeg_2000_dsp_context
    );

    if (
        check_func (
            jpeg_2000_dsp_context.mct_decode[FF_DWT53], "jpeg2000_rct_int"))
        check_rct_int ();
    if (
        check_func (
            jpeg_2000_dsp_context.mct_decode[FF_DWT97], "jpeg2000_ict_float"))
        check_ict_float ();

    report (
        "mct_decode"
    );

}
