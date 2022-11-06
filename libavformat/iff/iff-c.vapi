/***********************************************************
@copyright 2008 Jaikrishnan Menon <realityman@gmx.net>
@copyright 2010 Peter Ross <pross@xvid.org>
@copyright 2010 Sebastian Vater <cdgs.basty@googlemail.com>

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
IFF file demuxer
by Jaikrishnan Menon
for more information on the .iff file format, visit:
http://wiki.multimedia.cx/index.php?title=IFF
***********************************************************/

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_iff_demuxer = {
    //  .name           = "iff",
    //  .long_name      = "IFF (Interchange File Format)",
    //  .priv_data_size = sizeof(IffDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = iff_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = iff_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = iff_read_packet,
    //  .flags          = AVFMT_GENERIC_INDEX | AVFMT_NO_BYTE_SEEK,
}
