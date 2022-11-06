/*
 * Copyright (c) 2011, Luca Barbato
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

/**
 * @file generic segmenter
 * M3U8 specification can be find here:
 * @url{http://tools.ietf.org/id/draft-pantos-http-live-streaming}
 */

#define OFFSET(x) offsetof(SegmentContext, x)
#define E AV_OPT_FLAG_ENCODING_PARAM
static const AVOption options[] = {
    { "reference_stream",  "set reference stream", OFFSET(reference_stream_specifier), AV_OPT_TYPE_STRING, {.str = "auto"}, CHAR_MIN, CHAR_MAX, E },
    { "segment_format",    "set container format used for the segments", OFFSET(format),  AV_OPT_TYPE_STRING, {.str = NULL},  0, 0,       E },
    { "segment_format_options", "set list of options for the container format used for the segments", OFFSET(format_options_str), AV_OPT_TYPE_STRING, {.str = NULL}, 0, 0, E },
    { "segment_list",      "set the segment list filename",              OFFSET(list),    AV_OPT_TYPE_STRING, {.str = NULL},  0, 0,       E },
    { "segment_header_filename", "write a single file containing the header", OFFSET(header_filename), AV_OPT_TYPE_STRING, {.str = NULL}, 0, 0, E },

    { "segment_list_flags","set flags affecting segment list generation", OFFSET(list_flags), AV_OPT_TYPE_FLAGS, {.i64 = SEGMENT_LIST_FLAG_CACHE }, 0, UINT_MAX, E, "list_flags"},
    { "cache",             "allow list caching",                                    0, AV_OPT_TYPE_CONST, {.i64 = SEGMENT_LIST_FLAG_CACHE }, INT_MIN, INT_MAX,   E, "list_flags"},
    { "live",              "enable live-friendly list generation (useful for HLS)", 0, AV_OPT_TYPE_CONST, {.i64 = SEGMENT_LIST_FLAG_LIVE }, INT_MIN, INT_MAX,    E, "list_flags"},

    { "segment_list_size", "set the maximum number of playlist entries", OFFSET(list_size), AV_OPT_TYPE_INT,  {.i64 = 0},     0, INT_MAX, E },

    { "segment_list_type", "set the segment list type",                  OFFSET(list_type), AV_OPT_TYPE_INT,  {.i64 = LIST_TYPE_UNDEFINED}, -1, LIST_TYPE_NB-1, E, "list_type" },
    { "flat", "flat format",     0, AV_OPT_TYPE_CONST, {.i64=LIST_TYPE_FLAT }, INT_MIN, INT_MAX, E, "list_type" },
    { "csv",  "csv format",      0, AV_OPT_TYPE_CONST, {.i64=LIST_TYPE_CSV  }, INT_MIN, INT_MAX, E, "list_type" },
    { "ext",  "extended format", 0, AV_OPT_TYPE_CONST, {.i64=LIST_TYPE_EXT  }, INT_MIN, INT_MAX, E, "list_type" },
    { "ffconcat", "ffconcat format", 0, AV_OPT_TYPE_CONST, {.i64=LIST_TYPE_FFCONCAT }, INT_MIN, INT_MAX, E, "list_type" },
    { "m3u8", "M3U8 format",     0, AV_OPT_TYPE_CONST, {.i64=LIST_TYPE_M3U8 }, INT_MIN, INT_MAX, E, "list_type" },
    { "hls", "Apple HTTP Live Streaming compatible", 0, AV_OPT_TYPE_CONST, {.i64=LIST_TYPE_M3U8 }, INT_MIN, INT_MAX, E, "list_type" },

    { "segment_atclocktime",      "set segment to be cut at clocktime",  OFFSET(use_clocktime), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, E},
    { "segment_clocktime_offset", "set segment clocktime offset",        OFFSET(clocktime_offset), AV_OPT_TYPE_DURATION, {.i64 = 0}, 0, 86400000000LL, E},
    { "segment_clocktime_wrap_duration", "set segment clocktime wrapping duration", OFFSET(clocktime_wrap_duration), AV_OPT_TYPE_DURATION, {.i64 = INT64_MAX}, 0, INT64_MAX, E},
    { "segment_time",      "set segment duration",                       OFFSET(time_str),AV_OPT_TYPE_STRING, {.str = NULL},  0, 0,       E },
    { "segment_time_delta","set approximation value used for the segment times", OFFSET(time_delta), AV_OPT_TYPE_DURATION, {.i64 = 0}, 0, INT64_MAX, E },
    { "segment_times",     "set segment split time points",              OFFSET(times_str),AV_OPT_TYPE_STRING,{.str = NULL},  0, 0,       E },
    { "segment_frames",    "set segment split frame numbers",            OFFSET(frames_str),AV_OPT_TYPE_STRING,{.str = NULL},  0, 0,       E },
    { "segment_wrap",      "set number after which the index wraps",     OFFSET(segment_idx_wrap), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, E },
    { "segment_list_entry_prefix", "set base url prefix for segments", OFFSET(entry_prefix), AV_OPT_TYPE_STRING,  {.str = NULL}, 0, 0, E },
    { "segment_start_number", "set the sequence number of the first segment", OFFSET(segment_idx), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, E },
    { "segment_wrap_number", "set the number of wrap before the first segment", OFFSET(segment_idx_wrap_nb), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, E },
    { "strftime",          "set filename expansion with strftime at segment creation", OFFSET(use_strftime), AV_OPT_TYPE_BOOL, {.i64 = 0 }, 0, 1, E },
    { "increment_tc", "increment timecode between each segment", OFFSET(increment_tc), AV_OPT_TYPE_BOOL, {.i64 = 0 }, 0, 1, E },
    { "break_non_keyframes", "allow breaking segments on non-keyframes", OFFSET(break_non_keyframes), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, E },

    { "individual_header_trailer", "write header/trailer to each segment", OFFSET(individual_header_trailer), AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, E },
    { "write_header_trailer", "write a header to the first segment and a trailer to the last one", OFFSET(write_header_trailer), AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, E },
    { "reset_timestamps", "reset timestamps at the beginning of each segment", OFFSET(reset_timestamps), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, E },
    { "initial_offset", "set initial timestamp offset", OFFSET(initial_offset), AV_OPT_TYPE_DURATION, {.i64 = 0}, -INT64_MAX, INT64_MAX, E },
    { "write_empty_segments", "allow writing empty 'filler' segments", OFFSET(write_empty), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, E },
    { NULL },
};

#if CONFIG_SEGMENT_MUXER
static const AVClass seg_class = {
    .class_name = "segment muxer",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_segment_muxer = {
    .name           = "segment",
    .long_name      = NULL_IF_CONFIG_SMALL("segment"),
    .priv_data_size = sizeof(SegmentContext),
    .flags          = AVFMT_NOFILE|AVFMT_GLOBALHEADER,
    .init           = seg_init,
    .write_header   = seg_write_header,
    .write_packet   = seg_write_packet,
    .write_trailer  = seg_write_trailer,
    .deinit         = seg_free,
    .check_bitstream = seg_check_bitstream,
    .priv_class     = &seg_class,
};
#endif

#if CONFIG_STREAM_SEGMENT_MUXER
static const AVClass sseg_class = {
    .class_name = "stream_segment muxer",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_stream_segment_muxer = {
    .name           = "stream_segment,ssegment",
    .long_name      = NULL_IF_CONFIG_SMALL("streaming segment muxer"),
    .priv_data_size = sizeof(SegmentContext),
    .flags          = AVFMT_NOFILE,
    .init           = seg_init,
    .write_header   = seg_write_header,
    .write_packet   = seg_write_packet,
    .write_trailer  = seg_write_trailer,
    .deinit         = seg_free,
    .check_bitstream = seg_check_bitstream,
    .priv_class     = &sseg_class,
};
#endif