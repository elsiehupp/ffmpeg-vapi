/***********************************************************
@brief Ogg muxer
@copyright 2007 Baptiste Coudurier <baptiste dot coudurier at free dot fr>
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

static const LibAVUtil.Option options[] = {
    new LibAVUtil.IntOption () {
        name = "serial_offset",
        short_help_text = "serial number offset",
        offsetof (
            OGGContext,
            serial_offset
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "oggpagesize",
        short_help_text = "Set preferred Ogg page size.",
        offsetof (
            OGGContext,
            pref_size
        ),
        {
            .i64 = 0
        },
        0,
        MAX_PAGE_SIZE,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "pagesize",
        short_help_text = "preferred page size in bytes (deprecated)",
        offsetof (
            OGGContext,
            pref_size
        ),
        {
            .i64 = 0
        },
        0,
        MAX_PAGE_SIZE,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.Int64Option () {
        name = "page_duration",
        short_help_text = "preferred page duration, in microseconds",
        offsetof (
            OGGContext,
            pref_duration
        ),
        {
            .i64 = 1000000
        },
        0,
        int64.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

//  #define OGG_CLASS (flavor, name)
[CCode (cname="flavor ## _muxer_class",cheader_filename="ffmpeg/libformat/oggeng.c")]
public class FlaverMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string class_name {
        public get {
            return "#name muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

#if CONFIG_OGG_MUXER
//  OGG_CLASS (ogg, Ogg)
[CCode (cname="ff_ogg_muxer",cheader_filename="ffmpeg/libformat/oggeng.c")]
public class OggMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string name {
        public get {
            return "ogg";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string long_name {
        public get {
            return "Ogg";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string mime_type {
        public get {
            return "application/ogg";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string extensions {
        public get {
            string string_builder = "ogg";

#if !CONFIG_OGV_MUXER
            string_builder += ",ogv";
#endif

#if !CONFIG_SPX_MUXER
            string_builder += ",spx";
#endif

#if !CONFIG_OPUS_MUXER
            string_builder += ",opus";
#endif

            return string_builder;

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (OGGContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBVORBIS_ENCODER ? LibAVCodec.CodecID.VORBIS : LibAVCodec.CodecID.FLAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.THEORA;

        }

    }

    [CCode (cname="ogg_init",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="ogg_write_header",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="ogg_write_packet",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="ogg_write_trailer",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="ogg_free",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_TS_NEGATIVE | AVFMT_TS_NONSTRICT | AVFMT_ALLOW_FLUSH;

        }

    }
    //  .priv_class = ogg_muxer_class;
}
#endif

#if CONFIG_OGA_MUXER
//  OGG_CLASS (oga, Ogg audio)
[CCode (cname="ff_oga_muxer",cheader_filename="ffmpeg/libformat/oggeng.c")]
public class OggAudioMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string name {
        public get {
            return "oga";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string long_name {
        public get {
            return "Ogg Audio";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string mime_type {
        public get {
            return "audio/ogg";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string extensions {
        public get {
            return "oga";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (OGGContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.FLAC;

        }

    }

    [CCode (cname="ogg_init",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="ogg_write_header",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="ogg_write_packet",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="ogg_write_trailer",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="ogg_free",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_TS_NEGATIVE | AVFMT_ALLOW_FLUSH;

        }

    }
    //  .priv_class = oga_muxer_class;
}
#endif

#if CONFIG_OGV_MUXER
//  OGG_CLASS (ogv, Ogg video)
[CCode (cname="ff_ogv_muxer",cheader_filename="ffmpeg/libformat/oggeng.c")]
public class OggVideoMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string name {
        public get {
            return "ogv";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string long_name {
        public get {
            return "Ogg Video";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string mime_type {
        public get {
            return "video/ogg";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string extensions {
        public get {
            return "ogv";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (OGGContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBVORBIS_ENCODER ? LibAVCodec.CodecID.VORBIS : LibAVCodec.CodecID.FLAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return CONFIG_LIBTHEORA_ENCODER ? LibAVCodec.CodecID.THEORA : LibAVCodec.CodecID.VP8;

        }

    }

    [CCode (cname="ogg_init",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="ogg_write_header",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="ogg_write_packet",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="ogg_write_trailer",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="ogg_free",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_TS_NEGATIVE | AVFMT_TS_NONSTRICT | AVFMT_ALLOW_FLUSH;

        }

    }
    //  .priv_class = ogv_muxer_class;
}
#endif

#if CONFIG_SPX_MUXER
//  OGG_CLASS (spx, Ogg Speex)
[CCode (cname="ff_spx_muxer",cheader_filename="ffmpeg/libformat/oggeng.c")]
public class OggSpeexMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string name {
        public get {
            return "spx";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string long_name {
        public get {
            return "Ogg Speex";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string mime_type {
        public get {
            return "audio/ogg";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string extensions {
        public get {
            return "spx";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (OGGContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.SPEEX;

        }

    }

    [CCode (cname="ogg_init",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="ogg_write_header",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="ogg_write_packet",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="ogg_write_trailer",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="ogg_free",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_TS_NEGATIVE | AVFMT_ALLOW_FLUSH;

        }

    }
    //  .priv_class = spx_muxer_class;
}
#endif

#if CONFIG_OPUS_MUXER
//  OGG_CLASS (opus, Ogg Opus)
[CCode (cname="ff_opus_muxer",cheader_filename="ffmpeg/libformat/oggeng.c")]
public class OggOpusMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string name {
        public get {
            return "opus";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string long_name {
        public get {
            return "Ogg Opus";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string mime_type {
        public get {
            return "audio/ogg";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override string extensions {
        public get {
            return "opus";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (OGGContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.OPUS;

        }

    }

    [CCode (cname="ogg_init",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="ogg_write_header",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="ogg_write_packet",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="ogg_write_trailer",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="ogg_free",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override void deinit (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/oggeng.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_TS_NEGATIVE | AVFMT_ALLOW_FLUSH;

        }

    }
    //  .priv_class = opus_muxer_class;
}
#endif

} // namespace LibAVFormat
