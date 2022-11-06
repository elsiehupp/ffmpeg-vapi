/*
 * RTP network protocol
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

/**
 * @file
 * RTP protocol
 */

#define OFFSET(x) offsetof(RTPContext, x)
#define D AV_OPT_FLAG_DECODING_PARAM
#define E AV_OPT_FLAG_ENCODING_PARAM
static const AVOption options[] = {
    { "ttl",                "Time to live (in milliseconds, multicast only)",                   OFFSET(ttl),             AV_OPT_TYPE_INT,    { .i64 = -1 },    -1, INT_MAX, .flags = D|E },
    { "buffer_size",        "Send/Receive buffer size (in bytes)",                              OFFSET(buffer_size),     AV_OPT_TYPE_INT,    { .i64 = -1 },    -1, INT_MAX, .flags = D|E },
    { "rtcp_port",          "Custom rtcp port",                                                 OFFSET(rtcp_port),       AV_OPT_TYPE_INT,    { .i64 = -1 },    -1, INT_MAX, .flags = D|E },
    { "local_rtpport",      "Local rtp port",                                                   OFFSET(local_rtpport),   AV_OPT_TYPE_INT,    { .i64 = -1 },    -1, INT_MAX, .flags = D|E },
    { "local_rtcpport",     "Local rtcp port",                                                  OFFSET(local_rtcpport),  AV_OPT_TYPE_INT,    { .i64 = -1 },    -1, INT_MAX, .flags = D|E },
    { "connect",            "Connect socket",                                                   OFFSET(connect),         AV_OPT_TYPE_BOOL,   { .i64 =  0 },     0, 1,       .flags = D|E },
    { "write_to_source",    "Send packets to the source address of the latest received packet", OFFSET(write_to_source), AV_OPT_TYPE_BOOL,   { .i64 =  0 },     0, 1,       .flags = D|E },
    { "pkt_size",           "Maximum packet size",                                              OFFSET(pkt_size),        AV_OPT_TYPE_INT,    { .i64 = -1 },    -1, INT_MAX, .flags = D|E },
    { "dscp",               "DSCP class",                                                       OFFSET(dscp),            AV_OPT_TYPE_INT,    { .i64 = -1 },    -1, INT_MAX, .flags = D|E },
    { "sources",            "Source list",                                                      OFFSET(sources),         AV_OPT_TYPE_STRING, { .str = NULL },               .flags = D|E },
    { "block",              "Block list",                                                       OFFSET(block),           AV_OPT_TYPE_STRING, { .str = NULL },               .flags = D|E },
    { "fec",                "FEC",                                                              OFFSET(fec_options_str), AV_OPT_TYPE_STRING, { .str = NULL },               .flags = E },
    { NULL }
};

static const AVClass rtp_class = {
    .class_name = "rtp",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

const URLProtocol ff_rtp_protocol = {
    .name                      = "rtp",
    .url_open                  = rtp_open,
    .url_read                  = rtp_read,
    .url_write                 = rtp_write,
    .url_close                 = rtp_close,
    .url_get_file_handle       = rtp_get_file_handle,
    .url_get_multi_file_handle = rtp_get_multi_file_handle,
    .priv_data_size            = sizeof(RTPContext),
    .flags                     = URL_PROTOCOL_FLAG_NETWORK,
    .priv_data_class           = &rtp_class,
};
