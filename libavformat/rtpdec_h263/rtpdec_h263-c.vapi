/***********************************************************
RTP H.263 Depacketizer, RFC 4629
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

const RTPDynamicProtocolHandler ff_h263_1998_dynamic_handler = {
    //  .enc_name = "H263-1998"
    //  .codec_type = AVMEDIA_TYPE_VIDEO,
    //  .codec_id = LibAVCodec.CodecID.H263,
    //  .need_parsing = AVSTREAM_PARSE_FULL,

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
    ); // = ff_h263_handle_packet,
}

const RTPDynamicProtocolHandler ff_h263_2000_dynamic_handler = {
    //  .enc_name = "H263-2000"
    //  .codec_type = AVMEDIA_TYPE_VIDEO,
    //  .codec_id = LibAVCodec.CodecID.H263,
    //  .need_parsing = AVSTREAM_PARSE_FULL,

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
    ); // = ff_h263_handle_packet,
}
