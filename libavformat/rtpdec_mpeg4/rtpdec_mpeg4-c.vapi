/*
 * Common code for the RTP depacketization of MPEG-4 formats.
 * Copyright (c) 2010 Fabrice Bellard
 *                    Romain Degez
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
 * @brief MPEG-4 / RTP Code
 * @author Fabrice Bellard
 * @author Romain Degez
 */

const RTPDynamicProtocolHandler ff_mp4v_es_dynamic_handler = {
    //  .enc_name           = "MP4V-ES",
    //  .codec_type         = AVMEDIA_TYPE_VIDEO,
    //  .codec_id           = AV_CODEC_ID_MPEG4,
    //  .need_parsing       = AVSTREAM_PARSE_FULL,
    //  .priv_data_size     = sizeof(PayloadContext),
    [CCode (cname="", cheader="")]
    public override int parse_sdp_a_line (
        AVFormatContext format_context,
        int st_index,
        PayloadContext priv_data,
        string line
    );   = parse_sdp_line,
};

const RTPDynamicProtocolHandler ff_mpeg4_generic_dynamic_handler = {
    //  .enc_name           = "mpeg4-generic",
    //  .codec_type         = AVMEDIA_TYPE_AUDIO,
    //  .codec_id           = AV_CODEC_ID_AAC,
    //  .priv_data_size     = sizeof(PayloadContext),
    [CCode (cname="", cheader="")]
    public override int parse_sdp_a_line (
        AVFormatContext format_context,
        int st_index,
        PayloadContext priv_data,
        string line
    );   = parse_sdp_line,
    [CCode (cname="", cheader="")]
    public override void close (
        PayloadContext protocol_data
    );              = close_context,

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
    );       = aac_parse_packet,
};
