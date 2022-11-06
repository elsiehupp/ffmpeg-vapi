/*
 * Microsoft Advanced Streaming Format demuxer
 * Copyright (c) 2014 Alexandra Hájková
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

AVInputFormat ff_asf_o_demuxer = {
    .name           = "asf_o",
    .long_name      = NULL_IF_CONFIG_SMALL("ASF (Advanced / Active Streaming Format)"),
    .priv_data_size = sizeof(ASFContext),
    .read_probe     = asf_probe,
    .read_header    = asf_read_header,
    .read_packet    = asf_read_packet,
    .read_close     = asf_read_close,
    .read_timestamp = asf_read_timestamp,
    .read_seek      = asf_read_seek,
    .flags          = AVFMT_NOBINSEARCH | AVFMT_NOGENSEARCH,
};
