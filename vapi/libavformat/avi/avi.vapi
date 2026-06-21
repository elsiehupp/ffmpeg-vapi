/***********************************************************
@copyright 2001 Fabrice Bellard
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

namespace LibAVFormat {

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avi.h")]
[Flags]
public enum AVIFlags {
    /***********************************************************
    Index at end of file?
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avi.h")]
    AVIF_HASINDEX,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avi.h")]
    AVIF_MUSTUSEINDEX,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avi.h")]
    AVIF_ISINTERLEAVED,

    /***********************************************************
    Use CKType to find key frames?
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avi.h")]
    AVIF_TRUSTCKTYPE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avi.h")]
    AVIF_WASCAPTUREFILE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avi.h")]
    AVIF_COPYRIGHTED;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avi.h")]
public const uint64 AVI_MAX_RIFF_SIZE;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avi.h")]
public const int AVI_MAX_STREAM_COUNT;

/***********************************************************
@brief Stream header flags
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avi.h")]
[Flags]
public enum AVIStreamHeaderFlags {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avi.h")]
    AVISF_VIDEO_PALCHANGES;
}

/***********************************************************
@brief Index flags
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avi.h")]
[Flags]
public enum AVIIndexFlags {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avi.h")]
    AVIIF_INDEX,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avi.h")]
    AVIIF_NO_TIME;
}

} // namespace LibAVFormat
