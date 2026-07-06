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

[CCode (cname="struct AVChapter",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.Chapter {
    /***********************************************************
    @brief unique ID to identify the chapter
    ***********************************************************/
    [CCode (cname="id")]
    public int id;

    /***********************************************************
    @brief Time base in which the start/end timestamps are specified
    ***********************************************************/
    [CCode (cname="time_base")]
    public LibAVUtil.Rational time_base;

    /***********************************************************
    @brief Chapter start time in time_base units
    ***********************************************************/
    [CCode (cname="start")]
    public int64 start;

    /***********************************************************
    @brief Chapter end time in time_base units
    ***********************************************************/
    [CCode (cname="end")]
    public int64 end;

    [CCode (cname="metadata")]
    public LibAVUtil.Dictionary? metadata;
}

} // namespace LibAVFormat
