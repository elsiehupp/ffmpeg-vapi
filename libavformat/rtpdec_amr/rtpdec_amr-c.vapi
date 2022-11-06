/*
 * RTP AMR Depacketizer, RFC 3267
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

const RTPDynamicProtocolHandler ff_amr_nb_dynamic_handler = {
    .enc_name         = "AMR",
    .codec_type       = AVMEDIA_TYPE_AUDIO,
    .codec_id         = AV_CODEC_ID_AMR_NB,
    .priv_data_size   = sizeof(PayloadContext),
    .init             = amr_init,
    .parse_sdp_a_line = amr_parse_sdp_line,
    .parse_packet     = amr_handle_packet,
};

const RTPDynamicProtocolHandler ff_amr_wb_dynamic_handler = {
    .enc_name         = "AMR-WB",
    .codec_type       = AVMEDIA_TYPE_AUDIO,
    .codec_id         = AV_CODEC_ID_AMR_WB,
    .priv_data_size   = sizeof(PayloadContext),
    .init             = amr_init,
    .parse_sdp_a_line = amr_parse_sdp_line,
    .parse_packet     = amr_handle_packet,
};
