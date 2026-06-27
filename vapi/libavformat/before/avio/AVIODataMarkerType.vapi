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
@file @ingroup lavf_io
Buffered I/O operations
***********************************************************/

/***********************************************************
@brief Different data types that can be returned via the AVIO
write_data_type callback.
***********************************************************/
[CCode (cname="enum AVIODataMarkerType",cheader_filename="subprojects/ffmpeg/libformat/avio.h")]
public enum AVIODataMarkerType {
    /***********************************************************
    @brief Header data; this needs to be present for the stream to be decodeable.
    ***********************************************************/
    [CCode (cname="AVIO_DATA_MARKER_HEADER")]
    HEADER,

    /***********************************************************
    @brief A point in the output bytestream where a decoder can start decoding
    (i.e. a keyframe). A demuxer/decoder given the data flagged with
    AVIODataMarkerType.HEADER, followed by any AVIODataMarkerType.SYNC_POINT,
    should give decodeable results.
    ***********************************************************/
    [CCode (cname="AVIO_DATA_MARKER_SYNC_POINT")]
    SYNC_POINT,

    /***********************************************************
    @brief A point in the output bytestream where a demuxer can start parsing
    (for non self synchronizing bytestream formats). That is, any
    non-keyframe packet start point.
    ***********************************************************/
    [CCode (cname="AVIO_DATA_MARKER_BOUNDARY_POINT")]
    BOUNDARY_POINT,

    /***********************************************************
    @brief This is any, unlabelled data. It can either be a muxer not marking
    any positions at all, it can be an actual boundary/sync point
    that the muxer chooses not to mark, or a later part of a packet/fragment
    that is cut into multiple write callbacks due to limited IO buffer size.
    ***********************************************************/
    [CCode (cname="AVIO_DATA_MARKER_UNKNOWN")]
    UNKNOWN,

    /***********************************************************
    @brief Trailer data, which doesn't contain actual content, but only for
    finalizing the output file.
    ***********************************************************/
    [CCode (cname="AVIO_DATA_MARKER_TRAILER")]
    TRAILER,

    /***********************************************************
    @brief A point in the output bytestream where the underlying AVIOContext might
    flush the buffer depending on latency or buffering requirements. Typically
    means the end of a packet.
    ***********************************************************/
    [CCode (cname="AVIO_DATA_MARKER_FLUSH_POINT")]
    FLUSH_POINT;
}

} // namespace LibAVFormat
