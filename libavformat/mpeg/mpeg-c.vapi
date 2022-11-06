/*
 * MPEG-1/2 demuxer
 * Copyright (c) 2000, 2001, 2002 Fabrice Bellard
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

AVInputFormat ff_mpegps_demuxer = {
    .name           = "mpeg",
    .long_name      = NULL_IF_CONFIG_SMALL("MPEG-PS (MPEG-2 Program Stream)"),
    .priv_data_size = sizeof(MpegDemuxContext),
    .read_probe     = mpegps_probe,
    .read_header    = mpegps_read_header,
    .read_packet    = mpegps_read_packet,
    .read_timestamp = mpegps_read_dts,
    .flags          = AVFMT_SHOW_IDS | AVFMT_TS_DISCONT,
};

#if CONFIG_VOBSUB_DEMUXER
static const AVOption options[] = {
    { "sub_name", "URI for .sub file", offsetof(MpegDemuxContext, sub_name), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, AV_OPT_FLAG_DECODING_PARAM },
    { NULL }
};

static const AVClass vobsub_demuxer_class = {
    .class_name = "vobsub",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_vobsub_demuxer = {
    .name           = "vobsub",
    .long_name      = NULL_IF_CONFIG_SMALL("VobSub subtitle format"),
    .priv_data_size = sizeof(MpegDemuxContext),
    .read_probe     = vobsub_probe,
    .read_header    = vobsub_read_header,
    .read_packet    = vobsub_read_packet,
    .read_seek2     = vobsub_read_seek,
    .read_close     = vobsub_read_close,
    .flags          = AVFMT_SHOW_IDS,
    .extensions     = "idx",
    .priv_class     = &vobsub_demuxer_class,
};
#endif
