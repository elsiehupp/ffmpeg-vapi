/***********************************************************
@brief WebM DASH Manifest XML muxer
@copyright 2014 Vignesh Venkatasubramanian
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
@brief WebM DASH Specification:
https://sites.google.com/a/webmproject.org/wiki/adaptive-streaming/webm-dash-specification
ISO DASH Specification:
http://standards.iso.org/ittf/PubliclyAvailableStandards/c065274_ISO_IEC_23009-1_2014.zip
***********************************************************/

#if CONFIG_WEBM_DASH_MANIFEST_MUXER

[CCode (cname="webm_dash_class",cheader_filename="subprojects/ffmpeg/libavformat/webmdashenc.c")]
public class WebMDashManifestMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/webmdashenc.c")]
    public override string class_name {
        public get {
            return "WebM DASH Manifest muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/webmdashenc.c")]
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
                        WebMDashMuxContext,
                        adaptation_sets
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "debug_mode",
                    short_help_text = "[private option - users should never set this]. Create deterministic output",
                    offset = offsetof (
                        WebMDashMuxContext,
                        debug_mode
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "live",
                    short_help_text = "create a live stream manifest",
                    offset = offsetof (
                        WebMDashMuxContext,
                        is_live
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "chunk_start_index",
                    short_help_text = "start index of the chunk",
                    offset = offsetof (
                        WebMDashMuxContext,
                        chunk_start_index
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "chunk_duration_ms",
                    short_help_text = "duration of each chunk (in milliseconds)",
                    offset = offsetof (
                        WebMDashMuxContext,
                        chunk_duration
                    ),
                    default_value = 1000,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "utc_timing_url",
                    short_help_text = "URL of the page that will return the UTC timestamp in ISO format",
                    offset = offsetof (
                        WebMDashMuxContext,
                        utc_timing_url
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.DoubleOption () {
                    name = "time_shift_buffer_depth",
                    short_help_text = "Smallest time (in seconds) shifting buffer for which any Representation is guaranteed to be available.",
                    offset = offsetof (
                        WebMDashMuxContext,
                        time_shift_buffer_depth
                    ),
                    default_value = 60.0,
                    minimum_value = 1.0,
                    maximum_value = double.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "minimum_update_period",
                    short_help_text = "Minimum Update Period (in seconds) of the manifest.",
                    offset = offsetof (
                        WebMDashMuxContext,
                        minimum_update_period
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/webmdashenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_webm_dash_manifest_muxer",cheader_filename="subprojects/ffmpeg/libavformat/webmdashenc.c")]
public class WebMDashManifestMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/webmdashenc.c")]
    public override string name {
        public get {
            return "webm_dash_manifest";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/webmdashenc.c")]
    public override string long_name {
        public get {
            return "WebM DASH Manifest";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/webmdashenc.c")]
    public override string mime_type {
        public get {
            return "application/xml";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/webmdashenc.c")]
    public override string extensions {
        public get {
            return "xml";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/webmdashenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WebMDashMuxContext);

        }

    }

    [CCode (cname="webm_dash_manifest_write_header",cheader_filename="subprojects/ffmpeg/libavformat/webmdashenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="webm_dash_manifest_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/webmdashenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="webm_dash_manifest_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/webmdashenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );
    //  .priv_class = webm_dash_class;
}
#endif

} // namespace LibAVFormat
