/***********************************************************
@brief RTP output format
@copyright 2002 Fabrice Bellard
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

//  static const LibAVUtil.Option options[] = {
//      FF_RTP_FLAG_OPTS (RTPMuxContext, flags),
//      { "payload_type", "Specify RTP payload type", offsetof (RTPMuxContext, payload_type), AV_OPT_TYPE_INT, {.i64 = -1 }, -1, 127, AV_OPT_FLAG_ENCODING_PARAM },
//      { "ssrc", "Stream identifier", offsetof (RTPMuxContext, ssrc), AV_OPT_TYPE_INT, { .i64 = 0 }, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "cname", "CNAME to include in RTCP SR packets", offsetof (RTPMuxContext, cname), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, AV_OPT_FLAG_ENCODING_PARAM },
//      { "seq", "Starting sequence number", offsetof (RTPMuxContext, seq), AV_OPT_TYPE_INT, { .i64 = -1 }, -1, 65535, AV_OPT_FLAG_ENCODING_PARAM },
//      { NULL },
//  }

[CCode (cname="rtp_muxer_class", cheader_filename="")]
public class RTPMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "RTP muxer";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_rtp_muxer", cheader_filename="")]
public class RTPMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "rtp";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "RTP output";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTPMuxContext);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_MULAW;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG4;
        }
    }

    [CCode (cname="rtp_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="rtp_write_packet", cheader_filename="")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="rtp_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = rtp_muxer_class,
    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_TS_NONSTRICT;
        }
    }
}

} // namespace LibAVFormat
