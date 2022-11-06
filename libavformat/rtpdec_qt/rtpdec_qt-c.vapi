/***********************************************************
RTP/Quicktime support.
@copyright 2009 Ronald S. Bultje

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

/**
@file
@brief Quicktime-style RTP support
@author Ronald S. Bultje <rbultje@ronald.bitfreak.net>
***********************************************************/

#define RTP_QT_HANDLER(m, n, s, t) \
RTPDynamicProtocolHandler ff_ ## m ## _rtp_ ## n ## _handler = { \
    //  .enc_name         = s, \
    //  .codec_type       = t, \
    //  .codec_id         = AV_CODEC_ID_NONE, \
    //  .priv_data_size   = sizeof(PayloadContext), \
    [CCode (cname="", cheader="")]
    public override void close (
        PayloadContext protocol_data
    );            = qt_rtp_close,   \

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
    );     = qt_rtp_parse_packet, \
}

RTP_QT_HANDLER(qt,        vid, "X-QT",        AVMEDIA_TYPE_VIDEO);
RTP_QT_HANDLER(qt,        aud, "X-QT",        AVMEDIA_TYPE_AUDIO);
RTP_QT_HANDLER(quicktime, vid, "X-QUICKTIME", AVMEDIA_TYPE_VIDEO);
RTP_QT_HANDLER(quicktime, aud, "X-QUICKTIME", AVMEDIA_TYPE_AUDIO);
