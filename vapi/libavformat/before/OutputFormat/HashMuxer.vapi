/***********************************************************
@brief Hash/MD5 encoder (for codec/format testing)
@copyright 2009 Reimar Döffinger, based on crcenc (c) 2002 Fabrice Bellard
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

#if CONFIG_HASH_MUXER || CONFIG_FRAMEHASH_MUXER

public abstract class HashOptionsClass : LibAVUtil.Class {

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.StringOption () {
                    name = "hash",
                    short_help_text = "set hash to use",
                    offset = offsetof (
                        HashContext,
                        hash_name
                    ),
                    default_value = "sha256",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "format_version",
                    short_help_text = "file format version",
                    offset = offsetof (
                        HashContext,
                        format_version
                    ),
                    default_value = 2,
                    minimum_value = 1,
                    maximum_value = 2,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

}

#endif

#if CONFIG_MD5_MUXER || CONFIG_FRAMEMD5_MUXER

public abstract class MD5OptionsClass : LibAVUtil.Class {

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.StringOption () {
                    name = "hash",
                    short_help_text = "set hash to use",
                    offset = offsetof (
                        HashContext,
                        hash_name
                    ),
                    default_value = "md5",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "format_version",
                    short_help_text = "file format version",
                    offset = offsetof (
                        HashContext,
                        format_version
                    ),
                    default_value = 2,
                    minimum_value = 1,
                    maximum_value = 2,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

}

#endif

#if CONFIG_HASH_MUXER

[CCode (cname="hashenc_class",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
public class HashMuxerClass : HashOptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string class_name {
        public get {
            return "hash muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_hash_muxer",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
public class HashMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string name {
        public get {
            return "hash";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string long_name {
        public get {
            return "Hash testing";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HashContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.RAWVIDEO;

        }

    }

    [CCode (cname="hash_write_header",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="hash_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="hash_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.ALLOWS_VARIABLE_FPS | AVFormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS | AVFormatFlags1.ALLOW_NEGATIVE_TIMESTAMPS;

        }

    }
    //  .priv_class = hashenc_class;
}
#endif

#if CONFIG_MD5_MUXER

[CCode (cname="md5enc_class",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
public class MD5MuxerClass : MD5OptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string class_name {
        public get {
            return "MD5 muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_md5_muxer",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
public class MD5Muxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string name {
        public get {
            return "md5";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string long_name {
        public get {
            return "MD5 testing";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HashContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.RAWVIDEO;

        }

    }

    [CCode (cname="hash_write_header",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="hash_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="hash_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.ALLOWS_VARIABLE_FPS | AVFormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS | AVFormatFlags1.ALLOW_NEGATIVE_TIMESTAMPS;

        }

    }
    //  .priv_class = md5enc_class;
}
#endif

#if CONFIG_FRAMEHASH_MUXER

[CCode (cname="framehash_class",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
public class FrameHashMuxerClass : HashOptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string class_name {
        public get {
            return "frame hash muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_framehash_muxer",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
public class FrameHashMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string name {
        public get {
            return "framehash";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string long_name {
        public get {
            return "Per-frame hash testing";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HashContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.RAWVIDEO;

        }

    }

    [CCode (cname="framehash_write_header",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="framehash_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="framehash_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.ALLOWS_VARIABLE_FPS | AVFormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS | AVFormatFlags1.ALLOW_NEGATIVE_TIMESTAMPS;

        }

    }
    //  .priv_class = framehash_class;
}
#endif

#if CONFIG_FRAMEMD5_MUXER

[CCode (cname="framemd5_class",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
public class FrameMD5MuxerClass : MD5OptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string class_name {
        public get {
            return "frame MD5 muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_framemd5_muxer",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
public class FrameMD5Muxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string name {
        public get {
            return "framemd5";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override string long_name {
        public get {
            return "Per-frame MD5 testing";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HashContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.RAWVIDEO;

        }

    }

    [CCode (cname="framehash_write_header",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="framehash_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="framehash_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/hashenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.ALLOWS_VARIABLE_FPS | AVFormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS | AVFormatFlags1.ALLOW_NEGATIVE_TIMESTAMPS;

        }

    }
    //  .priv_class = framemd5_class;
}
#endif

} // namespace LibAVFormat
