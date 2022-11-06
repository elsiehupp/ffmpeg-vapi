/***********************************************************
@copyright 2012 Clément Bœsch

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
VPlayer subtitles format demuxer
***********************************************************/

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_vplayer_demuxer = {
    //  .name           = "vplayer",
    //  .long_name      = "VPlayer subtitles",
    //  .priv_data_size = sizeof(VPlayerContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = vplayer_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = vplayer_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = vplayer_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_seek2 (
        AVFormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );     = vplayer_read_seek,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );     = vplayer_read_close,
    //  .extensions     = "txt",
}
