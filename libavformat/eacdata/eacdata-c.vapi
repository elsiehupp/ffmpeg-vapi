/*
 * Electronic Arts .cdata file Demuxer
 * Copyright (c) 2007 Peter Ross
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
 * Electronic Arts cdata Format Demuxer
 * by Peter Ross (pross@xvid.org)
 *
 * Technical details here:
 *  http://wiki.multimedia.cx/index.php?title=EA_Command_And_Conquer_3_Audio_Codec
 */

AVInputFormat ff_ea_cdata_demuxer = {
    .name           = "ea_cdata",
    .long_name      = NULL_IF_CONFIG_SMALL("Electronic Arts cdata"),
    .priv_data_size = sizeof(CdataDemuxContext),
    .read_probe     = cdata_probe,
    .read_header    = cdata_read_header,
    .read_packet    = cdata_read_packet,
    .extensions = "cdata",
};
