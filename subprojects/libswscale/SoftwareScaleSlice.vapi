/***********************************************************
Copyright (C) 2001-2011 Michael Niedermayer <michaelni@gmx.at>

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
namespace LibSoftwareScale {

/***********************************************************
Struct which defines a slice of an image to be scaled or an output for
a scaled slice.
A slice can also be used as intermediate ring buffer for scaling steps.
***********************************************************/
[CCode (cname="struct SwsSlice",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
[Compact]
internal class LibSoftwareScale.SoftwareScaleSlice {
    /***********************************************************
    @brief Slice line width
    ***********************************************************/
    [CCode (cname="width")]
    internal int width;

    /***********************************************************
    @brief horizontal chroma subsampling factor
    ***********************************************************/
    [CCode (cname="h_chr_sub_sample")]
    internal int h_chr_sub_sample;

    /***********************************************************
    @brief vertical chroma subsampling factor
    ***********************************************************/
    [CCode (cname="v_chr_sub_sample")]
    internal int v_chr_sub_sample;

    /***********************************************************
    @brief flag to identify if this slice is a ring buffer
    ***********************************************************/
    [CCode (cname="is_ring")]
    internal bool is_ring;

    /***********************************************************
    @brief flag to identify if there are dynamic allocated lines
    ***********************************************************/
    [CCode (cname="should_free_lines")]
    internal bool should_free_lines;

    /***********************************************************
    @brief planes pixel format
    ***********************************************************/
    [CCode (cname="fmt")]
    internal LibAVUtil.PixelFormat fmt;

    [CCode (cname="MAX_SLICE_PLANES",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const size_t MAX_SLICE_PLANES; // 4

    /***********************************************************
    @brief number of extra lines to process
    ***********************************************************/
    [CCode (cname="MAX_LINES_AHEAD",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal const size_t MAX_LINES_AHEAD; // 4

    /***********************************************************
    @brief color planes
    ***********************************************************/
    [CCode (cname="plane")]
    internal LibSoftwareScale.SoftwareScaleSlicePlane plane[MAX_SLICE_PLANES];

    /***********************************************************
    warp input lines in the form (src + width*i + j) to slice format (line[i][j])
    relative=true means first line src[x][0] otherwise first line is src[x][lum/crh Y]
    ***********************************************************/
    [CCode (cname="ff_init_slice_from_src",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal int ff_init_slice_from_src (
        LibSoftwareScale.SoftwareScaleSlice? sws_slice,
        uint8[] src[4],
        int stride[4],
        int srcW,
        int lumY,
        int lumH,
        int chrY,
        int chrH,
        int relative
    );

}

} // namespace LibSoftwareScale
