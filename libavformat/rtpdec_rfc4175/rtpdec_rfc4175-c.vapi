/*
 * RTP Depacketization of RAW video (TR-03)
 * Copyright (c) 2016 Savoir-faire Linux, Inc
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

/* Development sponsored by CBC/Radio-Canada */

const RTPDynamicProtocolHandler ff_rfc4175_rtp_handler = {
    .enc_name           = "raw",
    .codec_type         = AVMEDIA_TYPE_VIDEO,
    .codec_id           = AV_CODEC_ID_BITPACKED,
    .priv_data_size     = sizeof(PayloadContext),
    .parse_sdp_a_line   = rfc4175_parse_sdp_line,
    .parse_packet       = rfc4175_handle_packet,
};
