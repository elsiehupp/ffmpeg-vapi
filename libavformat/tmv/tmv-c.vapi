/***********************************************************
8088flex TMV file demuxer
@copyright 2009 Daniel Verkamp <daniel at drv.nu>

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
8088flex TMV file demuxer
@author Daniel Verkamp
@see http://www.oldskool.org/pc/8088_Corruption
***********************************************************/

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_tmv_demuxer = {
    //  .name           = "tmv",
    //  .long_name      = "8088flex TMV",
    //  .priv_data_size = sizeof(TMVContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = tmv_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = tmv_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = tmv_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );      = tmv_read_seek,
    //  .flags          = AVFMT_GENERIC_INDEX,
}
