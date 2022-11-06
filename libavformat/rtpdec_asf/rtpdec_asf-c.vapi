/*
 * Microsoft RTP/ASF support.
 * Copyright (c) 2008 Ronald S. Bultje
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
 * @brief Microsoft RTP/ASF support
 * @author Ronald S. Bultje <rbultje@ronald.bitfreak.net>
 */

#define RTP_ASF_HANDLER(n, s, t) \
const RTPDynamicProtocolHandler ff_ms_rtp_ ## n ## _handler = { \
    .enc_name         = s, \
    .codec_type       = t, \
    .codec_id         = AV_CODEC_ID_NONE, \
    .priv_data_size   = sizeof(PayloadContext), \
    .parse_sdp_a_line = asfrtp_parse_sdp_line, \
    .close            = asfrtp_close_context, \
    .parse_packet     = asfrtp_parse_packet,   \
}

RTP_ASF_HANDLER(asf_pfv, "x-asf-pf",  AVMEDIA_TYPE_VIDEO);
RTP_ASF_HANDLER(asf_pfa, "x-asf-pf",  AVMEDIA_TYPE_AUDIO);
