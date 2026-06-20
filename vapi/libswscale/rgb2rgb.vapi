/***********************************************************
 software RGB to RGB converter
 pluralize by Software PAL8 to RGB converter
              Software YUV to YUV converter
              Software YUV to RGB converter
 Written by Nick Kurshev.
 YUV & runtime CPU stuff by Michael (michaelni@gmx.at)

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
A full collection of RGB to RGB (BGR) converters
***********************************************************/
//  extern void (*rgb24tobgr32)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void (*rgb24tobgr16)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void (*rgb24tobgr15)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void (*rgb32tobgr24)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void    (*rgb32to16)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void    (*rgb32to15)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void    (*rgb15to16)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void (*rgb15tobgr24)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void    (*rgb15to32)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void    (*rgb16to15)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void (*rgb16tobgr24)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void    (*rgb16to32)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void (*rgb24tobgr24)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void    (*rgb24to16)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void    (*rgb24to15)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void (*rgb32tobgr16)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void (*rgb32tobgr15)(
    uint8[] src,
    uint8[] dst,
    int src_size
);


//  extern void (*shuffle_bytes_0321)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void (*shuffle_bytes_2103)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void (*shuffle_bytes_1230)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void (*shuffle_bytes_3012)(
    uint8[] src,
    uint8[] dst,
    int src_size
);

//  extern void (*shuffle_bytes_3210)(
    uint8[] src,
    uint8[] dst,
    int src_size
);


[CCode (cname="",cheader_filename="")]
public void rgb64tobgr48_nobswap (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void   rgb64tobgr48_bswap (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void rgb48tobgr48_nobswap (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void   rgb48tobgr48_bswap (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void    rgb64to48_nobswap (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void      rgb64to48_bswap (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void rgb48tobgr64_nobswap (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void   rgb48tobgr64_bswap (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void    rgb48to64_nobswap (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void      rgb48to64_bswap (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void    rgb24to32 (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void    rgb32to24 (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void rgb16tobgr32 (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void    rgb16to24 (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void rgb16tobgr16 (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void rgb16tobgr15 (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void rgb15tobgr32 (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void    rgb15to24 (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void rgb15tobgr16 (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void rgb15tobgr15 (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void rgb12tobgr12 (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void    rgb12to15 (
    uint8[] src,
    uint8[] dst,
    int src_size
);

[CCode (cname="",cheader_filename="")]
public void ff_rgb24toyv12_c (
    uint8[] src,
    uint8[] ydst,
    uint8[] udst,
    uint8[] vdst,
    int width,
    int height,
    int lumStride,
    int chromStride,
    int srcStride,
    int32[] rgb2yuv
);

/***********************************************************
Height should be a multiple of 2 and width should be a multiple of 16.
(If this is a problem for anyone then tell me, and I will fix it.)
***********************************************************/
extern void (*yv12toyuy2)(
    uint8[] ysrc,
    uint8[] usrc,
    uint8[] vsrc,
    uint8[] dst,
    int width,
    int height,
    int lumStride,
    int chromStride,
    int dstStride
);

/***********************************************************
Width should be a multiple of 16.
***********************************************************/
extern void (*yuv422ptoyuy2)(
    uint8[] ysrc,
    uint8[] usrc,
    uint8[] vsrc,
    uint8[] dst,
    int width,
    int height,
    int lumStride,
    int chromStride,
    int dstStride
);

/***********************************************************
Height should be a multiple of 2 and width should be a multiple of 16.
(If this is a problem for anyone then tell me, and I will fix it.)
***********************************************************/
extern void (*yuy2toyv12)(
    uint8[] src,
    uint8[] ydst,
    uint8[] udst,
    uint8[] vdst,
    int width,
    int height,
    int lumStride,
    int chromStride,
    int srcStride
);

/***********************************************************
Height should be a multiple of 2 and width should be a multiple of 16.
(If this is a problem for anyone then tell me, and I will fix it.)
***********************************************************/
extern void (*yv12touyvy)(
    uint8[] ysrc,
    uint8[] usrc,
    uint8[] vsrc,
    uint8[] dst,
    int width,
    int height,
    int lumStride,
    int chromStride,
    int dstStride
);

/***********************************************************
Width should be a multiple of 16.
***********************************************************/
extern void (*yuv422ptouyvy)(
    uint8[] ysrc,
    uint8[] usrc,
    uint8[] vsrc,
    uint8[] dst,
    int width,
    int height,
    int lumStride,
    int chromStride,
    int dstStride
);

/***********************************************************
Height should be a multiple of 2 and width should be a multiple of 2.
(If this is a problem for anyone then tell me, and I will fix it.)
Chrominance data is only taken from every second line, others are ignored.
FIXME: Write high quality version.
***********************************************************/
extern void (*ff_rgb24toyv12)(
    uint8[] src,
    uint8[] ydst,
    uint8[] udst,
    uint8[] vdst,
    int width,
    int height,
    int lumStride,
    int chromStride,
    int srcStride,
    int32[] rgb2yuv
);

extern void (*planar2x)(
    uint8[] src,
    uint8[] dst,
    int width,
    int height,
    int srcStride,
    int dstStride
);

extern void (*interleaveBytes)(
    uint8[] src1,
    uint8[] src2,
    uint8[] dst,
    int width,
    int height,
    int src1Stride,
    int src2Stride,
    int dstStride
);

extern void (*deinterleaveBytes)(
    uint8[] src,
    uint8[] dst1,
    uint8[] dst2,
    int width,
    int height,
    int srcStride,
    int dst1Stride,
    int dst2Stride
);

extern void (*vu9_to_vu12)(
    uint8[] src1,
    uint8[] src2,
    uint8[] dst1,
    uint8[] dst2,
    int width,
    int height,
    int srcStride1,
    int srcStride2,
    int dstStride1,
    int dstStride2
);

extern void (*yvu9_to_yuy2)(
    uint8[] src1,
    uint8[] src2,
    uint8[] src3,
    uint8[] dst,
    int width,
    int height,
    int srcStride1,
    int srcStride2,
    int srcStride3,
    int dstStride
);

extern void (*uyvytoyuv420)(
    uint8[] ydst,
    uint8[] udst,
    uint8[] vdst,
    uint8[] src,
    int width,
    int height,
    int lumStride,
    int chromStride,
    int srcStride
);

extern void (*uyvytoyuv422)(
    uint8[] ydst,
    uint8[] udst,
    uint8[] vdst,
    uint8[] src,
    int width,
    int height,
    int lumStride,
    int chromStride,
    int srcStride
);

extern void (*yuyvtoyuv420)(
    uint8[] ydst,
    uint8[] udst,
    uint8[] vdst,
    uint8[] src,
    int width,
    int height,
    int lumStride,
    int chromStride,
    int srcStride
);

extern void (*yuyvtoyuv422)(
    uint8[] ydst,
    uint8[] udst,
    uint8[] vdst,
    uint8[] src,
    int width,
    int height,
    int lumStride,
    int chromStride,
    int srcStride
);

[CCode (cname="",cheader_filename="")]
public void ff_sws_rgb2rgb_init ();

[CCode (cname="",cheader_filename="")]
public void rgb2rgb_init_x86 ();
