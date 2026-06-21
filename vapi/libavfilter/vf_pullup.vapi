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

[CCode (cname="",cheader_filename="")]
[Compact]
public class PullupBuffer {
    [CCode (cname="")]
    public int lock[2];

    [CCode (cname="")]
    public uint8[] planes[4];
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class PullupField {
    [CCode (cname="")]
    public int parity;

    [CCode (cname="")]
    public PullupBuffer? buffer;

    [CCode (cname="")]
    public uint flags;

    [CCode (cname="")]
    public int breaks;

    [CCode (cname="")]
    public int affinity;

    [CCode (cname="")]
    public int[] diffs;

    [CCode (cname="")]
    public int[] combs;

    [CCode (cname="")]
    public int[] vars;

    [CCode (cname="")]
    public PullupField? prev;

    [CCode (cname="")]
    public PullupField? next;
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class PullupFrame {
    [CCode (cname="")]
    public int lock;

    [CCode (cname="")]
    public int length;

    [CCode (cname="")]
    public int parity;

    [CCode (cname="")]
    public PullupBuffer? ifields[4];

    [CCode (cname="")]
    public PullupBuffer? ofields[2];

    [CCode (cname="")]
    public PullupBuffer? buffer;
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class PullupContext {
    [CCode (cname="")]
    public AVClass class;

    [CCode (cname="")]
    public int junk_left;

    [CCode (cname="")]
    public int junk_right;

    [CCode (cname="")]
    public int junk_top;

    [CCode (cname="")]
    public int junk_bottom;

    [CCode (cname="")]
    public int metric_plane;

    [CCode (cname="")]
    public int strict_breaks;

    [CCode (cname="")]
    public int strict_pairs;

    [CCode (cname="")]
    public int metric_w;

    [CCode (cname="")]
    public int metric_h;

    [CCode (cname="")]
    public int metric_length;

    [CCode (cname="")]
    public int metric_offset;

    [CCode (cname="")]
    public int nb_planes;

    [CCode (cname="")]
    public int planewidth[4];

    [CCode (cname="")]
    public int planeheight[4];

    [CCode (cname="")]
    public PullupField? first;

    [CCode (cname="")]
    public PullupField? last;

    [CCode (cname="")]
    public PullupField? head;

    [CCode (cname="")]
    public PullupBuffer buffers[10];

    [CCode (cname="")]
    public PullupFrame frame;

    public delegate int DiffDelegate (
        uint8[] a,
        uint8[] b,
        ptrdiff_t s
    );

    [CCode (cname="diff")]
    public DiffDelegate diff;

    public delegate int CombDelegate (
        uint8[] a,
        uint8[] b,
        ptrdiff_t s
    );

    [CCode (cname="comb")]
    public CombDelegate comb;

    public delegate int VarDelegate (
        uint8[] a,
        uint8[] b,
        ptrdiff_t s
    );

    [CCode (cname="var")]
    public VarDelegate var;

}

[CCode (cname="",cheader_filename="")]
public void ff_pullup_init_x86 (
    PullupContext? s
);
