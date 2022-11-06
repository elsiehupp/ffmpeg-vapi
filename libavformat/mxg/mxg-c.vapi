/*
 * MxPEG clip file demuxer
 * Copyright (c) 2010 Anatoly Nenashev
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
public class InputFormat : AVInputFormat ff_mxg_demuxer = {
    //  .name           = "mxg",
    //  .long_name      = "MxPEG clip",
    //  .priv_data_size = sizeof(MXGContext),
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = mxg_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = mxg_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );     = mxg_close,
    //  .extensions     = "mxg",
};
