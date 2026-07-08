/***********************************************************
Copyright (C) 2001-2002 Michael Niedermayer (michaelni@gmx.at)

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or modify
it under the terms of the GNU General internal License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General internal License for more details.

You should have received a copy of the GNU General internal License
along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

/***********************************************************
@file
internal internal API header.
***********************************************************/
namespace LibPostProc {

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess_internal.h")]
internal enum PostProcFooBar1 {
    [CCode (cname="")]
    V_DEBLOCK, // 0x01

    [CCode (cname="")]
    H_DEBLOCK, // 0x02

    [CCode (cname="")]
    DERING, // 0x04

    /***********************************************************
    Brightness & Contrast
    ***********************************************************/
    [CCode (cname="")]
    LEVEL_FIX; // 0x08
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess_internal.h")]
internal enum FilterMask {
    [CCode (cname="")]
    LUM_V_DEBLOCK, // V_DEBLOCK // 1

    [CCode (cname="")]
    LUM_H_DEBLOCK, // H_DEBLOCK // 2

    [CCode (cname="")]
    CHROM_V_DEBLOCK, // (V_DEBLOCK<<4) // 16

    [CCode (cname="")]
    CHROM_H_DEBLOCK, // (H_DEBLOCK<<4) // 32

    [CCode (cname="")]
    LUM_DERING, // DERING // 4

    [CCode (cname="")]
    CHROM_DERING, // (DERING<<4) // 64

    [CCode (cname="")]
    LUM_LEVEL_FIX, // LEVEL_FIX // 8

    /***********************************************************
    (not implemented yet)
    ***********************************************************/
    [CCode (cname="")]
    CHROM_LEVEL_FIX, // (LEVEL_FIX<<4) // 128

    /***********************************************************
    Experimental vertical filter
    ***********************************************************/
    [CCode (cname="")]
    V_X1_FILTER, // 0x0200 // 512

    /***********************************************************
    Experimental vertical filter
    ***********************************************************/
    [CCode (cname="")]
    V_A_DEBLOCK, // 0x0400

    /***********************************************************
    Experimental horizontal filter
    ***********************************************************/
    [CCode (cname="")]
    H_X1_FILTER, // 0x2000 // 8192

    /***********************************************************
    Experimental horizontal filter
    ***********************************************************/
    [CCode (cname="")]
    H_A_DEBLOCK, // 0x4000

    /***********************************************************
    select between full y range (255-0) or standard one (234-16)
    ***********************************************************/
    [CCode (cname="")]
    FULL_Y_RANGE, // 0x8000 // 32768

    /***********************************************************
    Deinterlacing Filter
    ***********************************************************/
    [CCode (cname="")]
    LINEAR_IPOL_DEINT_FILTER, // 0x10000 // 65536

    /***********************************************************
    Deinterlacing Filter
    ***********************************************************/
    [CCode (cname="")]
    LINEAR_BLEND_DEINT_FILTER, // 0x20000 // 131072

    /***********************************************************
    Deinterlacing Filter

    (not implemented yet)
    ***********************************************************/
    [CCode (cname="")]
    CUBIC_BLEND_DEINT_FILTER, // 0x8000  //

    /***********************************************************
    Deinterlacing Filter
    ***********************************************************/
    [CCode (cname="")]
    CUBIC_IPOL_DEINT_FILTER, // 0x40000 // 262144

    /***********************************************************
    Deinterlacing Filter
    ***********************************************************/
    [CCode (cname="")]
    MEDIAN_DEINT_FILTER, // 0x80000 // 524288

    /***********************************************************
    Deinterlacing Filter
    ***********************************************************/
    [CCode (cname="")]
    FFMPEG_DEINT_FILTER, // 0x400000

    /***********************************************************
    Deinterlacing Filter
    ***********************************************************/
    [CCode (cname="")]
    LOWPASS5_DEINT_FILTER; // 0x800000
}

[Flags]
internal enum PostProcFooBar2 {
    [CCode (cname="")]
    TEMP_NOISE_FILTER, // 0x100000

    [CCode (cname="")]
    FORCE_QUANT, // 0x200000

    [CCode (cname="")]
    BIT_EXACT, // 0x1000000

    [CCode (cname="")]
    VISUALIZE; // 0x2000000
}


} // namespace LibPostProc
