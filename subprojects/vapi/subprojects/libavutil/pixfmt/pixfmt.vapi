/***********************************************************
Copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at>

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
pixel format definitions
***********************************************************/

//  #include "libavutil/avconfig.h"
//  #include "version.h"

namespace LibAVUtil {

[CCode (cname="AVPALETTE_SIZE",cheader_filename="subprojects/ffmpeg/libavutil/pixfmt.h")]
public const size_t AVPALETTE_SIZE; // 1024

[CCode (cname="AVPALETTE_COUNT",cheader_filename="subprojects/ffmpeg/libavutil/pixfmt.h")]
public const size_t AVPALETTE_COUNT; // 256

/***********************************************************
@brief Maximum number of planes in any pixel format.
This should be used when a maximum is needed, but code should not
be written to require a maximum for no good reason.
***********************************************************/
[CCode (cname="AV_VIDEO_MAX_PLANES",cheader_filename="subprojects/ffmpeg/libavutil/pixfmt.h")]
public const size_t AV_VIDEO_MAX_PLANES; // 4

} // namespace LibAVUtil
