/***********************************************************
Copyright (c) 2010 Nolan Lum <nol888@gmail.com>
Copyright (c) 2009 Loren Merritt <lorenm@u.washington.edu>

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
Holds instance-specific information for gradfun.
***********************************************************/
[CCode (cname="struct GradFunContext",cheader_filename="subprojects/ffmpeg/libavfilter/gradfun.h")]
[Compact]
public class GradFunContext {
    [CCode (cname="class")]
    public AVClass av_class;

    [CCode (cname="")]
    public float strength;

    /***********************************************************
    threshold for gradient algorithm
    ***********************************************************/
    [CCode (cname="")]
    public int thresh;

    /***********************************************************
    blur radius
    ***********************************************************/
    [CCode (cname="")]
    public int radius;

    /***********************************************************
    width of the chroma planes
    ***********************************************************/
    [CCode (cname="")]
    public int chroma_w;

    /***********************************************************
    weight of the chroma planes
    ***********************************************************/
    [CCode (cname="")]
    public int chroma_h;

    /***********************************************************
    blur radius for the chroma planes
    ***********************************************************/
    [CCode (cname="")]
    public int chroma_r;

    /***********************************************************
    holds image data for blur algorithm passed into filter.
    ***********************************************************/
    [CCode (cname="")]
    public uint16[] buf;

    public delegate void FilterLineDelegate (
        uint8[] dst,
        uint8[] src,
        uint16[] dc,
        int width,
        int thresh,
        uint16[] dithers
    );

    /***********************************************************
    DSP function.
    ***********************************************************/
    [CCode (cname="filter_line")]
    public FilterLineDelegate filter_line;

    public delegate void BlurLineDelegate (
        uint16[] dc,
        uint16[] buf,
        uint16[] buf1,
        uint8[] src,
        int src_linesize,
        int width
    );

    /***********************************************************
    DSP function.
    ***********************************************************/
    [CCode (cname="blur_line")]
    public BlurLineDelegate blur_line;

}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/gradfun.h")]
public void ff_gradfun_init_x86 (
    GradFunContext? gf
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/gradfun.h")]
public void ff_gradfun_filter_line_c (
    uint8[] dst,
    uint8[] src,
    uint16[] dc,
    int width,
    int thresh,
    uint16[] dithers
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/gradfun.h")]
public void ff_gradfun_blur_line_c (
    uint16[] dc,
    uint16[] buf,
    uint16[] buf1,
    uint8[] src,
    int src_linesize,
    int width
);

} // namespace LibAVFilter
