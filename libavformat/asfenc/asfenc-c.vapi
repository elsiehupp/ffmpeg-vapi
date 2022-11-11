/***********************************************************
ASF muxer
@copyright 2000, 2001 Fabrice Bellard
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

//  static const AVOption asf_options[] = {
//      { "packet_size", "Packet size", offsetof(ASFContext, packet_size), AV_OPT_TYPE_INT, {.i64 = 3200}, PACKET_SIZE_MIN, PACKET_SIZE_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { NULL },
//  }

#if CONFIG_ASF_MUXER
[CCode (cname="asf_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "ASF muxer";
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
    //  .option = asf_options,
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_asf_muxer", cheader="")]
public class AsfOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "asf";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "ASF (Advanced / Active Streaming Format)";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "video/x-ms-asf";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "asf,wmv,wma";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ASFContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.WMAV2;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MSMPEG4V3;
        }
    }
    [CCode (cname="asf_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="asf_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="asf_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .flags = AVFMT_GLOBALHEADER,
    //  .codec_tag = (const AVCodecTag * const []) {
    //      codec_asf_bmp_tags, ff_codec_bmp_tags, ff_codec_wav_tags, 0
    //  },
    //  .priv_class = asf_muxer_class,
}
#endif /* CONFIG_ASF_MUXER */

#if CONFIG_ASF_STREAM_MUXER
[CCode (cname="asf_stream_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "ASF stream muxer";
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
    //  .option = asf_options,
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_asf_stream_muxer", cheader="")]
public class AsfStreamOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "asf_stream";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "ASF (Advanced / Active Streaming Format)";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "video/x-ms-asf";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "asf,wmv,wma";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ASFContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.WMAV2;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MSMPEG4V3;
        }
    }
    [CCode (cname="asf_write_stream_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="asf_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="asf_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .flags = AVFMT_GLOBALHEADER,
    //  .codec_tag = (const AVCodecTag * const []) {
        codec_asf_bmp_tags, ff_codec_bmp_tags, ff_codec_wav_tags, 0
    },
    //  .priv_class = asf_stream_muxer_class,
}
#endif /* CONFIG_ASF_STREAM_MUXER */
