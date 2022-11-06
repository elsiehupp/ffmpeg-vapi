/***********************************************************
 Bitmap Brothers JV demuxer
 @copyright 2005, 2011 Peter Ross <pross@xvid.org>

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
 Bitmap Brothers JV demuxer
 @author Peter Ross <pross@xvid.org>
***********************************************************/

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_jv_demuxer = {
    //  .name           = "jv",
    //  .long_name      = "Bitmap Brothers JV",
    //  .priv_data_size = sizeof(JVDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = read_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = read_packet,
    [CCode (cname="", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );      = read_seek,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );     = read_close,
}
