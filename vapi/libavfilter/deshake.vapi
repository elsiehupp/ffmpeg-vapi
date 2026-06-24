/***********************************************************
Copyright (C) 2013 Wei Gao <weigao@multicorewareinc.com>
Copyright (C) 2013 Lenny Wang

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

[CCode (cname="enum SearchMethod",cheader_filename="subprojects/ffmpeg/libavfilter/deshake.h")]
public enum SearchMethod {
    /***********************************************************
    Search all possible positions
    ***********************************************************/
    EXHAUSTIVE,

    /***********************************************************
    Search most possible positions (faster)
    ***********************************************************/
    SMART_EXHAUSTIVE,

    SEARCH_COUNT;
}

[CCode (cname="struct IntMotionVector",cheader_filename="subprojects/ffmpeg/libavfilter/deshake.h")]
[Compact]
public class IntMotionVector {
    /***********************************************************
    Horizontal shift
    ***********************************************************/
    [CCode (cname="")]
    public int x;

    /***********************************************************
    Vertical shift
    ***********************************************************/
    [CCode (cname="")]
    public int y;
}

[CCode (cname="struct MotionVector",cheader_filename="subprojects/ffmpeg/libavfilter/deshake.h")]
[Compact]
public class MotionVector {
    /***********************************************************
    Horizontal shift
    ***********************************************************/
    [CCode (cname="")]
    public double x;

    /***********************************************************
    Vertical shift
    ***********************************************************/
    [CCode (cname="")]
    public double y;
}

[CCode (cname="struct Transform",cheader_filename="subprojects/ffmpeg/libavfilter/deshake.h")]
[Compact]
public class Transform {
    /***********************************************************
    Motion vector
    ***********************************************************/
    [CCode (cname="")]
    public MotionVector vec;

    /***********************************************************
    Angle of rotation
    ***********************************************************/
    [CCode (cname="")]
    public double angle;

    /***********************************************************
    Zoom percentage
    ***********************************************************/
    [CCode (cname="")]
    public double zoom;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/deshake.h")]
public const size_t MAX_R; // 64

[CCode (cname="struct DeshakeContext",cheader_filename="subprojects/ffmpeg/libavfilter/deshake.h")]
[Compact]
public class DeshakeContext {
    [CCode (cname="class")]
    public AVClass av_class;

    /***********************************************************
    Scratch buffer for motion search
    ***********************************************************/
    [CCode (cname="")]
    public int counts[2 * MAX_R + 1][2 * MAX_R + 1];

    /***********************************************************
    Scratch buffer for block angles
    ***********************************************************/
    [CCode (cname="")]
    public double[] angles;

    [CCode (cname="")]
    public uint angles_size;

    /***********************************************************
    Previous frame
    ***********************************************************/
    [CCode (cname="")]
    public AVFrame ref;

    /***********************************************************
    Maximum horizontal shift
    ***********************************************************/
    [CCode (cname="")]
    public int rx;

    /***********************************************************
    Maximum vertical shift
    ***********************************************************/
    [CCode (cname="")]
    public int ry;

    /***********************************************************
    Edge fill method
    ***********************************************************/
    [CCode (cname="")]
    public int edge;

    /***********************************************************
    Size of blocks to compare
    ***********************************************************/
    [CCode (cname="")]
    public int blocksize;

    /***********************************************************
    Contrast threshold
    ***********************************************************/
    [CCode (cname="")]
    public int contrast;

    /***********************************************************
    Motion search method
    ***********************************************************/
    [CCode (cname="")]
    public int search;

    /***********************************************************
    Sum of the absolute difference function
    ***********************************************************/
    [CCode (cname="")]
    public av_pixelutils_sad_fn sad;

    /***********************************************************
    Transform from last frame
    ***********************************************************/
    [CCode (cname="")]
    public Transform last;

    /***********************************************************
    Number of reference frames (defines averaging window)
    ***********************************************************/
    [CCode (cname="")]
    public int refcount;

    [CCode (cname="")]
    public FILE? fp;

    [CCode (cname="")]
    public Transform avg;

    /***********************************************************
    Crop motion search to this box
    ***********************************************************/
    [CCode (cname="")]
    public int cw;

    [CCode (cname="")]
    public int ch;

    [CCode (cname="")]
    public int cx;

    [CCode (cname="")]
    public int cy;

    /***********************************************************
    Motion search detailed log filename
    ***********************************************************/
    [CCode (cname="")]
    public string filename;

    [CCode (cname="")]
    public int opencl;

    public delegate int TransformDelegate (
        AVFilterContext? av_filter_context,
        int width,
        int height,
        int cw,
        int ch,
        float[] matrix_y,
        float[] matrix_uv,
        InterpolateMethod interpolate,
        FillMethod fill,
        AVFrame? in,
        AVFrame? out
    );

    [CCode (cname="transform")]
    public TransformDelegate transform;
}
