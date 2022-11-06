/*
 * Raw v210 video demuxer
 * Copyright (c) 2015 Tiancheng "Timothy" Gu
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

#define OFFSET(x) offsetof(V210DemuxerContext, x)
#define DEC AV_OPT_FLAG_DECODING_PARAM
static const AVOption v210_options[] = {
    { "video_size", "set frame size", OFFSET(width), AV_OPT_TYPE_IMAGE_SIZE, {.str = NULL}, 0, 0, DEC },
    { "framerate", "set frame rate", OFFSET(framerate), AV_OPT_TYPE_VIDEO_RATE, {.str = "25"}, 0, INT_MAX, DEC },
    { NULL },
};

#if CONFIG_V210_DEMUXER
static const AVClass v210_demuxer_class = {
    //  .class_name = "v210 demuxer",
    //  .item_name  = av_default_item_name,
    //  .option     = v210_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_v210_demuxer = {
    //  .name           = "v210",
    //  .long_name      = "Uncompressed 4:2:2 10-bit",
    //  .priv_data_size = sizeof(V210DemuxerContext),
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = v210_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = v210_read_packet,
    //  .flags          = AVFMT_GENERIC_INDEX,
    //  .extensions     = "v210",
    //  .raw_codec_id   = AV_CODEC_ID_V210,
    //  .priv_class     = &v210_demuxer_class,
};
#endif // CONFIG_V210_DEMUXER

#if CONFIG_V210X_DEMUXER
static const AVClass v210x_demuxer_class = {
    //  .class_name = "v210x demuxer",
    //  .item_name  = av_default_item_name,
    //  .option     = v210_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_v210x_demuxer = {
    //  .name           = "v210x",
    //  .long_name      = "Uncompressed 4:2:2 10-bit",
    //  .priv_data_size = sizeof(V210DemuxerContext),
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = v210_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = v210_read_packet,
    //  .flags          = AVFMT_GENERIC_INDEX,
    //  .extensions     = "yuv10",
    //  .raw_codec_id   = AV_CODEC_ID_V210X,
    //  .priv_class     = &v210x_demuxer_class,
};
#endif // CONFIG_V210X_DEMUXER
