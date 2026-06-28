/***********************************************************
Copyright (c) 2013 Paul B Mahol

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

[CCode (cname="struct FilterParams",cheader_filename="subprojects/ffmpeg/libavfilter/blend.h")]
[Compact]
public class FilterParams {

    [CCode (cname="enum BlendMode",cprefix="BLEND_",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
    public enum BlendMode {
        UNSET, // = -1,
        NORMAL,
        ADDITION,
        AND,
        AVERAGE,
        BURN,
        DARKEN,
        DIFFERENCE,

        [CCode (cname="BLEND_GRAINEXTRACT")]
        GRAIN_EXTRACT,
        DIVIDE,
        DODGE,
        EXCLUSION,

        [CCode (cname="BLEND_HARDLIGHT")]
        HARD_LIGHT,
        LIGHTEN,
        MULTIPLY,
        NEGATION,
        OR,
        OVERLAY,
        PHOENIX,

        [CCode (cname="BLEND_PINLIGHT")]
        PIN_LIGHT,
        REFLECT,
        SCREEN,

        [CCode (cname="BLEND_SOFTLIGHT")]
        SOF_TLIGHT,
        SUBTRACT,

        [CCode (cname="BLEND_VIVIDLIGHT")]
        VIVID_LIGHT,
        XOR,

        [CCode (cname="BLEND_HARDMIX")]
        HARD_MIX,

        [CCode (cname="BLEND_LINEARLIGHT")]
        LINEAR_LIGHT,
        GLOW,

        [CCode (cname="BLEND_GRAINMERGE")]
        GRAIN_MERGE,

        [CCode (cname="BLEND_MULTIPLY128")]
        MULTIPLY_128,
        HEAT,
        FREEZE,
        EXTREMITY,
        NB;
    }

    [CCode (cname="mode")]
    public BlendMode mode;

    [CCode (cname="opacity")]
    public double opacity;

    [CCode (cname="e")]
    public AVExpr? e;

    [CCode (cname="expr_str")]
    public string expr_str;

    public delegate void BlendDelegate (
        uint8[] top,
        ptrdiff_t top_linesize,
        uint8[] bottom,
        ptrdiff_t bottom_linesize,
        uint8[] dst,
        ptrdiff_t dst_linesize,
        ptrdiff_t width,
        ptrdiff_t height,
        FilterParams? param,
        double[] values,
        int starty
    );

    [CCode (cname="blend")]
    public BlendDelegate blend;

    [CCode (cname="ff_blend_init",cheader_filename="subprojects/ffmpeg/libavfilter/blend.h")]
    public void ff_blend_init (
        FilterParams? param,
        int depth
    );

    [CCode (cname="ff_blend_init_x86",cheader_filename="subprojects/ffmpeg/libavfilter/blend.h")]
    public void ff_blend_init_x86 (
        FilterParams? param,
        int depth
    );

}

} // namespace LibAVFilter
























/***********************************************************
Parameters describing a filter to be created in a filtergraph.

Created as a child of LibAVFilter.FilterGraphSegment by avfilter_graph_segment_parse().
Freed in avfilter_graph_segment_free().
***********************************************************/
typedef struct AVFilterParams {
    /***********************************************************
    The filter context.
     *
    Created by avfilter_graph_segment_create_filters() based on
    AVFilterParams.filter_name and instance_name.
     *
    Callers may also create the filter context manually, then they should
    av_free() filter_name and set it to NULL. Such AVFilterParams instances
    are then skipped by avfilter_graph_segment_create_filters().
    ***********************************************************/
    LibAVFilter.FilterContext     *filter;

    /***********************************************************
    Name of the LibAVFilter.Filter to be used.
     *
    An av_malloc()'ed string, set by avfilter_graph_segment_parse(). Will be
    passed to avfilter_get_by_name() by
    avfilter_graph_segment_create_filters().
     *
    Callers may av_free() this string and replace it with another one or
    NULL. If the caller creates the filter instance manually, this string
    MUST be set to NULL.
     *
    When both AVFilterParams.filter an AVFilterParams.filter_name are NULL,
    this AVFilterParams instance is skipped by avfilter_graph_segment_*()
    functions.
    ***********************************************************/
    char                *filter_name;
    /***********************************************************
    Name to be used for this filter instance.
     *
    An av_malloc()'ed string, may be set by avfilter_graph_segment_parse() or
    left NULL. The caller may av_free() this string and replace with another
    one or NULL.
     *
    Will be used by avfilter_graph_segment_create_filters() - passed as the
    third argument to avfilter_graph_alloc_filter(), then freed and set to
    NULL.
    ***********************************************************/
    char                *instance_name;

    /***********************************************************
    Options to be applied to the filter.
     *
    Filled by avfilter_graph_segment_parse(). Afterwards may be freely
    modified by the caller.
     *
    Will be applied to the filter by avfilter_graph_segment_apply_opts()
    with an equivalent of av_opt_set_dict2(filter, &opts, AV_OPT_SEARCH_CHILDREN),
    i.e. any unapplied options will be left in this dictionary.
    ***********************************************************/
    LibAVUtil.Dictionary        *opts;

    LibAVFilter.FilterPadParams  **inputs;
    unsigned          nb_inputs;

    LibAVFilter.FilterPadParams  **outputs;
    unsigned          nb_outputs;
} AVFilterParams;
