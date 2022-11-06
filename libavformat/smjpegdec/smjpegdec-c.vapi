/*
 * SMJPEG demuxer
 * Copyright (c) 2011 Paul B Mahol
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
 * This is a demuxer for Loki SDL Motion JPEG files
 */

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_smjpeg_demuxer = {
    //  .name           = "smjpeg",
    //  .long_name      = "Loki SDL MJPEG",
    //  .priv_data_size = sizeof(SMJPEGContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = smjpeg_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = smjpeg_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = smjpeg_read_packet,
    //  .extensions     = "mjpg",
    //  .flags          = AVFMT_GENERIC_INDEX,
};
