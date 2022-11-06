/*
 * Megalux Frame demuxer
 * Copyright (c) 2010 Peter Ross <pross@xvid.org>
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
 * Megalux Frame demuxer
 */

AVInputFormat ff_frm_demuxer = {
    .name           = "frm",
    .priv_data_size = sizeof(FrmContext),
    .long_name      = NULL_IF_CONFIG_SMALL("Megalux Frame"),
    .read_probe     = frm_read_probe,
    .read_header    = frm_read_header,
    .read_packet    = frm_read_packet,
};
