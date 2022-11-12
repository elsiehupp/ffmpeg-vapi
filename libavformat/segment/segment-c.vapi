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
@url{http://tools.ietf.org/id/draft-pantos-http-live-streaming}
***********************************************************/

//  #define OFFSET(x) offsetof(SegmentContext, x)
//  #define E AV_OPT_FLAG_ENCODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      { "reference_stream",  "set reference stream", OFFSET(reference_stream_specifier), AV_OPT_TYPE_STRING, {.str = "auto"}, CHAR_MIN, CHAR_MAX, E },
//      { "segment_format",    "set container format used for the segments", OFFSET(format),  AV_OPT_TYPE_STRING, {.str = NULL},  0, 0,       E },
//      { "segment_format_options", "set list of options for the container format used for the segments", OFFSET(format_options_str), AV_OPT_TYPE_STRING, {.str = NULL}, 0, 0, E },
//      { "segment_list",      "set the segment list filename",              OFFSET(list),    AV_OPT_TYPE_STRING, {.str = NULL},  0, 0,       E },
//      { "segment_header_filename", "write a single file containing the header", OFFSET(header_filename), AV_OPT_TYPE_STRING, {.str = NULL}, 0, 0, E },

//      { "segment_list_flags","set flags affecting segment list generation", OFFSET(list_flags), AV_OPT_TYPE_FLAGS, {.i64 = SEGMENT_LIST_FLAG_CACHE }, 0, UINT_MAX, E, "list_flags"},
//      { "cache",             "allow list caching",                                    0, AV_OPT_TYPE_CONST, {.i64 = SEGMENT_LIST_FLAG_CACHE }, INT_MIN, INT_MAX,   E, "list_flags"},
//      { "live",              "enable live-friendly list generation (useful for HLS)", 0, AV_OPT_TYPE_CONST, {.i64 = SEGMENT_LIST_FLAG_LIVE }, INT_MIN, INT_MAX,    E, "list_flags"},

//      { "segment_list_size", "set the maximum number of playlist entries", OFFSET(list_size), AV_OPT_TYPE_INT,  {.i64 = 0},     0, INT_MAX, E },

//      { "segment_list_type", "set the segment list type",                  OFFSET(list_type), AV_OPT_TYPE_INT,  {.i64 = LIST_TYPE_UNDEFINED}, -1, LIST_TYPE_NB-1, E, "list_type" },
//      { "flat", "flat format",     0, AV_OPT_TYPE_CONST, {.i64=LIST_TYPE_FLAT }, INT_MIN, INT_MAX, E, "list_type" },
//      { "csv",  "csv format",      0, AV_OPT_TYPE_CONST, {.i64=LIST_TYPE_CSV  }, INT_MIN, INT_MAX, E, "list_type" },
//      { "ext",  "extended format", 0, AV_OPT_TYPE_CONST, {.i64=LIST_TYPE_EXT  }, INT_MIN, INT_MAX, E, "list_type" },
//      { "ffconcat", "ffconcat format", 0, AV_OPT_TYPE_CONST, {.i64=LIST_TYPE_FFCONCAT }, INT_MIN, INT_MAX, E, "list_type" },
//      { "m3u8", "M3U8 format",     0, AV_OPT_TYPE_CONST, {.i64=LIST_TYPE_M3U8 }, INT_MIN, INT_MAX, E, "list_type" },
//      { "hls", "Apple HTTP Live Streaming compatible", 0, AV_OPT_TYPE_CONST, {.i64=LIST_TYPE_M3U8 }, INT_MIN, INT_MAX, E, "list_type" },

//      { "segment_atclocktime",      "set segment to be cut at clocktime",  OFFSET(use_clocktime), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, E},
//      { "segment_clocktime_offset", "set segment clocktime offset",        OFFSET(clocktime_offset), AV_OPT_TYPE_DURATION, {.i64 = 0}, 0, 86400000000LL, E},
//      { "segment_clocktime_wrap_duration", "set segment clocktime wrapping duration", OFFSET(clocktime_wrap_duration), AV_OPT_TYPE_DURATION, {.i64 = INT64_MAX}, 0, INT64_MAX, E},
//      { "segment_time",      "set segment duration",                       OFFSET(time_str),AV_OPT_TYPE_STRING, {.str = NULL},  0, 0,       E },
//      { "segment_time_delta","set approximation value used for the segment times", OFFSET(time_delta), AV_OPT_TYPE_DURATION, {.i64 = 0}, 0, INT64_MAX, E },
//      { "segment_times",     "set segment split time points",              OFFSET(times_str),AV_OPT_TYPE_STRING,{.str = NULL},  0, 0,       E },
//      { "segment_frames",    "set segment split frame numbers",            OFFSET(frames_str),AV_OPT_TYPE_STRING,{.str = NULL},  0, 0,       E },
//      { "segment_wrap",      "set number after which the index wraps",     OFFSET(segment_idx_wrap), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, E },
//      { "segment_list_entry_prefix", "set base url prefix for segments", OFFSET(entry_prefix), AV_OPT_TYPE_STRING,  {.str = NULL}, 0, 0, E },
//      { "segment_start_number", "set the sequence number of the first segment", OFFSET(segment_idx), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, E },
//      { "segment_wrap_number", "set the number of wrap before the first segment", OFFSET(segment_idx_wrap_nb), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, E },
//      { "strftime",          "set filename expansion with strftime at segment creation", OFFSET(use_strftime), AV_OPT_TYPE_BOOL, {.i64 = 0 }, 0, 1, E },
//      { "increment_tc", "increment timecode between each segment", OFFSET(increment_tc), AV_OPT_TYPE_BOOL, {.i64 = 0 }, 0, 1, E },
//      { "break_non_keyframes", "allow breaking segments on non-keyframes", OFFSET(break_non_keyframes), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, E },

//      { "individual_header_trailer", "write header/trailer to each segment", OFFSET(individual_header_trailer), AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, E },
//      { "write_header_trailer", "write a header to the first segment and a trailer to the last one", OFFSET(write_header_trailer), AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, E },
//      { "reset_timestamps", "reset timestamps at the beginning of each segment", OFFSET(reset_timestamps), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, E },
//      { "initial_offset", "set initial timestamp offset", OFFSET(initial_offset), AV_OPT_TYPE_DURATION, {.i64 = 0}, -INT64_MAX, INT64_MAX, E },
//      { "write_empty_segments", "allow writing empty 'filler' segments", OFFSET(write_empty), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, E },
//      { NULL },
//  }

#if CONFIG_SEGMENT_MUXER
[CCode (cname="seg_class", cheader_filename="")]
public class SegmentMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "segment muxer";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_segment_muxer", cheader_filename="")]
public class SegmentMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "segment";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "segment";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SegmentContext);
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOFILE | AVFMT_GLOBALHEADER;
        }
    }

    [CCode (cname="seg_init", cheader_filename="")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="seg_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="seg_write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="seg_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="seg_free", cheader_filename="")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="seg_check_bitstream", cheader_filename="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = seg_class,
}
#endif

#if CONFIG_STREAM_SEGMENT_MUXER
[CCode (cname="sseg_class", cheader_filename="")]
public class StreamSegmentMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "stream_segment muxer";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_stream_segment_muxer", cheader_filename="")]
public class StreamSegmentMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "stream_segment,ssegment";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "streaming segment muxer";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SegmentContext);
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOFILE;
        }
    }

    [CCode (cname="seg_init", cheader_filename="")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="seg_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="seg_write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="seg_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="seg_free", cheader_filename="")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="seg_check_bitstream", cheader_filename="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = sseg_class,
}
#endif

} // namespace LibAVFormat
