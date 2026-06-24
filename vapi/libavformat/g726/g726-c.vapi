/***********************************************************
@brief G.726 raw demuxer
Copyright 2017 Carl Eugen Hoyos
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

#if CONFIG_G726_DEMUXER

public class G726OptionsClass : LibAVUtil.Class {

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.IntOption () {
                    name = "code_size",
                    short_help_text = "Bits per G.726 code",
                    offset = offsetof (
                        G726Context,
                        code_size
                    ),
                    default_value = 4,
                    minimum_value = 2,
                    maximum_value = 5,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "sample_rate",
                    short_help_text = "",
                    offset = offsetof (
                        G726Context,
                        sample_rate
                    ),
                    default_value = 8000,
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

[CCode (cname="g726le_demuxer_class",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
public class G726LEDemuxerClass : G726OptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override string class_name {
        public get {
            return "G.726 big-endian demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_g726_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
public class G726Demuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override string name {
        public get {
            return "g726";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override string long_name {
        public get {
            return "raw big-endian G.726 (\"left aligned\")";

        }

    }

    [CCode (cname="g726_read_header",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="g726_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (G726Context);

        }

    }
    //  .priv_class = g726le_demuxer_class,

    [CCode (cname="raw_codec_id",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.ADPCM_G726;

        }

    }
}
#endif

#if CONFIG_G726LE_DEMUXER

[CCode (cname="g726_demuxer_class",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
public class G726DemuxerClass : G726OptionsClass {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override string class_name {
        public get {
            return "G.726 little-endian demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_g726le_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
public class G726LEDemuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override string name {
        public get {
            return "g726le";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override string long_name {
        public get {
            return "raw little-endian G.726 (\"right aligned\")";

        }

    }

    [CCode (cname="g726_read_header",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="g726_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (G726Context);

        }

    }
    //  .priv_class = g726_demuxer_class,

    [CCode (cname="raw_codec_id",cheader_filename="subprojects/ffmpeg/libavformat/g726.c")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.ADPCM_G726LE;

        }

    }
}
#endif

} // namespace LibAVFormat
