/***********************************************************
@brief IEC 61937 muxer
@copyright 2009 Bartlomiej Wolowiec
@copyright 2010 Anssi Hannula
@copyright 2010 Carl Eugen Hoyos
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

/***********************************************************
@file IEC-61937 encapsulation of various formats, used by S/PDIF
@author Bartlomiej Wolowiec
@author Anssi Hannula
@author Carl Eugen Hoyos
***********************************************************/

/***********************************************************
@brief Terminology used in specification:
data-burst - IEC61937 frame, contains header and encapsuled frame
burst-preamble - IEC61937 frame header, contains 16-bit words named Pa, Pb, Pc and Pd
burst-payload - encapsuled frame
Pa, Pb - syncword - 0xF872, 0x4E1F
Pc - burst-info, contains data-type (bits 0-6), error flag (bit 7), data-type-dependent info (bits 8-12)
     and bitstream number (bits 13-15)
data-type - determines type of encapsuled frames
Pd - length code (number of bits or bytes of encapsuled frame - according to data_type)

IEC 61937 frames at normal usage start every specific count of bytes,
     dependent from data-type (spaces between packets are filled by zeros)
***********************************************************/

[CCode (cname="spdif_class",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
public class SPIDFMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
    public override string class_name {
        public get {
            return "spdif";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="option",cheader_filename="")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.FlagsOption () {
                    name = "spdif_flags",
                    short_help_text = "IEC 61937 encapsulation flags",
                    offset = offsetof (
                        IEC61937Context,
                        spdif_flags
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "spdif_flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "be",
                    short_help_text = "output in big-endian format (for use as s16be)",
                    offset = 0,
                    default_value = SPDIF_FLAG_BIGENDIAN,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "spdif_flags"
                },
                new LibAVUtil.IntOption () {
                    name = "dtshd_rate",
                    short_help_text = "mux complete DTS frames in HD mode at the specified IEC958 rate (in Hz, default 0=disabled)",
                    offset = offsetof (
                        IEC61937Context,
                        dtshd_rate
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 768000,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "dtshd_fallback_time",
                    short_help_text = "min secs to strip HD for after an overflow (-1: till the end, default 60)",
                    offset = offsetof (
                        IEC61937Context,
                        dtshd_fallback
                    ),
                    default_value = 60,
                    minimum_value = -1,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct IEC61937Context",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
[Compact]
public class SPIDFMuxerPrivateData { }

[CCode (cname="ff_spdif_muxer",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
public class SPIDFMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
    public override string name {
        public get {
            return "spdif";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
    public override string long_name {
        public get {
            return "IEC 61937 (used on S/PDIF - IEC958)";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
    public override string extensions {
        public get {
            return "spdif";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SPIDFMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AC3;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;

        }

    }

    [CCode (cname="spdif_write_header",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="spdif_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="spdif_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/spdifenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_TIMESTAMPS;

        }

    }
    //  .priv_class = spdif_class;
}

} // namespace LibAVFormat
