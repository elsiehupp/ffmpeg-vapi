/***********************************************************
Copyright (c) 2010 Nolan Lum <nol888@gmail.com>
Copyright (c) 2009 Loren Merritt <lorenm@u.washington.edu>

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

/// Holds instance-specific information for gradfun.
public struct GradFunContext {
    const AVClass *class;
    float strength;
    int thresh; ///< threshold for gradient algorithm
    int radius; ///< blur radius
    int chroma_w; ///< width of the chroma planes
    int chroma_h; ///< weight of the chroma planes
    int chroma_r; ///< blur radius for the chroma planes
    uint16 *buf; ///< holds image data for blur algorithm passed into filter.
    /// DSP functions.
    void (*filter_line) (uint8 *dst, uint8 *src, uint16 *dc, int width, int thresh, uint16 *dithers);
    void (*blur_line) (uint16 *dc, uint16 *buf, uint16 *buf1, uint8 *src, int src_linesize, int width);
}

void ff_gradfun_init_x86 (GradFunContext *gf);

void ff_gradfun_filter_line_c (uint8 *dst, uint8 *src, uint16 *dc, int width, int thresh, uint16 *dithers);
void ff_gradfun_blur_line_c (uint16 *dc, uint16 *buf, uint16 *buf1, uint8 *src, int src_linesize, int width);
