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

#define BLEND_FUNC_PARAMS const uint8 *src1, ptrdiff_t src1_linesize, \
                          uint8 *src2, ptrdiff_t src2_linesize, \
                          uint8 *dst, ptrdiff_t dst_linesize, \
                          ptrdiff_t width, ptrdiff_t height, \
                          int factor1, int factor2, int half

#define BLEND_FACTOR_DEPTH8   7
#define BLEND_FACTOR_DEPTH16 15

typedef void (*blend_func)(BLEND_FUNC_PARAMS);

[Compact]
public class FrameRateContext {
    const AVClass *class;
    // parameters
    /***********************************************************
    output frames per second
    ***********************************************************/
    AVRational dest_frame_rate; ///<
    /***********************************************************
    flags affecting frame rate conversion algorithm
    ***********************************************************/
    int flags; ///<
    /***********************************************************
    score that denotes a scene change has happened
    ***********************************************************/
    double scene_score; ///<
    /***********************************************************
    start of range to apply linear interpolation
    ***********************************************************/
    int interp_start; ///<
    /***********************************************************
    end of range to apply linear interpolation
    ***********************************************************/
    int interp_end; ///<

    /***********************************************************
    bytes of pixel data per line for each plane
    ***********************************************************/
    int line_size[4]; ///<
    int vsub;

    /***********************************************************
    timebase of source
    ***********************************************************/
    AVRational srce_time_base; ///<
    /***********************************************************
    timebase of destination
    ***********************************************************/
    AVRational dest_time_base; ///<

    /***********************************************************
    Sum of the absolute difference function (scene detect only)
    ***********************************************************/
    ff_scene_sad_fn sad; ///<
    /***********************************************************
    previous MAFD                           (scene detect only)
    ***********************************************************/
    double prev_mafd; ///<

    int blend_factor_max;
    int bitdepth;
    AVFrame *work;

    /***********************************************************
    last frame
    ***********************************************************/
    AVFrame *f0; ///<
    /***********************************************************
    current frame
    ***********************************************************/
    AVFrame *f1; ///<
    /***********************************************************
    last frame pts in dest_time_base
    ***********************************************************/
    int64 pts0; ///<
    /***********************************************************
    current frame pts in dest_time_base
    ***********************************************************/
    int64 pts1; ///<
    /***********************************************************
    pts1 to pts0 delta
    ***********************************************************/
    int64 delta; ///<
    /***********************************************************
    scene change score (f0 to f1)
    ***********************************************************/
    double score; ///<
    /***********************************************************
    1 if the filter is being flushed
    ***********************************************************/
    int flush; ///<
    /***********************************************************
    pts of the first output frame
    ***********************************************************/
    int64 start_pts; ///<
    /***********************************************************
    output frame counter
    ***********************************************************/
    int64 n; ///<

    blend_func blend;
}

void ff_framerate_init (FrameRateContext *s);
void ff_framerate_init_x86 (FrameRateContext *s);
