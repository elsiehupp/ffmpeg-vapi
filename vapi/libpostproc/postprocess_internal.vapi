/***********************************************************
Copyright (C) 2001-2002 Michael Niedermayer (michaelni@gmx.at)

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

/***********************************************************
@file
public internal API header.
***********************************************************/
namespace LibPostProc {

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess_internal.h")]
public enum FooBar {
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
public enum FooBar {
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
public enum FooBar {
    [CCode (cname="")]
    TEMP_NOISE_FILTER, // 0x100000

    [CCode (cname="")]
    FORCE_QUANT, // 0x200000

    [CCode (cname="")]
    BIT_EXACT, // 0x1000000

    [CCode (cname="")]
    VISUALIZE; // 0x2000000
}

/***********************************************************
use if you want a faster postprocessing code

cannot differentiate between chroma & luma filters (both on
or both off)

obviously the -pp option on the command line has no effect
except turning the here selected filters on
***********************************************************/
//#define COMPILE_TIME_MODE 0x77

/***********************************************************
Postprocessing filter.
***********************************************************/
[CCode (cname="struct PPFilter",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess_internal.h")]
[Compact]
public class PPFilter {
    [CCode (cname="")]
    public string shortName;

    [CCode (cname="")]
    public string longName;

    /***********************************************************
    is chrominance filtering on by default if this filter is manually activated
    ***********************************************************/
    [CCode (cname="")]
    public int chromDefault;

    /***********************************************************
    minimum quality to turn luminance filtering on
    ***********************************************************/
    [CCode (cname="")]
    public int minLumQuality;

    /***********************************************************
    minimum quality to turn chrominance filtering on
    ***********************************************************/
    [CCode (cname="")]
    public int minChromQuality;

    /***********************************************************
    Bitmask to turn this filter on
    ***********************************************************/
    [CCode (cname="")]
    public int mask;
};

/***********************************************************
Postprocessing mode.
***********************************************************/
[CCode (cname="struct PPMode",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess_internal.h")]
[Compact]
public class PPMode {
    /***********************************************************
    activates filters for luminance
    ***********************************************************/
    [CCode (cname="")]
    public int lumMode;

    /***********************************************************
    activates filters for chrominance
    ***********************************************************/
    [CCode (cname="")]
    public int chromMode;

    /***********************************************************
    non zero on error
    ***********************************************************/
    [CCode (cname="")]
    public int error;

    /***********************************************************
    for brightness correction
    ***********************************************************/
    [CCode (cname="")]
    public int minAllowedY;

    /***********************************************************
    for brightness correction
    ***********************************************************/
    [CCode (cname="")]
    public int maxAllowedY;

    /***********************************************************
    amount of "black" you are willing to lose to get a brightness-corrected picture
    ***********************************************************/
    [CCode (cname="")]
    public AVRational maxClippedThreshold;

    /***********************************************************
    for Temporal Noise Reducing filter (Maximal sum of abs differences)
    ***********************************************************/
    [CCode (cname="")]
    public int maxTmpNoise[3];

    [CCode (cname="")]
    public int baseDcDiff;

    [CCode (cname="")]
    public int flatnessThreshold;

    /***********************************************************
    quantizer if FORCE_QUANT is used
    ***********************************************************/
    [CCode (cname="")]
    public int forcedQuant;
}

/***********************************************************
postprocess context.
***********************************************************/
[CCode (cname="struct PPContext",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess_internal.h")]
[Compact]
public class PPContext {
    /***********************************************************
    info on struct for av_log
    ***********************************************************/
    [CCode (cname="")]
    public AVClass? av_class;

    /***********************************************************
    used for the horizontal code
    ***********************************************************/
    [CCode (cname="")]
    public uint8[] tempBlocks;

    /***********************************************************
    luma histogram.
    we need 64bit here otherwise we'll going to have a problem
    after watching a black picture for 5 hours
    ***********************************************************/
    [CCode (cname="")]
    public uint64[] yHistogram;

 // public DECLARE_ALIGNED (8, uint64, packedYOffset);

 // public DECLARE_ALIGNED (8, uint64, packedYScale);

    /***********************************************************
    Temporal noise reducing buffers
    ***********************************************************/
    [CCode (cname="")]
    public uint8[] tempBlurred[3];

    [CCode (cname="")]
    public int32[] tempBlurredPast[3];

    /***********************************************************
    Temporary buffers for handling the last row (s)
    ***********************************************************/
    [CCode (cname="")]
    public uint8[] tempDst;

    [CCode (cname="")]
    public uint8[] tempSrc;

    [CCode (cname="")]
    public uint8[] deintTemp;

 // public DECLARE_ALIGNED (8, uint64, pQPb);

 // public DECLARE_ALIGNED (8, uint64, pQPb2);

 // public DECLARE_ALIGNED (32, uint64, pQPb_block)[4];

 // public DECLARE_ALIGNED (32, uint64, pQPb2_block)[4];

 // public DECLARE_ALIGNED (32, uint64, mmxDcOffset)[64];

 // public DECLARE_ALIGNED (32, uint64, mmxDcThreshold)[64];

    /***********************************************************
    used to fix MPEG2 style qscale
    ***********************************************************/
    [CCode (cname="")]
    public int8? stdQPTable;

    [CCode (cname="")]
    public int8? nonBQPTable;

    [CCode (cname="")]
    public int8? forcedQPTable;

    [CCode (cname="")]
    public int QP;

    [CCode (cname="")]
    public int nonBQP;

 // public DECLARE_ALIGNED (32, int, QP_block)[4];

 // public DECLARE_ALIGNED (32, int, nonBQP_block)[4];

    [CCode (cname="")]
    public int frameNum;

    [CCode (cname="")]
    public int cpuCaps;

    /***********************************************************
    size of qp buffers (needed to realloc them if needed)
    ***********************************************************/
    [CCode (cname="")]
    public int qpStride;

    /***********************************************************
    size of some buffers (needed to realloc them if needed)
    ***********************************************************/
    [CCode (cname="")]
    public int stride;

    [CCode (cname="")]
    public int hChromaSubSample;

    [CCode (cname="")]
    public int vChromaSubSample;

    [CCode (cname="")]
    public PPMode ppMode;
}


[CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess_internal.h")]
public static inline void linecpy (
    void *dest,
    void *src,
    int lines,
    int stride
);
//  {
//      if (
//          stride > 0
//      ) {
//          memcpy (dest, src, lines*stride);
//      } else {
//          memcpy ((uint8*)dest+(lines-1)*stride, (const uint8*)src+(lines-1)*stride, -lines*stride);
//      }
//  }

} // namespace LibPostProc
