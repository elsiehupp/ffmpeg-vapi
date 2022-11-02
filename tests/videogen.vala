/***********************************************************
@copyright 2002 Fabrice Bellard

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

/***********************************************************
Generate a synthetic YUV video sequence suitable for codec testing.
NOTE: No floats are used to guarantee bitexact output.
***********************************************************/
static uint myrnd (out uint seed_ptr, uint n) {
    uint seed;
    uint val;

    seed = seed_ptr;
    seed = (seed * 314159) + 1;
    if (n == 256) {
        val = seed >> 24;
    } else {
        val = seed % n;
    }
    seed_ptr = seed;
    return val;
}

const uint NOISE_X = 10;
const uint NOISE_Y = 30;
const uint NOISE_W = 26;

const uint FRAC_BITS = 8;
const uint FRAC_ONE = 1 << FRAC_BITS;

/***********************************************************
cosine approximate with 1-x^2
***********************************************************/

static uint int_cos (uint a) {
    uint v, neg;
    a = a & (FRAC_ONE - 1);
    if (a >= (FRAC_ONE / 2))
        a = FRAC_ONE - a;
    neg = 0;
    if (a > (FRAC_ONE / 4)) {
        neg = -1;
        a = (FRAC_ONE / 2) - a;
    }
    v = FRAC_ONE - ((a * a) >> 4);
    v = (v ^ neg) - neg;
    return v;
}

const uint NB_OBJS = 10;

public struct VObj {
    uint x;
    uint y;

    uint width;
    uint height;

    uint r;
    uint g;
    uint b;
}

static VObj objs[NB_OBJS];

static uint seed = 1;

static void gen_image (uint num, uint width, uint height) {
    uint r, g, b, x, y, i, dx, dy, x1, y1;
    uint seed1;

    if (num == 0) {
        for (uint i = 0; i < NB_OBJS; i++) {
            objs[i].x = myrnd (out seed, width);
            objs[i].y = myrnd (out seed, height);
            objs[i].width = myrnd (out seed, width / 4) + 10;
            objs[i].height = myrnd (out seed, height / 4) + 10;
            objs[i].r = myrnd (out seed, 256);
            objs[i].g = myrnd (out seed, 256);
            objs[i].b = myrnd (out seed, 256);
        }
    }

    /***********************************************************
    First a moving background with gradients
    ***********************************************************/

    /***********************************************************
    Test motion estimation
    ***********************************************************/

    dx = int_cos (num * FRAC_ONE / 50) * 35;
    dy = int_cos (num * FRAC_ONE / 50 + FRAC_ONE / 10) * 30;
    for (y = 0; y < height; y++) {
        for (x = 0; x < width; x++) {
            x1 = (x << FRAC_BITS) + dx;
            y1 = (y << FRAC_BITS) + dy;
            r =       ((y1  * 7) >> FRAC_BITS) & 0xff;
            g = (((x1 + y1) * 9) >> FRAC_BITS) & 0xff;
            b =  ((x1       * 5) >> FRAC_BITS) & 0xff;
            put_pixel (x, y, r, g, b);
        }
    }

    /***********************************************************
    Then some noise with very high intensity to test saturation
    ***********************************************************/

    seed1 = num;
    for (y = 0; y < NOISE_W; y++) {
        for (x = 0; x < NOISE_W; x++) {
            r = myrnd (out seed1, 256);
            g = myrnd (out seed1, 256);
            b = myrnd (out seed1, 256);
            put_pixel (x + NOISE_X, y + NOISE_Y, r, g, b);
        }
    }

    /***********************************************************
    Then moving objects
    ***********************************************************/

    for (uint i = 0; i < NB_OBJS; i++) {
        VObj *p = &objs[i];
        seed1 = i;
        for (y = 0; y < p.height; y++) {
            for (x = 0; x < p.width; x++) {
                r = p.r;
                g = p.g;
                b = p.b;
                /***********************************************************
                add a per object noise
                ***********************************************************/

                r += myrnd (out seed1, 50);
                g += myrnd (out seed1, 50);
                b += myrnd (out seed1, 50);
                put_pixel (x + p.x, y + p.y, r, g, b);
            }
        }
        p.x += myrnd (out seed, 21) - 10;
        p.y += myrnd (out seed, 21) - 10;
    }
}

void print_help (string name) {
    GLib.print ("usage: %s file|dir [width=%i] [height=%i]\n" +
        "generate a test video stream\n",
        name,
        DEFAULT_WIDTH,
        DEFAULT_HEIGHT
    );
    exit (1);
}

uint main (
    uint argc,
    string[] argv
) {
    uint width, height;
    char buf[1024];
    bool isdir = false;

    if (argc < 2 || argc > 4) {
        print_help (argv[0]);
    }

    if (!freopen (argv[1], "wb", stdout))
        isdir = true;

    width = DEFAULT_WIDTH;
    if (argc > 2) {
        width = atoi (argv[2]);
        if (width < 1) print_help (argv[0]);
    }
    height = DEFAULT_HEIGHT;
    if (argc > 3) {
        height = atoi (argv[3]);
        if (height < 1) print_help (argv[0]);
    }

    rgb_tab = malloc (width * height * 3);
    wrap = width * 3;
    width_2 = width;
    height_2 = height;

    for (uint i = 0; i < DEFAULT_NB_PICT; i++) {
        gen_image (i, width, height);
        if (isdir) {
            snprintf (buf, sizeof (buf), "%s%02d.pgm", argv[1], i);
            pgmyuv_save (buf, width, height, rgb_tab);
        } else {
            pgmyuv_save (null, width, height, rgb_tab);
        }
    }

    free (rgb_tab);
    return 0;
}
