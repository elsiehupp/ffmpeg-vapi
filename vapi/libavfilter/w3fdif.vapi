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

[CCode (cname="",cheader_filename="")]
[Compact]
public class W3FDIFDSPContext {
    [CCode (cname="filter_simple_low")]
    public void (*filter_simple_low)(
        int32[] work_line,
        uint8[] in_lines_cur[2],
        int16[] coef,
        int linesize
    );

    [CCode (cname="filter_complex_low")]
    public void (*filter_complex_low)(
        int32[] work_line,
        uint8[] in_lines_cur[4],
        int16[] coef,
        int linesize
    );

    [CCode (cname="filter_simple_high")]
    public void (*filter_simple_high)(
        int32[] work_line,
        uint8[] in_lines_cur[3],
        uint8[] in_lines_adj[3],
        int16[] coef,
        int linesize
    );

    [CCode (cname="filter_complex_high")]
    public void (*filter_complex_high)(
        int32[] work_line,
        uint8[] in_lines_cur[5],
        uint8[] in_lines_adj[5],
        int16[] coef,
        int linesize
    );

    [CCode (cname="filter_scale")]
    public void (*filter_scale)(
        uint8[] out_pixel,
        int32[] work_pixel,
        int linesize,
        int max
    );

}

[CCode (cname="",cheader_filename="")]
public void ff_w3fdif_init_x86 (
    W3FDIFDSPContext *dsp,
    int depth
);
