/*
 * WebM DASH Manifest XML muxer
 * Copyright (c) 2014 Vignesh Venkatasubramanian
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

/*
 * WebM DASH Specification:
 * https://sites.google.com/a/webmproject.org/wiki/adaptive-streaming/webm-dash-specification
 * ISO DASH Specification:
 * http://standards.iso.org/ittf/PubliclyAvailableStandards/c065274_ISO_IEC_23009-1_2014.zip
 */

#define OFFSET(x) offsetof(WebMDashMuxContext, x)
static const AVOption options[] = {
    { "adaptation_sets", "Adaptation sets. Syntax: id=0,streams=0,1,2 id=1,streams=3,4 and so on", OFFSET(adaptation_sets), AV_OPT_TYPE_STRING, { 0 }, 0, 0, AV_OPT_FLAG_ENCODING_PARAM },
    { "debug_mode", "[private option - users should never set this]. Create deterministic output", OFFSET(debug_mode), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM },
    { "live", "create a live stream manifest", OFFSET(is_live), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM },
    { "chunk_start_index",  "start index of the chunk", OFFSET(chunk_start_index), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
    { "chunk_duration_ms", "duration of each chunk (in milliseconds)", OFFSET(chunk_duration), AV_OPT_TYPE_INT, {.i64 = 1000}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
    { "utc_timing_url", "URL of the page that will return the UTC timestamp in ISO format", OFFSET(utc_timing_url), AV_OPT_TYPE_STRING, { 0 }, 0, 0, AV_OPT_FLAG_ENCODING_PARAM },
    { "time_shift_buffer_depth", "Smallest time (in seconds) shifting buffer for which any Representation is guaranteed to be available.", OFFSET(time_shift_buffer_depth), AV_OPT_TYPE_DOUBLE, { .dbl = 60.0 }, 1.0, DBL_MAX, AV_OPT_FLAG_ENCODING_PARAM },
    { "minimum_update_period", "Minimum Update Period (in seconds) of the manifest.", OFFSET(minimum_update_period), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
    { NULL },
};

#if CONFIG_WEBM_DASH_MANIFEST_MUXER
static const AVClass webm_dash_class = {
    //  .class_name = "WebM DASH Manifest muxer",
    //  .item_name  = av_default_item_name,
    //  .option     = options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_webm_dash_manifest_muxer = {
    //  .name              = "webm_dash_manifest",
    //  .long_name         = "WebM DASH Manifest",
    //  .mime_type         = "application/xml",
    //  .extensions        = "xml",
    //  .priv_data_size    = sizeof(WebMDashMuxContext),
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = webm_dash_manifest_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = webm_dash_manifest_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );     = webm_dash_manifest_write_trailer,
    //  .priv_class        = &webm_dash_class,
};
#endif
