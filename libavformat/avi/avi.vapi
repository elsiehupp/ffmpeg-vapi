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
public enum AVIFlags {
    /***********************************************************
    ***********************************************************/
    AVIF_HASINDEX, // Index at end of file?
    AVIF_MUSTUSEINDEX,
    AVIF_ISINTERLEAVED,
    /***********************************************************
    ***********************************************************/
    AVIF_TRUSTCKTYPE, // Use CKType to find key frames?
    AVIF_WASCAPTUREFILE,
    AVIF_COPYRIGHTED,
}

[CCode (cname="", cheader_filename="")]
public const uint64 AVI_MAX_RIFF_SIZE;

[CCode (cname="", cheader_filename="")]
public const int AVI_MAX_STREAM_COUNT;

/***********************************************************
@brief Stream header flags
***********************************************************/
[Flags]
public enum AVIStreamHeaderFlags {
    AVISF_VIDEO_PALCHANGES,
}

/***********************************************************
@brief Index flags
***********************************************************/
[Flags]
public enum AVIIndexFlags {
    AVIIF_INDEX,
    AVIIF_NO_TIME,
}

} // namespace LibAVFormat
