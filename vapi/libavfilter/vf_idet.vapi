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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_idet.h")]
public const size_t HIST_SIZE; // 4

[CCode (cname="ff_idet_filter_func")]
public delegate int FfIdetFilterDelegate (
    uint8[] a,
    uint8[] b,
    uint8[] c,
    int w
);

[CCode (cname="enum Type",cheader_filename="subprojects/ffmpeg/libavfilter/vf_idet.h")]
public enum Type {
    TFF,
    BFF,
    PROGRESSIVE,
    UNDETERMINED;
}

[CCode (cname="enum RepeatedField",cprefix="REPEAT_",cheader_filename="subprojects/ffmpeg/libavfilter/vf_idet.h")]
public enum RepeatedField {
    NONE,
    TOP,
    BOTTOM;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_idet.h")]
[Compact]
public class IDETContext {
    [CCode (cname="class")]
    public AVClass av_class;

    [CCode (cname="")]
    public float interlace_threshold;

    [CCode (cname="")]
    public float progressive_threshold;

    [CCode (cname="")]
    public float repeat_threshold;

    [CCode (cname="")]
    public float half_life;

    [CCode (cname="")]
    public uint64 decay_coefficient;

    [CCode (cname="")]
    public Type last_type;

    [CCode (cname="")]
    public uint64 repeats[3];

    [CCode (cname="")]
    public uint64 prestat[4];

    [CCode (cname="")]
    public uint64 poststat[4];

    [CCode (cname="")]
    public uint64 total_repeats[3];

    [CCode (cname="")]
    public uint64 total_prestat[4];

    [CCode (cname="")]
    public uint64 total_poststat[4];

    [CCode (cname="")]
    public uint8 history[HIST_SIZE];

    [CCode (cname="")]
    public AVFrame cur;

    [CCode (cname="")]
    public AVFrame next;

    [CCode (cname="")]
    public AVFrame prev;

    [CCode (cname="")]
    public FfIdetFilterDelegate filter_line;

    [CCode (cname="")]
    public int interlaced_flag_accuracy;

    [CCode (cname="")]
    public int analyze_interlaced_flag;

    [CCode (cname="")]
    public int analyze_interlaced_flag_done;

    [CCode (cname="")]
    public VPixFmtDescriptor csp;

    [CCode (cname="")]
    public int eof;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_idet.h")]
public void ff_idet_init_x86 (
    IDETContext? idet,
    int for_16b
);

/***********************************************************
main fall-back for left-over
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_idet.h")]
public int ff_idet_filter_line_c (
    uint8[] a,
    uint8[] b,
    uint8[] c,
    int w
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_idet.h")]
public int ff_idet_filter_line_c_16bit (
    uint16[] a,
    uint16[] b,
    uint16[] c,
    int w
);
