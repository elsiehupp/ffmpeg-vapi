/***********************************************************
@brief Matroska muxer
@copyright 2007 David Conrad
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

static const AVCodecTag additional_audio_tags[] = {
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.ALAC,
        tag = 0XFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.MLP,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.OPUS,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_S16BE,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_S24BE,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_S32BE,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.QDMC,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.QDM2,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.RA_144,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.RA_288,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.COOK,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.TRUEHD,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.NONE,
        tag = 0xFFFFFFFF
    }

};

static const AVCodecTag additional_video_tags[] = {
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.RV10,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.RV20,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.RV30,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.NONE,
        tag = 0xFFFFFFFF
    }

};

static const AVCodecTag additional_subtitle_tags[] = {
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.DVB_SUBTITLE,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.DVD_SUBTITLE,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.HDMV_PGS_SUBTITLE,
        tag = 0xFFFFFFFF
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.NONE,
        tag = 0xFFFFFFFF
    }

};

public abstract class MatroskaClassOptions : LibAVUtil.Class {
    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.IntOption () {
                    name = "reserve_index_space",
                    short_help_text = "Reserve a given amount of space (in bytes) at the beginning of the file for the index (cues).",
                    offset = offsetof (
                        MatroskaMuxContext,
                        reserve_cues_space
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "cluster_size_limit",
                    short_help_text = "Store at most the provided amount of bytes in a cluster. ",
                    offset = offsetof (
                        MatroskaMuxContext,
                        cluster_size_limit
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.Int64Option () {
                    name = "cluster_time_limit",
                    short_help_text = "Store at most the provided number of milliseconds in a cluster.",
                    offset = offsetof (
                        MatroskaMuxContext,
                        cluster_time_limit
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = int64.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "dash",
                    short_help_text = "Create a WebM file conforming to WebM DASH specification",
                    offset = offsetof (
                        MatroskaMuxContext,
                        is_dash
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "dash_track_number",
                    short_help_text = "Track number for the DASH stream",
                    offset = offsetof (
                        MatroskaMuxContext,
                        dash_track_number
                    ),
                    default_value = 1,
                    minimum_value = 0,
                    maximum_value = 127,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "live",
                    short_help_text = "Write files assuming it is a live stream.",
                    offset = offsetof (
                        MatroskaMuxContext,
                        is_live
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "allow_raw_vfw",
                    short_help_text = "allow RAW VFW mode",
                    offset = offsetof (
                        MatroskaMuxContext,
                        allow_raw_vfw
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "write_crc32",
                    short_help_text = "write a CRC32 element inside every Level 1 element",
                    offset = offsetof (
                        MatroskaMuxContext,
                        write_crc
                    ),
                    default_value = 1,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

}

#if CONFIG_MATROSKA_MUXER

[CCode (cname="matroska_class",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
public class MatroskaMuxerClass : MatroskaClassOptions {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string class_name {
        public get {
            return "matroska muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_matroska_muxer",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
public class MatroskaMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string name {
        public get {
            return "matroska";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string long_name {
        public get {
            return "Matroska";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string mime_type {
        public get {
            return "video/x-matroska";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string extensions {
        public get {
            return "mkv";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MatroskaMuxContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBVORBIS_ENCODER ? LibAVCodec.CodecID.VORBIS : LibAVCodec.CodecID.AC3;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return CONFIG_LIBX264_ENCODER ? LibAVCodec.CodecID.H264 : LibAVCodec.CodecID.MPEG4;

        }

    }

    [CCode (cname="mkv_init",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="mkv_write_header",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mkv_write_flush_packet",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mkv_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.WANTS_GLOBAL_HEADER | AVFormatFlags1.ALLOWS_VARIABLE_FPS | AVFormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS | AVFormatFlags1.ALLOWS_FLUSH;

        }

    }

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                ff_codec_bmp_tags,
                ff_codec_wav_tags,
                additional_audio_tags,
                additional_video_tags,
                additional_subtitle_tags,
                0
           };

        }

    }

    [CCode (cname="subtitle_codec",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override LibAVCodec.CodecID subtitle_codec {
        public get {
            return LibAVCodec.CodecID.ASS;

        }

    }

    [CCode (cname="mkv_query_codec",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int query_codec (
        LibAVCodec.CodecID id,
        int std_compliance
    );

    [CCode (cname="mkv_check_bitstream",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = matroska_class;
}
#endif

#if CONFIG_WEBM_MUXER

[CCode (cname="webm_class",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
public class WebMMuxerClass : MatroskaClassOptions {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string class_name {
        public get {
            return "webm muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_webm_muxer",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
public class WebMMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string name {
        public get {
            return "webm";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string long_name {
        public get {
            return "WebM";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string mime_type {
        public get {
            return "video/webm";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string extensions {
        public get {
            return "webm";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MatroskaMuxContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBOPUS_ENCODER ? LibAVCodec.CodecID.OPUS : LibAVCodec.CodecID.VORBIS;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return CONFIG_LIBVPX_VP9_ENCODER ? LibAVCodec.CodecID.VP9 : LibAVCodec.CodecID.VP8;

        }

    }

    [CCode (cname="subtitle_codec",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override LibAVCodec.CodecID subtitle_codec {
        public get {
            return LibAVCodec.CodecID.WEBVTT;

        }

    }

    [CCode (cname="mkv_init",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="mkv_write_header",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mkv_write_flush_packet",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mkv_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="webm_query_codec",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int query_codec (
        LibAVCodec.CodecID id,
        int std_compliance
    );

    [CCode (cname="mkv_check_bitstream",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.WANTS_GLOBAL_HEADER | AVFormatFlags1.ALLOWS_VARIABLE_FPS | AVFormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS | AVFormatFlags1.ALLOWS_FLUSH;

        }

    }
    //  .priv_class = webm_class;
}
#endif

#if CONFIG_MATROSKA_AUDIO_MUXER

[CCode (cname="mka_class",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
public class MatroskaAudioMuxerClass : MatroskaClassOptions {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string class_name {
        public get {
            return "matroska audio muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_matroska_audio_muxer",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
public class MatroskaAudioMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string name {
        public get {
            return "matroska";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string long_name {
        public get {
            return "Matroska Audio";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string mime_type {
        public get {
            return "audio/x-matroska";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override string extensions {
        public get {
            return "mka";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MatroskaMuxContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBVORBIS_ENCODER ?
                         LibAVCodec.CodecID.VORBIS : LibAVCodec.CodecID.AC3;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;

        }

    }

    [CCode (cname="mkv_init",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="mkv_write_header",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mkv_write_flush_packet",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mkv_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="mkv_check_bitstream",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/matroskaenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.WANTS_GLOBAL_HEADER | AVFormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS | AVFormatFlags1.ALLOWS_FLUSH;

        }

    }

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                ff_codec_wav_tags,
                additional_audio_tags,
                0
            };

        }

    }

    //  .priv_class = mka_class;
}
#endif

} // namespace LibAVFormat
