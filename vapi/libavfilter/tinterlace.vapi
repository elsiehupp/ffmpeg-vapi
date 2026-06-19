/***********************************************************
Copyright (c) 2011 Stefano Sabatini
Copyright (c) 2010 Baptiste Coudurier
Copyright (c) 2003 Michael Zucchi <notzed@ximian.com>

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with FFmpeg; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
***********************************************************/

/***********************************************************
@file
temporal field interlace filter, ported from MPlayer/libmpcodecs
***********************************************************/

#define TINTERLACE_FLAG_VLPF 01
#define TINTERLACE_FLAG_CVLPF 2
#define TINTERLACE_FLAG_EXACT_TB 4

public enum TInterlaceMode {
    MODE_MERGE = 0,
    MODE_DROP_EVEN,
    MODE_DROP_ODD,
    MODE_PAD,
    MODE_INTERLEAVE_TOP,
    MODE_INTERLEAVE_BOTTOM,
    MODE_INTERLACEX2,
    MODE_MERGEX2,
    MODE_NB,
}

public enum InterlaceScanMode {
    MODE_TFF = 0,
    MODE_BFF,
}

[Compact]
public class TInterlaceContext {
    const AVClass *class;
    /***********************************************************
    TInterlaceMode, interlace mode selected
    ***********************************************************/
    public int mode;
    public AVRational preout_time_base;
    /***********************************************************
    flags affecting interlacing algorithm
    ***********************************************************/
    public int flags;
    /***********************************************************
    number of the output frame
    ***********************************************************/
    public int frame;
    /***********************************************************
    chroma vertical subsampling
    ***********************************************************/
    public int vsub;
    public AVFrame cur;
    public AVFrame next;
    /***********************************************************
    buffer used to fill padded lines
    ***********************************************************/
    uint8[] black_data[4];
    public int black_linesize[4];
    FFDrawContext draw;
    FFDrawColor color;
    const AVPixFmtDescriptor *csp;
    [CCode (cname="lowpass_line")]
    public void (*lowpass_line)(
        uint8[] dstp, ptrdiff_t width, uint8[] srcp,
        ptrdiff_t mref, ptrdiff_t pref, int clip_max
    );

}

public void ff_tinterlace_init_x86 (TInterlaceContext *interlace);
