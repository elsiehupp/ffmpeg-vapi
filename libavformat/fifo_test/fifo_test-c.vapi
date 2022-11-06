/*
 * FIFO test pseudo-muxer
 * Copyright (c) 2016 Jan Sebechlebsky
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with FFmpeg; if not, write to the Free Software * Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#define OFFSET(x) offsetof(FailingMuxerContext, x)
static const AVOption options[] = {
        {"write_header_ret", "write_header() return value", OFFSET(write_header_ret),
         AV_OPT_TYPE_INT, {.i64 = 0}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM},
        {"write_trailer_ret", "write_trailer() return value", OFFSET(write_trailer_ret),
         AV_OPT_TYPE_INT, {.i64 = 0}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM},
        {"print_deinit_summary", "print summary when deinitializing muxer", OFFSET(print_deinit_summary),
         AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},
        {NULL}
    };

static const AVClass failing_muxer_class = {
    //  .class_name = "Fifo test muxer",
    //  .item_name  = av_default_item_name,
    //  .option     = options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_fifo_test_muxer = {
    //  .name           = "fifo_test",
    //  .long_name      = "Fifo test muxer",
    //  .priv_data_size = sizeof(FailingMuxerContext),
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );   = failing_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );   = failing_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );  = failing_write_trailer,
    [CCode (cname="", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    );         = failing_deinit,
    //  .priv_class     = &failing_muxer_class,
    //  .flags          = AVFMT_NOFILE | AVFMT_ALLOW_FLUSH,
};

