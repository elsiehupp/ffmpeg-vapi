/***********************************************************
@brief WAV muxer
@copyright 2001, 2002 Fabrice Bellard

Sony Wave64 muxer
@copyright 2012 Paul B Mahol

WAV muxer RF64 support
@copyright 2013 Daniel Verkamp <daniel@drv.nu>

EBU Tech 3285 - Supplement 3 - Peak Envelope Chunk encoder
@copyright 2014 Georg Lippitsch <georg.lippitsch@gmx.at>
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

[CCode (cname="wav_muxer_class",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
public class WAVMuxerClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override string class_name {
        public get {
            return "WAV muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.BoolOption () {
                    name = "write_bext",
                    short_help_text = "Write BEXT chunk.",
                    offset = offsetof (
                        WAVMuxContext,
                        write_bext
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "write_peak",
                    short_help_text = "Write Peak Envelope chunk.",
                    offset = offsetof (
                        WAVMuxContext,
                        write_peak
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 2,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "peak"
                },
                new LibAVUtil.ConstOption () {
                    name = "off",
                    short_help_text = "Do not write peak chunk.",
                    offset = 0,
                    default_value = PEAK_OFF,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "peak"
                },
                new LibAVUtil.ConstOption () {
                    name = "on",
                    short_help_text = "Append peak chunk after wav data.",
                    offset = 0,
                    default_value = PEAK_ON,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "peak"
                },
                new LibAVUtil.ConstOption () {
                    name = "only",
                    short_help_text = "Write only peak chunk, omit wav data.",
                    offset = 0,
                    default_value = PEAK_ONLY,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "peak"
                },
                new LibAVUtil.IntOption () {
                    name = "rf64",
                    short_help_text = "Use RF64 header rather than RIFF for large files.",
                    offset = offsetof (
                        WAVMuxContext,
                        rf64
                    ),
                    default_value = RF64_NEVER,
                    minimum_value = -1,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "rf64"
                },
                new LibAVUtil.ConstOption () {
                    name = "auto",
                    short_help_text = "Write RF64 header if file grows large enough.",
                    offset = 0,
                    default_value = RF64_AUTO,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "rf64"
                },
                new LibAVUtil.ConstOption () {
                    name = "always",
                    short_help_text = "Always write RF64 header regardless of file size.",
                    offset = 0,
                    default_value = RF64_ALWAYS,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "rf64"
                },
                new LibAVUtil.ConstOption () {
                    name = "never",
                    short_help_text = "Never write RF64 header regardless of file size.",
                    offset = 0,
                    default_value = RF64_NEVER,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "rf64"
                },
                new LibAVUtil.IntOption () {
                    name = "peak_block_size",
                    short_help_text = "Number of audio samples used to generate each peak frame.",
                    offset = offsetof (
                        WAVMuxContext,
                        peak_block_size
                    ),
                    default_value = 256,
                    minimum_value = 0,
                    maximum_value = 65536,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "peak_format",
                    short_help_text = "The format of the peak envelope data (1: uint8, 2: uint16).",
                    offset = offsetof (
                        WAVMuxContext,
                        peak_format
                    ),
                    default_value = PEAK_FORMAT_UINT16,
                    minimum_value = PEAK_FORMAT_UINT8,
                    maximum_value = PEAK_FORMAT_UINT16,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "peak_ppv",
                    short_help_text = "Number of peak points per peak value (1 or 2).",
                    offset = offsetof (
                        WAVMuxContext,
                        peak_ppv
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

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_wav_muxer",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
public class WAVMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override string name {
        public get {
            return "wav";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override string long_name {
        public get {
            return "WAV / WAVE (Waveform Audio)";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override string mime_type {
        public get {
            return "audio/x-wav";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override string extensions {
        public get {
            return "wav";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WAVMuxContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;

        }

    }

    [CCode (cname="wav_write_header",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="wav_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="wav_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS;

        }

    }

    [CCode (cname="codec_tag")]
    public override LibAVFormat.CodecTag[] codec_tag_list {
        public get {
            return {
                ff_codec_wav_tags,
                0
            };

        }

    }

}
#endif // CONFIG_WAV_MUXER

#if CONFIG_W64_MUXER

[CCode (cname="ff_w64_muxer",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
public class Wave64Muxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override string name {
        public get {
            return "w64";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override string long_name {
        public get {
            return "Sony Wave64";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override string extensions {
        public get {
            return "w64";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WAVMuxContext);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;

        }

    }

    [CCode (cname="w64_write_header",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="wav_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="w64_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/wavenc.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS;

        }

    }

    [CCode (cname="codec_tag")]
    public override LibAVFormat.CodecTag[] codec_tag_list {
        public get {
            return {
                ff_codec_wav_tags,
                0
            };

        }

    }

}
#endif // CONFIG_W64_MUXER

} // namespace LibAVFormat
