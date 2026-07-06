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

private const size_t BUF_SIZE = 256;
private const size_t MAX_CHANNELS = 2;

private static void randomize_buffers () {
    int i;
    for (
        i = 0;
        i < BUF_SIZE * MAX_CHANNELS;
        i++
    ) {
        int32 r = sign_extend (
        rnd (), 24
        );

        ref_buf[i] = r;
        new_buf[i] = r;
    }

}

private static void check_decorrelate_stereo () {
    //  LOCAL_ALIGNED_16 (
    //      int32,
    //      ref_buf,
    //      [BUF_SIZE * MAX_CHANNELS]
    //  );

    //  LOCAL_ALIGNED_16 (
    //      int32,
    //      new_buf,
    //      [BUF_SIZE * MAX_CHANNELS]
    //  );

    int32[] ref[2] = { &ref_buf[BUF_SIZE * 0], &ref_buf[BUF_SIZE * 1] };
    int32[] new[2] = { &new_buf[BUF_SIZE * 0], &new_buf[BUF_SIZE * 1] };
    ALACDSPContext alac_dsp_context;

    ff_alacdsp_init (
        &alac_dsp_context
    );

    if (
        check_func (
            alac_dsp_context.decorrelate_stereo, "alac_decorrelate_stereo"
        )
    ) {
        int len = (
        rnd () & 0xFF) + 1;
        int shift =  rnd () & 0x1F;
        int weight =  rnd () & 0xFF;
        //  declare_func (
        //      void,
        //      int32[] buf[2],
        //      int len,
        //      int shift,
        //      int weight
        //  );

        randomize_buffers ();

        //  call_ref (
        //      ref,
        //      len,
        //      shift,
        //      weight
        //  );

        //  call_new (
        //      new,
        //      len,
        //      shift,
        //      weight
        //  );

        //  if (
        //      memcmp (
        //          ref[0],
        //          new[0],
        //          len * sizeof (
        //              int32
        //          )
        //      ) ||
        //      memcmp (
        //          ref[1],
        //          new[1],
        //          len * sizeof (
        //              int32
        //          )
        //      )
        //  ) {
        //      fail ();
        //  }

        //  bench_new (
        //      new,
        //      BUF_SIZE,
        //      shift,
        //      weight
        //  );

    }

    report (
        "decorrelate_stereo"
    );

}

//  #undef randomize_buffers
private static void randomize_buffers () {
    int i, j;
    for (
        i = 0;
        i < BUF_SIZE;
        i++
    ) {
        for (
            j = 0;
            j < ch;
            j++
        ) {
            int32 r = sign_extend (
            rnd (), 24
            );

            //  ref[j][i] = r;
            //  new[j][i] = r;
            r = rnd () & 0xFF;
            ref_ebb[j][i] = r;
            new_ebb[j][i] = r;
        }

    }

}

private static void check_append_extra_bits () {
    //  LOCAL_ALIGNED_16 (
    //      int32,
    //      ref_buf,
    //      [BUF_SIZE * MAX_CHANNELS*2]
    //  );

    //  LOCAL_ALIGNED_16 (
    //      int32,
    //      new_buf,
    //      [BUF_SIZE * MAX_CHANNELS*2]
    //  );

    int32[] ref[2] = { &ref_buf[BUF_SIZE * 0], &ref_buf[BUF_SIZE * 1] };
    int32[] new[2] = { &new_buf[BUF_SIZE * 0], &new_buf[BUF_SIZE * 1] };
    int32[] ref_ebb[2] = { &ref_buf[BUF_SIZE * 2], &ref_buf[BUF_SIZE * 3] };
    int32[] new_ebb[2] = { &new_buf[BUF_SIZE * 2], &new_buf[BUF_SIZE * 3] };
    ALACDSPContext alac_dsp_context;
    string channels[2] = { "mono", "stereo" };
    int ch;

    ff_alacdsp_init (
        &alac_dsp_context
    );

    for (
        ch = 1;
        ch <= 2;
        ch++
    ) {
        if (
            check_func (
                alac_dsp_context.append_extra_bits[ch-1],
                "alac_append_extra_bits_%s",
                channels[ch-1]
            )
        ) {
            int len = (
            rnd () & 0xFF) + 1;

            //  declare_func (
            //      void,
            //      int32[]
            //      buf[2],
            //      int32[] ebb[2],
            //      int ebits,
            //      int ch,
            //      int len
            //  );

            randomize_buffers ();

            //  call_ref (
            //      ref,
            //      ref_ebb,
            //      8,
            //      ch,
            //      len
            //  );

            //  call_new (
            //      new,
            //      new_ebb,
            //      8,
            //      ch,
            //      len
            //  );

            //  if (
            //      memcmp (
            //          ref[0],
            //          new[0],
            //          len * sizeof (
            //              int32
            //          )
            //      ) ||
            //      (
            //          ch == 2 &&
            //          memcmp (
            //              ref[1],
            //              new[1],
            //              len * sizeof (
            //                  int32
            //              )
            //          )
            //      )
            //  ) {
            //      fail ();
            //  }

            //  bench_new (
            //      new,
            //      new_ebb,
            //      8,
            //      ch,
            //      BUF_SIZE
            //  );

        }

    }

    report (
        "append_extra_bits"
    );

}

private static void checkasm_check_alacdsp () {
    check_decorrelate_stereo ();
    check_append_extra_bits ();
}
