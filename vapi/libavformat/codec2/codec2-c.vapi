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
/***********************************************************
@brief Codec2 muxer and demuxers
@copyright 2017 Tomas Härdin
***********************************************************/
/***********************************************************
@brief Transcoding report2074.c2 to wav went from 7.391s to 5.322s
with -frames_per_packet 1000 compared to default, same sha1sum
***********************************************************/
public define FRAMES_PER_PACKET
    new LibAVUtil.IntOption () {
        name = "frames_per_packet",
        short_help_text = "Number of frames to read at a time. Higher = faster decoding, lower granularity",
        offset = offsetof (
            Codec2Context,
            frames_per_packet
        ),
        default_value = 1,
        minimum_value = 1,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    }

};

[CCode (cname="codec2_mux_class",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
public class Codec2MuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string class_name {
        public get {
            return "codec2 muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
    //  .category = LibAVUtil.ClassCategory.DEMUXER;
}

[CCode (cname="codec2_demux_class",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
public class Codec2DemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string class_name {
        public get {
            return "codec2 demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
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
                FRAMES_PER_PACKET,
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
    //  .category = LibAVUtil.ClassCategory.DEMUXER;
}

[CCode (cname="codec2raw_demux_class",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
public class Codec2RawDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string class_name {
        public get {
            return "codec2raw demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
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
                AVPRIV_CODEC2_AVOPTIONS (
                    "codec2 mode [mandatory]",
                    Codec2Context,
                    -1,
                    -1,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                ),
                FRAMES_PER_PACKET,
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
    //  .category = LibAVUtil.ClassCategory.DEMUXER;
}

#if CONFIG_CODEC2_DEMUXER

[CCode (cname="ff_codec2_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
public class Codec2Demuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string name {
        public get {
            return "codec2";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string long_name {
        public get {
            return "codec2 .c2 demuxer";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (Codec2Context);

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string extensions {
        public get {
            return "c2";

        }

    }

    [CCode (cname="codec2_probe",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="codec2_read_header",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="codec2_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="ff_pcm_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.USE_GENERIC_INDEX;

        }

    }

    [CCode (cname="raw_codec_id",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.CODEC2;

        }

    }
    //  .priv_class = codec2_demux_class;
}
#endif

#if CONFIG_CODEC2_MUXER

[CCode (cname="ff_codec2_muxer",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
public class Codec2Muxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string name {
        public get {
            return "codec2";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string long_name {
        public get {
            return "codec2 .c2 muxer";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (Codec2Context);

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string extensions {
        public get {
            return "c2";

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.CODEC2;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;

        }

    }

    [CCode (cname="codec2_write_header",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="ff_raw_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_TIMESTAMPS;

        }

    }
    //  .priv_class = codec2_mux_class;
}
#endif

#if CONFIG_CODEC2RAW_DEMUXER

[CCode (cname="ff_codec2raw_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
public class Codec2RawDemuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string name {
        public get {
            return "codec2raw";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string long_name {
        public get {
            return "raw codec2 demuxer";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (Codec2Context);

        }

    }

    [CCode (cname="codec2raw_read_header",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="codec2_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="ff_pcm_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.USE_GENERIC_INDEX;

        }

    }

    [CCode (cname="raw_codec_id",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.CODEC2;

        }

    }
    //  .priv_class = codec2raw_demux_class;
}
#endif

} // namespace LibAVFormat
