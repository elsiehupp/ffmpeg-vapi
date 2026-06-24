/***********************************************************
@brief Live smooth streaming fragmenter
@copyright 2012 Martin Storsjo
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

[CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.IntOption () {
        name = "window_size",
        short_help_text = "number of fragments kept in the manifest",
        offset = offsetof (
            SmoothStreamingContext,
            window_size
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "extra_window_size",
        short_help_text = "number of fragments kept outside of the manifest before removing from disk",
        offset = offsetof (
            SmoothStreamingContext,
            extra_window_size
        ),
        default_value = 5,
        minimum_value = 0,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "lookahead_count",
        short_help_text = "number of lookahead fragments",
        offset = offsetof (
            SmoothStreamingContext,
            lookahead_count
        ),
        default_value = 2,
        minimum_value = 0,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.Int64Option () {
        name = "min_frag_duration",
        short_help_text = "minimum fragment duration (in microseconds)",
        offset = offsetof (
            SmoothStreamingContext,
            min_frag_duration
        ),
        default_value = 5000000,
        minimum_value = 0,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "remove_at_exit",
        short_help_text = "remove all fragments when finished",
        offset = offsetof (
            SmoothStreamingContext,
            remove_at_exit
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

[CCode (cname="ism_class",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
public class SmoothStreamingMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
    public override string class_name {
        public get {
            return "smooth streaming muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct SmoothStreamingContext",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
[Compact]
public class SmoothStreamingMuxerPrivateData { }

[CCode (cname="ff_smoothstreaming_muxer",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
public class SmoothStreamingMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
    public override string name {
        public get {
            return "smoothstreaming";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
    public override string long_name {
        public get {
            return "Smooth Streaming Muxer";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SmoothStreamingMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.WANTS_GLOBAL_HEADER | AVFormatFlags1.NO_FILE;

        }

    }

    [CCode (cname="ism_write_header",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="ism_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="ism_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/smoothstreamingenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = ism_class;
}

} // namespace LibAVFormat
