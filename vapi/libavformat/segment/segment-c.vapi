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

[CCode (cname="",cheader_filename="")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.StringOption () {
        name = "reference_stream",
        short_help_text = "set reference stream",
        offsetof (
            SegmentContext,
            reference_stream_specifier
        ),
        {
            .str = "auto"
        },
        char.MIN,
        char.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_format",
        short_help_text = "set container format used for the segments",
        offsetof (
            SegmentContext,
            format
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_format_options",
        short_help_text = "set list of options for the container format used for the segments",
        offsetof (
            SegmentContext,
            format_options_str
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_list",
        short_help_text = "set the segment list filename",
        offsetof (
            SegmentContext,
            list
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_header_filename",
        short_help_text = "write a single file containing the header",
        offsetof (
            SegmentContext,
            header_filename
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.FlagsOption () {
        name = "segment_list_flags","set flags affecting segment list generation",
        offsetof (
            SegmentContext,
            list_flags
        ),
        {
            .i64 = SEGMENT_LIST_FLAG_CACHE
        },
        0,
        uint.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "list_flags"
    },
    new LibAVUtil.ConstOption () {
        name = "cache",
        short_help_text = "allow list caching",
        0,
        {
            .i64 = SEGMENT_LIST_FLAG_CACHE
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "list_flags"
    },
    new LibAVUtil.ConstOption () {
        name = "live",
        short_help_text = "enable live-friendly list generation (useful for HLS)",
        0,
        {
            .i64 = SEGMENT_LIST_FLAG_LIVE
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "list_flags"
    },
    new LibAVUtil.IntOption () {
        name = "segment_list_size",
        short_help_text = "set the maximum number of playlist entries",
        offsetof (
            SegmentContext,
            list_size
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "segment_list_type",
        short_help_text = "set the segment list type",
        offsetof (
            SegmentContext,
            list_type
        ),
        {
            .i64 = LIST_TYPE_UNDEFINED
        },
        -1,
        LIST_TYPE_NB - 1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "list_type"
    },
    new LibAVUtil.ConstOption () {
        name = "flat",
        short_help_text = "flat format",
        0,
        {
            .i64 = LIST_TYPE_FLAT
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "list_type"
    },
    new LibAVUtil.ConstOption () {
        name = "csv",
        short_help_text = "csv format",
        0,
        {
            .i64 = LIST_TYPE_CSV
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "list_type"
    },
    new LibAVUtil.ConstOption () {
        name = "ext",
        short_help_text = "extended format",
        0,
        {
            .i64 = LIST_TYPE_EXT
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "list_type"
    },
    new LibAVUtil.ConstOption () {
        name = "ffconcat",
        short_help_text = "ffconcat format",
        0,
        {
            .i64 = LIST_TYPE_FFCONCAT
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "list_type"
    },
    new LibAVUtil.ConstOption () {
        name = "m3u8",
        short_help_text = "M3U8 format",
        0,
        {
            .i64 = LIST_TYPE_M3U8
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "list_type"
    },
    new LibAVUtil.ConstOption () {
        name = "hls",
        short_help_text = "Apple HTTP Live Streaming compatible",
        0,
        {
            .i64 = LIST_TYPE_M3U8
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "list_type"
    },
    new LibAVUtil.BoolOption () {
        name = "segment_atclocktime",
        short_help_text = "set segment to be cut at clocktime",
        offsetof (
            SegmentContext,
            use_clocktime
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.DurationOption () {
        name = "segment_clocktime_offset",
        short_help_text = "set segment clocktime offset",
        offsetof (
            SegmentContext,
            clocktime_offset
        ),
        {
            .i64 = 0
        },
        0,
        86400000000LL,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.DurationOption () {
        name = "segment_clocktime_wrap_duration",
        short_help_text = "set segment clocktime wrapping duration",
        offsetof (
            SegmentContext,
            clocktime_wrap_duration
        ),
        {
            .i64 = int64.MAX
        },
        0,
        int64.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_time",
        short_help_text = "set segment duration",
        offsetof (
            SegmentContext,
            time_str
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.DurationOption () {
        name = "segment_time_delta","set approximation value used for the segment times",
        offsetof (
            SegmentContext,
            time_delta
        ),
        {
            .i64 = 0
        },
        0,
        int64.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_times",
        short_help_text = "set segment split time points",
        offsetof (
            SegmentContext,
            times_str
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_frames",
        short_help_text = "set segment split frame numbers",
        offsetof (
            SegmentContext,
            frames_str
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "segment_wrap",
        short_help_text = "set number after which the index wraps",
        offsetof (
            SegmentContext,
            segment_idx_wrap
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "segment_list_entry_prefix",
        short_help_text = "set base url prefix for segments",
        offsetof (
            SegmentContext,
            entry_prefix
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "segment_start_number",
        short_help_text = "set the sequence number of the first segment",
        offsetof (
            SegmentContext,
            segment_idx
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "segment_wrap_number",
        short_help_text = "set the number of wrap before the first segment",
        offsetof (
            SegmentContext,
            segment_idx_wrap_nb
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "strftime",
        short_help_text = "set filename expansion with strftime at segment creation",
        offsetof (
            SegmentContext,
            use_strftime
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "increment_tc",
        short_help_text = "increment timecode between each segment",
        offsetof (
            SegmentContext,
            increment_tc
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "break_non_keyframes",
        short_help_text = "allow breaking segments on non-keyframes",
        offsetof (
            SegmentContext,
            break_non_keyframes
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "individual_header_trailer",
        short_help_text = "write header/trailer to each segment",
        offsetof (
            SegmentContext,
            individual_header_trailer
        ),
        {
            .i64 = 1
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "write_header_trailer",
        short_help_text = "write a header to the first segment and a trailer to the last one",
        offsetof (
            SegmentContext,
            write_header_trailer
        ),
        {
            .i64 = 1
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "reset_timestamps",
        short_help_text = "reset timestamps at the beginning of each segment",
        offsetof (
            SegmentContext,
            reset_timestamps
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.DurationOption () {
        name = "initial_offset",
        short_help_text = "set initial timestamp offset",
        offsetof (
            SegmentContext,
            initial_offset
        ),
        {
            .i64 = 0
        },
        -int64.MAX,
        int64.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "write_empty_segments",
        short_help_text = "allow writing empty 'filler' segments",
        offsetof (
            SegmentContext,
            write_empty
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

}

#if CONFIG_SEGMENT_MUXER

[CCode (cname="seg_class",cheader_filename="ffmpeg/libformat/segment.c")]
public class SegmentMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/segment.c")]
    public override string class_name {
        public get {
            return "segment muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/segment.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/segment.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/segment.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_segment_muxer",cheader_filename="ffmpeg/libformat/segment.c")]
public class SegmentMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/segment.c")]
    public override string name {
        public get {
            return "segment";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/segment.c")]
    public override string long_name {
        public get {
            return "segment";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/segment.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SegmentContext);

        }

    }

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/segment.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOFILE | AVFMT_GLOBALHEADER;

        }

    }

    [CCode (cname="seg_init",cheader_filename="ffmpeg/libformat/segment.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="seg_write_header",cheader_filename="ffmpeg/libformat/segment.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="seg_write_packet",cheader_filename="ffmpeg/libformat/segment.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="seg_write_trailer",cheader_filename="ffmpeg/libformat/segment.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="seg_free",cheader_filename="ffmpeg/libformat/segment.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="seg_check_bitstream",cheader_filename="ffmpeg/libformat/segment.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = seg_class;
}
#endif

#if CONFIG_STREAM_SEGMENT_MUXER

[CCode (cname="sseg_class",cheader_filename="ffmpeg/libformat/segment.c")]
public class StreamSegmentMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/segment.c")]
    public override string class_name {
        public get {
            return "stream_segment muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/segment.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/segment.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/segment.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_stream_segment_muxer",cheader_filename="ffmpeg/libformat/segment.c")]
public class StreamSegmentMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/segment.c")]
    public override string name {
        public get {
            return "stream_segment,ssegment";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/segment.c")]
    public override string long_name {
        public get {
            return "streaming segment muxer";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/segment.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SegmentContext);

        }

    }

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/segment.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOFILE;

        }

    }

    [CCode (cname="seg_init",cheader_filename="ffmpeg/libformat/segment.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="seg_write_header",cheader_filename="ffmpeg/libformat/segment.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="seg_write_packet",cheader_filename="ffmpeg/libformat/segment.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="seg_write_trailer",cheader_filename="ffmpeg/libformat/segment.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="seg_free",cheader_filename="ffmpeg/libformat/segment.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="seg_check_bitstream",cheader_filename="ffmpeg/libformat/segment.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = sseg_class;
}
#endif

} // namespace LibAVFormat
