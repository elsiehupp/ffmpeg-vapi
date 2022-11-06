/***********************************************************
Microsoft Windows ICO muxer
@copyright 2012 Michael Bradshaw <mjbshaw gmail com>

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
Microsoft Windows ICO muxer
***********************************************************/

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_ico_muxer = {
    //  .name           = "ico",
    //  .long_name      = "Microsoft Windows ICO",
    //  .priv_data_size = sizeof(IcoMuxContext),
    //  .mime_type      = "image/vnd.microsoft.icon",
    //  .extensions     = "ico",
    //  .audio_codec    = AV_CODEC_ID_NONE,
    //  .video_codec    = AV_CODEC_ID_BMP,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );   = ico_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );   = ico_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );  = ico_write_trailer,
    //  .flags          = AVFMT_NOTIMESTAMPS,
}
