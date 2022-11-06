/***********************************************************
Sorenson-3 (SVQ3/SV3V) payload for RTP
@copyright 2010 Ronald S. Bultje

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
@brief RTP support for the SV3V (SVQ3) payload
@author Ronald S. Bultje <rbultje@ronald.bitfreak.net>
@see http://wiki.multimedia.cx/index.php?title=Sorenson_Video_3#Packetization
***********************************************************/

const RTPDynamicProtocolHandler ff_svq3_dynamic_handler = {
    //  .enc_name         = "X-SV3V-ES",
    //  .codec_type       = AVMEDIA_TYPE_VIDEO,
    //  .codec_id         = AV_CODEC_ID_NONE,      // see if (config_packet) above
    //  .priv_data_size   = sizeof(PayloadContext),
    [CCode (cname="", cheader="")]
    public override void close (
        PayloadContext protocol_data
    );            = svq3_close_context,

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
    );     = svq3_parse_packet,
}
