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

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum LibAVFormat.FormatStreamEventFlags {
    /***********************************************************
    @brief The call resulted in updated metadata.
    - demuxing: the demuxer read new metadata from the file and updated
        LibAVFormat.Stream.metadata accordingly
    - muxing: the user updated LibAVFormat.Stream.metadata and wishes the muxer to write
        it into the file
    ***********************************************************/
    [CCode (cname="AVSTREAM_EVENT_FLAG_METADATA_UPDATED")]
    METADATA_UPDATED,

    /***********************************************************
    - demuxing: new packets for this stream were read from the file. This
        event is informational only and does not guarantee that new packets
        for this stream will necessarily be returned from av_read_frame ().
    ***********************************************************/
    [CCode (cname="AVSTREAM_EVENT_FLAG_NEW_PACKETS")]
    NEW_PACKETS;
}

} // namespace LibAVFormat
