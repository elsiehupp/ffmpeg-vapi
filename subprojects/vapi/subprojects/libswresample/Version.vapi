/***********************************************************
Version macros.

This file is part of libswresample

libswresample is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

libswresample is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with libswresample; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

/***********************************************************
@file
Libswresample version macros
***********************************************************/
namespace LibSoftwareResample.Version {

    [CCode (cname="LibSoftwareResample.Version.MAJOR",cheader_filename="subprojects/ffmpeg/libswresample/version.h")]
    internal const int MAJOR; // 3

    [CCode (cname="LIBSWRESAMPLE_VERSION_MINOR",cheader_filename="subprojects/ffmpeg/libswresample/version.h")]
    internal const int MINOR; // 5

    [CCode (cname="LIBSWRESAMPLE_VERSION_MICRO",cheader_filename="subprojects/ffmpeg/libswresample/version.h")]
    internal const int MICRO; // 100

    [CCode (cname="LIBSWRESAMPLE_VERSION_INT",cheader_filename="subprojects/ffmpeg/libswresample/version.h")]
    internal const int INT;
    //  AV_VERSION_INT (
    //      LibSoftwareResample.Version.MAJOR,
    //      LibSoftwareResample.Version.MINOR,
    //      LibSoftwareResample.Version.MICRO
    //  );

    [CCode (cname="LIBSWRESAMPLE_VERSION",cheader_filename="subprojects/ffmpeg/libswresample/version.h")]
    internal const string STRING;
    //  AV_VERSION (
    //      LibSoftwareResample.Version.MAJOR,
    //      LibSoftwareResample.Version.MINOR,
    //      LibSoftwareResample.Version.MICRO
    //  );

    [CCode (cname="LIBSWRESAMPLE_BUILD",cheader_filename="subprojects/ffmpeg/libswresample/version.h")]
    internal const int BUILD; // LibSoftwareResample.Version.INT

    [CCode (cname="LIBSWRESAMPLE_IDENT",cheader_filename="subprojects/ffmpeg/libswresample/version.h")]
    internal const string IDENT; // "SwR" AV_STRINGIFY (LibSoftwareResample.Version.STRING)

} // namespace namespace LibSoftwareResample.Version
