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

#define MAX_NOISE 5120
#define MAX_SHIFT 1024
#define MAX_RES (MAX_NOISE-MAX_SHIFT)

#define NOISE_UNIFORM  1
#define NOISE_TEMPORAL 2
#define NOISE_AVERAGED 8
#define NOISE_PATTERN  16

public struct FilterParams {
    int strength;
    unsigned flags;
    AVLFG lfg;
    int seed;
    int8 *noise;
    int8 *prev_shift[MAX_RES][3];
    int rand_shift[MAX_RES];
    int rand_shift_init;
}

public struct NoiseContext {
    const AVClass *class;
    int nb_planes;
    int bytewidth[4];
    int height[4];
    FilterParams all;
    FilterParams param[4];
    void (*line_noise)(uint8 *dst, uint8 *src, int8 *noise, int len, int shift);
    void (*line_noise_avg)(uint8 *dst, uint8 *src, int len, int8 * const *shift);
}

void ff_line_noise_c (uint8 *dst, uint8 *src, int8 *noise, int len, int shift);
void ff_line_noise_avg_c (uint8 *dst, uint8 *src, int len, int8 * const *shift);

void ff_noise_init_x86 (NoiseContext *n);
