/***********************************************************
@brief This file is part of FFmpeg.

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

namespace LibAVCodec {
/***********************************************************
@file @ingroup libavc
LibAVCodec version macros.
***********************************************************/
namespace Version {

    [CCode (cname="LIBAVCODEC_VERSION_MAJOR",cheader_filename="subprojects/ffmpeg/libavcodec/version_major.h")]
    public const int MAJOR;

    [CCode (cname="LIBAVCODEC_VERSION_MINOR",cheader_filename="subprojects/ffmpeg/libavcodec/version.h")]
    public const int MINOR;

    [CCode (cname="LIBAVCODEC_VERSION_MICRO",cheader_filename="subprojects/ffmpeg/libavcodec/version.h")]
    public const int MICRO;

    [CCode (cname="LIBAVCODEC_VERSION_INT",cheader_filename="subprojects/ffmpeg/libavcodec/version.h")]
    public const int INT;
    //  AV_VERSION_INT (
    //      LIBAVCODEC_VERSION_MAJOR,
    //      LIBAVCODEC_VERSION_MINOR,
    //      LIBAVCODEC_VERSION_MICRO
    //  );

    [CCode (cname="LIBAVCODEC_VERSION",cheader_filename="subprojects/ffmpeg/libavcodec/version.h")]
    public const string STRING;
    //  AV_VERSION (
    //      LIBAVCODEC_VERSION_MAJOR,
    //      LIBAVCODEC_VERSION_MINOR,
    //      LIBAVCODEC_VERSION_MICRO
    //  );

    [CCode (cname="LIBAVCODEC_BUILD",cheader_filename="subprojects/ffmpeg/libavcodec/version.h")]
    public const int BUILD; // LIBAVCODEC_VERSION_INT

    [CCode (cname="LIBAVCODEC_IDENT",cheader_filename="subprojects/ffmpeg/libavcodec/version.h")]
    public const string IDENT;


    /***********************************************************
    FF_API_* defines may be placed below to indicate public API that will be
    dropped at a future version bump. The defines themselves are not part of
    the public API and may change, break or disappear at any time.

    @note, when bumping the major version it is recommended to manually
    disable each FF_API_* in its own commit instead of disabling them all
    at once through the bump. This improves the git bisect-ability of the change.
    ***********************************************************/

    //  [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavcodec/version_major.h")]
    //  #define FF_API_CODEC_PROPS         (LIBAVCODEC_VERSION_MAJOR < 63)

    //  [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavcodec/version_major.h")]
    //  #define FF_API_PARSER_PRIVATE      (LIBAVCODEC_VERSION_MAJOR < 63)

} // namespace Version
} // namespace LibAVCodec
