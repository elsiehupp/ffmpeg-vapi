/***********************************************************
WAV muxer
@copyright 2001, 2002 Fabrice Bellard

Sony Wave64 muxer
@copyright 2012 Paul B Mahol

WAV muxer RF64 support
@copyright 2013 Daniel Verkamp <daniel@drv.nu>

EBU Tech 3285 - Supplement 3 - Peak Envelope Chunk encoder
@copyright 2014 Georg Lippitsch <georg.lippitsch@gmx.at>
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

#if CONFIG_WAV_MUXER
//  #define OFFSET(x) offsetof(WAVMuxContext, x)
//  #define ENC AV_OPT_FLAG_ENCODING_PARAM
//  static const AVOption options[] = {
//      { "write_bext", "Write BEXT chunk.", OFFSET(write_bext), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, ENC },
//      { "write_peak", "Write Peak Envelope chunk.",            OFFSET(write_peak), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, 2, ENC, "peak" },
//      { "off",        "Do not write peak chunk.",              0,                  AV_OPT_TYPE_CONST, { .i64 = PEAK_OFF  }, 0, 0, ENC, "peak" },
//      { "on",         "Append peak chunk after wav data.",     0,                  AV_OPT_TYPE_CONST, { .i64 = PEAK_ON   }, 0, 0, ENC, "peak" },
//      { "only",       "Write only peak chunk, omit wav data.", 0,                  AV_OPT_TYPE_CONST, { .i64 = PEAK_ONLY }, 0, 0, ENC, "peak" },
//      { "rf64",       "Use RF64 header rather than RIFF for large files.",    OFFSET(rf64), AV_OPT_TYPE_INT,   { .i64 = RF64_NEVER  },-1, 1, ENC, "rf64" },
//      { "auto",       "Write RF64 header if file grows large enough.",        0,            AV_OPT_TYPE_CONST, { .i64 = RF64_AUTO   }, 0, 0, ENC, "rf64" },
//      { "always",     "Always write RF64 header regardless of file size.",    0,            AV_OPT_TYPE_CONST, { .i64 = RF64_ALWAYS }, 0, 0, ENC, "rf64" },
//      { "never",      "Never write RF64 header regardless of file size.",     0,            AV_OPT_TYPE_CONST, { .i64 = RF64_NEVER  }, 0, 0, ENC, "rf64" },
//      { "peak_block_size", "Number of audio samples used to generate each peak frame.",   OFFSET(peak_block_size), AV_OPT_TYPE_INT, { .i64 = 256 }, 0, 65536, ENC },
//      { "peak_format",     "The format of the peak envelope data (1: uint8, 2: uint16).", OFFSET(peak_format), AV_OPT_TYPE_INT,     { .i64 = PEAK_FORMAT_UINT16 }, PEAK_FORMAT_UINT8, PEAK_FORMAT_UINT16, ENC },
//      { "peak_ppv",        "Number of peak points per peak value (1 or 2).",              OFFSET(peak_ppv), AV_OPT_TYPE_INT, { .i64 = 2 }, 1, 2, ENC },
//      { NULL },
//  }

[CCode (cname="wav_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "WAV muxer";
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

[CCode (cname="ff_wav_muxer", cheader="")]
public class WAVOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "wav";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "WAV / WAVE (Waveform Audio)";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "audio/x-wav";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "wav";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WAVMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = wav_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = wav_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = wav_write_trailer,
    //  .flags = AVFMT_TS_NONSTRICT,
    //  .codec_tag = (AVCodecTag[]){ ff_codec_wav_tags, 0 },
    //  .priv_class = wav_muxer_class,
}
#endif /* CONFIG_WAV_MUXER */

#if CONFIG_W64_MUXER
[CCode (cname="ff_w64_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "w64";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Sony Wave64";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "w64";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WAVMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = w64_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = wav_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = w64_write_trailer,
    //  .flags = AVFMT_TS_NONSTRICT,
    //  .codec_tag = (AVCodecTag[]){ ff_codec_wav_tags, 0 },
}
#endif /* CONFIG_W64_MUXER */
