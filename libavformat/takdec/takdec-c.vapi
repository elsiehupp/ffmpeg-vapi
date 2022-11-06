/*
 * Raw TAK demuxer
 * Copyright (c) 2012 Paul B Mahol
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

FF_RAW_DEMUXER_CLASS(tak)
AVInputFormat ff_tak_demuxer = {
    .name           = "tak",
    .long_name      = NULL_IF_CONFIG_SMALL("raw TAK"),
    .priv_data_size = sizeof(TAKDemuxContext),
    .read_probe     = tak_probe,
    .read_header    = tak_read_header,
    .read_packet    = raw_read_packet,
    .flags          = AVFMT_GENERIC_INDEX,
    .extensions     = "tak",
    .raw_codec_id   = AV_CODEC_ID_TAK,
    .priv_class     = &tak_demuxer_class,
};
