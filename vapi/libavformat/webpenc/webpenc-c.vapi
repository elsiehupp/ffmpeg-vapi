/***********************************************************
@brief Webp muxer
@copyright 2014 Michael Niedermayer
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

[CCode (cname="webp_muxer_class",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
public class WebPMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
    public override string class_name {
        public get {
            return "WebP muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }

    [CCode (cname="option",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.IntOption () {
                    name = "loop",
                    short_help_text = "Number of times to loop the output: 0 - infinite loop",
                    offset = offsetof (
                        WebpContext,
                        loop
                    ),
                    default_value = 1,
                    minimum_value = 0,
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

[CCode (cname="struct WebpContext",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
[Compact]
public class WebPMuxerPrivateData { }

[CCode (cname="ff_webp_muxer",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
public class WebPMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
    public override string name {
        public get {
            return "webp";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
    public override string long_name {
        public get {
            return "WebP";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
    public override string extensions {
        public get {
            return "webp";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WebPMuxerPrivateData);

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.WEBP;

        }

    }

    [CCode (cname="webp_write_header",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="webp_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="webp_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = webp_muxer_class,

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/webpenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.ALLOWS_VARIABLE_FPS;

        }

    }
}

} // namespace LibAVFormat
