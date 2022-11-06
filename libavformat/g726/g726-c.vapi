/*
 * G.726 raw demuxer
 * Copyright 2017 Carl Eugen Hoyos
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

#define OFFSET(x) offsetof(G726Context, x)
static const AVOption options[] = {
    { "code_size", "Bits per G.726 code",
        OFFSET(code_size),   AV_OPT_TYPE_INT, {.i64 =    4}, 2,       5, AV_OPT_FLAG_DECODING_PARAM },
    { "sample_rate", "",
        OFFSET(sample_rate), AV_OPT_TYPE_INT, {.i64 = 8000}, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
    { NULL },
};

#if CONFIG_G726_DEMUXER
static const AVClass g726le_demuxer_class = {
    //  .class_name     = "G.726 big-endian demuxer",
    //  .item_name      = av_default_item_name,
    //  .option         = options,
    //  .version        = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_g726_demuxer = {
    //  .name           = "g726",
    //  .long_name      = "raw big-endian G.726 (\"left aligned\")",
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = g726_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = g726_read_packet,
    //  .priv_data_size = sizeof(G726Context),
    //  .priv_class     = &g726le_demuxer_class,
    //  .raw_codec_id   = AV_CODEC_ID_ADPCM_G726,
};
#endif

#if CONFIG_G726LE_DEMUXER
static const AVClass g726_demuxer_class = {
    //  .class_name     = "G.726 little-endian demuxer",
    //  .item_name      = av_default_item_name,
    //  .option         = options,
    //  .version        = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_g726le_demuxer = {
    //  .name           = "g726le",
    //  .long_name      = "raw little-endian G.726 (\"right aligned\")",
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = g726_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = g726_read_packet,
    //  .priv_data_size = sizeof(G726Context),
    //  .priv_class     = &g726_demuxer_class,
    //  .raw_codec_id   = AV_CODEC_ID_ADPCM_G726LE,
};
#endif

