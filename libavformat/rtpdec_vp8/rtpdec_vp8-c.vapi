/*
 * RTP VP8 Depacketizer
 * Copyright (c) 2010 Josh Allmann
 * Copyright (c) 2012 Martin Storsjo
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
 * @brief RTP support for the VP8 payload
 * @author Josh Allmann <joshua.allmann@gmail.com>
 * @see http://tools.ietf.org/html/draft-ietf-payload-vp8-05
 */

const RTPDynamicProtocolHandler ff_vp8_dynamic_handler = {
    //  .enc_name       = "VP8",
    //  .codec_type     = AVMEDIA_TYPE_VIDEO,
    //  .codec_id       = AV_CODEC_ID_VP8,
    //  .priv_data_size = sizeof(PayloadContext),
    [CCode (cname="", cheader="")]
    public override int init (
        AVFormatContext format_context
    );           = vp8_init,
    [CCode (cname="", cheader="")]
    public override void close (
        PayloadContext protocol_data
    );          = vp8_close_context,

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
    );   = vp8_handle_packet,
    [CCode (cname="", cheader="")]
    public override int need_keyframe (
        PayloadContext context
    );  = vp8_need_keyframe,
};
