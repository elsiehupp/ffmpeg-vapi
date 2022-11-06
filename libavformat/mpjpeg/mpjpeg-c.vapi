/*
 * Multipart JPEG format
 * Copyright (c) 2000, 2001, 2002, 2003 Fabrice Bellard
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
    { "boundary_tag",    "Boundary tag", offsetof(MPJPEGContext, boundary_tag),   AV_OPT_TYPE_STRING, {.str = BOUNDARY_TAG}, .flags = AV_OPT_FLAG_ENCODING_PARAM },
    { NULL },
};

static const AVClass mpjpeg_muxer_class = {
    .class_name = "mpjpeg_muxer",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_mpjpeg_muxer = {
    .name              = "mpjpeg",
    .long_name         = NULL_IF_CONFIG_SMALL("MIME multipart JPEG"),
    .mime_type         = "multipart/x-mixed-replace;boundary=" BOUNDARY_TAG,
    .extensions        = "mjpg",
    .priv_data_size    = sizeof(MPJPEGContext),
    .audio_codec       = AV_CODEC_ID_NONE,
    .video_codec       = AV_CODEC_ID_MJPEG,
    .write_header      = mpjpeg_write_header,
    .write_packet      = mpjpeg_write_packet,
    .write_trailer     = mpjpeg_write_trailer,
    .flags             = AVFMT_NOTIMESTAMPS,
    .priv_class        = &mpjpeg_muxer_class,
};
