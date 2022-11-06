/*
 * Xiph RTP Protocols
 * Copyright (c) 2009 Colin McQuillian
 * Copyright (c) 2010 Josh Allmann
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
 * @brief Xiph / RTP Code
 * @author Colin McQuillan <m.niloc@gmail.com>
 * @author Josh Allmann <joshua.allmann@gmail.com>
 */

const RTPDynamicProtocolHandler ff_theora_dynamic_handler = {
    .enc_name         = "theora",
    .codec_type       = AVMEDIA_TYPE_VIDEO,
    .codec_id         = AV_CODEC_ID_THEORA,
    .priv_data_size   = sizeof(PayloadContext),
    .parse_sdp_a_line = xiph_parse_sdp_line,
    .close            = xiph_close_context,
    .parse_packet     = xiph_handle_packet,
};

const RTPDynamicProtocolHandler ff_vorbis_dynamic_handler = {
    .enc_name         = "vorbis",
    .codec_type       = AVMEDIA_TYPE_AUDIO,
    .codec_id         = AV_CODEC_ID_VORBIS,
    .need_parsing     = AVSTREAM_PARSE_HEADERS,
    .priv_data_size   = sizeof(PayloadContext),
    .parse_sdp_a_line = xiph_parse_sdp_line,
    .close            = xiph_close_context,
    .parse_packet     = xiph_handle_packet,
};
