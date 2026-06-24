/***********************************************************
@brief GIF demuxer
@copyright 2012 Vitaliy E Sugrobov
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
@file GIF demuxer.
***********************************************************/

static const LibAVUtil.Option options[] = {
    new LibAVUtil.IntOption () {
        name = "min_delay",
        short_help_text = "minimum valid delay between frames (in hundredths of second)",
        offset = offsetof (
            GIFDemuxContext,
            min_delay
        ),
        default_value = GIF_MIN_DELAY,
        minimum_value = 0,
        maximum_value = (
            100 * 60
        ),
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "max_gif_delay",
        short_help_text = "maximum valid delay between frames (in hundredths of seconds)",
        offset = offsetof (
            GIFDemuxContext,
            max_delay
        ),
        default_value = 65535,
        minimum_value = 0,
        maximum_value = 65535,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "default_delay",
        short_help_text = "default delay between frames (in hundredths of second)",
        offset = offsetof (
            GIFDemuxContext,
            default_delay
        ),
        default_value = GIF_DEFAULT_DELAY,
        minimum_value = 0,
        maximum_value = (
            100 * 60
        ),
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "ignore_loop",
        short_help_text = "ignore loop setting (netscape extension)",
        offset = offsetof (
            GIFDemuxContext,
            ignore_loop
        ),
        default_value = 1,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="demuxer_class",cheader_filename="subprojects/ffmpeg/libavformat/gifdec.c")]
public class GIFDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/gifdec.c")]
    public override string class_name {
        public get {
            return "GIF demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/gifdec.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/gifdec.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/gifdec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
    //  .category = LibAVUtil.ClassCategory.DEMUXER;
}

[CCode (cname="struct GIFDemuxContext",cheader_filename="subprojects/ffmpeg/libavformat/gifdec.c")]
[Compact]
public class GIFDemuxerPrivateData { }

[CCode (cname="ff_gif_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/gifdec.c")]
public class GIFDemuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/gifdec.c")]
    public override string name {
        public get {
            return "gif";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/gifdec.c")]
    public override string long_name {
        public get {
            return "CompuServe Graphics Interchange Format (GIF)";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/gifdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (GIFDemuxerPrivateData);

        }

    }

    [CCode (cname="gif_probe",cheader_filename="subprojects/ffmpeg/libavformat/gifdec.c")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="gif_read_header",cheader_filename="subprojects/ffmpeg/libavformat/gifdec.c")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="gif_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/gifdec.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/gifdec.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.USE_GENERIC_INDEX;

        }

    }
    //  .priv_class = demuxer_class;
}

} // namespace LibAVFormat
