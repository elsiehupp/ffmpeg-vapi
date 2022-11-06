/*
 * Realmedia RTSP protocol (RDT) support.
 * Copyright (c) 2007 Ronald S. Bultje
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
 * @file
 * @brief Realmedia RTSP protocol (RDT) support
 * @author Ronald S. Bultje <rbultje@ronald.bitfreak.net>
 */

#define RDT_HANDLER(n, s, t) \
RTPDynamicProtocolHandler ff_rdt_ ## n ## _handler = { \
    .enc_name         = s, \
    .codec_type       = t, \
    .codec_id         = AV_CODEC_ID_NONE, \
    .priv_data_size   = sizeof(PayloadContext), \
    .init             = rdt_init, \
    .parse_sdp_a_line = rdt_parse_sdp_line, \
    .close            = rdt_close_context, \
    .parse_packet     = rdt_parse_packet \
}

RDT_HANDLER(live_video, "x-pn-multirate-realvideo-live", AVMEDIA_TYPE_VIDEO);
RDT_HANDLER(live_audio, "x-pn-multirate-realaudio-live", AVMEDIA_TYPE_AUDIO);
RDT_HANDLER(video,      "x-pn-realvideo",                AVMEDIA_TYPE_VIDEO);
RDT_HANDLER(audio,      "x-pn-realaudio",                AVMEDIA_TYPE_AUDIO);

