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
codec2 muxer and demuxers
@copyright 2017 Tomas Härdin
***********************************************************/
/***********************************************************
Transcoding report2074.c2 to wav went from 7.391s to 5.322s
with -frames_per_packet 1000 compared to default, same sha1sum
***********************************************************/
//  #define FRAMES_PER_PACKET
//      { "frames_per_packet", "Number of frames to read at a time. Higher = faster decoding, lower granularity",
//        offsetof(Codec2Context, frames_per_packet), AV_OPT_TYPE_INT, {.i64 = 1}, 1, INT_MAX, AV_OPT_FLAG_DECODING_PARAM}

//  static const AVOption codec2_options[] = {
//      FRAMES_PER_PACKET,
//      { NULL },
//  }

//  static const AVOption codec2raw_options[] = {
//      AVPRIV_CODEC2_AVOPTIONS("codec2 mode [mandatory]", Codec2Context, -1, -1, AV_OPT_FLAG_DECODING_PARAM),
//      FRAMES_PER_PACKET,
//      { NULL },
//  }

[CCode (cname="codec2_mux_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "codec2 muxer"
    //  .item_name = av_default_item_name,
    //  .version = LIBAVUTIL_VERSION_INT,
    //  .category = AV_CLASS_CATEGORY_DEMUXER,
}

[CCode (cname="codec2_demux_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "codec2 demuxer"
    //  .item_name = av_default_item_name,
    //  .option = codec2_options,
    //  .version = LIBAVUTIL_VERSION_INT,
    //  .category = AV_CLASS_CATEGORY_DEMUXER,
}

[CCode (cname="codec2raw_demux_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "codec2raw demuxer"
    //  .item_name = av_default_item_name,
    //  .option = codec2raw_options,
    //  .version = LIBAVUTIL_VERSION_INT,
    //  .category = AV_CLASS_CATEGORY_DEMUXER,
}

#if CONFIG_CODEC2_DEMUXER
[CCode (cname="ff_codec2_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "codec2"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "codec2 .c2 demuxer"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (Codec2Context);
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "c2"
    [CCode (cname="codec2_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="codec2_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="codec2_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="ff_pcm_read_seek", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.CODEC2;
        }
    }
    //  .priv_class = codec2_demux_class,
}
#endif

#if CONFIG_CODEC2_MUXER
[CCode (cname="ff_codec2_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "codec2"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "codec2 .c2 muxer"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (Codec2Context);
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "c2"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.CODEC2;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="codec2_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="ff_raw_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    //  .flags = AVFMT_NOTIMESTAMPS,
    //  .priv_class = codec2_mux_class,
}
#endif

#if CONFIG_CODEC2RAW_DEMUXER
[CCode (cname="ff_codec2raw_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "codec2raw"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw codec2 demuxer"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (Codec2Context);
        }
    }
    [CCode (cname="codec2raw_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="codec2_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="ff_pcm_read_seek", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.CODEC2;
        }
    }
    //  .priv_class = codec2raw_demux_class,
}
#endif
