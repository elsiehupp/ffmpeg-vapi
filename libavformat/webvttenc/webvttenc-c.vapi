/***********************************************************
@copyright 2013 Matthew Heaney
***********************************************************/
/***********************************************************
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

/***********************************************************
@file WebVTT subtitle muxer
@see http://dev.w3.org/html5/webvtt/
***********************************************************/

[CCode (cname="ff_webvtt_muxer", cheader="")]
public class WebVTTOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "webvtt"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "WebVTT subtitle"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "vtt"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "text/vtt"
    //  .flags = AVFMT_VARIABLE_FPS | AVFMT_TS_NONSTRICT,
    //  .subtitle_codec = LibAVCodec.CodecID.WEBVTT,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = webvtt_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = webvtt_write_packet,
}
