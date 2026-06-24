/***********************************************************
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
namespace LibAVDevice {

/***********************************************************
@file
@ingroup lavd
Libavdevice version macros
***********************************************************/

[CCode (cname="LIBAVDEVICE_VERSION_MAJOR",cheader_filename="subprojects/ffmpeg/libavdevice/version.h")]
public const int LIBAVDEVICE_VERSION_MAJOR; // 58

[CCode (cname="LIBAVDEVICE_VERSION_MINOR",cheader_filename="subprojects/ffmpeg/libavdevice/version.h")]
public const int LIBAVDEVICE_VERSION_MINOR; // 8

[CCode (cname="LIBAVDEVICE_VERSION_MICRO",cheader_filename="subprojects/ffmpeg/libavdevice/version.h")]
public const int LIBAVDEVICE_VERSION_MICRO; // 100

[CCode (cname="LIBAVDEVICE_VERSION_INT",cheader_filename="subprojects/ffmpeg/libavdevice/version.h")]
public const int LIBAVDEVICE_VERSION_INT;
//  AV_VERSION_INT (
//      LIBAVDEVICE_VERSION_MAJOR,
//      LIBAVDEVICE_VERSION_MINOR,
//      LIBAVDEVICE_VERSION_MICRO
//  );

[CCode (cname="LIBAVDEVICE_VERSION",cheader_filename="subprojects/ffmpeg/libavdevice/version.h")]
public const string LIBAVDEVICE_VERSION;
//  AV_VERSION (
//      LIBAVDEVICE_VERSION_MAJOR,
//      LIBAVDEVICE_VERSION_MINOR,
//      LIBAVDEVICE_VERSION_MICRO
//  );

[CCode (cname="LIBAVDEVICE_BUILD",cheader_filename="subprojects/ffmpeg/libavdevice/version.h")]
public const int LIBAVDEVICE_BUILD; // LIBAVDEVICE_VERSION_INT

[CCode (cname="LIBAVDEVICE_IDENT",cheader_filename="subprojects/ffmpeg/libavdevice/version.h")]
public const string LIBAVDEVICE_IDENT; // "Lavd" AV_STRINGIFY (LIBAVDEVICE_VERSION)

/***********************************************************
FF_API_* defines may be placed below to indicate public API that will be
dropped at a future version bump. The defines themselves are not part of
the public API and may change, break or disappear at any time.
***********************************************************/

} // namespace LibAVDevice
