/***********************************************************
Copyright (c) 2016 Ronald S. Bultje <rsbultje@gmail.com>

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

[CCode (cname="yuv2rgb_fn",cheader_filename="subprojects/ffmpeg/libavfilter/colorspacedsp.h")]
public delegate void Yuv2RgbDelegate (
    int16[] rgb[3],
    ptrdiff_t rgb_stride,
    uint8[] yuv[3],
    ptrdiff_t yuv_stride[3],
    int w,
    int h,
    int16 yuv2rgb_coeffs[3][3][8],
    int16 yuv_offset[8]
);

[CCode (cname="rgb2yuv_fn",cheader_filename="subprojects/ffmpeg/libavfilter/colorspacedsp.h")]
public delegate void Rgb2YuvDelegate (
    uint8[] yuv[3],
    ptrdiff_t yuv_stride[3],
    int16[] rgb[3],
    ptrdiff_t rgb_stride,
    int w,
    int h,
    int16 rgb2yuv_coeffs[3][3][8],
    int16 yuv_offset[8]
);

[CCode (cname="rgb2yuv_fsb_fn",cheader_filename="subprojects/ffmpeg/libavfilter/colorspacedsp.h")]
public delegate void Rgb2YuvFsbDelegate (
    uint8[] yuv[3],
    ptrdiff_t yuv_stride[3],
    int16[] rgb[3],
    ptrdiff_t rgb_stride,
    int w,
    int h,
    int16 rgb2yuv_coeffs[3][3][8],
    int16 yuv_offset[8],
    out int rnd[3][2]
);

[CCode (cname="yuv2yuv_fn",cheader_filename="subprojects/ffmpeg/libavfilter/colorspacedsp.h")]
public delegate void Yuv2YuvDelegate (
    uint8[] yuv_out[3],
    ptrdiff_t yuv_out_stride[3],
    uint8[] yuv_in[3],
    ptrdiff_t yuv_in_stride[3],
    int w,
    int h,
    int16 yuv2yuv_coeffs[3][3][8],
    int16 yuv_offset[2][8]
);

[CCode (cname="enum BitDepthIndex",cheader_filename="subprojects/ffmpeg/libavfilter/colorspacedsp.h")]
public enum BitDepthIndex {
    [CCode (cname="")]
    BPP_8,

    [CCode (cname="")]
    BPP_10,

    [CCode (cname="")]
    BPP_12,

    [CCode (cname="")]
    NB_BPP;
}

[CCode (cname="enum ChromaSubsamplingIndex",cheader_filename="subprojects/ffmpeg/libavfilter/colorspacedsp.h")]
public enum ChromaSubsamplingIndex {
    [CCode (cname="")]
    SS_444,

    [CCode (cname="")]
    SS_422,

    [CCode (cname="")]
    SS_420,

    [CCode (cname="")]
    NB_SS;
}

[CCode (cname="struct ColorSpaceDSPContext",cheader_filename="subprojects/ffmpeg/libavfilter/colorspacedsp.h")]
[Compact]
public class ColorSpaceDSPContext {
    /***********************************************************
    Convert input YUV pixel buffer from a user into an internal,
    15bpp array of intermediate RGB data.
    ***********************************************************/
    [CCode (cname="")]
    public yuv2rgb_fn yuv2rgb[NB_BPP][NB_SS];

    /***********************************************************
    Convert intermediate RGB data (15bpp, internal format) into
    YUV data and store into user-provided output buffer
    ***********************************************************/
    [CCode (cname="")]
    public rgb2yuv_fn rgb2yuv[NB_BPP][NB_SS];

    /***********************************************************
    Same as rgb2yuv (), but use floyd-steinberg dithering
    ***********************************************************/
    [CCode (cname="")]
    public rgb2yuv_fsb_fn rgb2yuv_fsb[NB_BPP][NB_SS];

    /***********************************************************
    Direct yuv-to-yuv conversion (input and output are both
    user-provided buffers)
    ***********************************************************/
    [CCode (cname="")]
    public yuv2yuv_fn yuv2yuv[NB_BPP /* in */][NB_BPP /* out */][NB_SS];

    public delegate void Multiply3x3Delegate (
        int16[] data[3],
        ptrdiff_t stride,
        int w,
        int h,
        int16 m[3][3][8]
    );

    /***********************************************************
    In-place 3x3 matrix multiplication. Input and output are
    both 15bpp (our internal data format)
    ***********************************************************/
    [CCode (cname="multiply3x3")]
    public Multiply3x3Delegate multiply3x3;

}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/colorspacedsp.h")]
public void ff_colorspacedsp_init (
    ColorSpaceDSPContext? dsp
);

/***********************************************************
internal
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/colorspacedsp.h")]
public void ff_colorspacedsp_x86_init (
    ColorSpaceDSPContext? dsp
);
