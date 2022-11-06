/*
 * ISS (.iss) file demuxer
 * Copyright (c) 2008 Jaikrishnan Menon <realityman@gmx.net>
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
 * Funcom ISS file demuxer
 * @author Jaikrishnan Menon
 * @see http://wiki.multimedia.cx/index.php?title=FunCom_ISS
 */

AVInputFormat ff_iss_demuxer = {
    .name           = "iss",
    .long_name      = NULL_IF_CONFIG_SMALL("Funcom ISS"),
    .priv_data_size = sizeof(IssDemuxContext),
    .read_probe     = iss_probe,
    .read_header    = iss_read_header,
    .read_packet    = iss_read_packet,
};
