/***********************************************************
Copyright (C) 2001-2003 Michael Niedermayer (michaelni@gmx.at)

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
@ingroup lpp
external API header
***********************************************************/
namespace LibPostProc {

/***********************************************************
@defgroup lpp libpostproc
Video postprocessing library.

@{
***********************************************************/

/***********************************************************
postprocess context.
***********************************************************/
[CCode (cname="struct pp_context",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess_internal.h")]
[Compact]
internal class LibPostProc.PostProcessContext {
    /***********************************************************
    info on struct for av_log
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVUtil.Class? av_class;

    /***********************************************************
    used for the horizontal code
    ***********************************************************/
    [CCode (cname="")]
    internal uint8[] tempBlocks;

    /***********************************************************
    luma histogram.
    we need 64bit here otherwise we'll going to have a problem
    after watching a black picture for 5 hours
    ***********************************************************/
    [CCode (cname="")]
    internal uint64[] yHistogram;

 // internal DECLARE_ALIGNED (8, uint64, packedYOffset);

 // internal DECLARE_ALIGNED (8, uint64, packedYScale);

    /***********************************************************
    Temporal noise reducing buffers
    ***********************************************************/
    [CCode (cname="")]
    internal uint8[] tempBlurred[3];

    [CCode (cname="")]
    internal int32[] tempBlurredPast[3];

    /***********************************************************
    Temporary buffers for handling the last row (s)
    ***********************************************************/
    [CCode (cname="")]
    internal uint8[] tempDst;

    [CCode (cname="")]
    internal uint8[] tempSrc;

    [CCode (cname="")]
    internal uint8[] deintTemp;

 // internal DECLARE_ALIGNED (8, uint64, pQPb);

 // internal DECLARE_ALIGNED (8, uint64, pQPb2);

 // internal DECLARE_ALIGNED (32, uint64, pQPb_block)[4];

 // internal DECLARE_ALIGNED (32, uint64, pQPb2_block)[4];

 // internal DECLARE_ALIGNED (32, uint64, mmxDcOffset)[64];

 // internal DECLARE_ALIGNED (32, uint64, mmxDcThreshold)[64];

    /***********************************************************
    used to fix MPEG2 style qscale
    ***********************************************************/
    [CCode (cname="")]
    internal int8? stdQPTable;

    [CCode (cname="")]
    internal int8? nonBQPTable;

    [CCode (cname="")]
    internal int8? forcedQPTable;

    [CCode (cname="")]
    internal int QP;

    [CCode (cname="")]
    internal int nonBQP;

 // internal DECLARE_ALIGNED (32, int, QP_block)[4];

 // internal DECLARE_ALIGNED (32, int, nonBQP_block)[4];

    [CCode (cname="")]
    internal int frameNum;

    [CCode (cname="")]
    internal int cpuCaps;

    /***********************************************************
    size of qp buffers (needed to realloc them if needed)
    ***********************************************************/
    [CCode (cname="")]
    internal int qpStride;

    /***********************************************************
    size of some buffers (needed to realloc them if needed)
    ***********************************************************/
    [CCode (cname="")]
    internal int stride;

    [CCode (cname="")]
    internal int hChromaSubSample;

    [CCode (cname="")]
    internal int vChromaSubSample;

    [CCode (cname="")]
    internal LibPostProc.PostProcessMode ppMode;

    /***********************************************************
    @file
    Libpostproc version macros
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/version.h")]
    internal const int LIBPOSTPROC_VERSION_MAJOR; // 55

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/version.h")]
    internal const int LIBPOSTPROC_VERSION_MINOR; // 5

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/version.h")]
    internal const int LIBPOSTPROC_VERSION_MICRO; // 100

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/version.h")]
    internal const int LIBPOSTPROC_VERSION_INT;
    //  AV_VERSION_INT (
    //      LIBPOSTPROC_VERSION_MAJOR,
    //      LIBPOSTPROC_VERSION_MINOR,
    //      LIBPOSTPROC_VERSION_MICRO
    //  );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/version.h")]
    internal const string LIBPOSTPROC_VERSION;
    //  AV_VERSION (
    //      LIBPOSTPROC_VERSION_MAJOR,
    //      LIBPOSTPROC_VERSION_MINOR,
    //      LIBPOSTPROC_VERSION_MICRO
    //  );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/version.h")]
    internal const int LIBPOSTPROC_BUILD; // LIBPOSTPROC_VERSION_INT

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/version.h")]
    internal const string LIBPOSTPROC_IDENT; // "postproc" AV_STRINGIFY (LIBPOSTPROC_VERSION)

    /***********************************************************
    Return the LIBPOSTPROC_VERSION_INT constant.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
    public uint postproc_version ();

    /***********************************************************
    Return the libpostproc build-time configuration.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
    public string postproc_configuration ();

    /***********************************************************
    Return the libpostproc license.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
    public string postproc_license ();

    #if LIBPOSTPROC_VERSION_INT < (52<<16)
    /***********************************************************
    a simple help text
    ***********************************************************/
    //  extern string const pp_help;
    #else
    /***********************************************************
    a simple help text
    ***********************************************************/
    //  extern const char pp_help[];
    #endif

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
    public void pp_postprocess (
        uint8[]  src[3],
        int srcStride[3],
        uint8[]  dst[3],
        int dstStride[3],
        int horizontalSize,
        int verticalSize,
        int8 *QP_store,
        int QP_stride,
        LibPostProc.PostProcessMode? mode,
        LibPostProc.PostProcessContext? ppContext,
        int pict_type
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
    public LibPostProc.PostProcessContext? pp_get_context (
        int width,
        int height,
        int flags
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
    public void pp_free_context (
        LibPostProc.PostProcessContext? ppContext
    );

}

/***********************************************************
@}
***********************************************************/

} // namespace LibPostProc
