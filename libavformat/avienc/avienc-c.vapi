/*
 * AVI muxer
 * Copyright (c) 2000 Fabrice Bellard
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

#define OFFSET(x) offsetof(AVIContext, x)
#define ENC AV_OPT_FLAG_ENCODING_PARAM
static const AVOption options[] = {
    { "reserve_index_space", "reserve space (in bytes) at the beginning of the file for each stream index", OFFSET(reserve_index_space), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX, ENC },
    { "write_channel_mask", "write channel mask into wave format header", OFFSET(write_channel_mask), AV_OPT_TYPE_BOOL, { .i64 = 1 }, 0, 1, ENC },
    { NULL },
};

static const AVClass avi_muxer_class = {
    .class_name = "AVI muxer",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_avi_muxer = {
    .name           = "avi",
    .long_name      = NULL_IF_CONFIG_SMALL("AVI (Audio Video Interleaved)"),
    .mime_type      = "video/x-msvideo",
    .extensions     = "avi",
    .priv_data_size = sizeof(AVIContext),
    .audio_codec    = CONFIG_LIBMP3LAME ? AV_CODEC_ID_MP3 : AV_CODEC_ID_AC3,
    .video_codec    = AV_CODEC_ID_MPEG4,
    .init           = avi_init,
    .write_header   = avi_write_header,
    .write_packet   = avi_write_packet,
    .write_trailer  = avi_write_trailer,
    .codec_tag      = (const AVCodecTag * const []) {
        ff_codec_bmp_tags, ff_codec_wav_tags, 0
    },
    .priv_class     = &avi_muxer_class,
};
