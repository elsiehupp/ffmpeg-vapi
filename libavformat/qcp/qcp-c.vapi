/*
 * QCP format (.qcp) demuxer
 * Copyright (c) 2009 Kenan Gillet
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
 * QCP format (.qcp) demuxer
 * @author Kenan Gillet
 * @see RFC 3625: "The QCP File Format and Media Types for Speech Data"
 *     http://tools.ietf.org/html/rfc3625
 */

AVInputFormat ff_qcp_demuxer = {
    .name           = "qcp",
    .long_name      = NULL_IF_CONFIG_SMALL("QCP"),
    .priv_data_size = sizeof(QCPContext),
    .read_probe     = qcp_probe,
    .read_header    = qcp_read_header,
    .read_packet    = qcp_read_packet,
};
