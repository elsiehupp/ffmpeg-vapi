/*
 * AVI demuxer
 * Copyright (c) 2001 Fabrice Bellard
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

static const AVOption options[] = {
    { "use_odml", "use odml index", offsetof(AVIContext, use_odml), AV_OPT_TYPE_BOOL, {.i64 = 1}, -1, 1, AV_OPT_FLAG_DECODING_PARAM},
    { NULL },
};

static const AVClass demuxer_class = {
    .class_name = "avi",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
    .category   = AV_CLASS_CATEGORY_DEMUXER,
};

AVInputFormat ff_avi_demuxer = {
    .name           = "avi",
    .long_name      = NULL_IF_CONFIG_SMALL("AVI (Audio Video Interleaved)"),
    .priv_data_size = sizeof(AVIContext),
    .extensions     = "avi",
    .read_probe     = avi_probe,
    .read_header    = avi_read_header,
    .read_packet    = avi_read_packet,
    .read_close     = avi_read_close,
    .read_seek      = avi_read_seek,
    .priv_class = &demuxer_class,
};
