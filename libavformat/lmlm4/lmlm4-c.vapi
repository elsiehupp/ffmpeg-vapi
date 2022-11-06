/*
 * Linux Media Labs MPEG-4 demuxer
 * Copyright (c) 2008 Ivo van Poorten
 *
 * Due to a lack of sample files, only files with one channel are supported.
 * u-law and ADPCM audio are unsupported for the same reason.
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

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_lmlm4_demuxer = {
    //  .name           = "lmlm4",
    //  .long_name      = "raw lmlm4",
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = lmlm4_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = lmlm4_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = lmlm4_read_packet,
};
