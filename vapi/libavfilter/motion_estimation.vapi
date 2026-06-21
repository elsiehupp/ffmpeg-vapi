/***********************************************************
Copyright (c) 2016 Davinder Singh (DSM_) <ds.mudhar<@gmail.com>

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
public enum FooBar {
    [CCode (cname="",cheader="")]
    AV_ME_METHOD_ESA, // 1

    [CCode (cname="",cheader="")]
    AV_ME_METHOD_TSS, // 2

    [CCode (cname="",cheader="")]
    AV_ME_METHOD_TDLS, // 3

    [CCode (cname="",cheader="")]
    AV_ME_METHOD_NTSS, // 4

    [CCode (cname="",cheader="")]
    AV_ME_METHOD_FSS, // 5

    [CCode (cname="",cheader="")]
    AV_ME_METHOD_DS, // 6

    [CCode (cname="",cheader="")]
    AV_ME_METHOD_HEXBS, // 7

    [CCode (cname="",cheader="")]
    AV_ME_METHOD_EPZS, // 8

    [CCode (cname="",cheader="")]
    AV_ME_METHOD_UMH; // 9
}

[CCode (cname="",cheader="")]
[Compact]
public class AVMotionEstPredictor {
    [CCode (cname="",cheader="")]
    public int mvs[10][2];

    [CCode (cname="",cheader="")]
    public int nb;
}

[CCode (cname="",cheader="")]
[Compact]
public class AVMotionEstContext {
    [CCode (cname="",cheader="")]
    public uint8[] data_cur;

    [CCode (cname="",cheader="")]
    public uint8[] data_ref;

    [CCode (cname="",cheader="")]
    public int linesize;

    [CCode (cname="",cheader="")]
    public int mb_size;

    [CCode (cname="",cheader="")]
    public int search_param;

    [CCode (cname="",cheader="")]
    public int width;

    [CCode (cname="",cheader="")]
    public int height;

    [CCode (cname="",cheader="")]
    public int x_min;

    [CCode (cname="",cheader="")]
    public int x_max;

    [CCode (cname="",cheader="")]
    public int y_min;

    [CCode (cname="",cheader="")]
    public int y_max;

    /***********************************************************
    median predictor x
    ***********************************************************/
    [CCode (cname="",cheader="")]
    public int pred_x;

    /***********************************************************
    median predictor y
    ***********************************************************/
    [CCode (cname="",cheader="")]
    public int pred_y;

    [CCode (cname="",cheader="")]
    public AVMotionEstPredictor preds[2];

    public delegate uint64 GetCostDelegate (
        AVMotionEstContext? me_ctx,
        int x_mb,
        int y_mb,
        int mv_x,
        int mv_y
    );

    [CCode (cname="get_cost")]
    public GetCostDelegate get_cost;

}

[CCode (cname="",cheader="")]
public void ff_me_init_context (
    AVMotionEstContext? me_ctx,
    int mb_size,
    int search_param,
    int width,
    int height,
    int x_min,
    int x_max,
    int y_min,
    int y_max
);

[CCode (cname="",cheader="")]
public uint64 ff_me_cmp_sad (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    int x_mv,
    int y_mv
);

[CCode (cname="",cheader="")]
public uint64 ff_me_search_esa (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader="")]
public uint64 ff_me_search_tss (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader="")]
public uint64 ff_me_search_tdls (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader="")]
public uint64 ff_me_search_ntss (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader="")]
public uint64 ff_me_search_fss (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader="")]
public uint64 ff_me_search_ds (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader="")]
public uint64 ff_me_search_hexbs (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader="")]
public uint64 ff_me_search_epzs (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader="")]
public uint64 ff_me_search_umh (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);
