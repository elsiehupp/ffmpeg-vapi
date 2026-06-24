/***********************************************************
@brief Tele-typewriter demuxer
@copyright 2010 Peter Ross <pross@xvid.org>
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
@file Tele-typewriter demuxer
***********************************************************/

[CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/tty.c")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.IntOption () {
        name = "chars_per_frame",
        short_help_text = "",
        offset = offsetof (
            TtyDemuxContext,
            chars_per_frame
        ),
        default_value = 6000,
        minimum_value = 1,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.ImageSizeOption () {
        name = "video_size",
        short_help_text = "A string describing frame size, such as 640x480 or hd720.",
        offset = offsetof (
            TtyDemuxContext,
            width
        ),
        default_value = "",
        minimum_value = 0,
        maximum_value = 0,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.VideoRateOption () {
        name = "framerate",
        short_help_text = "",
        offset = offsetof (
            TtyDemuxContext,
            framerate
        ),
        default_value = "25",
        minimum_value = 0,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="tty_demuxer_class",cheader_filename="subprojects/ffmpeg/libavformat/tty.c")]
public class TTYDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/tty.c")]
    public override string class_name {
        public get {
            return "TTY demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/tty.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = options,

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/tty.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct TtyDemuxContext",cheader_filename="subprojects/ffmpeg/libavformat/tty.c")]
[Compact]
public class TTYDemuxerPrivateData { }

[CCode (cname="ff_tty_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/tty.c")]
public class TTYDemuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/tty.c")]
    public override string name {
        public get {
            return "tty";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/tty.c")]
    public override string long_name {
        public get {
            return "Tele-typewriter";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/tty.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (TTYDemuxerPrivateData);

        }

    }

    [CCode (cname="read_probe",cheader_filename="subprojects/ffmpeg/libavformat/tty.c")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="read_header",cheader_filename="subprojects/ffmpeg/libavformat/tty.c")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="read_packet",cheader_filename="subprojects/ffmpeg/libavformat/tty.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="tty_extensions",cheader_filename="subprojects/ffmpeg/libavformat/tty.c")]
    public override string extensions {
        public get;
    }
    //  .priv_class = tty_demuxer_class;
}

} // namespace LibAVFormat
