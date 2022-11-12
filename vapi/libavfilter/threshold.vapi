/***********************************************************
Copyright (c) 2016 Paul B Mahol

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

public struct ThresholdContext {
    const AVClass *class;

    int depth;
    int planes;
    int bpc;

    int nb_planes;
    int width[4], height[4];

    void (*threshold)(const uint8 *in, uint8 *threshold,
                      uint8 *min, uint8 *max,
                      uint8 *out,
                      ptrdiff_t ilinesize, ptrdiff_t tlinesize,
                      ptrdiff_t flinesize, ptrdiff_t slinesize,
                      ptrdiff_t olinesize,
                      int w, int h);

    AVFrame *frames[4];
    FFFrameSync fs;
}

void ff_threshold_init (ThresholdContext *s);
void ff_threshold_init_x86 (ThresholdContext *s);
