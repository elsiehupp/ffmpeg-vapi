/*
 * Electronic Arts .cdata file Demuxer
 * Copyright (c) 2007 Peter Ross
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

/**
 * @file
 * Electronic Arts cdata Format Demuxer
 * by Peter Ross (pross@xvid.org)
 *
 * Technical details here:
 *  http://wiki.multimedia.cx/index.php?title=EA_Command_And_Conquer_3_Audio_Codec
 */

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_ea_cdata_demuxer = {
    //  .name           = "ea_cdata",
    //  .long_name      = "Electronic Arts cdata",
    //  .priv_data_size = sizeof(CdataDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = cdata_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = cdata_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = cdata_read_packet,
    //  .extensions = "cdata",
};
