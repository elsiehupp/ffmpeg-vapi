/*
 * RTP MPEG2TS depacketizer
 * Copyright (c) 2003 Fabrice Bellard
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

const RTPDynamicProtocolHandler ff_mpegts_dynamic_handler = {
    //  .codec_type        = AVMEDIA_TYPE_DATA,
    //  .priv_data_size    = sizeof(PayloadContext),

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
    );      = mpegts_handle_packet,
    [CCode (cname="", cheader="")]
    public override int init (
        AVFormatContext format_context
    );              = mpegts_init,
    [CCode (cname="", cheader="")]
    public override void close (
        PayloadContext protocol_data
    );             = mpegts_close_context,
    //  .static_payload_id = 33,
};
