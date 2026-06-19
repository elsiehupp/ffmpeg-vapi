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

public enum var_name {
    VAR_MAIN_W, VAR_MW,
    VAR_MAIN_H, VAR_MH,
    VAR_OVERLAY_W, VAR_OW,
    VAR_OVERLAY_H, VAR_OH,
    VAR_HSUB,
    VAR_VSUB,
    VAR_X,
    VAR_Y,
    VAR_N,
    VAR_POS,
    VAR_T,
    VAR_VARS_NB
}

public enum OverlayFormat {
    OVERLAY_FORMAT_YUV420,
    OVERLAY_FORMAT_YUV422,
    OVERLAY_FORMAT_YUV444,
    OVERLAY_FORMAT_RGB,
    OVERLAY_FORMAT_GBRP,
    OVERLAY_FORMAT_AUTO,
    OVERLAY_FORMAT_NB
}

[Compact]
public class OverlayContext {
    const AVClass *class;
    /***********************************************************
    position of overlaid picture
    ***********************************************************/
    /***********************************************************
    position of overlaid picture
    ***********************************************************/
    public int x, y;

    public uint8 main_is_packed_rgb;
    public uint8 main_rgba_map[4];
    public uint8 main_has_alpha;
    public uint8 overlay_is_packed_rgb;
    public uint8 overlay_rgba_map[4];
    public uint8 overlay_has_alpha;
    /***********************************************************
    OverlayFormat
    ***********************************************************/
    public int format;
    public int alpha_format;
    /***********************************************************
    EvalMode
    ***********************************************************/
    public int eval_mode;

    FFFrameSync fs;

    /***********************************************************
    steps per pixel for each plane of the main output
    ***********************************************************/
    public int main_pix_step[4];
    /***********************************************************
    steps per pixel for each plane of the overlay
    ***********************************************************/
    public int overlay_pix_step[4];
    /***********************************************************
    chroma subsampling values
    ***********************************************************/
    /***********************************************************
    chroma subsampling values
    ***********************************************************/
    public int hsub, vsub;
    /***********************************************************
    format descriptor for main input
    ***********************************************************/
    const AVPixFmtDescriptor *main_desc;

    double var_values[VAR_VARS_NB];
    string x_expr, *y_expr;

    AVExpr *x_pexpr, *y_pexpr;

    [CCode (cname="blend_row")]
    public int (*blend_row[4])(
        uint8[] d, uint8[] da, uint8[] s, uint8[] a, int w,
        ptrdiff_t alinesize
    );

    [CCode (cname="blend_slice")]
    public int (*blend_slice)(
        AVFilterContext *ctx, void *arg, int jobnr, int nb_jobs
    );

}

public void ff_overlay_init_x86 (OverlayContext *s, int format, int pix_format,
                         int alpha_format, int main_has_alpha);
