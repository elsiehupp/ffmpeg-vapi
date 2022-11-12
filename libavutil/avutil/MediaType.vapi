/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVUtil {

/***********************************************************
@file @ingroup lavu
Convenience header that includes @link lavu "libavutil"'s core.
***********************************************************/

/***********************************************************
@mainpage

@section ffmpeg_intro Introduction

This document describes the usage of the different libraries
provided by FFmpeg.

@li @link libavc "LibAVCodec" encoding/decoding library
@li @link lavfi "libavfilter" graph-based frame editing library
@li @link libavf "libavformat" I/O and muxing/demuxing library
@li @link lavd "libavdevice" special devices muxing/demuxing library
@li @link lavu "libavutil" common utility library
@li @link lswr "libswresample" audio resampling, format conversion and mixing
@li @link lpp  "libpostproc" post processing library
@li @link libsws "libswscale" color conversion and scaling library

@section ffmpeg_versioning Versioning and compatibility

Each of the FFmpeg libraries contains a version.h header, which defines a
major, minor and micro version number with the
<em>LIBRARYNAME_VERSION_{MAJOR,MINOR,MICRO}</em> macros. The major version
number is incremented with backward incompatible changes - e.g. removing
parts of the public API, reordering public struct members, etc. The minor
version number is incremented for backward compatible API changes or major
new features - e.g. adding a new public function or a new decoder. The micro
version number is incremented for smaller changes that a calling program
might still want to check for - e.g. changing behavior in a previously
unspecified situation.

FFmpeg guarantees backward API and ABI compatibility for each library as long
as its major version number is unchanged. This means that no public symbols
will be removed or renamed. Types and names of the public struct members and
values of public macros and enums will remain the same (unless they were
explicitly declared as not part of the public API). Documented behavior will
not change.

In other words, any correct program that works with a given FFmpeg snapshot
should work just as well without any changes with any later snapshot with the
same major versions. This applies to both rebuilding the program against new
FFmpeg versions or to replacing the dynamic FFmpeg libraries that a program
links against.

However, new public symbols may be added and new members may be appended to
public structs whose size is not part of public ABI (most public structs in
FFmpeg). New macros and enum values may be added. Behavior in undocumented
situations may change slightly (and be documented). All those are accompanied
by an entry in doc/APIchanges and incrementing either the minor or micro
version number.
***********************************************************/

/***********************************************************
@defgroup lavu libavutil
Common code shared across all FFmpeg libraries.

@note
libavutil is designed to be modular. In most cases, in order to use the
functions provided by one component of libavutil you must explicitly include
the specific header containing that feature. If you are only using
media-related components, you could simply include libavutil/avutil.h, which
brings in most of the "core" components.


@defgroup LibAVUtil.Crypto Crypto and Hashing


@defgroup LibAVUtil.Math Mathematics


@defgroup LibAVUtil.String String Manipulation



@defgroup LibAVUtil.Memory Memory Management



@defgroup LibAVUtil.Data Data Structures


@defgroup LibAVUtil.Video Video related



@defgroup LibAVUtil.Audio Audio related



@defgroup LibAVUtil.ErrorCode Error Codes



@defgroup LibAVUtil.Logging Logging Facility



@defgroup LibAVUtil.Misc Other




@defgroup LibAVUtil.Version Library Version Macros
***********************************************************/

/***********************************************************
@addtogroup LibAVUtil.Version
***********************************************************/

/***********************************************************
@brief Return the LibAVUtil.Version.INT constant.
***********************************************************/
[CCode (cname="avutil_version", cheader_filename="ffmpeg/libavutil/avutil.h")]
public uint avutil_version ();

/***********************************************************
@brief Return an informative version string. This usually is the actual release
version number or a git commit description. This string has no fixed format
and can change any time. It should never be parsed by code.
***********************************************************/
[CCode (cname="av_version_info", cheader_filename="ffmpeg/libavutil/avutil.h")]
public string av_version_info ();

/***********************************************************
@brief Return the libavutil build-time configuration.
***********************************************************/
[CCode (cname="avutil_configuration", cheader_filename="ffmpeg/libavutil/avutil.h")]
public string avutil_configuration ();

/***********************************************************
@brief Return the libavutil license.
***********************************************************/
[CCode (cname="avutil_license", cheader_filename="ffmpeg/libavutil/avutil.h")]
public string avutil_license ();

/***********************************************************
@addtogroup lavu_media Media Type
@brief Media Type
***********************************************************/

[CCode (cname="AVMediaType", cprefix="", cheader_filename="ffmpeg/libavutil/avutil.h")]
public enum MediaType {
    /***********************************************************
    @brief Usually treated as AVMEDIA_TYPE_DATA
    ***********************************************************/
    AVMEDIA_TYPE_UNKNOWN,
    AVMEDIA_TYPE_VIDEO,
    AVMEDIA_TYPE_AUDIO,
    /***********************************************************
    @brief Opaque data information usually continuous
    ***********************************************************/
    AVMEDIA_TYPE_DATA,
    AVMEDIA_TYPE_SUBTITLE,
    /***********************************************************
    @brief Opaque data information usually sparse
    ***********************************************************/
    AVMEDIA_TYPE_ATTACHMENT;
    //  AVMEDIA_TYPE_NB;

    /***********************************************************
    @brief Return a string describing the media_type enum, null if media_type
    is unknown.
    ***********************************************************/
    [CCode (cname="av_get_media_type_string", cheader_filename="ffmpeg/libavutil/avutil.h")]
    public string av_get_media_type_string (
        MediaType media_type
    );
}

/***********************************************************
@defgroup lavu_const Constants

@defgroup lavu_enc Encoding specific

@note those definition should move to avcodec
***********************************************************/

[CCode (cname="FF_LAMBDA_SHIFT", cheader_filename="ffmpeg/libavutil/avutil.h")]
public const int FF_LAMBDA_SHIFT;
[CCode (cname="FF_LAMBDA_SCALE", cheader_filename="ffmpeg/libavutil/avutil.h")]
public const int FF_LAMBDA_SCALE;
/***********************************************************
@brief Factor to convert from H.263 QP to lambda
***********************************************************/
[CCode (cname="FF_QP2LAMBDA", cheader_filename="ffmpeg/libavutil/avutil.h")]
public const int FF_QP2LAMBDA;
[CCode (cname="FF_LAMBDA_MAX", cheader_filename="ffmpeg/libavutil/avutil.h")]
public const int FF_LAMBDA_MAX;

[CCode (cname="FF_QUALITY_SCALE", cheader_filename="ffmpeg/libavutil/avutil.h")]
public const int FF_QUALITY_SCALE; //FIXME maybe remove

/***********************************************************
@defgroup lavu_time Timestamp specific

FFmpeg internal timebase and timestamp definitions
***********************************************************/

/***********************************************************
@brief Undefined timestamp value

Usually reported by demuxer that work on containers that do not provide
either pts or dts.
***********************************************************/

[CCode (cname="AV_NOPTS_VALUE", cheader_filename="ffmpeg/libavutil/avutil.h")]
public const int64 AV_NOPTS_VALUE;

/***********************************************************
@brief Internal time base represented as integer
***********************************************************/

[CCode (cname="AV_TIME_BASE", cheader_filename="ffmpeg/libavutil/avutil.h")]
public const int AV_TIME_BASE;

/***********************************************************
@brief Internal time base represented as fractional value
***********************************************************/

[CCode (cname="AV_TIME_BASE_Q", cheader_filename="ffmpeg/libavutil/avutil.h")]
public const Rational AV_TIME_BASE_Q;

/***********************************************************
@brief Return a single letter to describe the given picture type
pict_type.

@param[in] pict_type the picture type @return a single character
representing the picture type, '?' if pict_type is unknown
***********************************************************/
[CCode (cname="av_get_picture_type_char", cheader_filename="ffmpeg/libavutil/avutil.h")]
public char av_get_picture_type_char (
    PictureType pict_type
);

/***********************************************************
@brief Return x default pointer in case p is null.
***********************************************************/
[CCode (cname="av_x_if_null", cheader_filename="ffmpeg/libavutil/avutil.h")]
public static void *av_x_if_null (
    void *p,
    void *x
);

/***********************************************************
@brief Compute the length of an integer list.

@param elsize size in bytes of each list element (only 1, 2, 4 or 8)
@param term list terminator (usually 0 or -1)
@param list pointer to the list
@return length of the list, in elements, not counting the terminator
***********************************************************/
[CCode (cname="av_int_list_length_for_size", cheader_filename="ffmpeg/libavutil/avutil.h")]
public uint av_int_list_length_for_size (
    uint elsize,
    void *list,
    uint64 term
); // av_pure;

/***********************************************************
@brief Compute the length of an integer list.

@param term list terminator (usually 0 or -1)
@param list pointer to the list
@return length of the list, in elements, not counting the terminator
***********************************************************/
[CCode (cname="av_int_list_length", cheader_filename="ffmpeg/libavutil/avutil.h")]
public uint av_int_list_length (
    void *list,
    uint64 term
);

/***********************************************************
@brief Open a file using a UTF-8 filename.
The API of this function matches POSIX fopen (), errors are returned through
errno.
@deprecated Avoid using it, as on Windows, the GLib.File allocated by this
    function may be allocated with a different CRT than the caller
    who uses the GLib.File*. No replacement provided in public API.
***********************************************************/
[CCode (cname="av_fopen_utf8", cheader_filename="ffmpeg/libavutil/avutil.h")]
public GLib.File av_fopen_utf8 (
    string path,
    string mode
);

/***********************************************************
@brief Return the fractional representation of the internal time base.
***********************************************************/
[CCode (cname="av_get_time_base_q", cheader_filename="ffmpeg/libavutil/avutil.h")]
public Rational av_get_time_base_q ();

[CCode (cname="AV_FOURCC_MAX_STRING_SIZE", cheader_filename="ffmpeg/libavutil/avutil.h")]
public const int AV_FOURCC_MAX_STRING_SIZE;

[CCode (cname="av_fourcc2str", cheader_filename="ffmpeg/libavutil/avutil.h")]
public string av_fourcc2str (
    uint32 fourcc
);

/***********************************************************
@brief Fill the provided buffer with a string containing a FourCC (four-character
code) representation.

@param buffer a buffer with size in bytes of at least AV_FOURCC_MAX_STRING_SIZE
@param fourcc the fourcc to represent
@return the buffer in input
***********************************************************/
[CCode (cname="av_fourcc_make_string", cheader_filename="ffmpeg/libavutil/avutil.h")]
public string av_fourcc_make_string (
    string buffer,
    uint32 fourcc
);

} // namespace LibAVUtil
