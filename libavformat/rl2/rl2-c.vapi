/*
 * RL2 Format Demuxer
 * Copyright (c) 2008 Sascha Sommer (saschasommer@freenet.de)
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
 * RL2 file demuxer
 * @file
 * @author Sascha Sommer (saschasommer@freenet.de)
 * @see http://wiki.multimedia.cx/index.php?title=RL2
 *
 * extradata:
 * 2 byte le initial drawing offset within 320x200 viewport
 * 4 byte le number of used colors
 * 256 * 3 bytes rgb palette
 * optional background_frame
 */

AVInputFormat ff_rl2_demuxer = {
    .name           = "rl2",
    .long_name      = NULL_IF_CONFIG_SMALL("RL2"),
    .priv_data_size = sizeof(Rl2DemuxContext),
    .read_probe     = rl2_probe,
    .read_header    = rl2_read_header,
    .read_packet    = rl2_read_packet,
    .read_seek      = rl2_read_seek,
};
