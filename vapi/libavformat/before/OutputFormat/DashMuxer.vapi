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

[CCode (cname="dash_class",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
public class DashMuxerClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override string class_name {
        public get {
            return "dash muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.StringOption () {
                    name = "adaptation_sets",
                    short_help_text = "Adaptation sets. Syntax: id=0,streams=0,1,2 id=1,streams=3,4 and so on",
                    offset = offsetof (
                        DASHContext,
                        adaptation_sets
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "window_size",
                    short_help_text = "number of segments kept in the manifest",
                    offset = offsetof (
                        DASHContext,
                        window_size
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "extra_window_size",
                    short_help_text = "number of segments kept outside of the manifest before removing from disk",
                    offset = offsetof (
                        DASHContext,
                        extra_window_size
                    ),
                    default_value = 5,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
            #if FF_API_DASH_MIN_SEG_DURATION
                new LibAVUtil.IntOption () {
                    name = "min_seg_duration",
                    short_help_text = "minimum segment duration (in microseconds) (will be deprecated)",
                    offset = offsetof (
                        DASHContext,
                        min_seg_duration
                    ),
                    default_value = 5000000,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
            #endif

                new LibAVUtil.DurationOption () {
                    name = "seg_duration",
                    short_help_text = "segment duration (in seconds, fractional value can be set)",
                    offset = offsetof (
                        DASHContext,
                        seg_duration
                    ),
                    default_value = 5000000,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                }

                new LibAVUtil.BoolOption () {
                    name = "remove_at_exit",
                    short_help_text = "remove all segments when finished",
                    offset = offsetof (
                        DASHContext,
                        remove_at_exit
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "use_template",
                    short_help_text = "Use SegmentTemplate instead of SegmentList",
                    offset = offsetof (
                        DASHContext,
                        use_template
                    ),
                    default_value = 1,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "use_timeline",
                    short_help_text = "Use SegmentTimeline in SegmentTemplate",
                    offset = offsetof (
                        DASHContext,
                        use_timeline
                    ),
                    default_value = 1,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "single_file",
                    short_help_text = "Store all segments in one file, accessed using byte ranges",
                    offset = offsetof (
                        DASHContext,
                        single_file
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "single_file_name",
                    short_help_text = "DASH-templated name to be used for baseURL. Implies storing all segments in one file, accessed using byte ranges",
                    offset = offsetof (
                        DASHContext,
                        single_file_name
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "init_seg_name",
                    short_help_text = "DASH-templated name to used for the initialization segment",
                    offset = offsetof (
                        DASHContext,
                        init_seg_name
                    ),
                    default_value = "init-stream$RepresentationID$.$ext$",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "media_seg_name",
                    short_help_text = "DASH-templated name to used for the media segments",
                    offset = offsetof (
                        DASHContext,
                        media_seg_name
                    ),
                    default_value = "chunk-stream$RepresentationID$-$Number%05d$.$ext$",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "utc_timing_url",
                    short_help_text = "URL of the page that will return the UTC timestamp in ISO format",
                    offset = offsetof (
                        DASHContext,
                        utc_timing_url
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "method",
                    short_help_text = "set the HTTP method",
                    offset = offsetof (
                        DASHContext,
                        method
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "http_user_agent",
                    short_help_text = "override User-Agent field in HTTP header",
                    offset = offsetof (
                        DASHContext,
                        user_agent
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "http_persistent",
                    short_help_text = "Use persistent HTTP connections",
                    offset = offsetof (
                        DASHContext,
                        http_persistent
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "hls_playlist",
                    short_help_text = "Generate HLS playlist files (master.m3u8, media_%d.m3u8)",
                    offset = offsetof (
                        DASHContext,
                        hls_playlist
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "streaming",
                    short_help_text = "Enable/Disable streaming mode of output. Each frame will be moof fragment",
                    offset = offsetof (
                        DASHContext,
                        streaming
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.DurationOption () {
                    name = "timeout",
                    short_help_text = "set timeout for socket I/O operations",
                    offset = offsetof (
                        DASHContext,
                        timeout
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "index_correction",
                    short_help_text = "Enable/Disable segment index correction logic",
                    offset = offsetof (
                        DASHContext,
                        index_correction
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "format_options",
                    short_help_text = "set list of options for the container format (mp4/webm) used for dash",
                    offset = offsetof (
                        DASHContext,
                        format_options_str
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "global_sidx",
                    short_help_text = "Write global SIDX atom. Applicable only for single file, mp4 output, non-streaming mode",
                    offset = offsetof (
                        DASHContext,
                        global_sidx
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "dash_segment_type",
                    short_help_text = "set dash segment files type",
                    offset = offsetof (
                        DASHContext,
                        segment_type_option
                    ),
                    default_value = SEGMENT_TYPE_AUTO,
                    minimum_value = 0,
                    maximum_value = (
                        SEGMENT_TYPE_NB - 1
                    ),
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "segment_type"
                },
                new LibAVUtil.ConstOption () {
                    name = "auto",
                    short_help_text = "select segment file format based on codec",
                    offset = 0,
                    default_value = SEGMENT_TYPE_AUTO,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "segment_type"
                },
                new LibAVUtil.ConstOption () {
                    name = "mp4",
                    short_help_text = "make segment file in ISOBMFF format",
                    offset = 0,
                    default_value = SEGMENT_TYPE_MP4,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "segment_type"
                },
                new LibAVUtil.ConstOption () {
                    name = "webm",
                    short_help_text = "make segment file in WebM format",
                    offset = 0,
                    default_value = SEGMENT_TYPE_WEBM,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "segment_type"
                },
                new LibAVUtil.BoolOption () {
                    name = "ignore_io_errors",
                    short_help_text = "Ignore IO errors during open and write. Useful for long-duration runs with network output",
                    offset = offsetof (
                        DASHContext,
                        ignore_io_errors
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "lhls",
                    short_help_text = "Enable Low-latency HLS (Experimental). Adds #EXT-X-PREFETCH tag with current segment's URI",
                    offset = offsetof (
                        DASHContext,
                        lhls
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "master_m3u8_publish_rate",
                    short_help_text = "Publish master playlist every after this many segment intervals",
                    offset = offsetof (
                        DASHContext,
                        master_publish_rate
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct DASHContext",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
[Compact]
public class DashMuxerPrivateData { }

[CCode (cname="ff_dash_muxer",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
public class DashMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override string name {
        public get {
            return "dash";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override string long_name {
        public get {
            return "DASH Muxer";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override string extensions {
        public get {
            return "mpd";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (DashMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.WANTS_GLOBAL_HEADER | AVFormatFlags1.NO_FILE | AVFormatFlags1.ALLOW_NEGATIVE_TIMESTAMPS;

        }

    }

    [CCode (cname="dash_init",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override int init (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="dash_write_header",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="dash_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override int write_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="dash_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="dash_free",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override void deinit (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="dash_check_bitstream",cheader_filename="subprojects/ffmpeg/libavformat/dashenc.c")]
    public override int check_bitstream (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = dash_class;
}

} // namespace LibAVFormat
