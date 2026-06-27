/***********************************************************
@brief FLV demuxer
@copyright 2003 The FFmpeg Project

This demuxer will generate a 1 byte extradata for VP6F content.
It is composed of:
- upper 4 bits: difference between encoded width and visible width
- lower 4 bits: difference between encoded height and visible height
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

[CCode (cname="struct FLVContext",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
[Compact]
public class FLVDemuxerClassPrivateData { }

public abstract class FLVDemuxerClass : LibAVUtil.Class {
    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.BoolOption () {
                    name = "flv_metadata",
                    short_help_text = "Allocate streams according to the onMetaData array",
                    offset = offsetof (
                        FLVContext,
                        trust_metadata
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    )
                },
                new LibAVUtil.BoolOption () {
                    name = "flv_full_metadata",
                    short_help_text = "Dump full metadata of the onMetadata",
                    offset = offsetof (
                        FLVContext,
                        dump_full_metadata
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    )
                },
                new LibAVUtil.BoolOption () {
                    name = "flv_ignore_prevtag",
                    short_help_text = "Ignore the Size of previous tag",
                    offset = offsetof (
                        FLVContext,
                        trust_datasize
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "missing_streams",
                    short_help_text = "",
                    offset = offsetof (
                        FLVContext,
                        missing_streams
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 0xFF,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    ) | LibAVUtil.OptionFlags.EXPORT | LibAVUtil.OptionFlags.READONLY
                },
                {
                    NULL
                }

            };

        }

    }

}

[CCode (cname="flv_class",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
public class FLVDemuxerClass : FLVDemuxerClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override string class_name {
        public get {
            return "flvdec";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_flv_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
public class FLVDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override string name {
        public get {
            return "flv";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override string long_name {
        public get {
            return "FLV (Flash Video)";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FLVDemuxerClassPrivateData);

        }

    }

    [CCode (cname="flv_probe",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="flv_read_header",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flv_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flv_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flv_read_close",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int read_close (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override string extensions {
        public get {
            return "flv";

        }

    }
    //  .priv_class = flv_class;
}


[CCode (cname="live_flv_class",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
public class LiveFLVDemuxerClass : FLVDemuxerClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override string class_name {
        public get {
            return "live_flvdec";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_live_flv_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
public class LiveFLVDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override string name {
        public get {
            return "live_flv";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override string long_name {
        public get {
            return "live RTMP FLV (Flash Video)";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FLVDemuxerClassPrivateData);

        }

    }

    [CCode (cname="live_flv_probe",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="flv_read_header",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flv_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flv_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flv_read_close",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int read_close (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override string extensions {
        public get {
            return "flv";

        }

    }
    //  .priv_class = live_flv_class,

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.ALLOWS_TIMESTAMP_DISCONTINUITIES;

        }

    }
}

[CCode (cname="kux_class",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
public class KUXDemuxerClass : FLVDemuxerClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override string class_name {
        public get {
            return "kuxdec";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_kux_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
public class KUXDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override string name {
        public get {
            return "kux";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override string long_name {
        public get {
            return "KUX (YouKu)";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FLVDemuxerClassPrivateData);

        }

    }

    [CCode (cname="kux_probe",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="flv_read_header",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flv_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flv_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flv_read_close",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override int read_close (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/flvdec.c")]
    public override string extensions {
        public get {
            return "kux";

        }

    }
    //  .priv_class = kux_class;
}

} // namespace LibAVFormat
