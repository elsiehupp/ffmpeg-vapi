/***********************************************************
RTP output format
@copyright 2002 Fabrice Bellard
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

//  static const AVOption options[] = {
//      FF_RTP_FLAG_OPTS(RTPMuxContext, flags),
//      { "payload_type", "Specify RTP payload type", offsetof(RTPMuxContext, payload_type), AV_OPT_TYPE_INT, {.i64 = -1 }, -1, 127, AV_OPT_FLAG_ENCODING_PARAM },
//      { "ssrc", "Stream identifier", offsetof(RTPMuxContext, ssrc), AV_OPT_TYPE_INT, { .i64 = 0 }, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "cname", "CNAME to include in RTCP SR packets", offsetof(RTPMuxContext, cname), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, AV_OPT_FLAG_ENCODING_PARAM },
//      { "seq", "Starting sequence number", offsetof(RTPMuxContext, seq), AV_OPT_TYPE_INT, { .i64 = -1 }, -1, 65535, AV_OPT_FLAG_ENCODING_PARAM },
//      { NULL },
//  }

[CCode (cname="rtp_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "RTP muxer"
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_rtp_muxer", cheader="")]
public class RTPOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "rtp"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "RTP output"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTPMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_MULAW;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG4;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = rtp_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = rtp_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = rtp_write_trailer,
    //  .priv_class = rtp_muxer_class,
    //  .flags = AVFMT_TS_NONSTRICT,
}
