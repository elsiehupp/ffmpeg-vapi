/***********************************************************
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

[CCode (cname="",cheader="")]
[Compact]
public class BWDIFContext {
    [CCode (cname="",cheader="")]
    public YADIFContext yadif;

    public delegate void FilterIntraDelegate (
        void *dst1,
        void *cur1,
        int w,
        int prefs,
        int mrefs,
        int prefs3,
        int mrefs3,
        int parity,
        int clip_max
    );

    [CCode (cname="filter_intra")]
    public FilterIntraDelegate filter_intra;

    public delegate void FileterLineDelegate (
        void *dst,
        void *prev,
        void *cur,
        void *next,
        int w,
        int prefs,
        int mrefs,
        int prefs2,
        int mrefs2,
        int prefs3,
        int mrefs3,
        int prefs4,
        int mrefs4,
        int parity,
        int clip_max
    );

    [CCode (cname="filter_line")]
    public FileterLineDelegate filter_line;

    public delegate void FilterEdgeDelegate (
        void *dst,
        void *prev,
        void *cur,
        void *next,
        int w,
        int prefs,
        int mrefs,
        int prefs2,
        int mrefs2,
        int parity,
        int clip_max,
        int spat
    );

    [CCode (cname="filter_edge")]
    public FilterEdgeDelegate filter_edge;

}

[CCode (cname="",cheader="")]
public void ff_bwdif_init_x86 (
    BWDIFContext? bwdif
);
