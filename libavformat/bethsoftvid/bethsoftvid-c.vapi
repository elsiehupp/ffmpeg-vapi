/*
 * Bethsoft VID format Demuxer
 * Copyright (c) 2007 Nicholas Tung
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
 * @brief Bethesda Softworks VID (.vid) file demuxer
 * @author Nicholas Tung [ntung (at. ntung com] (2007-03)
 * @see http://wiki.multimedia.cx/index.php?title=Bethsoft_VID
 * @see http://www.svatopluk.com/andux/docs/dfvid.html
 */

AVInputFormat ff_bethsoftvid_demuxer = {
    .name           = "bethsoftvid",
    .long_name      = NULL_IF_CONFIG_SMALL("Bethesda Softworks VID"),
    .priv_data_size = sizeof(BVID_DemuxContext),
    .read_probe     = vid_probe,
    .read_header    = vid_read_header,
    .read_packet    = vid_read_packet,
    .read_close     = vid_read_close,
};
