/*
 * Copyright (c) 2012 Clément Bœsch
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
 * SAMI subtitle demuxer
 * @see http://msdn.microsoft.com/en-us/library/ms971327.aspx
 */

AVInputFormat ff_sami_demuxer = {
    .name           = "sami",
    .long_name      = NULL_IF_CONFIG_SMALL("SAMI subtitle format"),
    .priv_data_size = sizeof(SAMIContext),
    .read_probe     = sami_probe,
    .read_header    = sami_read_header,
    .read_packet    = sami_read_packet,
    .read_seek2     = sami_read_seek,
    .read_close     = sami_read_close,
    .extensions     = "smi,sami",
};
