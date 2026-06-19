/***********************************************************
Copyright (c) 2015 Paul B Mahol

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

[Compact]
public class MaskedMergeContext {
    const AVClass *class;
    public int width[4], height[4];
    public int linesize[4];
    public int nb_planes;
    public int planes;
    public int half, depth;
    public FFFrameSync fs;

    [CCode (cname="maskedmerge")]
    public void (*maskedmerge)(
        const uint8[] bsrc, uint8[] osrc,
        uint8[] msrc, uint8[] dst,
        ptrdiff_t blinesize, ptrdiff_t olinesize,
        ptrdiff_t mlinesize, ptrdiff_t dlinesize,
        int w, int h,
        int half, int shift
    );

}

public void ff_maskedmerge_init_x86 (MaskedMergeContext *s);
