/***********************************************************
Copyright (c) 2002 Michael Niedermayer <michaelni@gmx.at>
Copyright (c) 2013 Paul B Mahol

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

[CCode (cname="",cheader_filename="")]
public define MAX_NOISE 5120
public define MAX_SHIFT 1024
public define MAX_RES (MAX_NOISE-MAX_SHIFT)

[CCode (cname="",cheader_filename="")]
public define NOISE_UNIFORM  1
public define NOISE_TEMPORAL 2
public define NOISE_AVERAGED 8
public define NOISE_PATTERN  16

[CCode (cname="",cheader_filename="")]
[Compact]
public class FilterParams {
    [CCode (cname="")]
    public int strength;

    [CCode (cname="")]
    public uint flags;

    [CCode (cname="")]
    public AVLFG lfg;

    [CCode (cname="")]
    public int seed;

    [CCode (cname="")]
    public int8 *noise;

    [CCode (cname="")]
    public int8 *prev_shift[MAX_RES][3];

    [CCode (cname="")]
    public int rand_shift[MAX_RES];

    [CCode (cname="")]
    public int rand_shift_init;
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class NoiseContext {
    [CCode (cname="")]
    public AVClass class;

    [CCode (cname="")]
    public int nb_planes;

    [CCode (cname="")]
    public int bytewidth[4];

    [CCode (cname="")]
    public int height[4];

    FilterParams all;

    FilterParams param[4];

    [CCode (cname="line_noise")]
    public void (*line_noise)(
        uint8[] dst,
        uint8[] src,
        int8 *noise,
        int len,
        int shift
    );

    [CCode (cname="line_noise_avg")]
    public void (*line_noise_avg)(
        uint8[] dst,
        uint8[] src,
        int len,
        int8 * const *shift
    );

}

[CCode (cname="",cheader_filename="")]
public void ff_line_noise_c (
    uint8[] dst,
    uint8[] src,
    int8 *noise,
    int len,
    int shift
);

[CCode (cname="",cheader_filename="")]
public void ff_line_noise_avg_c (
    uint8[] dst,
    uint8[] src,
    int len,
    int8 * const *shift
);

[CCode (cname="",cheader_filename="")]
public void ff_noise_init_x86 (
    NoiseContext *n
);
