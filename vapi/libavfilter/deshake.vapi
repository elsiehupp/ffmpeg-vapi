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

enum SearchMethod {
    EXHAUSTIVE,        ///< Search all possible positions
    SMART_EXHAUSTIVE,  ///< Search most possible positions (faster)
    SEARCH_COUNT
}

[Compact]
public class IntMotionVector {
    /***********************************************************
    Horizontal shift
    ***********************************************************/
    int x; ///<
    /***********************************************************
    Vertical shift
    ***********************************************************/
    int y; ///<
}

[Compact]
public class MotionVector {
    /***********************************************************
    Horizontal shift
    ***********************************************************/
    double x; ///<
    /***********************************************************
    Vertical shift
    ***********************************************************/
    double y; ///<
}

[Compact]
public class Transform {
    /***********************************************************
    Motion vector
    ***********************************************************/
    MotionVector vec; ///<
    /***********************************************************
    Angle of rotation
    ***********************************************************/
    double angle; ///<
    /***********************************************************
    Zoom percentage
    ***********************************************************/
    double zoom; ///<
}

#define MAX_R 64

[Compact]
public class DeshakeContext {
    const AVClass *class;
    /***********************************************************
    Scratch buffer for motion search
    ***********************************************************/
    int counts[2*MAX_R+1][2*MAX_R+1]; ///<
    /***********************************************************
    Scratch buffer for block angles
    ***********************************************************/
    double[] angles; ///<
    unsigned angles_size;
    /***********************************************************
    Previous frame
    ***********************************************************/
    AVFrame *ref; ///<
    /***********************************************************
    Maximum horizontal shift
    ***********************************************************/
    int rx; ///<
    /***********************************************************
    Maximum vertical shift
    ***********************************************************/
    int ry; ///<
    /***********************************************************
    Edge fill method
    ***********************************************************/
    int edge; ///<
    /***********************************************************
    Size of blocks to compare
    ***********************************************************/
    int blocksize; ///<
    /***********************************************************
    Contrast threshold
    ***********************************************************/
    int contrast; ///<
    /***********************************************************
    Motion search method
    ***********************************************************/
    int search; ///<
    /***********************************************************
    Sum of the absolute difference function
    ***********************************************************/
    av_pixelutils_sad_fn sad; ///<
    /***********************************************************
    Transform from last frame
    ***********************************************************/
    Transform last; ///<
    /***********************************************************
    Number of reference frames (defines averaging window)
    ***********************************************************/
    int refcount; ///<
    FILE *fp;
    Transform avg;
    /***********************************************************
    Crop motion search to this box
    ***********************************************************/
    int cw; ///<
    int ch;
    int cx;
    int cy;
    /***********************************************************
    Motion search detailed log filename
    ***********************************************************/
    string filename; ///<
    int opencl;
    int (* transform)(AVFilterContext *ctx, int width, int height, int cw, int ch,
                      float *matrix_y, float *matrix_uv, InterpolateMethod interpolate,
                      FillMethod fill, AVFrame *in, AVFrame *out);
}
