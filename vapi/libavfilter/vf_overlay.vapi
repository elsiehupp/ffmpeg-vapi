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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_overlay.h")]
public enum var_name {
    [CCode (cname="")]
    VAR_MAIN_W,

    [CCode (cname="")]
    VAR_MW,

    [CCode (cname="")]
    VAR_MAIN_H,

    [CCode (cname="")]
    VAR_MH,

    [CCode (cname="")]
    VAR_OVERLAY_W,

    [CCode (cname="")]
    VAR_OW,

    [CCode (cname="")]
    VAR_OVERLAY_H,

    [CCode (cname="")]
    VAR_OH,

    [CCode (cname="")]
    VAR_HSUB,

    [CCode (cname="")]
    VAR_VSUB,

    [CCode (cname="")]
    VAR_X,

    [CCode (cname="")]
    VAR_Y,

    [CCode (cname="")]
    VAR_N,

    [CCode (cname="")]
    VAR_POS,

    [CCode (cname="")]
    VAR_T,

    [CCode (cname="")]
    VAR_VARS_NB;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_overlay.h")]
public enum OverlayFormat {
    [CCode (cname="")]
    OVERLAY_FORMAT_YUV420,

    [CCode (cname="")]
    OVERLAY_FORMAT_YUV422,

    [CCode (cname="")]
    OVERLAY_FORMAT_YUV444,

    [CCode (cname="")]
    OVERLAY_FORMAT_RGB,

    [CCode (cname="")]
    OVERLAY_FORMAT_GBRP,

    [CCode (cname="")]
    OVERLAY_FORMAT_AUTO,

    [CCode (cname="")]
    OVERLAY_FORMAT_NB;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_overlay.h")]
[Compact]
public class OverlayContext {
    [CCode (cname="")]
    public AVClass class;

    /***********************************************************
    position of overlaid picture
    ***********************************************************/
    [CCode (cname="")]
    public int x;

    /***********************************************************
    position of overlaid picture
    ***********************************************************/
    [CCode (cname="")]
    public int y;

    [CCode (cname="")]
    public uint8 main_is_packed_rgb;

    [CCode (cname="")]
    public uint8 main_rgba_map[4];

    [CCode (cname="")]
    public uint8 main_has_alpha;

    [CCode (cname="")]
    public uint8 overlay_is_packed_rgb;

    [CCode (cname="")]
    public uint8 overlay_rgba_map[4];

    [CCode (cname="")]
    public uint8 overlay_has_alpha;

    /***********************************************************
    OverlayFormat
    ***********************************************************/
    [CCode (cname="")]
    public int format;

    [CCode (cname="")]
    public int alpha_format;

    /***********************************************************
    EvalMode
    ***********************************************************/
    [CCode (cname="")]
    public int eval_mode;

    [CCode (cname="")]
    public FFFrameSync fs;

    /***********************************************************
    steps per pixel for each plane of the main output
    ***********************************************************/
    [CCode (cname="")]
    public int main_pix_step[4];

    /***********************************************************
    steps per pixel for each plane of the overlay
    ***********************************************************/
    [CCode (cname="")]
    public int overlay_pix_step[4];

    /***********************************************************
    chroma subsampling values
    ***********************************************************/
    [CCode (cname="")]
    public int hsub;

    /***********************************************************
    chroma subsampling values
    ***********************************************************/
    [CCode (cname="")]
    public int vsub;

    /***********************************************************
    format descriptor for main input
    ***********************************************************/
    [CCode (cname="")]
    public AVPixFmtDescriptor main_desc;

    [CCode (cname="")]
    public double var_values[VAR_VARS_NB];

    [CCode (cname="")]
    public string x_expr;

    [CCode (cname="")]
    public string y_expr;

    [CCode (cname="")]
    public AVExpr? x_pexpr;

    [CCode (cname="")]
    public AVExpr? y_pexpr;

    public delegate int BlendRowDelegate (
        uint8[] d,
        uint8[] da,
        uint8[] s,
        uint8[] a,
        int w,
        ptrdiff_t alinesize
    );

    [CCode (cname="blend_row")]
    public iBlendRowDelegate blend_row[4];

    public delegate int BlendSliceDelegate (
        AVFilterContext? av_filter_context,
        void *arg,
        int jobnr,
        int nb_jobs
    );

    [CCode (cname="blend_slice")]
    public BlendSliceDelegate blend_slice;

}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_overlay.h")]
public void ff_overlay_init_x86 (
    OverlayContext? s,
    int format,
    int pix_format,
    int alpha_format,
    int main_has_alpha
);
