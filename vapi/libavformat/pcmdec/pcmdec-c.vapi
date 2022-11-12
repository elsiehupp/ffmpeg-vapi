/***********************************************************
@brief RAW PCM demuxers
@copyright 2002 Fabrice Bellard
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

//  static const LibAVUtil.Option pcm_options[] = {
//      { "sample_rate", "", offsetof (PCMAudioDemuxerContext, sample_rate), AV_OPT_TYPE_INT, {.i64 = 44100}, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
//      { "channels",    "", offsetof (PCMAudioDemuxerContext, channels),    AV_OPT_TYPE_INT, {.i64 = 1}, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
//      { NULL },
//  }

[CCode (cname="struct PCMAudioDemuxerContext", cheader_filename="")]
public struct PCMDemuxerPrivateData { }

[CCode (cname="", cheader_filename="")]
public abstract class PCMDemuxerClass : LibAVUtil.Class {
    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = pcm_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="", cheader_filename="")]
public abstract class PCMDemuxer : AVInputFormat {
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (PCMDemuxerPrivateData);
        }
    }

    [CCode (cname="pcm_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="ff_pcm_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="ff_pcm_read_seek", cheader_filename="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GENERIC_INDEX;
        }
    }
}


[CCode (cname="f64be_demuxer_class", cheader_filename="")]
public class PCMF64BEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "f64be demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_f64be_demuxer", cheader_filename="")]
public class PCMF64BEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "f64be";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM 64-bit floating-point big-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_F64BE;
        }
    }
    //  .priv_class = f64be_demuxer_class,
}

[CCode (cname="f64le_demuxer_class", cheader_filename="")]
public class PCMF64LEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "f64le demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_f64le_demuxer", cheader_filename="")]
public class PCMF64LEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "f64le";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM 64-bit floating-point little-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_F64LE;
        }
    }
    //  .priv_class = f64le_demuxer_class,
}

[CCode (cname="f32be_demuxer_class", cheader_filename="")]
public class PCMF32BEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "f32be demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_f32be_demuxer", cheader_filename="")]
public class PCMF32BEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "f32be";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM 32-bit floating-point big-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_F32BE;
        }
    }
    //  .priv_class = f32be_demuxer_class,
}

[CCode (cname="f32le_demuxer_class", cheader_filename="")]
public class PCMF32LEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "f32le demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_f32le_demuxer", cheader_filename="")]
public class PCMF32LEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "f32le";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM 32-bit floating-point little-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_F32LE;
        }
    }
    //  .priv_class = f32le_demuxer_class,
}

[CCode (cname="s32be_demuxer_class", cheader_filename="")]
public class PCMS32BEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "s32be demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_s32be_demuxer", cheader_filename="")]
public class PCMS32BEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "s32be";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM signed 32-bit big-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_S32BE;
        }
    }
    //  .priv_class = s32be_demuxer_class,
}

[CCode (cname="s32le_demuxer_class", cheader_filename="")]
public class PCMS32LEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "s32le demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_s32le_demuxer", cheader_filename="")]
public class PCMS32LEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "s32le";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM signed 32-bit little-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_S32LE;
        }
    }
    //  .priv_class = s32le_demuxer_class,
}

[CCode (cname="s24be_demuxer_class", cheader_filename="")]
public class PCMS24BEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "s24be demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_s24be_demuxer", cheader_filename="")]
public class PCMS24BEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "s24be";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM signed 24-bit big-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_S24BE;
        }
    }
    //  .priv_class = s24be_demuxer_class,
}

[CCode (cname="s24le_demuxer_class", cheader_filename="")]
public class PCMS24LEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "s24le demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_s24le_demuxer", cheader_filename="")]
public class PCMS24LEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "s24le";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM signed 24-bit little-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_S24LE;
        }
    }
    //  .priv_class = s24le_demuxer_class,
}

[CCode (cname="s16be_demuxer_class", cheader_filename="")]
public class PCMS16BEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "s16be demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_s16be_demuxer", cheader_filename="")]
public class PCMS16BEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "s16be";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM signed 16-bit big-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
        #if AV_HAVE_BIGENDIAN
            return "sw";
        #else
            return "";
        #endif
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_S16BE;
        }
    }
    //  .priv_class = s16be_demuxer_class,
    //  .mime_type = "audio/L16";
}

[CCode (cname="s16le_demuxer_class", cheader_filename="")]
public class PCMS16LEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "s16le demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_s16le_demuxer", cheader_filename="")]
public class PCMS16LEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "s16le";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM signed 16-bit little-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
        #if AV_HAVE_BIGENDIAN
            return "";
        #else
            return "sw";
        #endif
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;
        }
    }
    //  .priv_class = s16le_demuxer_class,
}

[CCode (cname="s8_demuxer_class", cheader_filename="")]
public class PCMS8DemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "s8 demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_s8_demuxer", cheader_filename="")]
public class PCMS8Demuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "s8";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM signed 8-bit";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "sb";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_S8;
        }
    }
    //  .priv_class = s8_demuxer_class,
}

[CCode (cname="u32be_demuxer_class", cheader_filename="")]
public class PCMU32BEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "u32be demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_u32be_demuxer", cheader_filename="")]
public class PCMU32BEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "u32be";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM unsigned 32-bit big-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_U32BE;
        }
    }
    //  .priv_class = u32be_demuxer_class,
}

[CCode (cname="u32le_demuxer_class", cheader_filename="")]
public class PCMU32LEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "u32le demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_u32le_demuxer", cheader_filename="")]
public class PCMU32LEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "u32le";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM unsigned 32-bit little-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_U32LE;
        }
    }
    //  .priv_class = u32le_demuxer_class,
}

[CCode (cname="u24be_demuxer_class", cheader_filename="")]
public class PCMU24BEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "u24be demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_u24be_demuxer", cheader_filename="")]
public class PCMU24BEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "u24be";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM unsigned 24-bit big-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_U24BE;
        }
    }
    //  .priv_class = u24be_demuxer_class,
}

[CCode (cname="u24le_demuxer_class", cheader_filename="")]
public class PCMU24LEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "u24le demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_u24le_demuxer", cheader_filename="")]
public class PCMU24LEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "u24le";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM unsigned 24-bit little-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_U24LE;
        }
    }
    //  .priv_class = u24le_demuxer_class,
}

[CCode (cname="u16be_demuxer_class", cheader_filename="")]
public class PCMU16BEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "u16be demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_u16be_demuxer", cheader_filename="")]
public class PCMU16BEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "u16be";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM unsigned 16-bit big-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
        #if AV_HAVE_BIGENDIAN
            return "uw";
        #else
            return "";
        #endif
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_U16BE;
        }
    }
    //  .priv_class = u16be_demuxer_class,
}

[CCode (cname="u16le_demuxer_class", cheader_filename="")]
public class PCMU16LEDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "u16le demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_u16le_demuxer", cheader_filename="")]
public class PCMU16LEDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "u16le";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM unsigned 16-bit little-endian";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
        #if AV_HAVE_BIGENDIAN
            return "";
        #else
            return "uw";
        #endif
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_U16LE;
        }
    }
    //  .priv_class = u16le_demuxer_class,
}

[CCode (cname="u8_demuxer_class", cheader_filename="")]
public class PCMU8DemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "u8 demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_u8_demuxer", cheader_filename="")]
public class PCMU8Demuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "u8";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM unsigned 8-bit";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "ub";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_U8;
        }
    }
    //  .priv_class = u8_demuxer_class,
}

[CCode (cname="alaw_demuxer_class", cheader_filename="")]
public class PCMNALAWDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "alaw demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_alaw_demuxer", cheader_filename="")]
public class PCMALAWDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "alaw";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM A-law";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "al";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_ALAW;
        }
    }
    //  .priv_class = alaw_demuxer_class,
}

[CCode (cname="mulaw_demuxer_class", cheader_filename="")]
public class PCMMULAWDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "mulaw demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_mulaw_demuxer", cheader_filename="")]
public class PCMMULAWDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "mulaw";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM mu-law";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "ul";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_MULAW;
        }
    }
    //  .priv_class = mulaw_demuxer_class,
}

[CCode (cname="vidc_demuxer_class", cheader_filename="")]
public class PCMVIDCDemuxerClass : PCMDemuxerClass {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "vidc demuxer";
        }
    }
    //  .option = pcm_options,
}

[CCode (cname="ff_pcm_vidc_demuxer", cheader_filename="")]
public class PCMVIDCDemuxer : PCMDemuxer {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "vidc";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "PCM Archimedes VIDC";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_VIDC;
        }
    }
    //  .priv_class = vidc_demuxer_class,
}

//  static const LibAVUtil.Option sln_options[] = {
//      { "sample_rate", "", offsetof (PCMAudioDemuxerContext, sample_rate), AV_OPT_TYPE_INT, {.i64 = 8000}, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
//      { "channels",    "", offsetof (PCMAudioDemuxerContext, channels),    AV_OPT_TYPE_INT, {.i64 = 1}, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
//      { NULL },
//  }

[CCode (cname="sln_demuxer_class", cheader_filename="")]
public class SLNDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "sln demuxer";
        }
    }
    //  .option = sln_options,
}

[CCode (cname="ff_sln_demuxer", cheader_filename="")]
public class SLNDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "sln";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Asterisk raw pcm";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "sln";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;
        }
    }
    //  .priv_class = sln_demuxer_class,
}

} // namespace LibAVFormat
