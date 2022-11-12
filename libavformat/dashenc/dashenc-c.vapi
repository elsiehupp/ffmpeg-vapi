/***********************************************************
@brief MPEG-DASH ISO BMFF segmenter
@copyright 2014 Martin Storsjo
@copyright 2018 Akamai Technologies, Inc.
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

//  #define OFFSET(x) offsetof(DASHContext, x)
//  #define E AV_OPT_FLAG_ENCODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      { "adaptation_sets", "Adaptation sets. Syntax: id=0,streams=0,1,2 id=1,streams=3,4 and so on", OFFSET(adaptation_sets), AV_OPT_TYPE_STRING, { 0 }, 0, 0, AV_OPT_FLAG_ENCODING_PARAM },
//      { "window_size", "number of segments kept in the manifest", OFFSET(window_size), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX, E },
//      { "extra_window_size", "number of segments kept outside of the manifest before removing from disk", OFFSET(extra_window_size), AV_OPT_TYPE_INT, { .i64 = 5 }, 0, INT_MAX, E },
//  #if FF_API_DASH_MIN_SEG_DURATION
//      { "min_seg_duration", "minimum segment duration (in microseconds) (will be deprecated)", OFFSET(min_seg_duration), AV_OPT_TYPE_INT, { .i64 = 5000000 }, 0, INT_MAX, E },
//  #endif
//      { "seg_duration", "segment duration (in seconds, fractional value can be set)", OFFSET(seg_duration), AV_OPT_TYPE_DURATION, { .i64 = 5000000 }, 0, INT_MAX, E },
//      { "remove_at_exit", "remove all segments when finished", OFFSET(remove_at_exit), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, E },
//      { "use_template", "Use SegmentTemplate instead of SegmentList", OFFSET(use_template), AV_OPT_TYPE_BOOL, { .i64 = 1 }, 0, 1, E },
//      { "use_timeline", "Use SegmentTimeline in SegmentTemplate", OFFSET(use_timeline), AV_OPT_TYPE_BOOL, { .i64 = 1 }, 0, 1, E },
//      { "single_file", "Store all segments in one file, accessed using byte ranges", OFFSET(single_file), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, E },
//      { "single_file_name", "DASH-templated name to be used for baseURL. Implies storing all segments in one file, accessed using byte ranges", OFFSET(single_file_name), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, E },
//      { "init_seg_name", "DASH-templated name to used for the initialization segment", OFFSET(init_seg_name), AV_OPT_TYPE_STRING, {.str = "init-stream$RepresentationID$.$ext$"}, 0, 0, E },
//      { "media_seg_name", "DASH-templated name to used for the media segments", OFFSET(media_seg_name), AV_OPT_TYPE_STRING, {.str = "chunk-stream$RepresentationID$-$Number%05d$.$ext$"}, 0, 0, E },
//      { "utc_timing_url", "URL of the page that will return the UTC timestamp in ISO format", OFFSET(utc_timing_url), AV_OPT_TYPE_STRING, { 0 }, 0, 0, E },
//      { "method", "set the HTTP method", OFFSET(method), AV_OPT_TYPE_STRING, {.str = NULL}, 0, 0, E },
//      { "http_user_agent", "override User-Agent field in HTTP header", OFFSET(user_agent), AV_OPT_TYPE_STRING, {.str = NULL}, 0, 0, E},
//      { "http_persistent", "Use persistent HTTP connections", OFFSET(http_persistent), AV_OPT_TYPE_BOOL, {.i64 = 0 }, 0, 1, E },
//      { "hls_playlist", "Generate HLS playlist files(master.m3u8, media_%d.m3u8)", OFFSET(hls_playlist), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, E },
//      { "streaming", "Enable/Disable streaming mode of output. Each frame will be moof fragment", OFFSET(streaming), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, E },
//      { "timeout", "set timeout for socket I/O operations", OFFSET(timeout), AV_OPT_TYPE_DURATION, { .i64 = -1 }, -1, INT_MAX, .flags = E },
//      { "index_correction", "Enable/Disable segment index correction logic", OFFSET(index_correction), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, E },
//      { "format_options","set list of options for the container format (mp4/webm) used for dash", OFFSET(format_options_str), AV_OPT_TYPE_STRING, {.str = NULL},  0, 0, E},
//      { "global_sidx", "Write global SIDX atom. Applicable only for single file, mp4 output, non-streaming mode", OFFSET(global_sidx), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, E },
//      { "dash_segment_type", "set dash segment files type", OFFSET(segment_type_option), AV_OPT_TYPE_INT, {.i64 = SEGMENT_TYPE_AUTO }, 0, SEGMENT_TYPE_NB - 1, E, "segment_type"},
//      { "auto", "select segment file format based on codec", 0, AV_OPT_TYPE_CONST, {.i64 = SEGMENT_TYPE_AUTO }, 0, UINT_MAX,   E, "segment_type"},
//      { "mp4", "make segment file in ISOBMFF format", 0, AV_OPT_TYPE_CONST, {.i64 = SEGMENT_TYPE_MP4 }, 0, UINT_MAX,   E, "segment_type"},
//      { "webm", "make segment file in WebM format", 0, AV_OPT_TYPE_CONST, {.i64 = SEGMENT_TYPE_WEBM }, 0, UINT_MAX,   E, "segment_type"},
//      { "ignore_io_errors", "Ignore IO errors during open and write. Useful for long-duration runs with network output", OFFSET(ignore_io_errors), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, E },
//      { "lhls", "Enable Low-latency HLS(Experimental). Adds #EXT-X-PREFETCH tag with current segment's URI", OFFSET(lhls), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, E },
//      { "master_m3u8_publish_rate", "Publish master playlist every after this many segment intervals", OFFSET(master_publish_rate), AV_OPT_TYPE_INT, {.i64 = 0}, 0, UINT_MAX, E},
//      { NULL },
//  }

[CCode (cname="dash_class", cheader_filename="")]
public class DashMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "dash muxer";
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

[CCode (cname="struct DASHContext", cheader_filename="")]
public struct DashMuxerPrivateData { }

[CCode (cname="ff_dash_muxer", cheader_filename="")]
public class DashMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "dash";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "DASH Muxer";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "mpd";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (DashMuxerPrivateData);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GLOBALHEADER | AVFMT_NOFILE | AVFMT_TS_NEGATIVE;
        }
    }

    [CCode (cname="dash_init", cheader_filename="")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="dash_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="dash_write_packet", cheader_filename="")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="dash_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="dash_free", cheader_filename="")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="dash_check_bitstream", cheader_filename="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = dash_class,
}

} // namespace LibAVFormat
