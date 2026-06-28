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

/***********************************************************
ARGB black, for VAProcPipelineParameterBuffer.output_background_color.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vaapi_vpp.h")]
public const uint32 VAAPI_VPP_BACKGROUND_BLACK; // 0xff000000

[CCode (cname="struct VAAPIVPPContext",cheader_filename="subprojects/ffmpeg/libavfilter/vaapi_vpp.h")]
[Compact]
public class VAAPIVPPContext {
    [CCode (cname="class")]
    public LibAVUtil.Class av_class;

    [CCode (cname="")]
    public AVVAAPIDeviceContext? hwctx;

    [CCode (cname="")]
    public AVBufferRef device_ref;

    [CCode (cname="")]
    public int valid_ids;

    [CCode (cname="")]
    public VAConfigID va_config;

    [CCode (cname="")]
    public VAContextID va_context;

    [CCode (cname="")]
    public AVBufferRef? input_frames_ref;

    [CCode (cname="")]
    public AVHWFramesContext? input_frames;

    [CCode (cname="")]
    public VARectangle input_region;

    [CCode (cname="")]
    public LibAVUtil.PixelFormat output_format;

    /***********************************************************
    computed width
    ***********************************************************/
    [CCode (cname="")]
    public int output_width;

    /***********************************************************
    computed height
    ***********************************************************/
    [CCode (cname="")]
    public int output_height;

    [CCode (cname="")]
    public ABufferID filter_buffers[VAProcFilterCount];

    [CCode (cname="")]
    public int nb_filter_buffers;

    public delegate int BuildFilterParamsDelegate (
        LibAVFilter.FilterContext? avctx
    );

    [CCode (cname="build_filter_params")]
    public BuildFilterParamsDelegate build_filter_params;

    public delegate void PipelineUninitDelegate (
        LibAVFilter.FilterContext? avctx
    );

    [CCode (cname="pipeline_uninit")]
    public PipelineUninitDelegate pipeline_uninit;

}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vaapi_vpp.h")]
public void ff_vaapi_vpp_ctx_init (
    LibAVFilter.FilterContext? avctx
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vaapi_vpp.h")]
public void ff_vaapi_vpp_ctx_uninit (
    LibAVFilter.FilterContext? avctx
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vaapi_vpp.h")]
public int ff_vaapi_vpp_query_formats (
    LibAVFilter.FilterContext? avctx
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vaapi_vpp.h")]
public void ff_vaapi_vpp_pipeline_uninit (
    LibAVFilter.FilterContext? avctx
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vaapi_vpp.h")]
public int ff_vaapi_vpp_config_input (
    LibAVFilter.FilterLink? inlink
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vaapi_vpp.h")]
public int ff_vaapi_vpp_config_output (
    LibAVFilter.FilterLink? outlink
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vaapi_vpp.h")]
public int ff_vaapi_vpp_init_params (
    LibAVFilter.FilterContext? avctx,
    VAProcPipelineParameterBuffer? params,
    AVFrame input_frame,
    AVFrame output_frame
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vaapi_vpp.h")]
public int ff_vaapi_vpp_make_param_buffers (
    LibAVFilter.FilterContext? avctx,
    int type,
    void *data,
    size_t size,
    int count
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vaapi_vpp.h")]
public int ff_vaapi_vpp_render_picture (
    LibAVFilter.FilterContext? avctx,
    VAProcPipelineParameterBuffer? params,
    AVFrame output_frame
);

} // namespace LibAVFilter
