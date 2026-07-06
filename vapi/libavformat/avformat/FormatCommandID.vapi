/***********************************************************
Copyright (c) 2001 Fabrice Bellard

This file is part of FFmpeg.

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
@file
@ingroup libavf
Main libavformat public API header
***********************************************************/

/***********************************************************
Command IDs that can be sent to the demuxer

The following commands can be sent to a demuxer
using ::avformat_send_command.
***********************************************************/
[CCode (cname="enum AVFormatCommandID",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public enum LibAVFormat.FormatCommandID {
    /***********************************************************
    Send a RTSP `SET_PARAMETER` request to the server

    Sends an SET_PARAMETER RTSP command to the server,
    with a data payload of type ::LibAVFormat.RTSPCommandRequest,
    ownership of it and its data remains with the caller.

    A reply retrieved is of type ::LibAVFormat.RTSPResponse and it
    and its contents must be freed by the caller.
    ***********************************************************/
    [CCode (cname="AVFORMAT_COMMAND_RTSP_SET_PARAMETER")]
    RTSP_SET_PARAMETER;
}

} // namespace LibAVFormat
