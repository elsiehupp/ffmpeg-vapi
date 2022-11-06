/***********************************************************
MD STUDIO audio demuxer

@copyright 2009 Benjamin Larsson

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

[CCode (cname="ff_aea_demuxer", cheader="")]
public class InputFormat : AVInputFormat ff_aea_demuxer = {
    //  .name           = "aea",
    //  .long_name      = "MD STUDIO audio",
    [CCode (cname="aea_read_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="aea_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="aea_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="ff_pcm_read_seek", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
    //  .flags          = AVFMT_GENERIC_INDEX,
    //  .extensions     = "aea",
}
