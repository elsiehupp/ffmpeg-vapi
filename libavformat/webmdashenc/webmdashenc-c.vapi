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

//  #define OFFSET(x) offsetof(WebMDashMuxContext, x)
//  static const LibAVUtil.Option options[] = {
//      { "adaptation_sets", "Adaptation sets. Syntax: id=0,streams=0,1,2 id=1,streams=3,4 and so on", OFFSET(adaptation_sets), AV_OPT_TYPE_STRING, { 0 }, 0, 0, AV_OPT_FLAG_ENCODING_PARAM },
//      { "debug_mode", "[private option - users should never set this]. Create deterministic output", OFFSET(debug_mode), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM },
//      { "live", "create a live stream manifest", OFFSET(is_live), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM },
//      { "chunk_start_index",  "start index of the chunk", OFFSET(chunk_start_index), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "chunk_duration_ms", "duration of each chunk (in milliseconds)", OFFSET(chunk_duration), AV_OPT_TYPE_INT, {.i64 = 1000}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "utc_timing_url", "URL of the page that will return the UTC timestamp in ISO format", OFFSET(utc_timing_url), AV_OPT_TYPE_STRING, { 0 }, 0, 0, AV_OPT_FLAG_ENCODING_PARAM },
//      { "time_shift_buffer_depth", "Smallest time (in seconds) shifting buffer for which any Representation is guaranteed to be available.", OFFSET(time_shift_buffer_depth), AV_OPT_TYPE_DOUBLE, { .dbl = 60.0 }, 1.0, DBL_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "minimum_update_period", "Minimum Update Period (in seconds) of the manifest.", OFFSET(minimum_update_period), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { NULL },
//  }

#if CONFIG_WEBM_DASH_MANIFEST_MUXER
[CCode (cname="webm_dash_class", cheader_filename="")]
public class WebMDashManifestMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "WebM DASH Manifest muxer";
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

[CCode (cname="ff_webm_dash_manifest_muxer", cheader_filename="")]
public class WebMDashManifestMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "webm_dash_manifest";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "WebM DASH Manifest";
        }
    }

    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "application/xml";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "xml";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WebMDashMuxContext);
        }
    }

    [CCode (cname="webm_dash_manifest_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="webm_dash_manifest_write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="webm_dash_manifest_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = webm_dash_class,
}
#endif

} // namespace LibAVFormat
