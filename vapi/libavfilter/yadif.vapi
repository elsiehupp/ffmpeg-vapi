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

public enum YADIFMode {
    /***********************************************************
    send 1 frame for each frame
    ***********************************************************/
    YADIF_MODE_SEND_FRAME = 0,
    /***********************************************************
    send 1 frame for each field
    ***********************************************************/
    YADIF_MODE_SEND_FIELD = 1,
    /***********************************************************
    send 1 frame for each frame but skips spatial interlacing check
    ***********************************************************/
    YADIF_MODE_SEND_FRAME_NOSPATIAL = 2,
    /***********************************************************
    send 1 frame for each field but skips spatial interlacing check
    ***********************************************************/
    YADIF_MODE_SEND_FIELD_NOSPATIAL = 3;
}

public enum YADIFParity {
    /***********************************************************
    top field first
    ***********************************************************/
    YADIF_PARITY_TFF = 0,
    /***********************************************************
    bottom field first
    ***********************************************************/
    YADIF_PARITY_BFF = 1,
    /***********************************************************
    auto detection
    ***********************************************************/
    YADIF_PARITY_AUTO = -1;
}

public enum YADIFDeint {
    /***********************************************************
    deinterlace all frames
    ***********************************************************/
    YADIF_DEINT_ALL = 0,
    /***********************************************************
    only deinterlace frames marked as interlaced
    ***********************************************************/
    YADIF_DEINT_INTERLACED = 1;
}

public enum YADIFCurrentField {
    /***********************************************************
    The last frame in a sequence
    ***********************************************************/
    YADIF_FIELD_BACK_END = -1,
    /***********************************************************
    The first or last field in a sequence
    ***********************************************************/
    YADIF_FIELD_END = 0,
    /***********************************************************
    A normal field in the middle of a sequence
    ***********************************************************/
    YADIF_FIELD_NORMAL = 1;
}

[Compact]
public class YADIFContext {
    const AVClass *class;

    /***********************************************************
    YADIFMode
    ***********************************************************/
    public int mode;
    /***********************************************************
    YADIFParity
    ***********************************************************/
    public int parity;
    /***********************************************************
    YADIFDeint
    ***********************************************************/
    public int deint;

    public int frame_pending;

    AVFrame *cur;
    AVFrame *next;
    AVFrame *prev;
    AVFrame *out;

    void (*filter)(
        AVFilterContext *ctx, AVFrame *dstpic, int parity, int tff
    );

    /***********************************************************
    Required alignment for filter_line
    ***********************************************************/
    void (*filter_line)(
        void *dst,
        void *prev, void *cur, void *next,
        int w, int prefs, int mrefs, int parity, int mode
    );

    void (*filter_edges)(
        void *dst, void *prev, void *cur, void *next,
        int w, int prefs, int mrefs, int parity, int mode
    );

    const AVPixFmtDescriptor *csp;
    public int eof;
    uint8[] temp_line;
    public int temp_line_size;

    /***********************************************************
    YADIFCurrentField

    An algorithm that treats first and/or last fields in a sequence
    differently can use this to detect those cases. It is the algorithm's
    responsibility to set the value to YADIF_FIELD_NORMAL after processing
    the first field.
    ***********************************************************/
    public int current_field;
}

public void ff_yadif_init_x86 (YADIFContext *yadif);

public int ff_yadif_filter_frame (AVFilterLink *link, AVFrame *frame);

public int ff_yadif_request_frame (AVFilterLink *link);

//  extern const AVOption ff_yadif_options[];
