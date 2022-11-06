/*
 * SBG (SBaGen) file format decoder
 * Copyright (c) 2011 Nicolas George
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

static const AVOption sbg_options[] = {
    { "sample_rate", "", offsetof(struct sbg_demuxer, sample_rate),
      AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX,
      AV_OPT_FLAG_DECODING_PARAM },
    { "frame_size", "", offsetof(struct sbg_demuxer, frame_size),
      AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX,
      AV_OPT_FLAG_DECODING_PARAM },
    { "max_file_size", "", offsetof(struct sbg_demuxer, max_file_size),
      AV_OPT_TYPE_INT, { .i64 = 5000000 }, 0, INT_MAX,
      AV_OPT_FLAG_DECODING_PARAM },
    { NULL },
};

static const AVClass sbg_demuxer_class = {
    .class_name = "sbg_demuxer",
    .item_name  = av_default_item_name,
    .option     = sbg_options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_sbg_demuxer = {
    .name           = "sbg",
    .long_name      = NULL_IF_CONFIG_SMALL("SBaGen binaural beats script"),
    .priv_data_size = sizeof(struct sbg_demuxer),
    .read_probe     = sbg_read_probe,
    .read_header    = sbg_read_header,
    .read_packet    = sbg_read_packet,
    .read_seek      = sbg_read_seek,
    .read_seek2     = sbg_read_seek2,
    .extensions     = "sbg",
    .priv_class     = &sbg_demuxer_class,
};
