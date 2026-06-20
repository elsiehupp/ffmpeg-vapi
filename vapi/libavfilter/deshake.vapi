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

[CCode (cname="",cheader_filename="")]
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

[CCode (cname="",cheader_filename="")]
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

[CCode (cname="",cheader_filename="")]
[Compact]
public class MotionVector {
    /***********************************************************
    Horizontal shift
    ***********************************************************/
    double x;

    /***********************************************************
    Vertical shift
    ***********************************************************/
    double y;
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class Transform {
    /***********************************************************
    Motion vector
    ***********************************************************/
    MotionVector vec;

    /***********************************************************
    Angle of rotation
    ***********************************************************/
    double angle;

    /***********************************************************
    Zoom percentage
    ***********************************************************/
    double zoom;
}

[CCode (cname="",cheader_filename="")]
public define MAX_R 64

[CCode (cname="",cheader_filename="")]
[Compact]
public class DeshakeContext {
    [CCode (cname="")]
    public AVClass class;

    /***********************************************************
    Scratch buffer for motion search
    ***********************************************************/
    [CCode (cname="")]
    public int counts[2*MAX_R+1][2*MAX_R+1];

    /***********************************************************
    Scratch buffer for block angles
    ***********************************************************/
    double[] angles;

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
    av_pixelutils_sad_fn sad;

    /***********************************************************
    Transform from last frame
    ***********************************************************/
    Transform last;

    /***********************************************************
    Number of reference frames (defines averaging window)
    ***********************************************************/
    [CCode (cname="")]
    public int refcount;

    FILE *fp;

    Transform avg;

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
    string filename;

    [CCode (cname="")]
    public int opencl;

    [CCode (cname="transform")]
    public int (* transform)(
        AVFilterContext *ctx,
        int width,
        int height,
        int cw,
        int ch,
        float[] matrix_y,
        float[] matrix_uv,
        InterpolateMethod interpolate,
        FillMethod fill,
        AVFrame *in,
        AVFrame *out
    );

}
