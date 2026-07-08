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

[CCode (cname="struct AVIndexEntry",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.IndexEntry {
    [CCode (cname="pos")]
    public int64 pos;

    /***********************************************************
    @brief Timestamp in LibAVFormat.Stream.time_base units, preferably the time
    from which on correctly decoded frames are available when
    seeking to this entry. This means preferable PTS on keyframe
    based formats, but demuxers can choose to store a different
    timestamp, if it is more convenient for the implementation
    or nothing better is known.
    ***********************************************************/
    [CCode (cname="timestamp")]
    public int64 timestamp;

    [CCode (cname="flags")]
    public LibAVFormat.IndexEntryFlags[] flags; // :2;

    /***********************************************************
    @brief Yeah, trying to keep the size of this small to reduce
    memory requirements (it is 24 vs. 32 bytes due to possible
    8-byte alignment).
    ***********************************************************/
    [CCode (cname="size")]
    public int[] size; // :30

    /***********************************************************
    @brief Minimum distance between this and the previous keyframe, used to avoid unneeded searching.
    ***********************************************************/
    [CCode (cname="min_distance")]
    public int min_distance;
}

} // namespace LibAVFormat
