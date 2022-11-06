/*
 * ADTS muxer.
 * Copyright (c) 2006 Baptiste Coudurier <baptiste.coudurier@smartjog.com>
 *                    Mans Rullgard <mans@mansr.com>
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

#define ENC AV_OPT_FLAG_ENCODING_PARAM
#define OFFSET(obj) offsetof(ADTSContext, obj)
static const AVOption options[] = {
    { "write_id3v2",  "Enable ID3v2 tag writing", OFFSET(id3v2tag), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, ENC},
    { "write_apetag", "Enable APE tag writing",   OFFSET(apetag),   AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, ENC},
    { NULL },
};

static const AVClass adts_muxer_class = {
    .class_name     = "ADTS muxer",
    .item_name      = av_default_item_name,
    .option         = options,
    .version        = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_adts_muxer = {
    .name              = "adts",
    .long_name         = NULL_IF_CONFIG_SMALL("ADTS AAC (Advanced Audio Coding)"),
    .mime_type         = "audio/aac",
    .extensions        = "aac,adts",
    .priv_data_size    = sizeof(ADTSContext),
    .audio_codec       = AV_CODEC_ID_AAC,
    .video_codec       = AV_CODEC_ID_NONE,
    .init              = adts_init,
    .write_header      = adts_write_header,
    .write_packet      = adts_write_packet,
    .write_trailer     = adts_write_trailer,
    .priv_class        = &adts_muxer_class,
    .flags             = AVFMT_NOTIMESTAMPS,
};
