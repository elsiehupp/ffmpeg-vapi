/***********************************************************
@copyright 2015, Vignesh Venkatasubramanian
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
@file WebM Chunk Muxer
The chunk muxer enables writing WebM Live chunks where there is a header
chunk, followed by data chunks where each Cluster is written out as a Chunk.
***********************************************************/

//  #define OFFSET (x) offsetof (WebMChunkContext, x)
//  static const LibAVUtil.Option options[] = {
//      { "chunk_start_index",  "start index of the chunk", OFFSET (chunk_start_index), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "header", "filename of the header where the initialization data will be written", OFFSET (header_filename), AV_OPT_TYPE_STRING, { 0 }, 0, 0, AV_OPT_FLAG_ENCODING_PARAM },
//      { "audio_chunk_duration", "duration of each chunk in milliseconds", OFFSET (chunk_duration), AV_OPT_TYPE_INT, {.i64 = 5000}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "method", "set the HTTP method", OFFSET (http_method), AV_OPT_TYPE_STRING, {.str = NULL},  0, 0, AV_OPT_FLAG_ENCODING_PARAM },
//      { NULL },
//  }

#if CONFIG_WEBM_CHUNK_MUXER
[CCode (cname="webm_chunk_class", cheader_filename="")]
public class WebMChunkMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "WebM Chunk Muxer";
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

[CCode (cname="ff_webm_chunk_muxer", cheader_filename="")]
public class WebMChunkMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "webm_chunk";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "WebM Chunk Muxer";
        }
    }

    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "video/webm";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "chk";
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOFILE | AVFMT_GLOBALHEADER | AVFMT_NEEDNUMBER | AVFMT_TS_NONSTRICT;
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WebMChunkContext);
        }
    }

    [CCode (cname="webm_chunk_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="webm_chunk_write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="webm_chunk_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = webm_chunk_class,
}
#endif

} // namespace LibAVFormat
