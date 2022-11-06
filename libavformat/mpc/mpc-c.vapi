/*
 * Musepack demuxer
 * Copyright (c) 2006 Konstantin Shishkov
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

AVInputFormat ff_mpc_demuxer = {
    .name           = "mpc",
    .long_name      = NULL_IF_CONFIG_SMALL("Musepack"),
    .priv_data_size = sizeof(MPCContext),
    .read_probe     = mpc_probe,
    .read_header    = mpc_read_header,
    .read_packet    = mpc_read_packet,
    .read_close     = mpc_read_close,
    .read_seek      = mpc_read_seek,
    .extensions     = "mpc",
};
