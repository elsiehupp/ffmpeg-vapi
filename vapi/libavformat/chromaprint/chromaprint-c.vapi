/***********************************************************
@brief Chromaprint fingerprinting muxer
@copyright 2015 Rodger Combs
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

[CCode (cname="chromaprint_class",cheader_filename="subprojects/ffmpeg/libavformat/chromaprint.c")]
public class ChromaPrintMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/chromaprint.c")]
    public override string class_name {
        public get {
            return "chromaprint muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/chromaprint.c")]
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
                new LibAVUtil.IntOption () {
                    name = "silence_threshold",
                    short_help_text = "threshold for detecting silence",
                    offset = offsetof (
                        ChromaprintMuxContext,
                        silence_threshold
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = 32767,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "algorithm",
                    short_help_text = "version of the fingerprint algorithm",
                    offset = offsetof (
                        ChromaprintMuxContext,
                        algorithm
                    ),
                    default_value = CHROMAPRINT_ALGORITHM_DEFAULT,
                    minimum_value = CHROMAPRINT_ALGORITHM_TEST1,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "fp_format",
                    short_help_text = "fingerprint format to write",
                    offset = offsetof (
                        ChromaprintMuxContext,
                        fp_format
                    ),
                    default_value = FINGERPRINT_BASE64,
                    minimum_value = FINGERPRINT_RAW,
                    maximum_value = FINGERPRINT_BASE64,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.ConstOption () {
                    name = "raw",
                    short_help_text = "binary raw fingerprint",
                    offset = 0,
                    default_value = FINGERPRINT_RAW,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "fp_format"
                },
                new LibAVUtil.ConstOption () {
                    name = "compressed",
                    short_help_text = "binary compressed fingerprint",
                    offset = 0,
                    default_value = FINGERPRINT_COMPRESSED,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "fp_format"
                },
                new LibAVUtil.ConstOption () {
                    name = "base64",
                    short_help_text = "Base64 compressed fingerprint",
                    offset = 0,
                    default_value = FINGERPRINT_BASE64,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "fp_format"
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/chromaprint.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct ChromaprintMuxContext",cheader_filename="subprojects/ffmpeg/libavformat/chromaprint.c")]
[Compact]
public class ChromaPrintMuxerPrivateData { }

[CCode (cname="ff_chromaprint_muxer",cheader_filename="subprojects/ffmpeg/libavformat/chromaprint.c")]
public class ChromaPrintMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/chromaprint.c")]
    public override string name {
        public get {
            return "chromaprint";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/chromaprint.c")]
    public override string long_name {
        public get {
            return "Chromaprint";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/chromaprint.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ChromaPrintMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/chromaprint.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
        #if AV_HAVE_BIGENDIAN
            return LibAVCodec.CodecID.PCM_S16BE;
        #else
            return LibAVCodec.CodecID.PCM_S16LE;
        #endif
        }
    }

    [CCode (cname="write_header",cheader_filename="subprojects/ffmpeg/libavformat/chromaprint.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="write_packet",cheader_filename="subprojects/ffmpeg/libavformat/chromaprint.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/chromaprint.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/chromaprint.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_TIMESTAMPS;

        }

    }
    //  .priv_class = chromaprint_class;
}

} // namespace LibAVFormat
