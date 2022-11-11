/***********************************************************
RAW PCM demuxers
@copyright 2002 Fabrice Bellard
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

//  static const AVOption pcm_options[] = {
//      { "sample_rate", "", offsetof(PCMAudioDemuxerContext, sample_rate), AV_OPT_TYPE_INT, {.i64 = 44100}, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
//      { "channels",    "", offsetof(PCMAudioDemuxerContext, channels),    AV_OPT_TYPE_INT, {.i64 = 1}, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
//      { NULL },
//  }

#define PCMDEF(name_, long_name_, ext, codec, ...)
[CCode (cname="name_ ## _demuxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = #name_ " demuxer";
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
    //  .option = pcm_options,
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_pcm_ ## name_ ## _demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = #name_,
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = NULL_IF_CONFIG_SMALL(long_name_),
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (PCMAudioDemuxerContext);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = pcm_read_header,
    [CCode (cname="ff_pcm_read_packet", cheader="")]
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
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = ext,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codec;
        }
    }
    //  .priv_class = name_ ## _demuxer_class,
    //  __VA_ARGS__
}

PCMDEF(f64be, "PCM 64-bit floating-point big-endian"
       NULL, LibAVCodec.CodecID.PCM_F64BE)

PCMDEF(f64le, "PCM 64-bit floating-point little-endian"
       NULL, LibAVCodec.CodecID.PCM_F64LE)

PCMDEF(f32be, "PCM 32-bit floating-point big-endian"
       NULL, LibAVCodec.CodecID.PCM_F32BE)

PCMDEF(f32le, "PCM 32-bit floating-point little-endian"
       NULL, LibAVCodec.CodecID.PCM_F32LE)

PCMDEF(s32be, "PCM signed 32-bit big-endian"
       NULL, LibAVCodec.CodecID.PCM_S32BE)

PCMDEF(s32le, "PCM signed 32-bit little-endian"
       NULL, LibAVCodec.CodecID.PCM_S32LE)

PCMDEF(s24be, "PCM signed 24-bit big-endian"
       NULL, LibAVCodec.CodecID.PCM_S24BE)

PCMDEF(s24le, "PCM signed 24-bit little-endian"
       NULL, LibAVCodec.CodecID.PCM_S24LE)

PCMDEF(s16be, "PCM signed 16-bit big-endian"
       AV_NE("sw", NULL), LibAVCodec.CodecID.PCM_S16BE, .mime_type = "audio/L16")

PCMDEF(s16le, "PCM signed 16-bit little-endian"
       AV_NE(NULL, "sw", LibAVCodec.CodecID.PCM_S16LE)

PCMDEF(s8, "PCM signed 8-bit"
       "sb", LibAVCodec.CodecID.PCM_S8)

PCMDEF(u32be, "PCM unsigned 32-bit big-endian"
       NULL, LibAVCodec.CodecID.PCM_U32BE)

PCMDEF(u32le, "PCM unsigned 32-bit little-endian"
       NULL, LibAVCodec.CodecID.PCM_U32LE)

PCMDEF(u24be, "PCM unsigned 24-bit big-endian"
       NULL, LibAVCodec.CodecID.PCM_U24BE)

PCMDEF(u24le, "PCM unsigned 24-bit little-endian"
       NULL, LibAVCodec.CodecID.PCM_U24LE)

PCMDEF(u16be, "PCM unsigned 16-bit big-endian"
       AV_NE("uw", NULL), LibAVCodec.CodecID.PCM_U16BE)

PCMDEF(u16le, "PCM unsigned 16-bit little-endian"
       AV_NE(NULL, "uw", LibAVCodec.CodecID.PCM_U16LE)

PCMDEF(u8, "PCM unsigned 8-bit"
       "ub", LibAVCodec.CodecID.PCM_U8)

PCMDEF(alaw, "PCM A-law"
       "al", LibAVCodec.CodecID.PCM_ALAW)

PCMDEF(mulaw, "PCM mu-law"
       "ul", LibAVCodec.CodecID.PCM_MULAW)

PCMDEF(vidc, "PCM Archimedes VIDC"
       NULL, LibAVCodec.CodecID.PCM_VIDC)

//  static const AVOption sln_options[] = {
//      { "sample_rate", "", offsetof(PCMAudioDemuxerContext, sample_rate), AV_OPT_TYPE_INT, {.i64 = 8000}, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
//      { "channels",    "", offsetof(PCMAudioDemuxerContext, channels),    AV_OPT_TYPE_INT, {.i64 = 1}, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
//      { NULL },
//  }

[CCode (cname="sln_demuxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "sln demuxer";
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
    //  .option = sln_options,
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_sln_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "sln";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Asterisk raw pcm";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (PCMAudioDemuxerContext);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = pcm_read_header,
    [CCode (cname="ff_pcm_read_packet", cheader="")]
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
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "sln";
        }
    }
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;
        }
    }
    //  .priv_class = sln_demuxer_class,
}
