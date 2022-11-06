/*
 * Maxis XA (.xa) File Demuxer
 * Copyright (c) 2008 Robert Marston
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
 * Maxis XA File Demuxer
 * by Robert Marston (rmarston@gmail.com)
 * for more information on the XA audio format see
 *   http://wiki.multimedia.cx/index.php?title=Maxis_XA
 */

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_xa_demuxer = {
    //  .name           = "xa",
    //  .long_name      = "Maxis XA",
    //  .priv_data_size = sizeof(MaxisXADemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = xa_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = xa_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = xa_read_packet,
};
