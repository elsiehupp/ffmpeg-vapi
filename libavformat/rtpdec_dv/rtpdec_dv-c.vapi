/*
 * RTP parser for DV payload format (RFC 6469)
 * Copyright (c) 2015 Thomas Volkert <thomas@homer-conferencing.com>
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

const RTPDynamicProtocolHandler ff_dv_dynamic_handler = {
    .enc_name         = "DV",
    .codec_type       = AVMEDIA_TYPE_VIDEO,
    .codec_id         = AV_CODEC_ID_DVVIDEO,
    .need_parsing     = AVSTREAM_PARSE_FULL,
    .parse_sdp_a_line = dv_parse_sdp_line,
    .priv_data_size   = sizeof(PayloadContext),
    .close             = dv_close_context,
    .parse_packet     = dv_handle_packet,
};
