/***********************************************************
@brief ASF muxer
@copyright 2000, 2001 Fabrice Bellard
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

public abstract class ASFOptionsClass : LibAVUtil.Log.Class {
    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.IntOption () {
                    name = "packet_size",
                    short_help_text = "Packet size",
                    offset = offsetof (
                        ASFContext,
                        packet_size
                    ),
                    default_value = 3200,
                    minimum_value = PACKET_SIZE_MIN,
                    maximum_value = PACKET_SIZE_MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

}

#if CONFIG_ASF_MUXER

[CCode (cname="asf_muxer_class",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
public class ASFMuxerClass : ASFOptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override string class_name {
        public get {
            return "ASF muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_asf_muxer",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
public class AsfMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override string name {
        public get {
            return "asf";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override string long_name {
        public get {
            return "ASF (Advanced / Active Streaming Format)";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override string mime_type {
        public get {
            return "video/x-ms-asf";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override string extensions {
        public get {
            return "asf,wmv,wma";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ASFContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.WMAV2;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MSMPEG4V3;

        }

    }

    [CCode (cname="asf_write_header",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="asf_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="asf_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.WANTS_GLOBAL_HEADER;

        }

    }

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                codec_asf_bmp_tags,
                ff_codec_bmp_tags,
                ff_codec_wav_tags,
                0
            };
        }

    }

    //  .priv_class = asf_muxer_class;
}
#endif // CONFIG_ASF_MUXER

#if CONFIG_ASF_STREAM_MUXER

[CCode (cname="asf_stream_muxer_class",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
public class ASFStreamMuxerClass : ASFOptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override string class_name {
        public get {
            return "ASF stream muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_asf_stream_muxer",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
public class AsfStreamMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override string name {
        public get {
            return "asf_stream";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override string long_name {
        public get {
            return "ASF (Advanced / Active Streaming Format)";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override string mime_type {
        public get {
            return "video/x-ms-asf";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override string extensions {
        public get {
            return "asf,wmv,wma";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ASFContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.WMAV2;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MSMPEG4V3;

        }

    }

    [CCode (cname="asf_write_stream_header",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="asf_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="asf_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/asfenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.WANTS_GLOBAL_HEADER;

        }

    }

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                codec_asf_bmp_tags,
                ff_codec_bmp_tags,
                ff_codec_wav_tags,
                0
            };

        }

    }

    //  .priv_class = asf_stream_muxer_class;
}
#endif // CONFIG_ASF_STREAM_MUXER

} // namespace LibAVFormat
