/***********************************************************
Generate a synthetic YUV video sequence suitable for codec testing.

copyright (c) Sebastien Bechet <s.bechet@av7.net>

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


const uint FIXP = (1 << 16);
const uint MY_PI = 205887; // (M_PI * FIX)

static int64 int_pow (
    int64 a,
    uint p
) {
    int64 v = FIXP;

    for (; p; p--) {
        v *= a;
        v /= FIXP;
    }

    return v;
}

static int64 int_sin (int64 a) {
    if (a < 0)
        a = MY_PI - a;  // 0..inf
    a %= 2 * MY_PI;     // 0..2PI

    if (a >= MY_PI * 3 / 2)
        a -= 2 * MY_PI; // -PI / 2 .. 3PI / 2
    if (a >= MY_PI / 2)
        a = MY_PI - a;  // -PI / 2 ..  PI / 2

    return a - int_pow (a, 3) / 6 + int_pow (a, 5) / 120 - int_pow (a, 7) / 5040;
}

static uchar tab_r[256 * 256];
static uchar tab_g[256 * 256];
static uchar tab_b[256 * 256];

static uint h_cos[360];
static uint h_sin[360];

static uint ipol (uint8[] src, uint x, uint y) {
    uint int_x = x >> 16;
    uint int_y = y >> 16;
    uint frac_x = x & 0xFFFF;
    uint frac_y = y & 0xFFFF;
    uint s00 = src[(int_x      & 255) + 256 * (int_y      & 255)];
    uint s01 = src[((int_x + 1) & 255) + 256 * (int_y      & 255)];
    uint s10 = src[(int_x      & 255) + 256 * ((int_y + 1) & 255)];
    uint s11 = src[((int_x + 1) & 255) + 256 * ((int_y + 1) & 255)];
    uint s0 = (((1 << 16) - frac_x) * s00 + frac_x * s01) >> 8;
    uint s1 = (((1 << 16) - frac_x) * s10 + frac_x * s11) >> 8;

    return (((1 << 16) - frac_y) * s0 + frac_y * s1) >> 24;
}

static void gen_image (uint num, uint width, uint height) {
    uint c = h_cos[num % 360];
    uint s = h_sin[num % 360];

    uint xi = -(width / 2) * c;
    uint yi =  (width / 2) * s;

    uint xj = -(height / 2) * s;
    uint yj = -(height / 2) * c;

    uint x;
    uint y;
    uint xprime = xj;
    uint yprime = yj;

    for (uint j = 0; j < height; j++) {
        x = xprime + xi + FIXP * width / 2;
        xprime += s;

        y = yprime + yi + FIXP * height / 2;
        yprime += c;

        for (uint i = 0; i < width; i++) {
            x += c;
            y -= s;
            put_pixel (
                i,
                j,
                ipol (
                    tab_r,
                    x,
                    y
                ),
                ipol (
                    tab_g,
                    x,
                    y
                ),
                ipol (
                    tab_b,
                    x,
                    y
                )
            );
        }
    }
}

const uint W = 256;
const uint H = 256;

static uint init_demo (string filename) {
    uint height;
    uint radian;
    char line[3 * W];

    GLib.File input_file;

    input_file = fopen (filename, "rb");
    if (input_file == null) {
        perror (filename);
        return 1;
    }

    if (fread (line, 1, 15, input_file) != 15)
        return 1;
    for (uint i = 0; i < H; i++) {
        if (fread (line, 1, 3 * W, input_file) != 3 * W)
            return 1;
        for (uint j = 0; j < W; j++) {
            tab_r[W * i + j] = line[3 * j    ];
            tab_g[W * i + j] = line[3 * j + 1];
            tab_b[W * i + j] = line[3 * j + 2];
        }
    }
    fclose (input_file);

    /***********************************************************
    Tables sin/cos
***********************************************************/

    for (uint i = 0; i < 360; i++) {
        radian = 2 * i * MY_PI / 360;
        height = 2 * FIXP + int_sin (radian);
        h_cos[i] = height * int_sin (radian + MY_PI / 2) / 2 / FIXP;
        h_sin[i] = height * int_sin (radian)             / 2 / FIXP;
    }

    return 0;
}

uint main (
    uint argc,
    string[] argv
) {
    uint width;
    uint height;
    char buf[1024];
    uint isdir = 0;

    if (argc != 3) {
        GLib.print ("usage: %s image.pnm file|dir\n" +
               "generate a test video stream\n", argv[0]);
        return 1;
    }

    if (!freopen (argv[2], "wb", stdout))
        isdir = 1;

    width = DEFAULT_WIDTH;
    height = DEFAULT_HEIGHT;

    rgb_tab = malloc (width * height * 3);
    wrap = width * 3;
    width_2 = width;
    height_2 = height;

    if (init_demo (argv[1]))
        return 1;

    for (uint i = 0; i < DEFAULT_NB_PICT; i++) {
        gen_image (
            i,
            width,
            height
        );
        if (isdir) {
            snprintf (
                buf,
                sizeof (buf),
                "%s%02d.pgm",
                argv[2],
                i
            );
            pgmyuv_save (
                buf,
                width,
                height,
                rgb_tab
            );
        } else {
            pgmyuv_save (
                null,
                width,
                height,
                rgb_tab
            );
        }
    }

    free (rgb_tab);
    return 0;
}
