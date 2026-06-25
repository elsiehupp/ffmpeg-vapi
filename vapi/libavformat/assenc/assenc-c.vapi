/***********************************************************
@brief SSA/ASS muxer
@copyright 2008 Michael Niedermayer
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

[CCode (cname="ass_class",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
public class ASSClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
    public override string class_name {
        public get {
            return "ass muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
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
                new LibAVUtil.BoolOption () {
                    name = "ignore_readorder",
                    short_help_text = "write events immediately, even if they're out-of-order",
                    offset = offsetof (
                        ASSContext,
                        ignore_readorder
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct ASSContext",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
[Compact]
public class ASSMuxerPrivateData { }

[CCode (cname="ff_ass_muxer",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
public class ASSMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
    public override string name {
        public get {
            return "ass";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
    public override string long_name {
        public get {
            return "SSA (SubStation Alpha) subtitle";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
    public override string mime_type {
        public get {
            return "text/x-ass";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
    public override string extensions {
        public get {
            return "ass,ssa";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ASSMuxerPrivateData);

        }

    }

    [CCode (cname="subtitle_codec",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
    public override LibAVCodec.CodecID subtitle_codec {
        public get {
            return LibAVCodec.CodecID.ASS;

        }

    }

    [CCode (cname="write_header",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="write_packet",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
    public override int write_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/assenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.WANTS_GLOBAL_HEADER | AVFormatFlags1.NO_TIMESTAMPS | AVFormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS;

        }

    }
    //  .priv_class = ass_class;
}

} // namespace LibAVFormat
