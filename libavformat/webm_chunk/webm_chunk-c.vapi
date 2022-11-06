/*
 * Copyright (c) 2015, Vignesh Venkatasubramanian
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
 * @file WebM Chunk Muxer
 * The chunk muxer enables writing WebM Live chunks where there is a header
 * chunk, followed by data chunks where each Cluster is written out as a Chunk.
 */

#define OFFSET(x) offsetof(WebMChunkContext, x)
static const AVOption options[] = {
    { "chunk_start_index",  "start index of the chunk", OFFSET(chunk_start_index), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
    { "header", "filename of the header where the initialization data will be written", OFFSET(header_filename), AV_OPT_TYPE_STRING, { 0 }, 0, 0, AV_OPT_FLAG_ENCODING_PARAM },
    { "audio_chunk_duration", "duration of each chunk in milliseconds", OFFSET(chunk_duration), AV_OPT_TYPE_INT, {.i64 = 5000}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
    { "method", "set the HTTP method", OFFSET(http_method), AV_OPT_TYPE_STRING, {.str = NULL},  0, 0, AV_OPT_FLAG_ENCODING_PARAM },
    { NULL },
};

#if CONFIG_WEBM_CHUNK_MUXER
static const AVClass webm_chunk_class = {
    .class_name = "WebM Chunk Muxer",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_webm_chunk_muxer = {
    .name           = "webm_chunk",
    .long_name      = NULL_IF_CONFIG_SMALL("WebM Chunk Muxer"),
    .mime_type      = "video/webm",
    .extensions     = "chk",
    .flags          = AVFMT_NOFILE | AVFMT_GLOBALHEADER | AVFMT_NEEDNUMBER |
                      AVFMT_TS_NONSTRICT,
    .priv_data_size = sizeof(WebMChunkContext),
    .write_header   = webm_chunk_write_header,
    .write_packet   = webm_chunk_write_packet,
    .write_trailer  = webm_chunk_write_trailer,
    .priv_class     = &webm_chunk_class,
};
#endif
