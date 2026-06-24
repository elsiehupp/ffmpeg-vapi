/***********************************************************
@brief Raw FLAC muxer
@copyright 2006-2009 Justin Ruggles
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

[CCode (cname="struct FlacMuxerContext",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
[Compact]
public class FLACMuxerPrivateData { }

static const LibAVUtil.Option flacenc_options[] = {
    new LibAVUtil.BoolOption () {
        name = "write_header",
        short_help_text = "Write the file header",
        offset = offsetof (
            FlacMuxerContext, write_header
        ),
        default_value = 1,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="flac_muxer_class",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
public class FLACMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
    public override string class_name {
        public get {
            return "flac muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = flacenc_options,

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_flac_muxer",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
public class FLACMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
    public override string name {
        public get {
            return "flac";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
    public override string long_name {
        public get {
            return "raw FLAC";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FLACMuxerPrivateData);

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
    public override string mime_type {
        public get {
            return "audio/x-flac";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
    public override string extensions {
        public get {
            return "flac";

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.FLAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.PNG;

        }

    }

    [CCode (cname="flac_init",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="flac_write_header",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="flac_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flac_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/flacenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_TIMESTAMPS;

        }

    }
    //  .priv_class = flac_muxer_class;
}

} // namespace LibAVFormat
