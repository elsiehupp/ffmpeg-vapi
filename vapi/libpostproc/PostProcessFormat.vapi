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

[CCode (cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
public enum PostProcessFormat {
    [CCode (cname="PP_FORMAT")]
    FORMAT, // 0x00000008

    [CCode (cname="PP_FORMAT_420")]
    FORMAT_420, // (0x00000011|LibPostProc.PostProcessFormat.FORMAT)

    [CCode (cname="PP_FORMAT_422")]
    FORMAT_422, // (0x00000001|LibPostProc.PostProcessFormat.FORMAT)

    [CCode (cname="PP_FORMAT_411")]
    FORMAT_411, // (0x00000002|LibPostProc.PostProcessFormat.FORMAT)

    [CCode (cname="PP_FORMAT_444")]
    FORMAT_444, // (0x00000000|LibPostProc.PostProcessFormat.FORMAT)

    [CCode (cname="PP_FORMAT_440")]
    FORMAT_440; // (0x00000010|LibPostProc.PostProcessFormat.FORMAT)
}

/***********************************************************
@}
***********************************************************/

} // namespace LibPostProc
