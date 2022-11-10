/***********************************************************
@copyright 2012 Clément Bœsch
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

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

/***********************************************************
@file WebVTT subtitle demuxer
@see http://dev.w3.org/html5/webvtt/
***********************************************************/

//  #define OFFSET(x) offsetof(WebVTTContext, x)
//  #define KIND_FLAGS AV_OPT_FLAG_SUBTITLE_PARAM|AV_OPT_FLAG_DECODING_PARAM

//  static const AVOption options[] = {
//      { "kind", "Set kind of WebVTT track", OFFSET(kind), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX, KIND_FLAGS, "webvtt_kind" },
//          { "subtitles",    "WebVTT subtitles kind",    0, AV_OPT_TYPE_CONST, { .i64 = 0 },                           INT_MIN, INT_MAX, KIND_FLAGS, "webvtt_kind" },
//          { "captions",     "WebVTT captions kind",     0, AV_OPT_TYPE_CONST, { .i64 = AV_DISPOSITION_CAPTIONS },     INT_MIN, INT_MAX, KIND_FLAGS, "webvtt_kind" },
//          { "descriptions", "WebVTT descriptions kind", 0, AV_OPT_TYPE_CONST, { .i64 = AV_DISPOSITION_DESCRIPTIONS }, INT_MIN, INT_MAX, KIND_FLAGS, "webvtt_kind" },
//          { "metadata",     "WebVTT metadata kind",     0, AV_OPT_TYPE_CONST, { .i64 = AV_DISPOSITION_METADATA },     INT_MIN, INT_MAX, KIND_FLAGS, "webvtt_kind" },
//      { NULL }
//  }

[CCode (cname="webvtt_demuxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "WebVTT demuxer"
    //  .item_name = av_default_item_name,
    //  .option = options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_webvtt_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "webvtt"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "WebVTT subtitle"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WebVTTContext);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = webvtt_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = webvtt_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = webvtt_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_seek2 (
        AVFormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    ); // = webvtt_read_seek,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    ); // = webvtt_read_close,
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "vtt"
    //  .priv_class = webvtt_demuxer_class,
}
