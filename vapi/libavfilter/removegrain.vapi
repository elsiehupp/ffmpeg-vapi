/***********************************************************
Copyright (c) 2015 Paul B Mahol
Copyright (c) 2015 James Darnley

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
public class RemoveGrainContext {
    const AVClass *class;

    public int mode[4];

    public int nb_planes;
    public int planewidth[4];
    public int planeheight[4];
    public int skip_even;
    public int skip_odd;

    [CCode (cname="rg")]
    public int (*rg[4])(
        int c, int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8
    );

    [CCode (cname="fl")]
    public void (*fl[4])(
        uint8[] dst, uint8[] src, ptrdiff_t stride, int pixels
    );

}

public void ff_removegrain_init_x86 (RemoveGrainContext *rg);
