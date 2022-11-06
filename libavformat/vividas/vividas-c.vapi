/*
 * Vividas VIV format Demuxer
 * Copyright (c) 2012 Krzysztof Klinikowski
 * Copyright (c) 2010 Andrzej Szombierski
 * based on vivparse Copyright (c) 2007 Måns Rullgård
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
 * @brief Vividas VIV (.viv) file demuxer
 * @author Andrzej Szombierski [qq at kuku eu org] (2010-07)
 * @sa http://wiki.multimedia.cx/index.php?title=Vividas_VIV
 */

AVInputFormat ff_vividas_demuxer = {
    //  .name           = "vividas",
    //  .long_name      = "Vividas VIV",
    //  .priv_data_size = sizeof(VividasDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = viv_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = viv_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = viv_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );     = viv_read_close,
    [CCode (cname="", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );      = viv_read_seek,
};
