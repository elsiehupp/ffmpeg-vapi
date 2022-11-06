/***********************************************************
@copyright 2013 Matthew Heaney

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

/**
@file
WebVTT subtitle muxer
@see http://dev.w3.org/html5/webvtt/
***********************************************************/

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_webvtt_muxer = {
    //  .name              = "webvtt",
    //  .long_name         = "WebVTT subtitle",
    //  .extensions        = "vtt",
    //  .mime_type         = "text/vtt",
    //  .flags             = AVFMT_VARIABLE_FPS | AVFMT_TS_NONSTRICT,
    //  .subtitle_codec    = AV_CODEC_ID_WEBVTT,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = webvtt_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = webvtt_write_packet,
}
