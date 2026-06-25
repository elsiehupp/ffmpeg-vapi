/***********************************************************
@brief AST muxer
@copyright 2012 James Almer
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

[CCode (cname="ast_muxer_class",cheader_filename="subprojects/ffmpeg/libavformat/astenc.c")]
public class ASTMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/astenc.c")]
    public override string class_name {
        public get {
            return "AST muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/astenc.c")]
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
                new LibAVUtil.Int64Option () {
                    name = "loopstart",
                    short_help_text = "Loopstart position in milliseconds.",
                    offset = offsetof (
                        ASTMuxContext,
                        loopstart
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.Int64Option () {
                    name = "loopend",
                    short_help_text = "Loopend position in milliseconds.",
                    offset = offsetof (
                        ASTMuxContext,
                        loopend
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/astenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct ASTMuxContext",cheader_filename="subprojects/ffmpeg/libavformat/astenc.c")]
[Compact]
public class ASTMuxerPrivateData { }

[CCode (cname="ff_ast_muxer",cheader_filename="subprojects/ffmpeg/libavformat/astenc.c")]
public class ASTMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/astenc.c")]
    public override string name {
        public get {
            return "ast";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/astenc.c")]
    public override string long_name {
        public get {
            return "AST (Audio Stream)";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/astenc.c")]
    public override string extensions {
        public get {
            return "ast";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/astenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ASTMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/astenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16BE_PLANAR;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/astenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;

        }

    }

    [CCode (cname="ast_write_header",cheader_filename="subprojects/ffmpeg/libavformat/astenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="ast_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/astenc.c")]
    public override int write_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="ast_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/astenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );
    //  .priv_class = ast_muxer_class,

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                ff_codec_ast_tags,
                0
            };

        }

    }

}

} // namespace LibAVFormat
