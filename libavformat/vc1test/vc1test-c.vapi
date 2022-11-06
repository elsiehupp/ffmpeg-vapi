/*
 * VC1 Test Bitstreams Format Demuxer
 * Copyright (c) 2006, 2008 Konstantin Shishkov
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
 * VC1 test bitstream file demuxer
 * by Konstantin Shishkov
 * Format specified in SMPTE standard 421 Annex L
 */

AVInputFormat ff_vc1t_demuxer = {
    .name           = "vc1test",
    .long_name      = NULL_IF_CONFIG_SMALL("VC-1 test bitstream"),
    .read_probe     = vc1t_probe,
    .read_header    = vc1t_read_header,
    .read_packet    = vc1t_read_packet,
    .extensions     = "rcv",
    .flags          = AVFMT_GENERIC_INDEX,
};