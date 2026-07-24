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

[CCode (cname="rtp_muxer_class",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.c")]
public class RTPMuxerClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.c")]
    public override string class_name {
        public get {
            return "RTP muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                FF_RTP_FLAG_OPTS (
                    RTPMuxContext,
                    flags
                ),
                new LibAVUtil.IntOption () {
                    name = "payload_type",
                    short_help_text = "Specify RTP payload type",
                    offset = offsetof (
                        RTPMuxContext,
                        payload_type
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = 127,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "ssrc",
                    short_help_text = "Stream identifier",
                    offset = offsetof (
                        RTPMuxContext,
                        ssrc
                    ),
                    default_value = 0,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "cname",
                    short_help_text = "CNAME to include in RTCP SR packets",
                    offset = offsetof (
                        RTPMuxContext,
                        cname
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "seq",
                    short_help_text = "Starting sequence number",
                    offset = offsetof (
                        RTPMuxContext,
                        seq
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = 65535,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_rtp_muxer",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.c")]
public class RTPMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.c")]
    public override string name {
        public get {
            return "rtp";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.c")]
    public override string long_name {
        public get {
            return "RTP output";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTPMuxContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_MULAW;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG4;

        }

    }

    [CCode (cname="rtp_write_header",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="rtp_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.c")]
    public override int write_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="rtp_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );
    //  .priv_class = rtp_muxer_class,

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS;

        }

    }
}

} // namespace LibAVFormat
