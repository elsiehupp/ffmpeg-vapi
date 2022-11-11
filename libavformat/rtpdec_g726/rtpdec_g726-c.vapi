/***********************************************************
@copyright 2011 Miroslav Slugeň <Thunder.m@seznam.cz>
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

//  #define RTP_G726_HANDLER(bitrate)
//  static av_cold int g726_ ## bitrate ##_init(AVFormatContext *s, int st_index,
//                                              PayloadContext *data)
//  {
//      AVStream *stream = s->streams[st_index];
//      AVCodecParameters *par = stream->codecpar;
//  \
//      par->bits_per_coded_sample = bitrate/8;
//      par->bit_rate = par->bits_per_coded_sample * par->sample_rate;
//  \
//      return 0;
//  }
//  \
//  [CCode (cname="ff_g726_ ## bitrate ## _dynamic_handler", cheader="")]
//  public class G726DynamicHandler : RTPDynamicProtocolHandler {
//      [CCode (cname="enc_name", cheader="")]
//      public override string enc_name {
//          public get {
//              return "AAL2-G726-" #bitrate,
//      [CCode (cname="codec_type", cheader="")]
//      public override LibAVUtil.MediaType codec_type {
//          public get {
//              return AVMEDIA_TYPE_AUDIO;
//          }
//      }
//      [CCode (cname="codec_id", cheader="")]
//      public override LibAVCodec.CodecID codec_id {
//          public get {
//              return LibAVCodec.CodecID.ADPCM_G726;
//          }
//      }
//      [CCode (cname="", cheader="")]
//      public override int init (
//          AVFormatContext format_context
//      ); // = g726_ ## bitrate ## _init,
//  }
//  [CCode (cname="ff_g726le_ ## bitrate ## _dynamic_handler", cheader="")]
//  public class G726LEDynamicHandler : RTPDynamicProtocolHandler {
//      [CCode (cname="enc_name", cheader="")]
//      public override string enc_name {
//          public get {
//              return "G726-" #bitrate,
//      [CCode (cname="codec_type", cheader="")]
//      public override LibAVUtil.MediaType codec_type {
//          public get {
//              return AVMEDIA_TYPE_AUDIO;
//          }
//      }
//      [CCode (cname="codec_id", cheader="")]
//      public override LibAVCodec.CodecID codec_id {
//          public get {
//              return LibAVCodec.CodecID.ADPCM_G726LE;
//          }
//      }
//      [CCode (cname="", cheader="")]
//      public override int init (
//          AVFormatContext format_context
//      ); // = g726_ ## bitrate ## _init,
//  }

//  RTP_G726_HANDLER(16);
//  RTP_G726_HANDLER(24);
//  RTP_G726_HANDLER(32);
//  RTP_G726_HANDLER(40);
