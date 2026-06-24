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

[Flags]
public enum TemporalInterlaceFlags {
    [CCode (cname="TINTERLACE_FLAG_VLPF",cheader_filename="subprojects/ffmpeg/libavfilter/tinterlace.h")]
    VLPF, // 01

    [CCode (cname="TINTERLACE_FLAG_CVLPF",cheader_filename="subprojects/ffmpeg/libavfilter/tinterlace.h")]
    CVLPF, // 2

    [CCode (cname="TINTERLACE_FLAG_EXACT_TB",cheader_filename="subprojects/ffmpeg/libavfilter/tinterlace.h")]
    EXACT_TB; // 4
}

[CCode (cname="enum TInterlaceMode",cheader_filename="subprojects/ffmpeg/libavfilter/tinterlace.h")]
public enum TemporalInterlaceMode {
    [CCode (cname="MODE_MERGE")]
    MERGE, // = 0,

    [CCode (cname="MODE_DROP_EVEN")]
    DROP_EVEN,

    [CCode (cname="MODE_DROP_ODD")]
    DROP_ODD,

    [CCode (cname="MODE_PAD")]
    PAD,

    [CCode (cname="MODE_INTERLEAVE_TOP")]
    INTERLEAVE_TOP,

    [CCode (cname="MODE_INTERLEAVE_BOTTOM")]
    INTERLEAVE_BOTTOM,

    [CCode (cname="MODE_INTERLACEX2")]
    INTERLACE_X2,

    [CCode (cname="MODE_MERGEX2")]
    MERGE_X2,

    [CCode (cname="MODE_NB")]
    MERGE_NB;
}

[CCode (cname="enum InterlaceScanMode",cheader_filename="subprojects/ffmpeg/libavfilter/tinterlace.h")]
public enum InterlaceScanMode {
    [CCode (cname="MODE_TFF")]
    TFF, // = 0,

    [CCode (cname="MODE_BFF")]
    BFF;
}

[CCode (cname="struct TInterlaceContext",cheader_filename="subprojects/ffmpeg/libavfilter/tinterlace.h")]
[Compact]
public class TInterlaceContext {
    [CCode (cname="class")]
    public AVClass av_class;

    /***********************************************************
    TInterlaceMode, interlace mode selected
    ***********************************************************/
    [CCode (cname="")]
    public int mode;

    [CCode (cname="")]
    public AVRational preout_time_base;

    /***********************************************************
    flags affecting interlacing algorithm
    ***********************************************************/
    [CCode (cname="")]
    public int flags;

    /***********************************************************
    number of the output frame
    ***********************************************************/
    [CCode (cname="")]
    public int frame;

    /***********************************************************
    chroma vertical subsampling
    ***********************************************************/
    [CCode (cname="")]
    public int vsub;

    [CCode (cname="")]
    public AVFrame cur;

    [CCode (cname="")]
    public AVFrame next;

    /***********************************************************
    buffer used to fill padded lines
    ***********************************************************/
    [CCode (cname="")]
    public uint8[] black_data[4];

    [CCode (cname="")]
    public int black_linesize[4];

    [CCode (cname="")]
    public FFDrawContext draw;

    [CCode (cname="")]
    public FFDrawColor color;

    [CCode (cname="")]
    public AVPixFmtDescriptor[] csp;

    public delegate void LowpassLineDelegate (
        uint8[] dstp,
        ptrdiff_t width,
        uint8[] srcp,
        ptrdiff_t mref,
        ptrdiff_t pref,
        int clip_max
    );

    [CCode (cname="lowpass_line")]
    public LowpassLineDelegate lowpass_line

}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/tinterlace.h")]
public void ff_tinterlace_init_x86 (
    TInterlaceContext? interlace
);
