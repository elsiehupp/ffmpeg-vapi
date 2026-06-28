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

/***********************************************************
@file
@ingroup lavfi
Libavfilter version macros
***********************************************************/
namespace LibAVFilter {
namespace Version {

    [CCode (cname="LIBAVFILTER_VERSION_MAJOR",cheader_filename="subprojects/ffmpeg/libavfilter/version_major.h")]
    public const int MAJOR;

    [CCode (cname="LIBAVFILTER_VERSION_MINOR",cheader_filename="subprojects/ffmpeg/libavfilter/version.h")]
    public const int MINOR;

    [CCode (cname="LIBAVFILTER_VERSION_MICRO",cheader_filename="subprojects/ffmpeg/libavfilter/version.h")]
    public const int MICRO;


    [CCode (cname="LIBAVFILTER_VERSION_INT",cheader_filename="subprojects/ffmpeg/libavfilter/version.h")]
    public const int INT;
    //  AV_VERSION_INT (
    //      LibAVFilter.Version.MAJOR,
    //      LibAVFilter.Version.MINOR,
    //      LibAVFilter.Version.MICRO
    //  );

    [CCode (cname="LIBAVFILTER_VERSION",cheader_filename="subprojects/ffmpeg/libavfilter/version.h")]
    public const string STRING;
    //  AV_VERSION (
    //      LibAVFilter.Version.MAJOR,
    //      LibAVFilter.Version.MINOR,
    //      LibAVFilter.Version.MICRO
    //  );

    [CCode (cname="LIBAVFILTER_BUILD",cheader_filename="subprojects/ffmpeg/libavfilter/version.h")]
    public const int BUILD;

    [CCode (cname="LIBAVFILTER_IDENT",cheader_filename="subprojects/ffmpeg/libavfilter/version.h")]
    public const string IDENT;

    /***********************************************************
    FF_API_* defines may be placed below to indicate public API that will be
    dropped at a future version bump. The defines themselves are not part of
    the public API and may change, break or disappear at any time.
    ***********************************************************/

} // namespace Version
} // namespace LibAVFilter
