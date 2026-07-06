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

/***********************************************************
@brief The duration of a video can be estimated through various ways, and this enum can be used
to know how the duration was estimated.
***********************************************************/
[CCode (cname="enum AVDurationEstimationMethod",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum LibAVFormat.DurationEstimationMethod {
    /***********************************************************
    @brief Duration accurately estimated from PTSes
    ***********************************************************/
    [CCode (cname="AVFMT_DURATION_FROM_PTS")]
    FROM_PTS,

    /***********************************************************
    @brief Duration estimated from a stream with a known duration
    ***********************************************************/
    [CCode (cname="AVFMT_DURATION_FROM_STREAM")]
    FROM_STREAM,

    /***********************************************************
    @brief Duration estimated from bitrate (less accurate)
    ***********************************************************/
    [CCode (cname="AVFMT_DURATION_FROM_BITRATE")]
    FROM_BITRATE
}

} // namespace LibAVFormat
