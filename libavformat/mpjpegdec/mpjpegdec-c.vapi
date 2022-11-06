/*
 * Multipart JPEG format
 * Copyright (c) 2015 Luca Barbato
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

#define OFFSET(x) offsetof(MPJPEGDemuxContext, x)
#define DEC AV_OPT_FLAG_DECODING_PARAM
static const AVOption mpjpeg_options[] = {
    { "strict_mime_boundary",  "require MIME boundaries match", OFFSET(strict_mime_boundary), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, DEC },
    { NULL }
};


static const AVClass mpjpeg_demuxer_class = {
    .class_name     = "MPJPEG demuxer",
    .item_name      = av_default_item_name,
    .option         = mpjpeg_options,
    .version        = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_mpjpeg_demuxer = {
    .name              = "mpjpeg",
    .long_name         = NULL_IF_CONFIG_SMALL("MIME multipart JPEG"),
    .mime_type         = "multipart/x-mixed-replace",
    .extensions        = "mjpg",
    .priv_data_size    = sizeof(MPJPEGDemuxContext),
    .read_probe        = mpjpeg_read_probe,
    .read_header       = mpjpeg_read_header,
    .read_packet       = mpjpeg_read_packet,
    .read_close        = mpjpeg_read_close,
    .priv_class        = &mpjpeg_demuxer_class,
    .flags             = AVFMT_NOTIMESTAMPS,
};


