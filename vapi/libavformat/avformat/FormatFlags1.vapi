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

[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum LibAVFormat.FormatFlags1 {
    /***********************************************************
    @brief Demuxer will use avio_open, no opened file should be provided by the caller.
    ***********************************************************/
    [CCode (cname="AVFMT_NOFILE")]
    NO_FILE,

    /***********************************************************
    @brief Needs '%d' in filename.
    ***********************************************************/
    [CCode (cname="AVFMT_NEEDNUMBER")]
    NEED_NUMBER,

    /***********************************************************
    The muxer/demuxer is experimental and should be used with caution.

    It will not be selected automatically, and must be specified explicitly.
    ***********************************************************/
    [CCode (cname="AVFMT_EXPERIMENTAL")]
    EXPERIMENTAL,

    /***********************************************************
    @brief Show format stream IDs numbers.
    ***********************************************************/
    [CCode (cname="AVFMT_SHOW_IDS")]
    SHOW_IDS,

    /***********************************************************
    @brief Format wants global header.
    ***********************************************************/
    [CCode (cname="AVFMT_GLOBALHEADER")]
    WANTS_GLOBAL_HEADER,

    /***********************************************************
    @brief Format does not need / have any timestamps.
    ***********************************************************/
    [CCode (cname="AVFMT_NOTIMESTAMPS")]
    NO_TIMESTAMPS,

    /***********************************************************
    Use generic index building code.
    ***********************************************************/
    [CCode (cname="AVFMT_GENERIC_INDEX")]
    USE_GENERIC_INDEX,

    /***********************************************************
    @brief Format allows timestamp discontinuities. Note, muxers always require valid (monotone) timestamps
    ***********************************************************/
    [CCode (cname="AVFMT_TS_DISCONT")]
    ALLOWS_TIMESTAMP_DISCONTINUITIES,

    /***********************************************************
    @brief Format allows variable fps.
    ***********************************************************/
    [CCode (cname="AVFMT_VARIABLE_FPS")]
    ALLOWS_VARIABLE_FPS,

    /***********************************************************
    @brief Format does not need width/height
    ***********************************************************/
    [CCode (cname="AVFMT_NODIMENSIONS")]
    NO_DIMENSIONS,

    /***********************************************************
    @brief Format does not require any streams
    ***********************************************************/
    [CCode (cname="AVFMT_NOSTREAMS")]
    NO_STREAMS,

    /***********************************************************
    @brief Format does not allow to fall back on binary search via read_timestamp
    ***********************************************************/
    [CCode (cname="AVFMT_NOBINSEARCH")]
    NO_BINARY_SEARCH,

    /***********************************************************
    @brief Format does not allow to fall back on generic search
    ***********************************************************/
    [CCode (cname="AVFMT_NOGENSEARCH")]
    NO_GENERIC_SEARCH,

    /***********************************************************
    @brief Format does not allow seeking by bytes
    ***********************************************************/
    [CCode (cname="AVFMT_NO_BYTE_SEEK")]
    NO_BYTE_SEEK,

    /***********************************************************
    @brief Format allows flushing. If not set, the muxer will not receive a NULL packet in the write_packet function.
    ***********************************************************/
    [CCode (cname="AVFMT_ALLOW_FLUSH")]
    ALLOWS_FLUSH,

    /***********************************************************
    @brief Format does not require strictly increasing timestamps, but
    they must still be monotonic.
    ***********************************************************/
    [CCode (cname="AVFMT_TS_NONSTRICT")]
    ALLOW_NON_STRICT_TIMESTAMPS,

    /***********************************************************
    @brief Format allows muxing negative
    timestamps. If not set the timestamp
    will be shifted in av_write_frame and
    av_interleaved_write_frame so they
    start from 0.
    The user or muxer can override this through
    LibAVFormat.FormatContext.avoid_negative_ts
    ***********************************************************/
    [CCode (cname="AVFMT_TS_NEGATIVE")]
    ALLOW_NEGATIVE_TIMESTAMPS,

    /***********************************************************
    @brief Seeking is based on PTS
    ***********************************************************/
    [CCode (cname="AVFMT_SEEK_TO_PTS")]
    SEEK_TO_PTS;
}

} // namespace LibAVFormat
