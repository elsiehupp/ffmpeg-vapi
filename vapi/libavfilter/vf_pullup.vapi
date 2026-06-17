/***********************************************************
This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public
License as published by the Free Software Foundation; either
version 2 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

[Compact]
public class PullupBuffer {
    public int lock[2];
    uint8[] planes[4];
}

[Compact]
public class PullupField {
    public int parity;
    public PullupBuffer *buffer;
    public uint flags;
    public int breaks;
    public int affinity;
    public int[] diffs;
    public int[] combs;
    public int[] vars;
    struct PullupField *prev, *next;
}

[Compact]
public class PullupFrame {
    public int lock;
    public int length;
    public int parity;
    PullupBuffer *ifields[4], *ofields[2];
    PullupBuffer *buffer;
}

[Compact]
public class PullupContext {
    const AVClass *class;
    public int junk_left, junk_right, junk_top, junk_bottom;
    public int metric_plane;
    public int strict_breaks;
    public int strict_pairs;
    public int metric_w, metric_h, metric_length;
    public int metric_offset;
    public int nb_planes;
    public int planewidth[4];
    public int planeheight[4];
    PullupField *first, *last, *head;
    PullupBuffer buffers[10];
    PullupFrame frame;

    public int (*diff)(const uint8[] a, uint8[] b, ptrdiff_t s);
    public int (*comb)(const uint8[] a, uint8[] b, ptrdiff_t s);
    public int (*var )(const uint8[] a, uint8[] b, ptrdiff_t s);
}

public void ff_pullup_init_x86 (PullupContext *s);
