/***********************************************************
@brief Animated GIF muxer
@copyright 2000 Fabrice Bellard

first version by Francois Revol <revol@free.fr>
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

[CCode (cname="gif_muxer_class",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
public class GIFMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
    public override string class_name {
        public get {
            return "GIF muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.IntOption () {
                    name = "loop",
                    short_help_text = "Number of times to loop the output: -1 - no loop, 0 - infinite loop",
                    offset = offsetof (
                        GIFContext,
                        loop
                    ),
                    default_value = 0,
                    minimum_value = -1,
                    maximum_value = 65535,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "final_delay",
                    short_help_text = "Force delay (in centiseconds) after the last frame",
                    offset = offsetof (
                        GIFContext,
                        last_delay
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
}

[CCode (cname="struct GIFContext",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
[Compact]
public class GIFMuxerPrivateData { }

[CCode (cname="ff_gif_muxer",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
public class GIFMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
    public override string name {
        public get {
            return "gif";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
    public override string long_name {
        public get {
            return "CompuServe Graphics Interchange Format (GIF)";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
    public override string mime_type {
        public get {
            return "image/gif";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
    public override string extensions {
        public get {
            return "gif";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (GIFMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.GIF;

        }

    }

    [CCode (cname="gif_write_header",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="gif_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
    public override int write_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="gif_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );
    //  .priv_class = gif_muxer_class,

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/gif.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.ALLOWS_VARIABLE_FPS;

        }

    }
}

} // namespace LibAVFormat
