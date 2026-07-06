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
namespace LibAVFilter {

[CCode (cname="enum YADIFMode",cheader_filename="subprojects/ffmpeg/libavfilter/yadif.h")]
public enum YADIFMode {
    /***********************************************************
    send 1 frame for each frame
    ***********************************************************/
    [CCode (cname="YADIF_MODE_SEND_FRAME")]
    SEND_FRAME, // = 0,

    /***********************************************************
    send 1 frame for each field
    ***********************************************************/
    [CCode (cname="YADIF_MODE_SEND_FIELD")]
    SEND_FIELD, // = 1,

    /***********************************************************
    send 1 frame for each frame but skips spatial interlacing check
    ***********************************************************/
    [CCode (cname="YADIF_MODE_SEND_FRAME_NOSPATIAL")]
    SEND_FRAME_NO_SPATIAL, // = 2,

    /***********************************************************
    send 1 frame for each field but skips spatial interlacing check
    ***********************************************************/
    [CCode (cname="YADIF_MODE_SEND_FIELD_NOSPATIAL")]
    SEND_FIELD_NO_SPATIAL; // = 3;
}

[CCode (cname="enum YADIFParity",cheader_filename="subprojects/ffmpeg/libavfilter/yadif.h")]
public enum YADIFParity {
    /***********************************************************
    top field first
    ***********************************************************/
    [CCode (cname="YADIF_PARITY_TFF")]
    TOP_FIELD_FIRST, // = 0,

    /***********************************************************
    bottom field first
    ***********************************************************/
    [CCode (cname="YADIF_PARITY_BFF")]
    BOTTOM_FIELD_FIRST, // = 1,

    /***********************************************************
    auto detection
    ***********************************************************/
    [CCode (cname="YADIF_PARITY_AUTO")]
    AUTO; // = -1;
}

[CCode (cname="enum YADIFDeint",cprefix="YADIF_DEINT_",cheader_filename="subprojects/ffmpeg/libavfilter/yadif.h")]
public enum YADIFDeint {
    /***********************************************************
    deinterlace all frames
    ***********************************************************/
    [CCode (cname="")]
    ALL, // = 0,

    /***********************************************************
    only deinterlace frames marked as interlaced
    ***********************************************************/
    [CCode (cname="")]
    INTERLACED; // = 1;
}

[CCode (cname="enum YADIFCurrentField",cprefix="YADIF_FIELD_",cheader_filename="subprojects/ffmpeg/libavfilter/yadif.h")]
public enum YADIFCurrentField {
    /***********************************************************
    The last frame in a sequence
    ***********************************************************/
    BACK_END, // = -1,

    /***********************************************************
    The first or last field in a sequence
    ***********************************************************/
    END, // = 0,

    /***********************************************************
    A normal field in the middle of a sequence
    ***********************************************************/
    NORMAL; // = 1;
}

[CCode (cname="struct YADIFContext",cheader_filename="subprojects/ffmpeg/libavfilter/yadif.h")]
[Compact]
public class YADIFContext {
    [CCode (cname="class")]
    public LibAVUtil.Log.Class av_class;

    /***********************************************************
    YADIFMode
    ***********************************************************/
    [CCode (cname="")]
    public int mode;

    /***********************************************************
    YADIFParity
    ***********************************************************/
    [CCode (cname="")]
    public int parity;

    /***********************************************************
    YADIFDeint
    ***********************************************************/
    [CCode (cname="")]
    public int deint;

    [CCode (cname="")]
    public int frame_pending;

    [CCode (cname="")]
    public LibAVFormat.Frame cur;

    [CCode (cname="")]
    public LibAVFormat.Frame next;

    [CCode (cname="")]
    public LibAVFormat.Frame prev;

    [CCode (cname="")]
    public LibAVFormat.Frame out;

    public delegate void FilterDelegate (
        LibAVFilter.FilterContext? av_filter_context,
        LibAVFormat.Frame? dstpic,
        int parity,
        int tff
    );

    [CCode (cname="filter")]
    public FilterDelegate filter;

    public delegate void FilterLineDelegate (
        void *dst,
        void *prev,
        void *cur,
        void *next,
        int w,
        int prefs,
        int mrefs,
        int parity,
        int mode
    );

    /***********************************************************
    Required alignment for filter_line
    ***********************************************************/
    [CCode (cname="filter_line")]
    public FilterLineDelegate filter_line;

    public delegate void FilterEdgesDelegate (
        void *dst,
        void *prev,
        void *cur,
        void *next,
        int w,
        int prefs,
        int mrefs,
        int parity,
        int mode
    );

    [CCode (cname="filter_edges")]
    public FilterEdgesDelegate filter_edges;

    [CCode (cname="")]
    public AVPixFmtDescriptor? csp;

    [CCode (cname="")]
    public int eof;

    [CCode (cname="")]
    public uint8[] temp_line;

    [CCode (cname="")]
    public int temp_line_size;

    [CCode (cname="")]

    /***********************************************************
    YADIFCurrentField

    An algorithm that treats first and/or last fields in a sequence
    differently can use this to detect those cases. It is the algorithm's
    responsibility to set the value to YADIF_FIELD_NORMAL after processing
    the first field.
    ***********************************************************/
    [CCode (cname="")]
    public int current_field;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/yadif.h")]
public void ff_yadif_init_x86 (
    YADIFContext? yadif
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/yadif.h")]
public int ff_yadif_filter_frame (
    LibAVFilter.FilterLink? link,
    LibAVFormat.Frame? frame
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/yadif.h")]
public int ff_yadif_request_frame (
    LibAVFilter.FilterLink? link
);

//  extern const AVOption ff_yadif_options[];

} // namespace LibAVFilter
