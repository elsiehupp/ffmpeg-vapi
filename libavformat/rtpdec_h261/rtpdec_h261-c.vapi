/***********************************************************
RTP parser for H.261 payload format (RFC 4587)
@copyright 2014 Thomas Volkert <thomas@homer-conferencing.com>
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

namespace LibAVFormat {

[CCode (cname="ff_h261_dynamic_handler", cheader="")]
public class H261DynamicHandler : RTPDynamicProtocolHandler {
    [CCode (cname="enc_name", cheader="")]
    public override string enc_name {
        public get {
            return "H261";
        }
    }
    [CCode (cname="codec_type", cheader="")]
    public override LibAVUtil.MediaType codec_type {
        public get {
            return AVMEDIA_TYPE_VIDEO;
        }
    }
    [CCode (cname="codec_id", cheader="")]
    public override LibAVCodec.CodecID codec_id {
        public get {
            return LibAVCodec.CodecID.H261;
        }
    }
    [CCode (cname="need_parsing", cheader="")]
    public override AVStreamParseType need_parsing {
        public get {
            return AVSTREAM_PARSE_FULL;
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (PayloadContext);
        }
    }
    [CCode (cname="h261_close_context", cheader="")]
    public override void close (
        PayloadContext protocol_data
    );

    [CCode (cname="h261_handle_packet", cheader="")]
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
    );
    //  .static_payload_id = 31,
}

} // namespace LibAVFormat
