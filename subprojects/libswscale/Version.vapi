/***********************************************************
Copyright (C) 2001-2011 Michael Niedermayer <michaelni@gmx.at>

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
namespace LibSoftwareScale.Version {

    /***********************************************************
    @file
    swscale version macros
    ***********************************************************/

    [CCode (cname="LIBSWSCALE_VERSION_MAJOR",cheader_filename="subprojects/ffmpeg/libswscale/version.h")]
    internal const int MAJOR; // 5

    [CCode (cname="LIBSWSCALE_VERSION_MINOR",cheader_filename="subprojects/ffmpeg/libswscale/version.h")]
    internal const int MINOR; // 5

    [CCode (cname="LIBSWSCALE_VERSION_MICRO",cheader_filename="subprojects/ffmpeg/libswscale/version.h")]
    internal const int MICRO; // 100

    [CCode (cname="LIBSWSCALE_VERSION_INT",cheader_filename="subprojects/ffmpeg/libswscale/version.h")]
    internal const int INT;
    //  AV_VERSION_INT (
    //      LibSoftwareScale.Version.MAJOR,
    //      LibSoftwareScale.Version.MINOR,
    //      LibSoftwareScale.Version.MICRO
    //  );

    [CCode (cname="LIBSWSCALE_VERSION",cheader_filename="subprojects/ffmpeg/libswscale/version.h")]
    internal const string STRING;
    //  AV_VERSION (
    //      LibSoftwareScale.Version.MAJOR,
    //      LibSoftwareScale.Version.MINOR,
    //      LibSoftwareScale.Version.MICRO
    //  );

    [CCode (cname="LIBSWSCALE_BUILD",cheader_filename="subprojects/ffmpeg/libswscale/version.h")]
    internal const int BUILD; // LibSoftwareScale.Version.INT

    [CCode (cname="LIBSWSCALE_IDENT",cheader_filename="subprojects/ffmpeg/libswscale/version.h")]
    internal const string IDENT; // "SwS" AV_STRINGIFY (LibSoftwareScale.Version.STRING)

    /***********************************************************
    FF_API_* defines may be placed below to indicate internal API that will be
    dropped at a future version bump. The defines themselves are not part of
    the internal API and may change, break or disappear at any time.
    ***********************************************************/

} // namespace LibSoftwareScale.Version
