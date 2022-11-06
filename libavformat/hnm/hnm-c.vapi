/*
 * Cryo Interactive Entertainment HNM4 demuxer
 *
 * Copyright (c) 2012 David Kment
 *
 * This file is part of FFmpeg .
 *
 * FFmpeg  is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg  is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg ; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_hnm_demuxer = {
    //  .name           = "hnm",
    //  .long_name      = "Cryo HNM v4",
    //  .priv_data_size = sizeof(Hnm4DemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = hnm_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = hnm_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = hnm_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );     = hnm_read_close,
    //  .flags          = AVFMT_NO_BYTE_SEEK | AVFMT_NOGENSEARCH | AVFMT_NOBINSEARCH
};
