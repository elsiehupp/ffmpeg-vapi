/***********************************************************
@copyright 2011, Luca Barbato
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

/***********************************************************
@file generic segmenter
M3U8 specification can be find here:
@url {http://tools.ietf.org/id/draft-pantos-http-live-streaming}
***********************************************************/

[CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.StringOption () {
        name = "reference_stream",
        short_help_text = "set reference stream",
        offset = offsetof (
            SegmentContext,
            reference_stream_specifier
        ),
        default_value = "auto",
        minimum_value = char.MIN,
        maximum_value = char.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_format",
        short_help_text = "set container format used for the segments",
        offset = offsetof (
            SegmentContext,
            format
        ),
        default_value = "",
        minimum_value = 0,
        maximum_value = 0,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_format_options",
        short_help_text = "set list of options for the container format used for the segments",
        offset = offsetof (
            SegmentContext,
            format_options_str
        ),
        default_value = "",
        minimum_value = 0,
        maximum_value = 0,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_list",
        short_help_text = "set the segment list filename",
        offset = offsetof (
            SegmentContext,
            list
        ),
        default_value = "",
        minimum_value = 0,
        maximum_value = 0,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_header_filename",
        short_help_text = "write a single file containing the header",
        offset = offsetof (
            SegmentContext,
            header_filename
        ),
        default_value = "",
        minimum_value = 0,
        maximum_value = 0,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.FlagsOption () {
        name = "segment_list_flags","set flags affecting segment list generation",
        offset = offsetof (
            SegmentContext,
            list_flags
        ),
        default_value = SEGMENT_LIST_FLAG_CACHE,
        minimum_value = 0,
        maximum_value = uint.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "list_flags"
    },
    new LibAVUtil.ConstOption () {
        name = "cache",
        short_help_text = "allow list caching",
        offset = 0,
        default_value = SEGMENT_LIST_FLAG_CACHE,
        minimum_value = int.MIN,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "list_flags"
    },
    new LibAVUtil.ConstOption () {
        name = "live",
        short_help_text = "enable live-friendly list generation (useful for HLS)",
        offset = 0,
        default_value = SEGMENT_LIST_FLAG_LIVE,
        minimum_value = int.MIN,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "list_flags"
    },
    new LibAVUtil.IntOption () {
        name = "segment_list_size",
        short_help_text = "set the maximum number of playlist entries",
        offset = offsetof (
            SegmentContext,
            list_size
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "segment_list_type",
        short_help_text = "set the segment list type",
        offset = offsetof (
            SegmentContext,
            list_type
        ),
        default_value = LIST_TYPE_UNDEFINED,
        minimum_value = -1,
        maximum_value = (
            LIST_TYPE_NB - 1
        ),
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "list_type"
    },
    new LibAVUtil.ConstOption () {
        name = "flat",
        short_help_text = "flat format",
        offset = 0,
        default_value = LIST_TYPE_FLAT,
        minimum_value = int.MIN,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "list_type"
    },
    new LibAVUtil.ConstOption () {
        name = "csv",
        short_help_text = "csv format",
        offset = 0,
        default_value = LIST_TYPE_CSV,
        minimum_value = int.MIN,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "list_type"
    },
    new LibAVUtil.ConstOption () {
        name = "ext",
        short_help_text = "extended format",
        offset = 0,
        default_value = LIST_TYPE_EXT,
        minimum_value = int.MIN,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "list_type"
    },
    new LibAVUtil.ConstOption () {
        name = "ffconcat",
        short_help_text = "ffconcat format",
        offset = 0,
        default_value = LIST_TYPE_FFCONCAT,
        minimum_value = int.MIN,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "list_type"
    },
    new LibAVUtil.ConstOption () {
        name = "m3u8",
        short_help_text = "M3U8 format",
        offset = 0,
        default_value = LIST_TYPE_M3U8,
        minimum_value = int.MIN,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "list_type"
    },
    new LibAVUtil.ConstOption () {
        name = "hls",
        short_help_text = "Apple HTTP Live Streaming compatible",
        offset = 0,
        default_value = LIST_TYPE_M3U8,
        minimum_value = int.MIN,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "list_type"
    },
    new LibAVUtil.BoolOption () {
        name = "segment_atclocktime",
        short_help_text = "set segment to be cut at clocktime",
        offset = offsetof (
            SegmentContext,
            use_clocktime
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.DurationOption () {
        name = "segment_clocktime_offset",
        short_help_text = "set segment clocktime offset",
        offset = offsetof (
            SegmentContext,
            clocktime_offset
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = 86400000000LL,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.DurationOption () {
        name = "segment_clocktime_wrap_duration",
        short_help_text = "set segment clocktime wrapping duration",
        offset = offsetof (
            SegmentContext,
            clocktime_wrap_duration
        ),
        default_value = int64.MAX,
        minimum_value = 0,
        maximum_value = int64.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_time",
        short_help_text = "set segment duration",
        offset = offsetof (
            SegmentContext,
            time_str
        ),
        default_value = "",
        minimum_value = 0,
        maximum_value = 0,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.DurationOption () {
        name = "segment_time_delta","set approximation value used for the segment times",
        offset = offsetof (
            SegmentContext,
            time_delta
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = int64.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_times",
        short_help_text = "set segment split time points",
        offset = offsetof (
            SegmentContext,
            times_str
        ),
        default_value = "",
        minimum_value = 0,
        maximum_value = 0,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_frames",
        short_help_text = "set segment split frame numbers",
        offset = offsetof (
            SegmentContext,
            frames_str
        ),
        default_value = "",
        minimum_value = 0,
        maximum_value = 0,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "segment_wrap",
        short_help_text = "set number after which the index wraps",
        offset = offsetof (
            SegmentContext,
            segment_idx_wrap
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_list_entry_prefix",
        short_help_text = "set base url prefix for segments",
        offset = offsetof (
            SegmentContext,
            entry_prefix
        ),
        default_value = "",
        minimum_value = 0,
        maximum_value = 0,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "segment_start_number",
        short_help_text = "set the sequence number of the first segment",
        offset = offsetof (
            SegmentContext,
            segment_idx
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "segment_wrap_number",
        short_help_text = "set the number of wrap before the first segment",
        offset = offsetof (
            SegmentContext,
            segment_idx_wrap_nb
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "strftime",
        short_help_text = "set filename expansion with strftime at segment creation",
        offset = offsetof (
            SegmentContext,
            use_strftime
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "increment_tc",
        short_help_text = "increment timecode between each segment",
        offset = offsetof (
            SegmentContext,
            increment_tc
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "break_non_keyframes",
        short_help_text = "allow breaking segments on non-keyframes",
        offset = offsetof (
            SegmentContext,
            break_non_keyframes
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "individual_header_trailer",
        short_help_text = "write header/trailer to each segment",
        offset = offsetof (
            SegmentContext,
            individual_header_trailer
        ),
        default_value = 1,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "write_header_trailer",
        short_help_text = "write a header to the first segment and a trailer to the last one",
        offset = offsetof (
            SegmentContext,
            write_header_trailer
        ),
        default_value = 1,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "reset_timestamps",
        short_help_text = "reset timestamps at the beginning of each segment",
        offset = offsetof (
            SegmentContext,
            reset_timestamps
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.DurationOption () {
        name = "initial_offset",
        short_help_text = "set initial timestamp offset",
        offset = offsetof (
            SegmentContext,
            initial_offset
        ),
        default_value = 0,
        minimum_value = -int64.MAX,
        maximum_value = int64.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "write_empty_segments",
        short_help_text = "allow writing empty 'filler' segments",
        offset = offsetof (
            SegmentContext,
            write_empty
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

}

#if CONFIG_SEGMENT_MUXER

[CCode (cname="seg_class",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
public class SegmentMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override string class_name {
        public get {
            return "segment muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_segment_muxer",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
public class SegmentMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override string name {
        public get {
            return "segment";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override string long_name {
        public get {
            return "segment";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SegmentContext);

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_FILE | AVFormatFlags1.WANTS_GLOBAL_HEADER;

        }

    }

    [CCode (cname="seg_init",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="seg_write_header",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="seg_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="seg_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="seg_free",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="seg_check_bitstream",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = seg_class;
}
#endif

#if CONFIG_STREAM_SEGMENT_MUXER

[CCode (cname="sseg_class",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
public class StreamSegmentMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override string class_name {
        public get {
            return "stream_segment muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_stream_segment_muxer",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
public class StreamSegmentMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override string name {
        public get {
            return "stream_segment,ssegment";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override string long_name {
        public get {
            return "streaming segment muxer";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SegmentContext);

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_FILE;

        }

    }

    [CCode (cname="seg_init",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="seg_write_header",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="seg_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="seg_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="seg_free",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="seg_check_bitstream",cheader_filename="subprojects/ffmpeg/libavformat/segment.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = sseg_class;
}
#endif

} // namespace LibAVFormat
