/***********************************************************
@brief MXF muxer
@copyright 2008 GUCAS, Zhentan Feng <spyfeng at gmail dot com>
@copyright 2008 Baptiste Coudurier <baptiste dot coudurier at gmail dot com>
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
@brief Signal_standard, color_siting, store_user_comments, sample rate and klv_fill_key version
fixes sponsored by NOA GmbH
***********************************************************/

/***********************************************************
@brief References
SMPTE 336M KLV Data Encoding Protocol Using Key-Length-Value
SMPTE 377M MXF File Format Specifications
SMPTE 379M MXF Generic Container
SMPTE 381M Mapping MPEG Streams into the MXF Generic Container
SMPTE 422M Mapping JPEG 2000 Codestreams into the MXF Generic Container
SMPTE RP210: SMPTE Metadata Dictionary
SMPTE RP224: Registry of SMPTE Universal Labels
***********************************************************/

[CCode (cname="MXF_COMMON_OPTIONS",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
public define MXF_COMMON_OPTIONS
    new LibAVUtil.IntOption () {
        name = "signal_standard",
        short_help_text = "Force/set Signal Standard",
        offset = offsetof (
            MXFContext,
            signal_standard
        ),
        default_value = -1,
        minimum_value = -1,
        maximum_value = 7,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "signal_standard"
    },
    new LibAVUtil.ConstOption () {
        name = "bt601",
        short_help_text = "ITU-R BT.601 and BT.656, also SMPTE 125M (525 and 625 line interlaced)",
        offset = 0,
        default_value = 1,
        minimum_value = -1,
        maximum_value = 7,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "signal_standard"
    },
    new LibAVUtil.ConstOption () {
        name = "bt1358",
        short_help_text = "ITU-R BT.1358 and ITU-R BT.799-3, also SMPTE 293M (525 and 625 line progressive)",
        offset = 0,
        default_value = 2,
        minimum_value = -1,
        maximum_value = 7,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "signal_standard"
    },
    new LibAVUtil.ConstOption () {
        name = "smpte347m",
        short_help_text = "SMPTE 347M (540 Mbps mappings)",
        offset = 0,
        default_value = 3,
        minimum_value = -1,
        maximum_value = 7,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "signal_standard"
    },
    new LibAVUtil.ConstOption () {
        name = "smpte274m",
        short_help_text = "SMPTE 274M (1125 line)",
        offset = 0,
        default_value = 4,
        minimum_value = -1,
        maximum_value = 7,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "signal_standard"
    },
    new LibAVUtil.ConstOption () {
        name = "smpte296m",
        short_help_text = "SMPTE 296M (750 line progressive)",
        offset = 0,
        default_value = 5,
        minimum_value = -1,
        maximum_value = 7,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "signal_standard"
    },
    new LibAVUtil.ConstOption () {
        name = "smpte349m",
        short_help_text = "SMPTE 349M (1485 Mbps mappings)",
        offset = 0,
        default_value = 6,
        minimum_value = -1,
        maximum_value = 7,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "signal_standard"
    },
    new LibAVUtil.ConstOption () {
        name = "smpte428",
        short_help_text = "SMPTE 428-1 DCDM",
        offset = 0,
        default_value = 7,
        minimum_value = -1,
        maximum_value = 7,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        unit = "signal_standard"
    }

};

[CCode (cname="struct MXFContext",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
[Compact]
public class MXFMuxerClassPrivateData { }

[CCode (cname="mxf_muxer_class",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
public class MXFMuxerClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override string class_name {
        public get {
            return "MXF muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
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
                MXF_COMMON_OPTIONS,
                new LibAVUtil.BoolOption () {
                    name = "store_user_comments",
                    short_help_text = "",
                    offset = offsetof (
                        MXFContext,
                        store_user_comments
                    ),
                    default_value = 1,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="mxf_d10_muxer_class",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
public class MXFD10MuxerClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override string class_name {
        public get {
            return "MXF-D10 muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
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
                    name = "d10_channelcount",
                    short_help_text = "Force/set channelcount in generic sound essence descriptor",
                    offset = offsetof (
                        MXFContext,
                        channel_count
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = 8,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                MXF_COMMON_OPTIONS,
                new LibAVUtil.BoolOption () {
                    name = "store_user_comments",
                    short_help_text = "",
                    offset = offsetof (
                        MXFContext,
                        store_user_comments
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="mxf_opatom_muxer_class",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
public class MXFOPAtomMuxerClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override string class_name {
        public get {
            return "MXF-OPAtom muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
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
                new LibAVUtil.RationalOption () {
                    name = "mxf_audio_edit_rate",
                    short_help_text = "Audio edit rate for timecode",
                    offset = offsetof (
                        MXFContext,
                        audio_edit_rate
                    ),
                    default_value = 25,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                MXF_COMMON_OPTIONS,
                new LibAVUtil.BoolOption () {
                    name = "store_user_comments",
                    short_help_text = "",
                    offset = offsetof (
                        MXFContext,
                        store_user_comments
                    ),
                    default_value = 1,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_mxf_muxer",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
public class MXFOPATOMMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override string name {
        public get {
            return "mxf";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override string long_name {
        public get {
            return "MXF (Material eXchange Format)";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override string mime_type {
        public get {
            return "application/mxf";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override string extensions {
        public get {
            return "mxf";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MXFMuxerClassPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG2VIDEO;

        }

    }

    [CCode (cname="mxf_write_header",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="mxf_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override int write_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="mxf_write_footer",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_TIMESTAMPS;

        }

    }

    [CCode (cname="mxf_interleave",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override int interleave_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet output,
        LibAVCodec.Packet input,
        int flush
    );
    //  .priv_class = mxf_muxer_class;
}

[CCode (cname="ff_mxf_d10_muxer",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
public class MXFD10Muxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override string name {
        public get {
            return "mxf_d10";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override string long_name {
        public get {
            return "MXF (Material eXchange Format) D-10 Mapping";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override string mime_type {
        public get {
            return "application/mxf";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MXFMuxerClassPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG2VIDEO;

        }

    }

    [CCode (cname="mxf_write_header",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="mxf_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override int write_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="mxf_write_footer",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_TIMESTAMPS;

        }

    }

    [CCode (cname="mxf_interleave",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override int interleave_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet output,
        LibAVCodec.Packet input,
        int flush
    );
    //  .priv_class = mxf_d10_muxer_class;
}

[CCode (cname="ff_mxf_opatom_muxer",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
public class MXFMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override string name {
        public get {
            return "mxf_opatom";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override string long_name {
        public get {
            return "MXF (Material eXchange Format) Operational Pattern Atom";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override string mime_type {
        public get {
            return "application/mxf";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override string extensions {
        public get {
            return "mxf";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MXFMuxerClassPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.DNXHD;

        }

    }

    [CCode (cname="mxf_write_header",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="mxf_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override int write_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="mxf_write_footer",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_TIMESTAMPS;

        }

    }

    [CCode (cname="mxf_interleave",cheader_filename="subprojects/ffmpeg/libavformat/mxfenc.c")]
    public override int interleave_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet output,
        LibAVCodec.Packet input,
        int flush
    );
    //  .priv_class = mxf_opatom_muxer_class;
}

} // namespace LibAVFormat
