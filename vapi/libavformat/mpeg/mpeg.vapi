/***********************************************************
@brief MPEG-1/2 muxer and demuxer common defines
@copyright 2000, 2001, 2002 Fabrice Bellard
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

[CCode (cname="", cheader_filename="")]
public const uint PACK_START_CODE;

[CCode (cname="", cheader_filename="")]
public const uint SYSTEM_HEADER_START_CODE;

[CCode (cname="", cheader_filename="")]
public const uint SEQUENCE_END_CODE;

[CCode (cname="", cheader_filename="")]
public const uint PACKET_START_CODE_MASK;

[CCode (cname="", cheader_filename="")]
public const uint PACKET_START_CODE_PREFIX;

[CCode (cname="", cheader_filename="")]
public const uint ISO_11172_END_CODE;

/***********************************************************
@brief Mpeg2
***********************************************************/
[CCode (cname="", cheader_filename="")]
public const uint PROGRAM_STREAM_MAP;

[CCode (cname="", cheader_filename="")]
public const uint PRIVATE_STREAM_1;

[CCode (cname="", cheader_filename="")]
public const uint PADDING_STREAM;

[CCode (cname="", cheader_filename="")]
public const uint PRIVATE_STREAM_2;

[CCode (cname="", cheader_filename="")]
public enum MpegID {
    AUDIO_ID,
    VIDEO_ID,
    H264_ID,
    AC3_ID,
    DTS_ID,
    LPCM_ID,
    SUB_ID,
}

[CCode (cname="", cheader_filename="")]
public enum StreamType {
    STREAM_TYPE_VIDEO_MPEG1,
    STREAM_TYPE_VIDEO_MPEG2,
    STREAM_TYPE_AUDIO_MPEG1,
    STREAM_TYPE_AUDIO_MPEG2,
    STREAM_TYPE_PRIVATE_SECTION,
    STREAM_TYPE_PRIVATE_DATA,
    STREAM_TYPE_AUDIO_AAC,
    STREAM_TYPE_VIDEO_MPEG4,
    STREAM_TYPE_VIDEO_H264,
    STREAM_TYPE_VIDEO_HEVC,
    STREAM_TYPE_VIDEO_CAVS,
    STREAM_TYPE_AUDIO_AC3,
}

[CCode (cname="", cheader_filename="")]
public const int lpcm_freq_tab[4]; // = { 48000, 96000, 44100, 32000 }

/***********************************************************
@brief Parse MPEG-PES five-byte timestamp
***********************************************************/
[CCode (cname="", cheader_filename="")]
public static int64 ff_parse_pes_pts (
    uint8[] buffer
);

} // namespace LibAVFormat
