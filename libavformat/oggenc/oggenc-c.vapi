/*
 * Ogg muxer
 * Copyright (c) 2007 Baptiste Coudurier <baptiste dot coudurier at free dot fr>
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

#define OFFSET(x) offsetof(OGGContext, x)
#define PARAM AV_OPT_FLAG_ENCODING_PARAM

static const AVOption options[] = {
    { "serial_offset", "serial number offset",
        OFFSET(serial_offset), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX, PARAM },
    { "oggpagesize", "Set preferred Ogg page size.",
      OFFSET(pref_size), AV_OPT_TYPE_INT, {.i64 = 0}, 0, MAX_PAGE_SIZE, PARAM},
    { "pagesize", "preferred page size in bytes (deprecated)",
        OFFSET(pref_size), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, MAX_PAGE_SIZE, PARAM },
    { "page_duration", "preferred page duration, in microseconds",
        OFFSET(pref_duration), AV_OPT_TYPE_INT64, { .i64 = 1000000 }, 0, INT64_MAX, PARAM },
    { NULL },
};

#define OGG_CLASS(flavor, name)\
static const AVClass flavor ## _muxer_class = {\
    .class_name = #name " muxer",\
    .item_name  = av_default_item_name,\
    .option     = options,\
    .version    = LIBAVUTIL_VERSION_INT,\
};

#if CONFIG_OGG_MUXER
OGG_CLASS(ogg, Ogg)
AVOutputFormat ff_ogg_muxer = {
    .name              = "ogg",
    .long_name         = NULL_IF_CONFIG_SMALL("Ogg"),
    .mime_type         = "application/ogg",
    .extensions        = "ogg"
#if !CONFIG_OGV_MUXER
                         ",ogv"
#endif
#if !CONFIG_SPX_MUXER
                         ",spx"
#endif
#if !CONFIG_OPUS_MUXER
                         ",opus"
#endif
                         ,
    .priv_data_size    = sizeof(OGGContext),
    .audio_codec       = CONFIG_LIBVORBIS_ENCODER ?
                         AV_CODEC_ID_VORBIS : AV_CODEC_ID_FLAC,
    .video_codec       = AV_CODEC_ID_THEORA,
    .init              = ogg_init,
    .write_header      = ogg_write_header,
    .write_packet      = ogg_write_packet,
    .write_trailer     = ogg_write_trailer,
    .deinit            = ogg_free,
    .flags             = AVFMT_TS_NEGATIVE | AVFMT_TS_NONSTRICT | AVFMT_ALLOW_FLUSH,
    .priv_class        = &ogg_muxer_class,
};
#endif

#if CONFIG_OGA_MUXER
OGG_CLASS(oga, Ogg audio)
AVOutputFormat ff_oga_muxer = {
    .name              = "oga",
    .long_name         = NULL_IF_CONFIG_SMALL("Ogg Audio"),
    .mime_type         = "audio/ogg",
    .extensions        = "oga",
    .priv_data_size    = sizeof(OGGContext),
    .audio_codec       = AV_CODEC_ID_FLAC,
    .init              = ogg_init,
    .write_header      = ogg_write_header,
    .write_packet      = ogg_write_packet,
    .write_trailer     = ogg_write_trailer,
    .deinit            = ogg_free,
    .flags             = AVFMT_TS_NEGATIVE | AVFMT_ALLOW_FLUSH,
    .priv_class        = &oga_muxer_class,
};
#endif

#if CONFIG_OGV_MUXER
OGG_CLASS(ogv, Ogg video)
AVOutputFormat ff_ogv_muxer = {
    .name              = "ogv",
    .long_name         = NULL_IF_CONFIG_SMALL("Ogg Video"),
    .mime_type         = "video/ogg",
    .extensions        = "ogv",
    .priv_data_size    = sizeof(OGGContext),
    .audio_codec       = CONFIG_LIBVORBIS_ENCODER ?
                         AV_CODEC_ID_VORBIS : AV_CODEC_ID_FLAC,
    .video_codec       = CONFIG_LIBTHEORA_ENCODER ?
                         AV_CODEC_ID_THEORA : AV_CODEC_ID_VP8,
    .init              = ogg_init,
    .write_header      = ogg_write_header,
    .write_packet      = ogg_write_packet,
    .write_trailer     = ogg_write_trailer,
    .deinit            = ogg_free,
    .flags             = AVFMT_TS_NEGATIVE | AVFMT_TS_NONSTRICT | AVFMT_ALLOW_FLUSH,
    .priv_class        = &ogv_muxer_class,
};
#endif

#if CONFIG_SPX_MUXER
OGG_CLASS(spx, Ogg Speex)
AVOutputFormat ff_spx_muxer = {
    .name              = "spx",
    .long_name         = NULL_IF_CONFIG_SMALL("Ogg Speex"),
    .mime_type         = "audio/ogg",
    .extensions        = "spx",
    .priv_data_size    = sizeof(OGGContext),
    .audio_codec       = AV_CODEC_ID_SPEEX,
    .init              = ogg_init,
    .write_header      = ogg_write_header,
    .write_packet      = ogg_write_packet,
    .write_trailer     = ogg_write_trailer,
    .deinit            = ogg_free,
    .flags             = AVFMT_TS_NEGATIVE | AVFMT_ALLOW_FLUSH,
    .priv_class        = &spx_muxer_class,
};
#endif

#if CONFIG_OPUS_MUXER
OGG_CLASS(opus, Ogg Opus)
AVOutputFormat ff_opus_muxer = {
    .name              = "opus",
    .long_name         = NULL_IF_CONFIG_SMALL("Ogg Opus"),
    .mime_type         = "audio/ogg",
    .extensions        = "opus",
    .priv_data_size    = sizeof(OGGContext),
    .audio_codec       = AV_CODEC_ID_OPUS,
    .init              = ogg_init,
    .write_header      = ogg_write_header,
    .write_packet      = ogg_write_packet,
    .write_trailer     = ogg_write_trailer,
    .deinit            = ogg_free,
    .flags             = AVFMT_TS_NEGATIVE | AVFMT_ALLOW_FLUSH,
    .priv_class        = &opus_muxer_class,
};
#endif
