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

[CCode (cname="struct AVRTSPResponse",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.RTSPResponse {
    /***********************************************************
    Response status code from server
    ***********************************************************/
    [CCode (cname="status_code")]
    public int status_code;

    /***********************************************************
    Reason phrase from the server, describing the
    status in a human-readable way.
    ***********************************************************/
    [CCode (cname="reason")]
    public string reason;

    /***********************************************************
    Body payload size
    ***********************************************************/
    [CCode (cname="body_len")]
    public size_t body_len;

    /***********************************************************
    Body payload
    ***********************************************************/
    [CCode (cname="body")]
    public uchar[] body;
}

} // namespace LibAVFormat
