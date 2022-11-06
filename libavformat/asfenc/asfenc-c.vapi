/*
 * ASF muxer
 * Copyright (c) 2000, 2001 Fabrice Bellard
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

static const AVOption asf_options[] = {
    { "packet_size", "Packet size", offsetof(ASFContext, packet_size), AV_OPT_TYPE_INT, {.i64 = 3200}, PACKET_SIZE_MIN, PACKET_SIZE_MAX, AV_OPT_FLAG_ENCODING_PARAM },
    { NULL },
};

#if CONFIG_ASF_MUXER
static const AVClass asf_muxer_class = {
    //  .class_name     = "ASF muxer",
    //  .item_name      = av_default_item_name,
    //  .option         = asf_options,
    //  .version        = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_asf_muxer = {
    //  .name           = "asf",
    //  .long_name      = "ASF (Advanced / Active Streaming Format)",
    //  .mime_type      = "video/x-ms-asf",
    //  .extensions     = "asf,wmv,wma",
    //  .priv_data_size = sizeof(ASFContext),
    //  .audio_codec    = AV_CODEC_ID_WMAV2,
    //  .video_codec    = AV_CODEC_ID_MSMPEG4V3,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );   = asf_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );   = asf_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );  = asf_write_trailer,
    //  .flags          = AVFMT_GLOBALHEADER,
    //  .codec_tag      = (const AVCodecTag * const []) {
        codec_asf_bmp_tags, ff_codec_bmp_tags, ff_codec_wav_tags, 0
    },
    //  .priv_class        = &asf_muxer_class,
};
#endif /* CONFIG_ASF_MUXER */

#if CONFIG_ASF_STREAM_MUXER
static const AVClass asf_stream_muxer_class = {
    //  .class_name     = "ASF stream muxer",
    //  .item_name      = av_default_item_name,
    //  .option         = asf_options,
    //  .version        = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_asf_stream_muxer = {
    //  .name           = "asf_stream",
    //  .long_name      = "ASF (Advanced / Active Streaming Format)",
    //  .mime_type      = "video/x-ms-asf",
    //  .extensions     = "asf,wmv,wma",
    //  .priv_data_size = sizeof(ASFContext),
    //  .audio_codec    = AV_CODEC_ID_WMAV2,
    //  .video_codec    = AV_CODEC_ID_MSMPEG4V3,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );   = asf_write_stream_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );   = asf_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );  = asf_write_trailer,
    //  .flags          = AVFMT_GLOBALHEADER,
    //  .codec_tag      = (const AVCodecTag * const []) {
        codec_asf_bmp_tags, ff_codec_bmp_tags, ff_codec_wav_tags, 0
    },
    //  .priv_class        = &asf_stream_muxer_class,
};
#endif /* CONFIG_ASF_STREAM_MUXER */
