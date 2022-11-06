/*
 * RTP parser for AC3 payload format (RFC 4184)
 * Copyright (c) 2015 Gilles Chanteperdrix <gch@xenomai.org>
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

const RTPDynamicProtocolHandler ff_ac3_dynamic_handler = {
    .enc_name           = "ac3",
    .codec_type         = AVMEDIA_TYPE_AUDIO,
    .codec_id           = AV_CODEC_ID_AC3,
    .need_parsing       = AVSTREAM_PARSE_FULL,
    .priv_data_size     = sizeof(PayloadContext),
    .close              = ac3_close_context,
    .parse_packet       = ac3_handle_packet,
};
