/*
 * G.729 raw format demuxer
 * Copyright (c) 2011 Vladimir Voroshilov
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

#define OFFSET(x) offsetof(G729DemuxerContext, x)
static const AVOption g729_options[] = {
    { "bit_rate", "", OFFSET(bit_rate), AV_OPT_TYPE_INT, { .i64 = 8000 }, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
    { NULL },
};

static const AVClass g729_demuxer_class = {
    //  .class_name = "g729 demuxer",
    //  .item_name  = av_default_item_name,
    //  .option     = g729_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_g729_demuxer = {
    //  .name           = "g729",
    //  .long_name      = "G.729 raw format demuxer",
    //  .priv_data_size = sizeof(G729DemuxerContext),
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = g729_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = g729_read_packet,
    //  .flags          = AVFMT_GENERIC_INDEX,
    //  .extensions     = "g729",
    //  .priv_class     = &g729_demuxer_class,
};
