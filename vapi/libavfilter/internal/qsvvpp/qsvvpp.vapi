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
namespace LibAVFilter {

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/qsvvpp.h")]
public define FF_INLINK_IDX (
    void *link
);
//  {
//      ((int)((link)->dstpad - (link)->dst->input_pads));
//  }

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/qsvvpp.h")]
public define FF_OUTLINK_IDX (
    void *link
);
//  {
//      ((int)((link)->srcpad - (link)->src->output_pads));
//  }

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/qsvvpp.h")]
public static bool QSV_VERSION_ATLEAST (
    int MAJOR,
    int MINOR
);
//  {
//      return (
//          MFX_VERSION_MAJOR > (MAJOR) ||
//          MFX_VERSION_MAJOR == (MAJOR) &&
//          MFX_VERSION_MINOR >= (MINOR)
//      );
//  }

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/qsvvpp.h")]
public static bool QSV_RUNTIME_VERSION_ATLEAST (
    void *MFX_VERSION,
    void *MAJOR,
    void *MINOR
);
//  {
//      return (
//          (MFX_VERSION.Major > (MAJOR)) ||
//          (MFX_VERSION.Major == (MAJOR) &&
//          MFX_VERSION.Minor >= (MINOR))
//      );
//  }

[CCode (cname="struct QSVVPPContext",cheader_filename="subprojects/ffmpeg/libavfilter/qsvvpp.h")]
[Compact]
public class QSVVPPContext { }

[CCode (cname="struct QSVVPPCrop",cheader_filename="subprojects/ffmpeg/libavfilter/qsvvpp.h")]
[Compact]
public class QSVVPPCrop {
    /***********************************************************
    Input index
    ***********************************************************/
    [CCode (cname="")]
    public int in_idx;

    /***********************************************************
    Crop rectangle
    ***********************************************************/
    [CCode (cname="")]
    public int x;

    /***********************************************************
    Crop rectangle
    ***********************************************************/
    [CCode (cname="")]
    public int y;

    /***********************************************************
    Crop rectangle
    ***********************************************************/
    [CCode (cname="")]
    public int w;

    /***********************************************************
    Crop rectangle
    ***********************************************************/
    [CCode (cname="")]
    public int h;
}

[CCode (cname="struct QSVVPPParam",cheader_filename="subprojects/ffmpeg/libavfilter/qsvvpp.h")]
[Compact]
public class QSVVPPParam {
    public delegate int FilterFrameDelegate (
        LibAVFilter.FilterLink? outlink,
        AVFrame? frame
    );

    /***********************************************************
    default is ff_filter_frame
    ***********************************************************/
    [CCode (cname="filter_frame")]
    public FilterFrameDelegate filter_frame;

    /***********************************************************
    To fill with MFX enhanced filter configurations
    ***********************************************************/
    [CCode (cname="")]
    public int num_ext_buf;

    mfxExtBuffer **ext_buf;

    /***********************************************************
    Real output format
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.PixelFormat out_sw_format;

    /***********************************************************
    Crop information for each input, if needed
    ***********************************************************/
    [CCode (cname="")]
    public int num_crop;

    QSVVPPCrop? crop;
}

/***********************************************************
create and initialize the QSV session
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/qsvvpp.h")]
public int ff_qsvvpp_create (
    LibAVFilter.FilterContext? avctx, QSVVPPContext **vpp, QSVVPPParam? param
);

/***********************************************************
release the resources (eg.surfaces)
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/qsvvpp.h")]
public int ff_qsvvpp_free (
    QSVVPPContext **vpp
);

/***********************************************************
vpp filter frame and call the cb if needed
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/qsvvpp.h")]
public int ff_qsvvpp_filter_frame (
    QSVVPPContext? vpp, LibAVFilter.FilterLink? inlink, AVFrame? frame
);

} // namespace LibAVFilter
