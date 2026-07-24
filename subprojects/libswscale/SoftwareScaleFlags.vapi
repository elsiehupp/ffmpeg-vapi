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

/***********************************************************
@file
@ingroup libsws
external API header
***********************************************************/
namespace LibSoftwareScale {

/***********************************************************
values for the flags, the stuff on the command line is different
***********************************************************/
[Flags]
[CCode (cname="enum SwsFlags",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public enum LibSoftwareScale.SoftwareScaleFlags {
    [CCode (cname="SWS_FAST_BILINEAR")]
    FAST_BILINEAR, // 1

    [CCode (cname="SWS_BILINEAR")]
    BILINEAR, // 2

    [CCode (cname="SWS_BICUBIC")]
    BICUBIC, // 4

    [CCode (cname="SWS_X")]
    X, // 8

    [CCode (cname="SWS_POINT")]
    POINT, // 0x10

    [CCode (cname="SWS_AREA")]
    AREA, // 0x20

    [CCode (cname="SWS_BICUBLIN")]
    BICUBIC_LINEAR, // 0x40

    [CCode (cname="SWS_GAUSS")]
    GAUSSIAN, // 0x80

    [CCode (cname="SWS_SINC")]
    SINC, // 0x100

    [CCode (cname="SWS_LANCZOS")]
    LANCZOS, // 0x200

    [CCode (cname="SWS_SPLINE")]
    SPLINE, // 0x400

    [CCode (cname="SWS_SRC_V_CHR_DROP_MASK")]
    SRC_V_CHR_DROP_MASK, // 0x30000

    [CCode (cname="SWS_SRC_V_CHR_DROP_SHIFT")]
    SRC_V_CHR_DROP_SHIFT, // 16

    [CCode (cname="SWS_PARAM_DEFAULT")]
    PARAM_DEFAULT, // 123456

    [CCode (cname="SWS_PRINT_INFO")]
    PRINT_INFO, // 0x1000

    /***********************************************************
    internal chrominance subsampling info

    this flag is not completely implemented
    ***********************************************************/
    [CCode (cname="SWS_FULL_CHR_H_INT")]
    FULL_CHR_H_INT, // 0x2000

    /***********************************************************
    input subsampling info

    this flag is not completely implemented
    ***********************************************************/
    [CCode (cname="SWS_FULL_CHR_H_INP")]
    FULL_CHR_H_INP, // 0x4000

    /***********************************************************
    this flag is not completely implemented
    ***********************************************************/
    [CCode (cname="SWS_DIRECT_BGR")]
    DIRECT_BGR, // 0x8000

    [CCode (cname="SWS_ACCURATE_RND")]
    ACCURATE_RND, // 0x40000

    [CCode (cname="SWS_BITEXACT")]
    BIT_EXACT, // 0x80000

    [CCode (cname="SWS_ERROR_DIFFUSION")]
    ERROR_DIFFUSION; // 0x800000
}

} // namespace LibSoftwareScale
