/***********************************************************
@brief FLV muxer
@copyright 2003 The FFmpeg Project
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

[CCode (cname="struct FLVContext",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
[Compact]
public class FLVMuxerPrivateClass { }

[CCode (cname="flv_muxer_class",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
public class FLVMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
    public override string class_name {
        public get {
            return "flv muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
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
                new LibAVUtil.FlagsOption () {
                    name = "flvflags",
                    short_help_text = "FLV muxer flags",
                    offset = offsetof (
                        FLVContext,
                        flags
                    ),
                    default_value = 0,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flvflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "aac_seq_header_detect",
                    short_help_text = "Put AAC sequence header based on stream data",
                    offset = 0,
                    default_value = FLV_AAC_SEQ_HEADER_DETECT,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flvflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "no_sequence_end",
                    short_help_text = "disable sequence end for FLV",
                    offset = 0,
                    default_value = FLV_NO_SEQUENCE_END,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flvflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "no_metadata",
                    short_help_text = "disable metadata for FLV",
                    offset = 0,
                    default_value = FLV_NO_METADATA,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flvflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "no_duration_filesize",
                    short_help_text = "disable duration and filesize zero value metadata for FLV",
                    offset = 0,
                    default_value = FLV_NO_DURATION_FILESIZE,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flvflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "add_keyframe_index",
                    short_help_text = "Add keyframe index metadata",
                    offset = 0,
                    default_value = FLV_ADD_KEYFRAME_INDEX,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flvflags"
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_flv_muxer",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
public class FLVMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
    public override string name {
        public get {
            return "flv";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
    public override string long_name {
        public get {
            return "FLV (Flash Video)";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
    public override string mime_type {
        public get {
            return "video/x-flv";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
    public override string extensions {
        public get {
            return "flv";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FLVMuxerPrivateClass);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
        #if CONFIG_LIBMP3LAME
            return LibAVCodec.CodecID.MP3;
        #else
            return LibAVCodec.CodecID.ADPCM_SWF;
        #endif
        }
    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.FLV1;

        }

    }

    [CCode (cname="flv_init",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="flv_write_header",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="flv_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flv_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flv_check_bitstream",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );


    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                flv_video_codec_ids,
                flv_audio_codec_ids,
                0
            };

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/flvenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.WANTS_GLOBAL_HEADER | AVFormatFlags1.ALLOWS_VARIABLE_FPS | AVFormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS;

        }

    }
    //  .priv_class = flv_muxer_class;
}

} // namespace LibAVFormat
