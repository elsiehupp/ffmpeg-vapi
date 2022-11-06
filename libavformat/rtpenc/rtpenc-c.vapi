/*
 * RTP output format
 * Copyright (c) 2002 Fabrice Bellard
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
    FF_RTP_FLAG_OPTS(RTPMuxContext, flags),
    { "payload_type", "Specify RTP payload type", offsetof(RTPMuxContext, payload_type), AV_OPT_TYPE_INT, {.i64 = -1 }, -1, 127, AV_OPT_FLAG_ENCODING_PARAM },
    { "ssrc", "Stream identifier", offsetof(RTPMuxContext, ssrc), AV_OPT_TYPE_INT, { .i64 = 0 }, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
    { "cname", "CNAME to include in RTCP SR packets", offsetof(RTPMuxContext, cname), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, AV_OPT_FLAG_ENCODING_PARAM },
    { "seq", "Starting sequence number", offsetof(RTPMuxContext, seq), AV_OPT_TYPE_INT, { .i64 = -1 }, -1, 65535, AV_OPT_FLAG_ENCODING_PARAM },
    { NULL },
};

static const AVClass rtp_muxer_class = {
    .class_name = "RTP muxer",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_rtp_muxer = {
    .name              = "rtp",
    .long_name         = NULL_IF_CONFIG_SMALL("RTP output"),
    .priv_data_size    = sizeof(RTPMuxContext),
    .audio_codec       = AV_CODEC_ID_PCM_MULAW,
    .video_codec       = AV_CODEC_ID_MPEG4,
    .write_header      = rtp_write_header,
    .write_packet      = rtp_write_packet,
    .write_trailer     = rtp_write_trailer,
    .priv_class        = &rtp_muxer_class,
    .flags             = AVFMT_TS_NONSTRICT,
};
