/*
 * RTP H.263 Depacketizer, RFC 2190
 * Copyright (c) 2012 Martin Storsjo
 * Based on the GStreamer H.263 Depayloder:
 * Copyright 2005 Wim Taymans
 * Copyright 2007 Edward Hervey
 * Copyright 2007 Nokia Corporation
 * Copyright 2007 Collabora Ltd, Philippe Kalaf
 * Copyright 2010 Mark Nauwelaerts
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

const RTPDynamicProtocolHandler ff_h263_rfc2190_dynamic_handler = {
    //  .codec_type        = AVMEDIA_TYPE_VIDEO,
    //  .codec_id          = AV_CODEC_ID_H263,
    //  .need_parsing      = AVSTREAM_PARSE_FULL,

    [CCode (cname="", cheader="")]
    public override int parse_packet (
        AVFormatContext format_context,
        PayloadContext payload_context,
        AVStream st,
        LibAVCodec.Packet packet,
        uint32[] timestamp,
        uint8[] buf,
        int len,
        uint16 seq,
        int flags
    );      = h263_handle_packet,
    //  .priv_data_size    = sizeof(PayloadContext),
    [CCode (cname="", cheader="")]
    public override void close (
        PayloadContext protocol_data
    );             = h263_close_context,
    //  .static_payload_id = 34,
};
