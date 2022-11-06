/*
 * Cryo Interactive Entertainment HNM4 demuxer
 *
 * Copyright (c) 2012 David Kment
 *
 * This file is part of FFmpeg .
 *
 * FFmpeg  is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg  is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg ; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

AVInputFormat ff_hnm_demuxer = {
    .name           = "hnm",
    .long_name      = NULL_IF_CONFIG_SMALL("Cryo HNM v4"),
    .priv_data_size = sizeof(Hnm4DemuxContext),
    .read_probe     = hnm_probe,
    .read_header    = hnm_read_header,
    .read_packet    = hnm_read_packet,
    .read_close     = hnm_read_close,
    .flags          = AVFMT_NO_BYTE_SEEK | AVFMT_NOGENSEARCH | AVFMT_NOBINSEARCH
};
