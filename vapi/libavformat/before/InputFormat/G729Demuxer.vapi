/***********************************************************
@brief G.729 raw format demuxer
@copyright 2011 Vladimir Voroshilov
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

[CCode (cname="g729_demuxer_class",cheader_filename="subprojects/ffmpeg/libavformat/g729dec.c")]
public class G729DemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/g729dec.c")]
    public override string class_name {
        public get {
            return "g729 demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/g729dec.c")]
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
                    name = "bit_rate",
                    short_help_text = "",
                    offset = offsetof (
                        G729DemuxerContext,
                        bit_rate
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

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/g729dec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct G729DemuxerContext",cheader_filename="subprojects/ffmpeg/libavformat/g729dec.c")]
[Compact]
public class G729DemuxerPrivateData { }

[CCode (cname="ff_g729_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/g729dec.c")]
public class G729Demuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/g729dec.c")]
    public override string name {
        public get {
            return "g729";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/g729dec.c")]
    public override string long_name {
        public get {
            return "G.729 raw format demuxer";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/g729dec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (G729DemuxerPrivateData);

        }

    }

    [CCode (cname="g729_read_header",cheader_filename="subprojects/ffmpeg/libavformat/g729dec.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="g729_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/g729dec.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/g729dec.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.USE_GENERIC_INDEX;

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/g729dec.c")]
    public override string extensions {
        public get {
            return "g729";

        }

    }
    //  .priv_class = g729_demuxer_class;
}

} // namespace LibAVFormat
