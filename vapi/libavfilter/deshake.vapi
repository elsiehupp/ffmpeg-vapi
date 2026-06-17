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

[Compact]
public class IntMotionVector {
    /***********************************************************
    Horizontal shift
    ***********************************************************/
    public int x;
    /***********************************************************
    Vertical shift
    ***********************************************************/
    public int y;
}

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

#define MAX_R 64

[Compact]
public class DeshakeContext {
    const AVClass *class;
    /***********************************************************
    Scratch buffer for motion search
    ***********************************************************/
    public int counts[2*MAX_R+1][2*MAX_R+1];
    /***********************************************************
    Scratch buffer for block angles
    ***********************************************************/
    double[] angles;
    public uint angles_size;
    /***********************************************************
    Previous frame
    ***********************************************************/
    AVFrame *ref;
    /***********************************************************
    Maximum horizontal shift
    ***********************************************************/
    public int rx;
    /***********************************************************
    Maximum vertical shift
    ***********************************************************/
    public int ry;
    /***********************************************************
    Edge fill method
    ***********************************************************/
    public int edge;
    /***********************************************************
    Size of blocks to compare
    ***********************************************************/
    public int blocksize;
    /***********************************************************
    Contrast threshold
    ***********************************************************/
    public int contrast;
    /***********************************************************
    Motion search method
    ***********************************************************/
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
    public int refcount;
    FILE *fp;
    Transform avg;
    /***********************************************************
    Crop motion search to this box
    ***********************************************************/
    public int cw;
    public int ch;
    public int cx;
    public int cy;
    /***********************************************************
    Motion search detailed log filename
    ***********************************************************/
    string filename;
    public int opencl;
    public int (* transform)(AVFilterContext *ctx, int width, int height, int cw, int ch,
                      float *matrix_y, float *matrix_uv, InterpolateMethod interpolate,
                      FillMethod fill, AVFrame *in, AVFrame *out);
}
