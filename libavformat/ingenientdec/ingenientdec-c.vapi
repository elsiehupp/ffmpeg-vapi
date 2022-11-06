/*
 * RAW Ingenient MJPEG demuxer
 * Copyright (c) 2005 Alex Beregszaszi
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

FF_RAWVIDEO_DEMUXER_CLASS(ingenient)

AVInputFormat ff_ingenient_demuxer = {
    .name           = "ingenient",
    .long_name      = NULL_IF_CONFIG_SMALL("raw Ingenient MJPEG"),
    .priv_data_size = sizeof(FFRawVideoDemuxerContext),
    .read_probe     = ingenient_probe,
    .read_header    = ff_raw_video_read_header,
    .read_packet    = ingenient_read_packet,
    .flags          = AVFMT_GENERIC_INDEX,
    .extensions     = "cgi", // FIXME
    .raw_codec_id   = AV_CODEC_ID_MJPEG,
    .priv_class     = &ingenient_demuxer_class,
};
