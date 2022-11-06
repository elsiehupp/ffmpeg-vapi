/*
 * a64 muxer
 * Copyright (c) 2009 Tobias Bindhammer
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

[CCode (cname="ff_a64_muxer", cheader="")]
public class OutputFormat : AVOutputFormat ff_a64_muxer = {
    //  .name           = "a64",
    //  .long_name      = "a64 - video for Commodore 64",
    //  .extensions     = "a64, A64",
    //  .video_codec    = AV_CODEC_ID_A64_MULTI,
    [CCode (cname="a64_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="ff_raw_write_packet", cheader="")]
    public abstract int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );
};
