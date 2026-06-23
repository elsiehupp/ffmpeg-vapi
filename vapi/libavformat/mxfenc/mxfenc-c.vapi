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

[CCode (cname="",cheader_filename="")]
public define MXF_COMMON_OPTIONS
    new LibAVUtil.IntOption () {
        name = "signal_standard",
        short_help_text = "Force/set Signal Standard",
        offsetof (
            MXFContext,
            signal_standard
        ),
        {
            .i64 = -1
        },
        -1,
        7,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "signal_standard"
    },
    new LibAVUtil.ConstOption () {
        name = "bt601",
        short_help_text = "ITU-R BT.601 and BT.656, also SMPTE 125M (525 and 625 line interlaced)",
        0,
        {
            .i64 = 1
        },
        -1,
        7,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "signal_standard"
    },
    new LibAVUtil.ConstOption () {
        name = "bt1358",
        short_help_text = "ITU-R BT.1358 and ITU-R BT.799-3, also SMPTE 293M (525 and 625 line progressive)",
        0,
        {
            .i64 = 2
        },
        -1,
        7,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "signal_standard"
    },
    new LibAVUtil.ConstOption () {
        name = "smpte347m",
        short_help_text = "SMPTE 347M (540 Mbps mappings)",
        0,
        {
            .i64 = 3
        },
        -1,
        7,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "signal_standard"
    },
    new LibAVUtil.ConstOption () {
        name = "smpte274m",
        short_help_text = "SMPTE 274M (1125 line)",
        0,
        {
            .i64 = 4
        },
        -1,
        7,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "signal_standard"
    },
    new LibAVUtil.ConstOption () {
        name = "smpte296m",
        short_help_text = "SMPTE 296M (750 line progressive)",
        0,
        {
            .i64 = 5
        },
        -1,
        7,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "signal_standard"
    },
    new LibAVUtil.ConstOption () {
        name = "smpte349m",
        short_help_text = "SMPTE 349M (1485 Mbps mappings)",
        0,
        {
            .i64 = 6
        },
        -1,
        7,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "signal_standard"
    },
    new LibAVUtil.ConstOption () {
        name = "smpte428",
        short_help_text = "SMPTE 428-1 DCDM",
        0,
        {
            .i64 = 7
        },
        -1,
        7,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "signal_standard"
    }

};



static const LibAVUtil.Option mxf_options[] = {
    MXF_COMMON_OPTIONS,
    new LibAVUtil.BoolOption () {
        name = "store_user_comments",
        short_help_text = "",
        offsetof (
            MXFContext,
            store_user_comments
        ),
        {
            .i64 = 1
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="struct MXFContext",cheader_filename="ffmpeg/libformat/mxfenc.c")]
[Compact]
public class MXFMuxerClassPrivateData { }

[CCode (cname="mxf_muxer_class",cheader_filename="ffmpeg/libformat/mxfenc.c")]
public class MXFMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string class_name {
        public get {
            return "MXF muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = mxf_options,

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

static const LibAVUtil.Option d10_options[] = {
    new LibAVUtil.IntOption () {
        name = "d10_channelcount",
        short_help_text = "Force/set channelcount in generic sound essence descriptor",
        offsetof (
            MXFContext,
            channel_count
        ),
        {
            .i64 = -1
        },
        -1,
        8,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    MXF_COMMON_OPTIONS,
    new LibAVUtil.BoolOption () {
        name = "store_user_comments",
        short_help_text = "",
        offsetof (
            MXFContext,
            store_user_comments
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="mxf_d10_muxer_class",cheader_filename="ffmpeg/libformat/mxfenc.c")]
public class MXFD10MuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string class_name {
        public get {
            return "MXF-D10 muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = d10_options,

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

static const LibAVUtil.Option opatom_options[] = {
    new LibAVUtil.RationalOption () {
        name = "mxf_audio_edit_rate",
        short_help_text = "Audio edit rate for timecode",
        offsetof (
            MXFContext,
            audio_edit_rate
        ),
        {
            .dbl = 25
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    MXF_COMMON_OPTIONS,
    new LibAVUtil.BoolOption () {
        name = "store_user_comments",
        short_help_text = "",
        offsetof (
            MXFContext,
            store_user_comments
        ),
        {
            .i64 = 1
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="mxf_opatom_muxer_class",cheader_filename="ffmpeg/libformat/mxfenc.c")]
public class MXFOPAtomMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string class_name {
        public get {
            return "MXF-OPAtom muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = opatom_options,

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_mxf_muxer",cheader_filename="ffmpeg/libformat/mxfenc.c")]
public class MXFOPATOMMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string name {
        public get {
            return "mxf";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string long_name {
        public get {
            return "MXF (Material eXchange Format)";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string mime_type {
        public get {
            return "application/mxf";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string extensions {
        public get {
            return "mxf";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MXFMuxerClassPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG2VIDEO;

        }

    }

    [CCode (cname="mxf_write_header",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mxf_write_packet",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="mxf_write_footer",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOTIMESTAMPS;

        }

    }

    [CCode (cname="mxf_interleave",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override int interleave_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet output,
        LibAVCodec.Packet input,
        int flush
    );
    //  .priv_class = mxf_muxer_class;
}

[CCode (cname="ff_mxf_d10_muxer",cheader_filename="ffmpeg/libformat/mxfenc.c")]
public class MXFD10Muxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string name {
        public get {
            return "mxf_d10";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string long_name {
        public get {
            return "MXF (Material eXchange Format) D-10 Mapping";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string mime_type {
        public get {
            return "application/mxf";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MXFMuxerClassPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG2VIDEO;

        }

    }

    [CCode (cname="mxf_write_header",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mxf_write_packet",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="mxf_write_footer",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOTIMESTAMPS;

        }

    }

    [CCode (cname="mxf_interleave",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override int interleave_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet output,
        LibAVCodec.Packet input,
        int flush
    );
    //  .priv_class = mxf_d10_muxer_class;
}

[CCode (cname="ff_mxf_opatom_muxer",cheader_filename="ffmpeg/libformat/mxfenc.c")]
public class MXFMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string name {
        public get {
            return "mxf_opatom";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string long_name {
        public get {
            return "MXF (Material eXchange Format) Operational Pattern Atom";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string mime_type {
        public get {
            return "application/mxf";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override string extensions {
        public get {
            return "mxf";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MXFMuxerClassPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.DNXHD;

        }

    }

    [CCode (cname="mxf_write_header",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mxf_write_packet",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="mxf_write_footer",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOTIMESTAMPS;

        }

    }

    [CCode (cname="mxf_interleave",cheader_filename="ffmpeg/libformat/mxfenc.c")]
    public override int interleave_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet output,
        LibAVCodec.Packet input,
        int flush
    );
    //  .priv_class = mxf_opatom_muxer_class;
}

} // namespace LibAVFormat
