/*
 * Sierra SOL demuxer
 * Copyright Konstantin Shishkov
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

/*
 * Based on documents from Game Audio Player and own research
 */

AVInputFormat ff_sol_demuxer = {
    .name           = "sol",
    .long_name      = NULL_IF_CONFIG_SMALL("Sierra SOL"),
    .read_probe     = sol_probe,
    .read_header    = sol_read_header,
    .read_packet    = sol_read_packet,
    .read_seek      = ff_pcm_read_seek,
};
