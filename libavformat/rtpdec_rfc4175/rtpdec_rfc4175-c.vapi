/***********************************************************
 RTP Depacketization of RAW video (TR-03)
 @copyright 2016 Savoir-faire Linux, Inc

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

/* Development sponsored by CBC/Radio-Canada */

const RTPDynamicProtocolHandler ff_rfc4175_rtp_handler = {
    //  .enc_name           = "raw",
    //  .codec_type         = AVMEDIA_TYPE_VIDEO,
    //  .codec_id           = AV_CODEC_ID_BITPACKED,
    //  .priv_data_size     = sizeof(PayloadContext),
    [CCode (cname="", cheader="")]
    public override int parse_sdp_a_line (
        AVFormatContext format_context,
        int st_index,
        PayloadContext priv_data,
        string line
    );   = rfc4175_parse_sdp_line,

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
    );       = rfc4175_handle_packet,
}
