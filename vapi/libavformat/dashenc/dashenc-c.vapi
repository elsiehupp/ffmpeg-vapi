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

[CCode (cname="",cheader_filename="")]

static const LibAVUtil.Option options[] = {
    new LibAVUtil.StringOption () {
        name = "adaptation_sets",
        short_help_text = "Adaptation sets. Syntax: id=0,streams=0,1,2 id=1,streams=3,4 and so on",
        offsetof (
            DASHContext,
            adaptation_sets
        ),
        {
            0
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "window_size",
        short_help_text = "number of segments kept in the manifest",
        offsetof (
            DASHContext,
            window_size
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "extra_window_size",
        short_help_text = "number of segments kept outside of the manifest before removing from disk",
        offsetof (
            DASHContext,
            extra_window_size
        ),
        {
            .i64 = 5
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
#if FF_API_DASH_MIN_SEG_DURATION
    new LibAVUtil.IntOption () {
        name = "min_seg_duration",
        short_help_text = "minimum segment duration (in microseconds) (will be deprecated)",
        offsetof (
            DASHContext,
            min_seg_duration
        ),
        {
            .i64 = 5000000
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
#endif

    new LibAVUtil.DurationOption () {
        name = "seg_duration",
        short_help_text = "segment duration (in seconds, fractional value can be set)",
        offsetof (
            DASHContext,
            seg_duration
        ),
        {
            .i64 = 5000000
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    }new LibAVUtil.BoolOption () ,
    new LibAVUtil.IntOption () {
        name = "remove_at_exit",
        short_help_text = "remove all segments when finished",
        offsetof (
            DASHContext,
            remove_at_exit
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "use_template",
        short_help_text = "Use SegmentTemplate instead of SegmentList",
        offsetof (
            DASHContext,
            use_template
        ),
        {
            .i64 = 1
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "use_timeline",
        short_help_text = "Use SegmentTimeline in SegmentTemplate",
        offsetof (
            DASHContext,
            use_timeline
        ),
        {
            .i64 = 1
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "single_file",
        short_help_text = "Store all segments in one file, accessed using byte ranges",
        offsetof (
            DASHContext,
            single_file
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "single_file_name",
        short_help_text = "DASH-templated name to be used for baseURL. Implies storing all segments in one file, accessed using byte ranges",
        offsetof (
            DASHContext,
            single_file_name
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "init_seg_name",
        short_help_text = "DASH-templated name to used for the initialization segment",
        offsetof (
            DASHContext,
            init_seg_name
        ),
        {
            .str = "init-stream$RepresentationID$.$ext$"
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "media_seg_name",
        short_help_text = "DASH-templated name to used for the media segments",
        offsetof (
            DASHContext,
            media_seg_name
        ),
        {
            .str = "chunk-stream$RepresentationID$-$Number%05d$.$ext$"
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "utc_timing_url",
        short_help_text = "URL of the page that will return the UTC timestamp in ISO format",
        offsetof (
            DASHContext,
            utc_timing_url
        ),
        {
            0
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "method",
        short_help_text = "set the HTTP method",
        offsetof (
            DASHContext,
            method
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "http_user_agent",
        short_help_text = "override User-Agent field in HTTP header",
        offsetof (
            DASHContext,
            user_agent
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "http_persistent",
        short_help_text = "Use persistent HTTP connections",
        offsetof (
            DASHContext,
            http_persistent
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "hls_playlist",
        short_help_text = "Generate HLS playlist files (master.m3u8, media_%d.m3u8)",
        offsetof (
            DASHContext,
            hls_playlist
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "streaming",
        short_help_text = "Enable/Disable streaming mode of output. Each frame will be moof fragment",
        offsetof (
            DASHContext,
            streaming
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.DurationOption () {
        name = "timeout",
        short_help_text = "set timeout for socket I/O operations",
        offsetof (
            DASHContext,
            timeout
        ),
        {
            .i64 = -1
        },
        -1,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "index_correction",
        short_help_text = "Enable/Disable segment index correction logic",
        offsetof (
            DASHContext,
            index_correction
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "format_options",
        short_help_text = "set list of options for the container format (mp4/webm) used for dash",
        offsetof (
            DASHContext,
            format_options_str
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "global_sidx",
        short_help_text = "Write global SIDX atom. Applicable only for single file, mp4 output, non-streaming mode",
        offsetof (
            DASHContext,
            global_sidx
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "dash_segment_type",
        short_help_text = "set dash segment files type",
        offsetof (
            DASHContext,
            segment_type_option
        ),
        {
            .i64 = SEGMENT_TYPE_AUTO
        },
        0,
        SEGMENT_TYPE_NB - 1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "segment_type"
    },
    new LibAVUtil.ConstOption () {
        name = "auto",
        short_help_text = "select segment file format based on codec",
        0,
        {
            .i64 = SEGMENT_TYPE_AUTO
        },
        0,
        uint.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "segment_type"
    },
    new LibAVUtil.ConstOption () {
        name = "mp4",
        short_help_text = "make segment file in ISOBMFF format",
        0,
        {
            .i64 = SEGMENT_TYPE_MP4
        },
        0,
        uint.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "segment_type"
    },
    new LibAVUtil.ConstOption () {
        name = "webm",
        short_help_text = "make segment file in WebM format",
        0,
        {
            .i64 = SEGMENT_TYPE_WEBM
        },
        0,
        uint.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "segment_type"
    },
    new LibAVUtil.BoolOption () {
        name = "ignore_io_errors",
        short_help_text = "Ignore IO errors during open and write. Useful for long-duration runs with network output",
        offsetof (
            DASHContext,
            ignore_io_errors
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "lhls",
        short_help_text = "Enable Low-latency HLS (Experimental). Adds #EXT-X-PREFETCH tag with current segment's URI",
        offsetof (
            DASHContext,
            lhls
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "master_m3u8_publish_rate",
        short_help_text = "Publish master playlist every after this many segment intervals",
        offsetof (
            DASHContext,
            master_publish_rate
        ),
        {
            .i64 = 0
        },
        0,
        uint.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="dash_class",cheader_filename="ffmpeg/libformat/dashenc.c")]
public class DashMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override string class_name {
        public get {
            return "dash muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct DASHContext",cheader_filename="ffmpeg/libformat/dashenc.c")]
[Compact]
public class DashMuxerPrivateData { }

[CCode (cname="ff_dash_muxer",cheader_filename="ffmpeg/libformat/dashenc.c")]
public class DashMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override string name {
        public get {
            return "dash";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override string long_name {
        public get {
            return "DASH Muxer";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override string extensions {
        public get {
            return "mpd";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (DashMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;

        }

    }

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GLOBALHEADER | AVFMT_NOFILE | AVFMT_TS_NEGATIVE;

        }

    }

    [CCode (cname="dash_init",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="dash_write_header",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="dash_write_packet",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="dash_write_trailer",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="dash_free",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="dash_check_bitstream",cheader_filename="ffmpeg/libformat/dashenc.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = dash_class;
}

} // namespace LibAVFormat
