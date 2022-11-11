/***********************************************************
@copyright 2015, Vignesh Venkatasubramanian
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
@file WebM Chunk Muxer
The chunk muxer enables writing WebM Live chunks where there is a header
chunk, followed by data chunks where each Cluster is written out as a Chunk.
***********************************************************/

//  #define OFFSET(x) offsetof(WebMChunkContext, x)
//  static const AVOption options[] = {
//      { "chunk_start_index",  "start index of the chunk", OFFSET(chunk_start_index), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "header", "filename of the header where the initialization data will be written", OFFSET(header_filename), AV_OPT_TYPE_STRING, { 0 }, 0, 0, AV_OPT_FLAG_ENCODING_PARAM },
//      { "audio_chunk_duration", "duration of each chunk in milliseconds", OFFSET(chunk_duration), AV_OPT_TYPE_INT, {.i64 = 5000}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "method", "set the HTTP method", OFFSET(http_method), AV_OPT_TYPE_STRING, {.str = NULL},  0, 0, AV_OPT_FLAG_ENCODING_PARAM },
//      { NULL },
//  }

#if CONFIG_WEBM_CHUNK_MUXER
[CCode (cname="webm_chunk_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "WebM Chunk Muxer";
        }
    }
    [CCode (cname="item_name", cheader="")]
    public override string item_name (
        void *class_context
    ) {
        return av_default_item_name (
            class_context
        );
    }
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_webm_chunk_muxer", cheader="")]
public class WebMChunkOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "webm_chunk";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "WebM Chunk Muxer";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "video/webm";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "chk"
        }
    }
    //  .flags = AVFMT_NOFILE | AVFMT_GLOBALHEADER | AVFMT_NEEDNUMBER | AVFMT_TS_NONSTRICT,
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WebMChunkContext);
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = webm_chunk_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = webm_chunk_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = webm_chunk_write_trailer,
    //  .priv_class = webm_chunk_class,
}
#endif
