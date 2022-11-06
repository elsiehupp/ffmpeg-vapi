/*
 * RTP Depacketization of QCELP/PureVoice, RFC 2658
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

const RTPDynamicProtocolHandler ff_qcelp_dynamic_handler = {
    .enc_name           = "x-Purevoice",
    .codec_type         = AVMEDIA_TYPE_AUDIO,
    .codec_id           = AV_CODEC_ID_QCELP,
    .priv_data_size     = sizeof(PayloadContext),
    .static_payload_id  = 12,
    .parse_packet       = qcelp_parse_packet,
};
