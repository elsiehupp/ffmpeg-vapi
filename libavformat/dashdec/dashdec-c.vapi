/*
 * Dynamic Adaptive Streaming over HTTP demux
 * Copyright (c) 2017 samsamsam@o2.pl based on HLS demux
 * Copyright (c) 2017 Steven Liu
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

#define OFFSET(x) offsetof(DASHContext, x)
#define FLAGS AV_OPT_FLAG_DECODING_PARAM
static const AVOption dash_options[] = {
    {"allowed_extensions", "List of file extensions that dash is allowed to access",
        OFFSET(allowed_extensions), AV_OPT_TYPE_STRING,
        {.str = "aac,m4a,m4s,m4v,mov,mp4,webm"},
        INT_MIN, INT_MAX, FLAGS},
    {NULL}
};

static const AVClass dash_class = {
    .class_name = "dash",
    .item_name  = av_default_item_name,
    .option     = dash_options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_dash_demuxer = {
    .name           = "dash",
    .long_name      = NULL_IF_CONFIG_SMALL("Dynamic Adaptive Streaming over HTTP"),
    .priv_class     = &dash_class,
    .priv_data_size = sizeof(DASHContext),
    .read_probe     = dash_probe,
    .read_header    = dash_read_header,
    .read_packet    = dash_read_packet,
    .read_close     = dash_close,
    .read_seek      = dash_read_seek,
    .flags          = AVFMT_NO_BYTE_SEEK,
};