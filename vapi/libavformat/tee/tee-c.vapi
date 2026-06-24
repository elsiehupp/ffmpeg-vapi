/***********************************************************
@brief Tee pseudo-muxer
@copyright 2012 Nicolas George
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with FFmpeg; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVFormat {

[CCode (cname="tee_muxer_class",cheader_filename="subprojects/ffmpeg/libavformat/tee.c")]
public class TeeMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/tee.c")]
    public override string class_name {
        public get {
            return "Tee muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/tee.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="option",cheader_filename="")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.BoolOption () {
                    name = "use_fifo",
                    short_help_text = "Use fifo pseudo-muxer to separate actual muxers from encoder",
                    offset = offsetof (
                        TeeContext,
                        use_fifo
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "fifo_options",
                    short_help_text = "fifo pseudo-muxer options",
                    offset = offsetof (
                        TeeContext,
                        fifo_options_str
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/tee.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct TeeContext",cheader_filename="subprojects/ffmpeg/libavformat/tee.c")]
[Compact]
public class TeeMuxerPrivateData { }

[CCode (cname="ff_tee_muxer",cheader_filename="subprojects/ffmpeg/libavformat/tee.c")]
public class TeeMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/tee.c")]
    public override string name {
        public get {
            return "tee";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/tee.c")]
    public override string long_name {
        public get {
            return "Multiple muxer tee";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/tee.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (TeeMuxerPrivateData);

        }

    }

    [CCode (cname="tee_write_header",cheader_filename="subprojects/ffmpeg/libavformat/tee.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="tee_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/tee.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="tee_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/tee.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = tee_muxer_class,

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/tee.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_FILE | AVFormatFlags1.ALLOWS_FLUSH;

        }

    }
}

} // namespace LibAVFormat
