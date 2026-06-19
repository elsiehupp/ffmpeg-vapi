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
@file
Intel Quick Sync Video VPP base function
***********************************************************/

#define FF_INLINK_IDX (link)  ((int)((link)->dstpad - (link)->dst->input_pads))
#define FF_OUTLINK_IDX (link) ((int)((link)->srcpad - (link)->src->output_pads))

#define QSV_VERSION_ATLEAST (MAJOR, MINOR)   \
    (MFX_VERSION_MAJOR > (MAJOR) ||         \
     MFX_VERSION_MAJOR == (MAJOR) && MFX_VERSION_MINOR >= (MINOR))

#define QSV_RUNTIME_VERSION_ATLEAST (MFX_VERSION, MAJOR, MINOR) \
    ((MFX_VERSION.Major > (MAJOR)) ||                           \
    (MFX_VERSION.Major == (MAJOR) && MFX_VERSION.Minor >= (MINOR)))

[Compact]
public class QSVVPPContext QSVVPPContext;

[Compact]
public class QSVVPPCrop {
    /***********************************************************
    Input index
    ***********************************************************/
    public int in_idx;
    /***********************************************************
    Crop rectangle
    ***********************************************************/
    /***********************************************************
    Crop rectangle
    ***********************************************************/
    /***********************************************************
    Crop rectangle
    ***********************************************************/
    /***********************************************************
    Crop rectangle
    ***********************************************************/
    public int x, y, w, h;
}

[Compact]
public class QSVVPPParam {
    /***********************************************************
    default is ff_filter_frame
    ***********************************************************/
    [CCode (cname="filter_frame")]
    public int (*filter_frame)(
        AVFilterLink *outlink, AVFrame *frame
    );

    /***********************************************************
    To fill with MFX enhanced filter configurations
    ***********************************************************/
    public int num_ext_buf;
    mfxExtBuffer **ext_buf;

    /***********************************************************
    Real output format
    ***********************************************************/
    public AVPixelFormat out_sw_format;

    /***********************************************************
    Crop information for each input, if needed
    ***********************************************************/
    public int num_crop;
    QSVVPPCrop *crop;
}

/***********************************************************
create and initialize the QSV session
***********************************************************/
public int ff_qsvvpp_create (AVFilterContext *avctx, QSVVPPContext **vpp, QSVVPPParam *param);

/***********************************************************
release the resources (eg.surfaces)
***********************************************************/
public int ff_qsvvpp_free (QSVVPPContext **vpp);

/***********************************************************
vpp filter frame and call the cb if needed
***********************************************************/
public int ff_qsvvpp_filter_frame (QSVVPPContext *vpp, AVFilterLink *inlink, AVFrame *frame);
