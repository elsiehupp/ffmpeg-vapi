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

#if CONFIG_WEBM_CHUNK_MUXER

[CCode (cname="webm_chunk_class",cheader_filename="subprojects/ffmpeg/libavformat/webm_chunk.c")]
public class WebMChunkMuxerClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/webm_chunk.c")]
    public override string class_name {
        public get {
            return "WebM Chunk Muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/webm_chunk.c")]
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
                new LibAVUtil.IntOption () {
                    name = "chunk_start_index",
                    short_help_text = "start index of the chunk",
                    offset = offsetof (
                        WebMChunkContext,
                        chunk_start_index
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "header",
                    short_help_text = "filename of the header where the initialization data will be written",
                    offset = offsetof (
                        WebMChunkContext,
                        header_filename
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "audio_chunk_duration",
                    short_help_text = "duration of each chunk in milliseconds",
                    offset = offsetof (
                        WebMChunkContext,
                        chunk_duration
                    ),
                    default_value = 5000,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "method",
                    short_help_text = "set the HTTP method",
                    offset = offsetof (
                        WebMChunkContext,
                        http_method
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/webm_chunk.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_webm_chunk_muxer",cheader_filename="subprojects/ffmpeg/libavformat/webm_chunk.c")]
public class WebMChunkMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/webm_chunk.c")]
    public override string name {
        public get {
            return "webm_chunk";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/webm_chunk.c")]
    public override string long_name {
        public get {
            return "WebM Chunk Muxer";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/webm_chunk.c")]
    public override string mime_type {
        public get {
            return "video/webm";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/webm_chunk.c")]
    public override string extensions {
        public get {
            return "chk";

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/webm_chunk.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_FILE | AVFormatFlags1.WANTS_GLOBAL_HEADER | AVFormatFlags1.NEED_NUMBER | AVFormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS;

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/webm_chunk.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WebMChunkContext);

        }

    }

    [CCode (cname="webm_chunk_write_header",cheader_filename="subprojects/ffmpeg/libavformat/webm_chunk.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="webm_chunk_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/webm_chunk.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="webm_chunk_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/webm_chunk.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );
    //  .priv_class = webm_chunk_class;
}
#endif

} // namespace LibAVFormat
