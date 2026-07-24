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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/framerate.h")]
public const int BLEND_FACTOR_DEPTH8; // 7

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/framerate.h")]
public const int BLEND_FACTOR_DEPTH16; // 15

[CCode (cname="blend_func")]
public delegate void BlendDelegate (
    uint8[] src1,
    ptrdiff_t src1_linesize,
    uint8[] src2,
    ptrdiff_t src2_linesize,
    uint8[] dst,
    ptrdiff_t dst_linesize,
    ptrdiff_t width,
    ptrdiff_t height,
    int factor1,
    int factor2,
    int half
);

[CCode (cname="struct FrameRateContext",cheader_filename="subprojects/ffmpeg/libavfilter/framerate.h")]
[Compact]
public class FrameRateContext {
    [CCode (cname="class")]
    public LibAVUtil.Log.Class av_class;

    // parameters

    /***********************************************************
    output frames per second
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Rational dest_frame_rate;

    /***********************************************************
    flags affecting frame rate conversion algorithm
    ***********************************************************/
    [CCode (cname="")]
    public int flags;

    /***********************************************************
    score that denotes a scene change has happened
    ***********************************************************/
    [CCode (cname="")]
    public double scene_score;

    /***********************************************************
    start of range to apply linear interpolation
    ***********************************************************/
    [CCode (cname="")]
    public int interp_start;

    /***********************************************************
    end of range to apply linear interpolation
    ***********************************************************/
    [CCode (cname="")]
    public int interp_end;

    /***********************************************************
    bytes of pixel data per line for each plane
    ***********************************************************/
    [CCode (cname="")]
    public int line_size[4];

    [CCode (cname="")]
    public int vsub;

    /***********************************************************
    timebase of source
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Rational srce_time_base;

    /***********************************************************
    timebase of destination
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Rational dest_time_base;

    /***********************************************************
    Sum of the absolute difference function (scene detect only)
    ***********************************************************/
    [CCode (cname="")]
    public ff_scene_sad_fn sad;

    /***********************************************************
    previous MAFD (scene detect only)
    ***********************************************************/
    [CCode (cname="")]
    public double prev_mafd;

    [CCode (cname="")]
    public int blend_factor_max;

    [CCode (cname="")]
    public int bitdepth;

    [CCode (cname="")]
    public LibAVFormat.Frame work;

    /***********************************************************
    last frame
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.Frame f0;

    /***********************************************************
    current frame
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.Frame f1;

    /***********************************************************
    last frame pts in dest_time_base
    ***********************************************************/
    [CCode (cname="")]
    public int64 pts0;

    /***********************************************************
    current frame pts in dest_time_base
    ***********************************************************/
    [CCode (cname="")]
    public int64 pts1;

    /***********************************************************
    pts1 to pts0 delta
    ***********************************************************/
    [CCode (cname="")]
    public int64 delta;

    /***********************************************************
    scene change score (f0 to f1)
    ***********************************************************/
    [CCode (cname="")]
    public double score;

    /***********************************************************
    1 if the filter is being flushed
    ***********************************************************/
    [CCode (cname="")]
    public int flush;

    /***********************************************************
    pts of the first output frame
    ***********************************************************/
    [CCode (cname="")]
    public int64 start_pts;

    /***********************************************************
    output frame counter
    ***********************************************************/
    [CCode (cname="")]
    public int64 n;

    [CCode (cname="")]
    public BlendDelegate blend;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/framerate.h")]
public void ff_framerate_init (
    FrameRateContext? s
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/framerate.h")]
public void ff_framerate_init_x86 (
    FrameRateContext? s
);

} // namespace LibAVFilter
