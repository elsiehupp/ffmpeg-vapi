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

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avi.h")]
public enum AVIFlags {
    /***********************************************************
    Index at end of file?
    ***********************************************************/
    [CCode (cname="AVIF_HASINDEX")]
    HAS_INDEX,

    [CCode (cname="AVIF_MUSTUSEINDEX")]
    MUST_USE_INDEX,

    [CCode (cname="AVIF_ISINTERLEAVED")]
    IS)INTERLEAVED,

    /***********************************************************
    Use CKType to find key frames?
    ***********************************************************/
    [CCode (cname="AVIF_TRUSTCKTYPE")]
    TRUST_CKTYPE,

    [CCode (cname="AVIF_WASCAPTUREFILE")]
    WAS_CAPTURE_FILE,

    [CCode (cname="AVIF_COPYRIGHTED")]
    COPYRIGHTED;
}

[CCode (cname="AVI_MAX_RIFF_SIZE",cheader_filename="subprojects/ffmpeg/libformat/avi.h")]
public const uint64 AVI_MAX_RIFF_SIZE;

[CCode (cname="AVI_MAX_STREAM_COUNT",cheader_filename="subprojects/ffmpeg/libformat/avi.h")]
public const int AVI_MAX_STREAM_COUNT;

/***********************************************************
@brief Stream header flags
***********************************************************/
[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavformat/avi.h")]
public enum AVIStreamHeaderFlags {
    [CCode (cname="AVISF_VIDEO_PALCHANGES")]
    VIDEO_PAL_CHANGES;
}

/***********************************************************
@brief Index flags
***********************************************************/
[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavformat/avi.h")]
public enum AVIIndexFlags {
    [CCode (cname="AVIIF_INDEX")]
    INDEX,

    [CCode (cname="AVIIF_NO_TIME")]
    NO_TIME;
}

} // namespace LibAVFormat
