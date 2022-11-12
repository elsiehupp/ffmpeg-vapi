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

//  #define OFFSET(x) offsetof(HashContext, x)
//  #define ENC AV_OPT_FLAG_ENCODING_PARAM
//  #if CONFIG_HASH_MUXER || CONFIG_FRAMEHASH_MUXER
//  static const LibAVUtil.Option hash_options[] = {
//      { "hash", "set hash to use", OFFSET(hash_name), AV_OPT_TYPE_STRING, {.str = "sha256"}, 0, 0, ENC },
//      { "format_version", "file format version", OFFSET(format_version), AV_OPT_TYPE_INT, {.i64 = 2}, 1, 2, ENC },
//      { NULL },
//  }
//  #endif

//  #if CONFIG_MD5_MUXER || CONFIG_FRAMEMD5_MUXER
//  static const LibAVUtil.Option md5_options[] = {
//      { "hash", "set hash to use", OFFSET(hash_name), AV_OPT_TYPE_STRING, {.str = "md5"}, 0, 0, ENC },
//      { "format_version", "file format version", OFFSET(format_version), AV_OPT_TYPE_INT, {.i64 = 2}, 1, 2, ENC },
//      { NULL },
//  }
//  #endif

#if CONFIG_HASH_MUXER
[CCode (cname="hashenc_class", cheader_filename="")]
public class HashMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "hash muxer";
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
    //  .option = hash_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_hash_muxer", cheader_filename="")]
public class HashMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "hash";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Hash testing";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HashContext);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.RAWVIDEO;
        }
    }

    [CCode (cname="hash_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="hash_write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="hash_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_VARIABLE_FPS | AVFMT_TS_NONSTRICT | AVFMT_TS_NEGATIVE;
        }
    }
    //  .priv_class = hashenc_class,
}
#endif

#if CONFIG_MD5_MUXER
[CCode (cname="md5enc_class", cheader_filename="")]
public class MD5MuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "MD5 muxer";
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
    //  .option = md5_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_md5_muxer", cheader_filename="")]
public class MD5Muxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "md5";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "MD5 testing";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HashContext);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.RAWVIDEO;
        }
    }

    [CCode (cname="hash_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="hash_write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="hash_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_VARIABLE_FPS | AVFMT_TS_NONSTRICT | AVFMT_TS_NEGATIVE;
        }
    }
    //  .priv_class = md5enc_class,
}
#endif

#if CONFIG_FRAMEHASH_MUXER
[CCode (cname="framehash_class", cheader_filename="")]
public class FrameHashMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "frame hash muxer";
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
    //  .option = hash_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_framehash_muxer", cheader_filename="")]
public class FrameHashMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "framehash";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Per-frame hash testing";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HashContext);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.RAWVIDEO;
        }
    }

    [CCode (cname="framehash_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="framehash_write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="framehash_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_VARIABLE_FPS | AVFMT_TS_NONSTRICT | AVFMT_TS_NEGATIVE;
        }
    }
    //  .priv_class = framehash_class,
}
#endif

#if CONFIG_FRAMEMD5_MUXER
[CCode (cname="framemd5_class", cheader_filename="")]
public class FrameMD5MuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "frame MD5 muxer";
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
    //  .option = md5_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_framemd5_muxer", cheader_filename="")]
public class FrameMD5Muxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "framemd5";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Per-frame MD5 testing";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HashContext);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.RAWVIDEO;
        }
    }

    [CCode (cname="framehash_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="framehash_write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="framehash_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_VARIABLE_FPS | AVFMT_TS_NONSTRICT | AVFMT_TS_NEGATIVE;
        }
    }
    //  .priv_class = framemd5_class,
}
#endif

} // namespace LibAVFormat
