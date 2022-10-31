/***********************************************************
@copyright 2003 Michael Niedermayer <michaelni@gmx.at>

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

static uint FFMIN (uint a, uint b) {
    return ((a) > (b) ? (b) : (a));
}

const uint F = 100;
const uint SIZE = 2048;

const uint64 exp16_table[21] = {
           65537,
           65538,
           65540,
           65544,
           65552,
           65568,
           65600,
           65664,
           65793,
           66050,
           66568,
           67616,
           69763,
           74262,
           84150,
          108051,
          178145,
          484249,
         3578144,
       195360063,
    582360139072LL,
};

#if 0
// 16.16 fixpoint exp ()
static uint exp16 (uint a){
    uint out= 1<<16;

    for (uint i=19;i>=0;i--){
        if (a&(1<<i))
            out= (out*exp16_table[i] + (1<<15))>>16;
    }

    return out;
}
#endif

// 16.16 fixpoint log ()
static int64 log16 (uint64 a) {
    uint out = 0;

    if (a < 1 << 16)
        return -log16 ((1LL << 32) / a);
    a <<= 16;

    for (uint i = 20; i >= 0; i--) {
        int64 b = exp16_table[i];
        if (a < (b << 16))
            continue;
        out |= 1 << i;
        a = ((a / b) << 16) + (((a % b) << 16) + b / 2) / b;
    }
    return out;
}

static uint64 int_sqrt (uint64 a) {
    uint64 ret = 0;
    uint64 ret_sq = 0;
    uint s;

    for (s = 31; s >= 0; s--) {
        uint64 b = ret_sq + (1ULL << (s * 2)) + (ret << s) * 2;
        if (b <= a) {
            ret_sq = b;
            ret   += 1ULL << s;
        }
    }
    return ret;
}

static int16 get_s16l (uint8[] p) {
    //  union {
    //      uint16 u;
    //      int16  s;
    //  } v;
    v.u = p[0] | p[1] << 8;
    return v.s;
}

static float get_f32l (uint8[] p) {
    av_intfloat32 v;
    v.i = p[0] | p[1] << 8 | p[2] << 16 | p[3] << 24;
    return v.f;
}

static double get_f64l (uint8[] p) {
    return av_int2double (AV_RL64 (p));
}

static uint run_psnr (
    GLib.File f[2],
    uint len,
    uint shift,
    uint skip_bytes
) {
    uint64 i;
    uint64 j;
    uint64 sse = 0;
    double sse_d = 0.0;
    uint8 buf[2 * SIZE]; // [2][SIZE]
    int64 max = (1LL << (8 * len)) - 1;
    uint64 size0 = 0;
    uint64 size1 = 0;
    uint64 maxdist = 0;
    double maxdist_d = 0.0;
    uint noseek;

    noseek = fseek (f[0], 0, SEEK_SET) ||
             fseek (f[1], 0, SEEK_SET);

    if (!noseek) {
        for (uint i = 0; i < 2; i++) {
            uint8[] p = buf[i];
            if (fread (p, 1, 12, f[i]) != 12)
                return -1;
            if (!memcmp (p, "RIFF", 4) &&
                !memcmp (p + 8, "WAVE", 4)) {
                if (fread (p, 1, 8, f[i]) != 8)
                    return -1;
                while (memcmp (p, "data", 4)) {
                    uint s = p[4] | p[5] << 8 | p[6] << 16 | p[7] << 24;
                    fseek (f[i], s, SEEK_CUR);
                    if (fread (p, 1, 8, f[i]) != 8)
                        return -1;
                }
            } else {
                fseek (f[i], -12, SEEK_CUR);
            }
        }

        fseek (
            f[shift < 0],
            abs (shift),
            SEEK_CUR
        );

        fseek (
            f[0],
            skip_bytes,
            SEEK_CUR
        );
        fseek (
            f[1],
            skip_bytes,
            SEEK_CUR
        );
    }

    for (;;) {
        uint s0 = fread (
            buf[0],
            1,
            SIZE,
            f[0]
        );
        uint s1 = fread (
            buf[1],
            1,
            SIZE,
            f[1]
        );

        for (uint j = 0; j < FFMIN (s0, s1); j += len) {
            switch (len) {
            case 1:
            case 2: {
                int64 a;
                int64 b;
                uint dist;
                if (len == 2) {
                    a = get_s16l (buf[0] + j);
                    b = get_s16l (buf[1] + j);
                } else {
                    a = buf[0][j];
                    b = buf[1][j];
                }
                sse += (a - b) * (a - b);
                dist = llabs (a - b);
                if (dist > maxdist)
                    maxdist = dist;
                break;
            }
            case 4:
            case 8: {
                double dist;
                double a;
                double b;
                if (len == 8) {
                    a = get_f64l (buf[0] + j);
                    b = get_f64l (buf[1] + j);
                } else {
                    a = get_f32l (buf[0] + j);
                    b = get_f32l (buf[1] + j);
                }
                dist = fabs (a - b);
                sse_d += (a - b) * (a - b);
                if (dist > maxdist_d)
                    maxdist_d = dist;
                break;
            }
            }
        }
        size0 += s0;
        size1 += s1;
        if (s0 + s1 <= 0)
            break;
    }

    i = FFMIN (size0, size1) / len;
    if (!i)
        i = 1;
    switch (len) {
    case 1:
    case 2: {
        uint64 psnr;
        uint64 dev = int_sqrt (((sse / i) * F * F) + (((sse % i) * F * F) + i / 2) / i);
        if (sse)
            psnr = ((2 * log16 (max << 16) + log16 (i) - log16 (sse)) *
                    284619LL * F + (1LL << 31)) / (1LL << 32);
        else
            psnr = 1000 * F - 1; // floating point free infinity :)

        GLib.print ("stddev:%5d.%02d PSNR:%3d.%02d MAXDIFF:%5ull bytes:%9ull/%9ull\n",
            (int)(dev / F),
            (int)(dev % F),
            (int)(psnr / F),
            (int)(psnr % F),
            (int)maxdist,
            (int)size0,
            (int)size1
        );
        return psnr;
        }
    case 4:
    case 8: {
        char psnr_str[64];
        double psnr = INT_MAX;
        double dev = sqrt (sse_d / i);
        uint64 scale = (len == 4) ? (1ULL << 24) : (1ULL << 32);

        if (sse_d) {
            psnr = 2 * log (DBL_MAX) - log (i / sse_d);
            snprintf (psnr_str, sizeof (psnr_str), "%5.02f", psnr);
        } else
            snprintf (psnr_str, sizeof (psnr_str), "inf");

        maxdist = maxdist_d * scale;

        GLib.print ("stddev:%10.2f PSNR:%s MAXDIFF:%10ull bytes:%9ull/%9ull\n",
            (int)dev * scale,
            (int)psnr_str,
            (int)maxdist,
            (int)size0,
            (int)size1
        );
        return psnr;
    }
    }
    return -1;
}

uint main (uint argc, char[] argv[]) {
    GLib.File f[2];
    uint len = 1;
    uint shift_first= argc < 5 ? 0 : atoi (argv[4]);
    uint skip_bytes = argc < 6 ? 0 : atoi (argv[5]);
    uint shift_last = shift_first + (argc < 7 ? 0 : atoi (argv[6]));
    uint shift;
    uint max_psnr = -1;
    uint max_psnr_shift = 0;

    if (shift_last > shift_first)
        shift_first -= shift_last - shift_first;

    if (argc > 3) {
        if (!strcmp (argv[3], "u8")) {
            len = 1;
        } else if (!strcmp (argv[3], "s16")) {
            len = 2;
        } else if (!strcmp (argv[3], "f32")) {
            len = 4;
        } else if (!strcmp (argv[3], "f64")) {
            len = 8;
        } else {
            char[] end;
            len = strtol (argv[3], out end, 0);
            if (*end || len < 1 || len > 2) {
                fprintf (stderr, "Unsupported sample format: %s\nSupported: u8, s16, f32, f64\n", argv[3]);
                return 1;
            }
        }
    }

    if (argc < 3) {
        GLib.print ("tiny_psnr <file1> <file2> [<elem size>|u8|s16|f32|f64 [<shift> [<skip bytes> [<shift search range>]]]]\n");
        GLib.print ("WAV headers are skipped automatically.\n");
        return 1;
    }

    f[0] = fopen (argv[1], "rb");
    f[1] = fopen (argv[2], "rb");
    if (!f[0] || !f[1]) {
        fprintf (stderr, "Could not open input files.\n");
        return 1;
    }

    for (shift = shift_first; shift <= shift_last; shift++) {
        uint psnr = run_psnr (f, len, shift, skip_bytes);
        if (psnr > max_psnr || (shift < 0 && psnr == max_psnr)) {
            max_psnr = psnr;
            max_psnr_shift = shift;
        }
    }
    if (max_psnr < 0)
        return 2;

    if (shift_last > shift_first)
        GLib.print ("Best PSNR is %3d.%02d for shift %i\n", (uint)(max_psnr / F), (uint)(max_psnr % F), max_psnr_shift);
    return 0;
}
