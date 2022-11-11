/***********************************************************
RTP H.264 Protocol (RFC3984)
@copyright 2006 Ryan Martell
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

/***********************************************************
@file @brief H.264 / RTP Code (RFC3984)
@author Ryan Martell <rdm4@martellventures.com>

@note Notes:
Notes:
This currently supports packetization mode:
Single Nal Unit Mode (0), or
Non-Interleaved Mode (1).  It currently does not support
Interleaved Mode (2). (This requires implementing STAP-B, MTAP16, MTAP24,
                       FU-B packet types)
***********************************************************/

[CCode (cname="ff_h264_dynamic_handler", cheader="")]
public class H264DynamicHandler : RTPDynamicProtocolHandler {
    [CCode (cname="enc_name", cheader="")]
    public override string enc_name {
        public get {
            return "H264";
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
            return LibAVCodec.CodecID.H264;
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
    [CCode (cname="", cheader="")]
    public override int parse_sdp_a_line (
        AVFormatContext format_context,
        int st_index,
        PayloadContext priv_data,
        string line
    ); // = parse_h264_sdp_line,
    [CCode (cname="", cheader="")]
    public override void close (
        PayloadContext protocol_data
    ); // = h264_close_context,

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
    ); // = h264_handle_packet,
}
