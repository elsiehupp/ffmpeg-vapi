/*
 * RTSP/SDP client
 * Copyright (c) 2002 Fabrice Bellard
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

static const AVClass sdp_demuxer_class = {
    .class_name     = "SDP demuxer",
    .item_name      = av_default_item_name,
    .option         = sdp_options,
    .version        = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_sdp_demuxer = {
    .name           = "sdp",
    .long_name      = NULL_IF_CONFIG_SMALL("SDP"),
    .priv_data_size = sizeof(RTSPState),
    .read_probe     = sdp_probe,
    .read_header    = sdp_read_header,
    .read_packet    = ff_rtsp_fetch_packet,
    .read_close     = sdp_read_close,
    .priv_class     = &sdp_demuxer_class,
};
#endif /* CONFIG_SDP_DEMUXER */

#if CONFIG_RTP_DEMUXER
static const AVClass rtp_demuxer_class = {
    .class_name     = "RTP demuxer",
    .item_name      = av_default_item_name,
    .option         = rtp_options,
    .version        = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_rtp_demuxer = {
    .name           = "rtp",
    .long_name      = NULL_IF_CONFIG_SMALL("RTP input"),
    .priv_data_size = sizeof(RTSPState),
    .read_probe     = rtp_probe,
    .read_header    = rtp_read_header,
    .read_packet    = ff_rtsp_fetch_packet,
    .read_close     = sdp_read_close,
    .flags          = AVFMT_NOFILE,
    .priv_class     = &rtp_demuxer_class,
};
#endif /* CONFIG_RTP_DEMUXER */
