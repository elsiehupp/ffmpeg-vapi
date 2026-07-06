/***********************************************************
Version macros.

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

namespace LibAVFormat.Version {

/***********************************************************
@file @ingroup libavf
Libavformat version macros
***********************************************************/

[CCode (cname="LIBAVFORMAT_VERSION_MINOR",cheader_filename="subprojects/ffmpeg/libavformat/version.h")]
public const int MINOR;

[CCode (cname="LIBAVFORMAT_VERSION_MICRO",cheader_filename="subprojects/ffmpeg/libavformat/version.h")]
public const int MICRO;

[CCode (cname="LIBAVFORMAT_VERSION_INT",cheader_filename="subprojects/ffmpeg/libavformat/version.h")]
public const int INT;
//  AV_VERSION_INT (
//      LibAVFormat.Version.MAJOR,
//      LibAVFormat.Version.MINOR,
//      LibAVFormat.Version.MICRO
//  )

[CCode (cname="LIBAVFORMAT_VERSION",cheader_filename="subprojects/ffmpeg/libavformat/version.h")]
public const string STRING;
//  AV_VERSION (
//      LibAVFormat.Version.MAJOR,
//      LibAVFormat.Version.MINOR,
//      LibAVFormat.Version.MICRO
//  )

[CCode (cname="LIBAVFORMAT_BUILD",cheader_filename="subprojects/ffmpeg/libavformat/version.h")]
public const int BUILD; // LibAVFormat.Version.INT

[CCode (cname="LIBAVFORMAT_IDENT",cheader_filename="subprojects/ffmpeg/libavformat/version.h")]
public const string IDENT; // "Lavf" AV_STRINGIFY (LibAVFormat.Version.STRING)

} // namespace LibAVFormat.Version
