/***********************************************************
RTP Depacketization of MP4A-LATM, RFC 3016
@copyright 2010 Martin Storsjo
***********************************************************/
/***********************************************************
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

const RTPDynamicProtocolHandler ff_mp4a_latm_dynamic_handler = {
    //  .enc_name = "MP4A-LATM"
    //  .codec_type = AVMEDIA_TYPE_AUDIO,
    //  .codec_id = LibAVCodec.CodecID.AAC,
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (PayloadContext);
        }
    }
    [CCode (cname="", cheader="")]
    public override int parse_sdp_a_line (
        AVFormatContext format_context,
        int st_index,
        PayloadContext priv_data,
        string line
    ); // = latm_parse_sdp_line,
    [CCode (cname="", cheader="")]
    public override void close (
        PayloadContext protocol_data
    ); // = latm_close_context,

    [CCode (cname="", cheader="")]
    public override int parse_packet (
        AVFormatContext format_context,
        PayloadContext payload_context,
        AVStream st,
        LibAVCodec.Packet packet,
        uint32[] timestamp,
        uint8[] buffer,
        int len,
        uint16 seq,
        int flags
    ); // = latm_parse_packet,
}
