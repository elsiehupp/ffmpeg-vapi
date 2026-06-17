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

/***********************************************************
***********************************************************/
// ARGB black, for VAProcPipelineParameterBuffer.output_background_color.
#define VAAPI_VPP_BACKGROUND_BLACK 0xff000000

[Compact]
public class VAAPIVPPContext {
    const AVClass *class;

    AVVAAPIDeviceContext *hwctx;
    public AVBufferRef device_ref;

    public int valid_ids;
    VAConfigID  va_config;
    VAContextID va_context;

    AVBufferRef       *input_frames_ref;
    AVHWFramesContext *input_frames;
    VARectangle        input_region;

    public AVPixelFormat output_format;
    /***********************************************************
    computed width
    ***********************************************************/
    public int output_width;
    /***********************************************************
    computed height
    ***********************************************************/
    public int output_height;

    VABufferID         filter_buffers[VAProcFilterCount];
    public int                nb_filter_buffers;

    public int (*build_filter_params)(AVFilterContext *avctx);

    void (*pipeline_uninit)(AVFilterContext *avctx);
}

public void ff_vaapi_vpp_ctx_init (AVFilterContext *avctx);

public void ff_vaapi_vpp_ctx_uninit (AVFilterContext *avctx);

public int ff_vaapi_vpp_query_formats (AVFilterContext *avctx);

public void ff_vaapi_vpp_pipeline_uninit (AVFilterContext *avctx);

public int ff_vaapi_vpp_config_input (AVFilterLink *inlink);

public int ff_vaapi_vpp_config_output (AVFilterLink *outlink);

public int ff_vaapi_vpp_init_params (AVFilterContext *avctx,
                             VAProcPipelineParameterBuffer *params,
                             AVFrame *input_frame,
                             AVFrame *output_frame);

public int ff_vaapi_vpp_make_param_buffers (AVFilterContext *avctx,
                                    int type,
                                    void *data,
                                    size_t size,
                                    int count);

public int ff_vaapi_vpp_render_picture (AVFilterContext *avctx,
                                VAProcPipelineParameterBuffer *params,
                                AVFrame *output_frame);
