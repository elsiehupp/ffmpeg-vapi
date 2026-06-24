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
/***********************************************************
@brief RAW aptX demuxer

@copyright 2017 Aurelien Jacobs <aurel@gnuage.org>
***********************************************************/
namespace LibAVFormat {

public abstract class AptXOptionsClass : LibAVUtil.Class {

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.IntOption () {
                    name = "sample_rate",
                    short_help_text = "",
                    offset = offsetof (
                        AptXDemuxerContext,
                        sample_rate
                    ),
                    default_value = 48000,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

}

#if CONFIG_APTX_DEMUXER

[CCode (cname="aptx_demuxer_class",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
public class APTXDemuxerClass : AptXOptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override string class_name {
        public get {
            return "aptx demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_aptx_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
public class APTXDemuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override string name {
        public get {
            return "aptx";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override string long_name {
        public get {
            return "raw aptX";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override string extensions {
        public get {
            return "aptx";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (AptXDemuxerContext);

        }

    }

    [CCode (cname="aptx_read_header",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override int read_header (
        AVFormatContext format_context
    )
    [CCode (cname="aptx_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    )
    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.USE_GENERIC_INDEX;

        }

    }
    //  .priv_class = aptx_demuxer_class;
}
#endif

#if CONFIG_APTX_HD_DEMUXER

[CCode (cname="aptx_hd_demuxer_class",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
public class APTXHDDemuxerClass : AptXOptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override string class_name {
        public get {
            return "aptx hd demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_aptx_hd_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
public class APTXDemuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override string name {
        public get {
            return "aptx_hd";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override string long_name {
        public get {
            return "raw aptX HD";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override string extensions {
        public get {
            return "aptxhd";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (AptXDemuxerContext);

        }

    }

    [CCode (cname="aptx_hd_read_header",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="aptx_hd_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/aptxdec.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.USE_GENERIC_INDEX;

        }

    }
    //  .priv_class = aptx_hd_demuxer_class;
}
#endif

} // namespace LibAVFormat
