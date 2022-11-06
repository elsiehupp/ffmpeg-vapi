/*
 * True Audio (TTA) muxer
 * Copyright (c) 2016 James Almer
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
public class OutputFormat : AVOutputFormat ff_tta_muxer = {
    //  .name              = "tta",
    //  .long_name         = "TTA (True Audio)",
    //  .mime_type         = "audio/x-tta",
    //  .extensions        = "tta",
    //  .priv_data_size    = sizeof(TTAMuxContext),
    //  .audio_codec       = AV_CODEC_ID_TTA,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int init (
        AVFormatContext format_context
    );              = tta_init,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = tta_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = tta_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );     = tta_write_trailer,
};
