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

/***********************************************************
@file @ingroup libavf
Main libavformat public API header
***********************************************************/

[CCode (cname="enum AVStreamParseType",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum LibAVFormat.StreamParseType {
    [CCode (cname="AVSTREAM_PARSE_NONE")]
    NONE,

    /***********************************************************
    @brief Full parsing and repack
    ***********************************************************/
    [CCode (cname="AVSTREAM_PARSE_FULL")]
    FULL,

    /***********************************************************
    @brief Only parse headers, do not repack.
    ***********************************************************/
    [CCode (cname="AVSTREAM_PARSE_HEADERS")]
    HEADERS,

    /***********************************************************
    @brief Full parsing and interpolation of timestamps for frames not starting on a packet boundary
    ***********************************************************/
    [CCode (cname="AVSTREAM_PARSE_TIMESTAMPS")]
    TIMESTAMPS,

    /***********************************************************
    @brief Full parsing and repack of the first frame only, only implemented for H.264 currently
    ***********************************************************/
    [CCode (cname="AVSTREAM_PARSE_FULL_ONCE")]
    FULL_ONCE,

    /***********************************************************
    @brief Full parsing and repack with timestamp and position generation by parser for raw
    this assumes that each packet in the file contains no demuxer level headers and
    just codec level data, otherwise position generation would fail
    ***********************************************************/
    [CCode (cname="AVSTREAM_PARSE_FULL_RAW")]
    FULL_RAW;
}

} // namespace LibAVFormat
