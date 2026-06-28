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

[CCode (cname="enum var_name",cheader_filename="subprojects/ffmpeg/libavfilter/vf_overlay.h")]
public enum VarName {
    [CCode (cname="VAR_MAIN_W")]
    MAIN_W,

    [CCode (cname="VAR_MW")]
    MW,

    [CCode (cname="VAR_MAIN_H")]
    MAIN_H,

    [CCode (cname="VAR_MH")]
    MH,

    [CCode (cname="VAR_OVERLAY_W")]
    OVERLAY_W,

    [CCode (cname="VAR_OW")]
    OW,

    [CCode (cname="VAR_OVERLAY_H")]
    OVERLAY_H,

    [CCode (cname="VAR_OH")]
    OH,

    [CCode (cname="VAR_HSUB")]
    HSUB,

    [CCode (cname="VAR_VSUB")]
    VSUB,

    [CCode (cname="VAR_X")]
    X,

    [CCode (cname="VAR_Y")]
    Y,

    [CCode (cname="VAR_N")]
    N,

    [CCode (cname="VAR_POS")]
    POS,

    [CCode (cname="VAR_T")]
    T,

    [CCode (cname="VAR_NB")]
    NB;
}

[CCode (cname="enum OverlayFormat",cprefix="OVERLAY_FORMAT_",cheader_filename="subprojects/ffmpeg/libavfilter/vf_overlay.h")]
public enum OverlayFormat {
    YUV420,
    YUV422,
    YUV444,
    RGB,
    GBRP,
    AUTO,
    NB;
}

[CCode (cname="struct OverlayContext",cheader_filename="subprojects/ffmpeg/libavfilter/vf_overlay.h")]
[Compact]
public class OverlayContext {
    [CCode (cname="class")]
    public LibAVUtil.Class av_class;

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
    public double var_values[VarName.NB];

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
        LibAVFilter.FilterContext? av_filter_context,
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

} // namespace LibAVFilter
