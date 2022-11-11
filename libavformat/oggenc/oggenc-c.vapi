/***********************************************************
Ogg muxer
@copyright 2007 Baptiste Coudurier <baptiste dot coudurier at free dot fr>
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

//  #define OFFSET(x) offsetof(OGGContext, x)
//  #define PARAM AV_OPT_FLAG_ENCODING_PARAM

//  static const AVOption options[] = {
//      { "serial_offset", "serial number offset"
//          OFFSET(serial_offset), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX, PARAM },
//      { "oggpagesize", "Set preferred Ogg page size."
//        OFFSET(pref_size), AV_OPT_TYPE_INT, {.i64 = 0}, 0, MAX_PAGE_SIZE, PARAM},
//      { "pagesize", "preferred page size in bytes (deprecated)"
//          OFFSET(pref_size), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, MAX_PAGE_SIZE, PARAM },
//      { "page_duration", "preferred page duration, in microseconds"
//          OFFSET(pref_duration), AV_OPT_TYPE_INT64, { .i64 = 1000000 }, 0, INT64_MAX, PARAM },
//      { NULL },
//  }

#define OGG_CLASS(flavor, name)
[CCode (cname="flavor ## _muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = #name " muxer";
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

#if CONFIG_OGG_MUXER
OGG_CLASS(ogg, Ogg)
[CCode (cname="ff_ogg_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "ogg";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Ogg";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "application/ogg";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "ogg"
#if !CONFIG_OGV_MUXER
                         ",ogv"
#endif

#if !CONFIG_SPX_MUXER
                         ",spx"
#endif

#if !CONFIG_OPUS_MUXER
                         ",opus"
#endif
                         ,
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (OGGContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBVORBIS_ENCODER ? LibAVCodec.CodecID.VORBIS : LibAVCodec.CodecID.FLAC;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.THEORA;
        }
    }
    [CCode (cname="", cheader="")]
    public override int init (
        AVFormatContext format_context
    ); // = ogg_init,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = ogg_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ogg_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = ogg_write_trailer,
    [CCode (cname="", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    ); // = ogg_free,
    //  .flags = AVFMT_TS_NEGATIVE | AVFMT_TS_NONSTRICT | AVFMT_ALLOW_FLUSH,
    //  .priv_class = ogg_muxer_class,
}
#endif

#if CONFIG_OGA_MUXER
OGG_CLASS(oga, Ogg audio)
public class OutputMuxer : AVOutputFormat ff_oga_muxer = {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "oga";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Ogg Audio";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "audio/ogg";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "oga";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (OGGContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.FLAC;
        }
    }
    [CCode (cname="", cheader="")]
    public override int init (
        AVFormatContext format_context
    ); // = ogg_init,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = ogg_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ogg_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = ogg_write_trailer,
    [CCode (cname="", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    ); // = ogg_free,
    //  .flags = AVFMT_TS_NEGATIVE | AVFMT_ALLOW_FLUSH,
    //  .priv_class = oga_muxer_class,
}
#endif

#if CONFIG_OGV_MUXER
OGG_CLASS(ogv, Ogg video)
public class OutputMuxer : AVOutputFormat ff_ogv_muxer = {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "ogv";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Ogg Video";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "video/ogg";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "ogv";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (OGGContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBVORBIS_ENCODER ? LibAVCodec.CodecID.VORBIS : LibAVCodec.CodecID.FLAC;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return CONFIG_LIBTHEORA_ENCODER ? LibAVCodec.CodecID.THEORA : LibAVCodec.CodecID.VP8;
        }
    }
    [CCode (cname="", cheader="")]
    public override int init (
        AVFormatContext format_context
    ); // = ogg_init,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = ogg_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ogg_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = ogg_write_trailer,
    [CCode (cname="", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    ); // = ogg_free,
    //  .flags = AVFMT_TS_NEGATIVE | AVFMT_TS_NONSTRICT | AVFMT_ALLOW_FLUSH,
    //  .priv_class = ogv_muxer_class,
}
#endif

#if CONFIG_SPX_MUXER
OGG_CLASS(spx, Ogg Speex)
public class OutputMuxer : AVOutputFormat ff_spx_muxer = {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "spx";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Ogg Speex";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "audio/ogg";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "spx";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (OGGContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.SPEEX;
        }
    }
    [CCode (cname="", cheader="")]
    public override int init (
        AVFormatContext format_context
    ); // = ogg_init,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = ogg_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ogg_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = ogg_write_trailer,
    [CCode (cname="", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    ); // = ogg_free,
    //  .flags = AVFMT_TS_NEGATIVE | AVFMT_ALLOW_FLUSH,
    //  .priv_class = spx_muxer_class,
}
#endif

#if CONFIG_OPUS_MUXER
OGG_CLASS(opus, Ogg Opus)
public class OutputMuxer : AVOutputFormat ff_opus_muxer = {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "opus";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Ogg Opus";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "audio/ogg";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "opus";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (OGGContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.OPUS;
        }
    }
    [CCode (cname="", cheader="")]
    public override int init (
        AVFormatContext format_context
    ); // = ogg_init,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = ogg_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ogg_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = ogg_write_trailer,
    [CCode (cname="", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    ); // = ogg_free,
    //  .flags = AVFMT_TS_NEGATIVE | AVFMT_ALLOW_FLUSH,
    //  .priv_class = opus_muxer_class,
}
#endif
