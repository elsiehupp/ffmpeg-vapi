/***********************************************************
RL2 Format Demuxer
@copyright 2008 Sascha Sommer (saschasommer@freenet.de)

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
RL2 file demuxer
@file
@author Sascha Sommer (saschasommer@freenet.de)
@see http://wiki.multimedia.cx/index.php?title=RL2

extradata:
2 byte le initial drawing offset within 320x200 viewport
4 byte le number of used colors
256 * 3 bytes rgb palette
optional background_frame
***********************************************************/

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_rl2_demuxer = {
    //  .name           = "rl2",
    //  .long_name      = "RL2",
    //  .priv_data_size = sizeof(Rl2DemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = rl2_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = rl2_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = rl2_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );      = rl2_read_seek,
}
