/*
 * RTSP muxer
 * Copyright (c) 2010 Martin Storsjo
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

static const AVClass rtsp_muxer_class = {
    .class_name = "RTSP muxer",
    .item_name  = av_default_item_name,
    .option     = ff_rtsp_options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_rtsp_muxer = {
    .name              = "rtsp",
    .long_name         = NULL_IF_CONFIG_SMALL("RTSP output"),
    .priv_data_size    = sizeof(RTSPState),
    .audio_codec       = AV_CODEC_ID_AAC,
    .video_codec       = AV_CODEC_ID_MPEG4,
    .write_header      = rtsp_write_header,
    .write_packet      = rtsp_write_packet,
    .write_trailer     = rtsp_write_close,
    .flags             = AVFMT_NOFILE | AVFMT_GLOBALHEADER,
    .priv_class        = &rtsp_muxer_class,
};