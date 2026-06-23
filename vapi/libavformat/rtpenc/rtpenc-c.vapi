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

static const LibAVUtil.Option options[] = {
    FF_RTP_FLAG_OPTS (
        RTPMuxContext,
        flags
    ),
    new LibAVUtil.IntOption () {
        name = "payload_type",
        short_help_text = "Specify RTP payload type",
        offsetof (
            RTPMuxContext,
            payload_type
        ),
        {
            .i64 = -1
        },
        -1,
        127,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "ssrc",
        short_help_text = "Stream identifier",
        offsetof (
            RTPMuxContext,
            ssrc
        ),
        {
            .i64 = 0
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "cname",
        short_help_text = "CNAME to include in RTCP SR packets",
        offsetof (
            RTPMuxContext,
            cname
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "seq",
        short_help_text = "Starting sequence number",
        offsetof (
            RTPMuxContext,
            seq
        ),
        {
            .i64 = -1
        },
        -1,
        65535,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="rtp_muxer_class",cheader_filename="ffmpeg/libformat/rtpenc.c")]
public class RTPMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/rtpenc.c")]
    public override string class_name {
        public get {
            return "RTP muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/rtpenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/rtpenc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/rtpenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_rtp_muxer",cheader_filename="ffmpeg/libformat/rtpenc.c")]
public class RTPMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/rtpenc.c")]
    public override string name {
        public get {
            return "rtp";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/rtpenc.c")]
    public override string long_name {
        public get {
            return "RTP output";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/rtpenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTPMuxContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/rtpenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_MULAW;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/rtpenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG4;

        }

    }

    [CCode (cname="rtp_write_header",cheader_filename="ffmpeg/libformat/rtpenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="rtp_write_packet",cheader_filename="ffmpeg/libformat/rtpenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="rtp_write_trailer",cheader_filename="ffmpeg/libformat/rtpenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = rtp_muxer_class,

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/rtpenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_TS_NONSTRICT;

        }

    }
}

} // namespace LibAVFormat
