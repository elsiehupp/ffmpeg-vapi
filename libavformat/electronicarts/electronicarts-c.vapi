/* Electronic Arts Multimedia File Demuxer
@copyright 2004  The FFmpeg project
@copyright 2006-2008 Peter Ross

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
Electronic Arts Multimedia file demuxer (WVE/UV2/etc.)
by Robin Kay (komadori at gekkou.co.uk)
***********************************************************/

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_ea_demuxer = {
    //  .name           = "ea",
    //  .long_name      = "Electronic Arts Multimedia",
    //  .priv_data_size = sizeof(EaDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = ea_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = ea_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = ea_read_packet,
}
