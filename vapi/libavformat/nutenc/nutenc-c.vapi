/***********************************************************
@brief Nut muxer
@copyright 2004-2007 Michael Niedermayer
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

[CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.FlagsOption () {
        name = "syncpoints",
        short_help_text = "NUT syncpoint behaviour",
        offset = offsetof (
            NUTContext,
            flags
        ),
        default_value = 0,
        minimum_value = int.MIN,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "syncpoints"
    },
    new LibAVUtil.ConstOption () {
        name = "default",
        short_help_text = "",
        offset = 0,
        default_value = 0,
        minimum_value = int.MIN,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "syncpoints"
    },
    new LibAVUtil.ConstOption () {
        name = "none",
        short_help_text = "Disable syncpoints,
        low overhead and unseekable",
        offset = 0,
        default_value = NUTFlags.PIPE,
        minimum_value = int.MIN,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "syncpoints"
    },
    new LibAVUtil.ConstOption () {
        name = "timestamped",
        short_help_text = "Extend syncpoints with a wallclock timestamp",
        offset = 0,
        default_value = NUTFlags.BROADCAST,
        minimum_value = int.MIN,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "syncpoints"
    },
    new LibAVUtil.BoolOption () {
        name = "write_index",
        short_help_text = "Write index",
        offset = offsetof (
            NUTContext,
            write_index
        ),
        default_value = 1,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
    },
    {
        NULL
    }

};

[CCode (cname="class",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
public class NUTMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override string class_name {
        public get {
            return "nutenc";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_nut_muxer",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
public class NUTMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override string name {
        public get {
            return "nut";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override string long_name {
        public get {
            return "NUT";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override string mime_type {
        public get {
            return "video/x-nut";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override string extensions {
        public get {
            return "nut";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (NUTContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
        #if CONFIG_LIBVORBIS
            return LibAVCodec.CodecID.VORBIS;
        #else
        #if CONFIG_LIBMP3LAME
            return LibAVCodec.CodecID.MP3;
        #else
            return LibAVCodec.CodecID.MP2;
        #endif
        #endif
        }
    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG4;

        }

    }

    [CCode (cname="nut_write_header",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="nut_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="nut_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="nut_write_deinit",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/nutenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.WANTS_GLOBAL_HEADER | AVFormatFlags1.ALLOWS_VARIABLE_FPS;

        }

    }

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return ff_nut_codec_tags;
        }

    }

    //  .priv_class = class;
}

} // namespace LibAVFormat
