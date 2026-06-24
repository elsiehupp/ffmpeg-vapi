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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
public const size_t PP_QUALITY_MAX; // 6

[CCode (cname="struct pp_context",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
public class pp_context { }

[CCode (cname="struct pp_mode",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
public class pp_mode { }

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
    pp_mode? mode,
    pp_context? ppContext,
    int pict_type
);


/***********************************************************
Return a pp_mode or NULL if an error occurred.

@param name    the string after "-pp" on the command line
@param quality a number from 0 to PP_QUALITY_MAX
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
public pp_mode? pp_get_mode_by_name_and_quality (
    string name,
    int quality
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
public void pp_free_mode (
    pp_mode? mode
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
public pp_context? pp_get_context (
    int width,
    int height,
    int flags
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
public void pp_free_context (
    pp_context? ppContext
);

[Flags]
[CCode (cprefix="PP_CPU_CAPS_",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
public enum PostProcessCpuCapabilityFlags {
    [CCode (cname="")]
    MMX, // 0x80000000

    [CCode (cname="")]
    MMX2, // 0x20000000

    [CCode (cname="")]
    @3DNOW, // 0x40000000

    [CCode (cname="")]
    ALTIVEC, // 0x10000000

    [CCode (cname="")]
    AUTO; // 0x00080000
}

[CCode (cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
public enum PostProcessFormat {
    [CCode (cname="PP_FORMAT")]
    FORMAT, // 0x00000008

    [CCode (cname="PP_FORMAT_420")]
    FORMAT_420, // (0x00000011|PostProcessFormat.FORMAT)

    [CCode (cname="PP_FORMAT_422")]
    FORMAT_422, // (0x00000001|PostProcessFormat.FORMAT)

    [CCode (cname="PP_FORMAT_411")]
    FORMAT_411, // (0x00000002|PostProcessFormat.FORMAT)

    [CCode (cname="PP_FORMAT_444")]
    FORMAT_444, // (0x00000000|PostProcessFormat.FORMAT)

    [CCode (cname="PP_FORMAT_440")]
    FORMAT_440; // (0x00000010|PostProcessFormat.FORMAT)
}

[CCode (cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
public enum PostProcessPictureType {
    /***********************************************************
    MPEG2 style QScale
    ***********************************************************/
    [CCode (cname="PP_PICT_TYPE_QP2")]
    QP2; // 0x00000010
}

/***********************************************************
@}
***********************************************************/

} // namespace LibPostProc
