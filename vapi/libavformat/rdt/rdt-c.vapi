/***********************************************************
@brief Realmedia RTSP protocol (RDT) support.
@copyright 2007 Ronald S. Bultje
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

/***********************************************************
@file @brief Realmedia RTSP protocol (RDT) support
@author Ronald S. Bultje <rbultje@ronald.bitfreak.net>
***********************************************************/

//  #define RDT_HANDLER (n, s, t)
//  RTPDynamicProtocolHandler ff_rdt_ ## n ## _handler = {
//      [CCode (cname="enc_name", cheader_filename="")]
//      public override string enc_name {
//          public get {
//              return s;
//          }
//      }
//      [CCode (cname="codec_type", cheader_filename="")]
//      public override LibAVUtil.MediaType codec_type {
//          public get {
//              return t;
//          }
//      }
//      [CCode (cname="codec_id", cheader_filename="")]
//      public override LibAVCodec.CodecID codec_id {
//          public get {
//              return LibAVCodec.CodecID.NONE;
//          }
//      }
//      [CCode (cname="priv_data_size", cheader_filename="")]
//      public override size_t priv_data_size {
//          public get {
//              return sizeof (PayloadContext);
//          }
//      }
//      [CCode (cname="rdt_init", cheader_filename="")]
//      public override int init (
//          AVFormatContext format_context
//      );
//      [CCode (cname="rdt_parse_sdp_line", cheader_filename="")]
//      public override int parse_sdp_a_line (
//          AVFormatContext format_context,
//          int st_index,
//          PayloadContext priv_data,
//          string line
//      );
//      [CCode (cname="rdt_close_context", cheader_filename="")]
//      public override void close (
//          PayloadContext protocol_data
//      );

//      [CCode (cname="rdt_parse_packet", cheader_filename="")]
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

//  RDT_HANDLER (live_video, "x-pn-multirate-realvideo-live", AVMEDIA_TYPE_VIDEO);
//  RDT_HANDLER (live_audio, "x-pn-multirate-realaudio-live", AVMEDIA_TYPE_AUDIO);
//  RDT_HANDLER (video,      "x-pn-realvideo",                AVMEDIA_TYPE_VIDEO);
//  RDT_HANDLER (audio,      "x-pn-realaudio",                AVMEDIA_TYPE_AUDIO);


} // namespace LibAVFormat
