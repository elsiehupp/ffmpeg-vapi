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

[CCode (cheader_filename="subprojects/ffmpeg/libavfilter/motion_estimation.h")]
public enum MotionEstimationMethon {
    [CCode (cname="AV_ME_METHOD_ESA")]
    ESA, // 1

    [CCode (cname="AV_ME_METHOD_TSS")]
    TSS, // 2

    [CCode (cname="AV_ME_METHOD_TDLS")]
    TDLS, // 3

    [CCode (cname="AV_ME_METHOD_NTSS")]
    NTSS, // 4

    [CCode (cname="AV_ME_METHOD_FSS")]
    FSS, // 5

    [CCode (cname="AV_ME_METHOD_DS")]
    DS, // 6

    [CCode (cname="AV_ME_METHOD_HEXBS")]
    HEXBS, // 7

    [CCode (cname="AV_ME_METHOD_EPZS")]
    EPZS, // 8

    [CCode (cname="AV_ME_METHOD_UMH")]
    UMH; // 9
}

[CCode (cname="struct AVMotionEstPredictor",cheader_filename="subprojects/ffmpeg/libavfilter/motion_estimation.h")]
[Compact]
public class AVMotionEstPredictor {
    [CCode (cname="")]
    public int mvs[10][2];

    [CCode (cname="")]
    public int nb;
}

[CCode (cname="struct AVMotionEstContext",cheader_filename="subprojects/ffmpeg/libavfilter/motion_estimation.h")]
[Compact]
public class AVMotionEstContext {
    [CCode (cname="")]
    public uint8[] data_cur;

    [CCode (cname="")]
    public uint8[] data_ref;

    [CCode (cname="")]
    public int linesize;

    [CCode (cname="")]
    public int mb_size;

    [CCode (cname="")]
    public int search_param;

    [CCode (cname="")]
    public int width;

    [CCode (cname="")]
    public int height;

    [CCode (cname="")]
    public int x_min;

    [CCode (cname="")]
    public int x_max;

    [CCode (cname="")]
    public int y_min;

    [CCode (cname="")]
    public int y_max;

    /***********************************************************
    median predictor x
    ***********************************************************/
    [CCode (cname="")]
    public int pred_x;

    /***********************************************************
    median predictor y
    ***********************************************************/
    [CCode (cname="")]
    public int pred_y;

    [CCode (cname="")]
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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/motion_estimation.h")]
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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/motion_estimation.h")]
public uint64 ff_me_cmp_sad (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    int x_mv,
    int y_mv
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/motion_estimation.h")]
public uint64 ff_me_search_esa (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/motion_estimation.h")]
public uint64 ff_me_search_tss (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/motion_estimation.h")]
public uint64 ff_me_search_tdls (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/motion_estimation.h")]
public uint64 ff_me_search_ntss (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/motion_estimation.h")]
public uint64 ff_me_search_fss (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/motion_estimation.h")]
public uint64 ff_me_search_ds (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/motion_estimation.h")]
public uint64 ff_me_search_hexbs (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/motion_estimation.h")]
public uint64 ff_me_search_epzs (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/motion_estimation.h")]
public uint64 ff_me_search_umh (
    AVMotionEstContext? me_ctx,
    int x_mb,
    int y_mb,
    out int mv
);
