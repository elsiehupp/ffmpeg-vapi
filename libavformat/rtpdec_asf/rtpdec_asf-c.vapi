/***********************************************************
Microsoft RTP/ASF support.
@copyright 2008 Ronald S. Bultje
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
@file @brief Microsoft RTP/ASF support
@author Ronald S. Bultje <rbultje@ronald.bitfreak.net>
***********************************************************/

//  #define RTP_ASF_HANDLER(n, s, t)
//  [CCode (cname="ff_ms_rtp_ ## n ## _handler", cheader="")]
//  public class ASFDynamicHandler : RTPDynamicProtocolHandler {
//      [CCode (cname="enc_name", cheader="")]
//      public override string enc_name {
//          public get {
//              return s;
//          }
//      }
//      [CCode (cname="codec_type", cheader="")]
//      public override LibAVUtil.MediaType codec_type {
//          public get {
//              return t;
//          }
//      }
//      [CCode (cname="codec_id", cheader="")]
//      public override LibAVCodec.CodecID codec_id {
//          public get {
//              return LibAVCodec.CodecID.NONE;
//          }
//      }
//      [CCode (cname="priv_data_size", cheader="")]
//      public override size_t priv_data_size {
//          public get {
//              return sizeof (PayloadContext);
//          }
//      }
//      [CCode (cname="asfrtp_parse_sdp_line", cheader="")]
//      public override int parse_sdp_a_line (
//          AVFormatContext format_context,
//          int st_index,
//          PayloadContext priv_data,
//          string line
//      );
//      [CCode (cname="asfrtp_close_context", cheader="")]
//      public override void close (
//          PayloadContext protocol_data
//      );

//      [CCode (cname="asfrtp_parse_packet", cheader="")]
//      public override int parse_packet (
//          AVFormatContext format_context,
//          PayloadContext payload_context,
//          AVStream st,
//          LibAVCodec.Packet packet,
//          uint32[] timestamp,
//          uint8[] buffer,
//          int len,
//          uint16 seq,
//          int flags
//      );
//  }

//  RTP_ASF_HANDLER(asf_pfv, "x-asf-pf",  AVMEDIA_TYPE_VIDEO);
//  RTP_ASF_HANDLER(asf_pfa, "x-asf-pf",  AVMEDIA_TYPE_AUDIO);
