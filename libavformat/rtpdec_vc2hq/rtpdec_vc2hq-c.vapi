/*
 * RTP parser for VC-2 HQ payload format (draft version 1) - experimental
 * Copyright (c) 2016 Thomas Volkert <thomas@netzeal.de>
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

const RTPDynamicProtocolHandler ff_vc2hq_dynamic_handler = {
    .enc_name         = "VC2",
    .codec_type       = AVMEDIA_TYPE_VIDEO,
    .codec_id         = AV_CODEC_ID_DIRAC,
    .priv_data_size   = sizeof(PayloadContext),
    .parse_packet     = vc2hq_handle_packet
};