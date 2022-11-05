/***********************************************************
@copyright Sebastien Bechet <s.bechet@av7.net>

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


const uint SCALEBITS = 8;
const uint ONE_HALF = (1 << (SCALEBITS - 1));
static uint FIX (float x) {
    return ((uint) (x * (1 << SCALEBITS) + 0.5));
}

static void err_if (bool expr) {
    if (expr) {
        fprintf (
            stderr,
            "%s\n",
            strerror (errno)
        );
        exit (1);
    }
}

static void rgb24_to_yuv420p (
    uchar[] lum,
    uchar[] cb,
    uchar[] cr,
    uchar[] src,
    uint width_2,
    uint height_2
) {
    uint wrap;
    uint wrap3;
    uint x;
    uint y;
    uint r;
    uint g;
    uint b;
    uint r1;
    uint g1;
    uint b1;
    uchar[] p;

    wrap = width_2;
    wrap3 = width_2 * 3;
    p = src;
    for (y = 0; y < height_2; y += 2) {
        for (x = 0; x < width_2; x += 2) {
            r = p[0];
            g = p[1];
            b = p[2];
            r1 = r;
            g1 = g;
            b1 = b;
            lum[0] = (FIX (0.29900) * r + FIX (0.58700) * g +
                       FIX (0.11400) * b + ONE_HALF) >> SCALEBITS;
            r = p[3];
            g = p[4];
            b = p[5];
            r1     += r;
            g1     += g;
            b1     += b;
            lum[1] = (FIX (0.29900) * r + FIX (0.58700) * g +
                       FIX (0.11400) * b + ONE_HALF) >> SCALEBITS;
            p      += wrap3;
            lum    += wrap;

            r = p[0];
            g = p[1];
            b = p[2];
            r1     += r;
            g1     += g;
            b1     += b;
            lum[0] = (FIX (0.29900) * r + FIX (0.58700) * g +
                       FIX (0.11400) * b + ONE_HALF) >> SCALEBITS;
            r = p[3];
            g = p[4];
            b = p[5];
            r1     += r;
            g1     += g;
            b1     += b;
            lum[1] = (FIX (0.29900) * r + FIX (0.58700) * g +
                       FIX (0.11400) * b + ONE_HALF) >> SCALEBITS;

            cb[0] = ((- FIX (0.16874) * r1 - FIX (0.33126) * g1 +
                       FIX (0.50000) * b1 + 4 * ONE_HALF - 1) >> (SCALEBITS + 2)) + 128;
            cr[0] = ((FIX (0.50000) * r1 - FIX (0.41869) * g1 -
                       FIX (0.08131) * b1 + 4 * ONE_HALF - 1) >> (SCALEBITS + 2)) + 128;

            cb++;
            cr++;
            p   += -wrap3 + 2 * 3;
            lum += -wrap  + 2;
        }
        p   += wrap3;
        lum += wrap;
    }
}

/***********************************************************
cif format
***********************************************************/

const uint DEFAULT_WIDTH = 352;
const uint DEFAULT_HEIGHT = 288;
const uint DEFAULT_NB_PICT = 50;

static void pgmyuv_save (
    string filename,
    uint width,
    uint height,
    uchar[] rgb_tab
) {
    GLib.File f;
    uint h2;
    uint w2;
    uchar[] cb;
    uchar[] cr;
    uchar[] lum_tab;
    uchar[] cb_tab;
    uchar[] cr_tab;

    lum_tab = new uchar[width * height];
    cb_tab = new uchar[width * height / 4];
    cr_tab = new uchar[width * height / 4];

    rgb24_to_yuv420p (lum_tab, cb_tab, cr_tab, rgb_tab, width, height);

    if (filename != "") {
        f = fopen (filename, "wb");
        fprintf (f, "P5\n%d %d\n%d\n", width, height * 3 / 2, 255);
    } else {
        f = stdout;
    }

    err_if (fwrite (lum_tab, 1, width * height, f) != width * height);
    h2 = height / 2;
    w2 = width / 2;
    cb = cb_tab;
    cr = cr_tab;

    if (filename != "") {
        for (uint i = 0; i < h2; i++) {
            err_if (fwrite (cb, 1, w2, f) != w2);
            err_if (fwrite (cr, 1, w2, f) != w2);
            cb += w2;
            cr += w2;
        }
        fclose (f);
    } else {
        for (uint i = 0; i < h2; i++) {
            err_if (fwrite (cb, 1, w2, f) != w2);
            cb += w2;
        }
        for (uint i = 0; i < h2; i++) {
            err_if (fwrite (cr, 1, w2, f) != w2);
            cr += w2;
        }
    }

    free (lum_tab);
    free (cb_tab);
    free (cr_tab);
}

static uchar[] rgb_tab;
static uint width_2;
static uint height_2;
static uint wrap;

static void put_pixel (
    uint x,
    uint y,
    uint r,
    uint g,
    uint b
) {
    uchar[] p;

    if (x < 0 || x >= width_2 ||
        y < 0 || y >= height_2)
        return;

    p = rgb_tab + y * wrap + x * 3;
    p[0] = r;
    p[1] = g;
    p[2] = b;
}
