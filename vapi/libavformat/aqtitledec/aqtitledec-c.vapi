/***********************************************************
@copyright 2012 Clément Bœsch
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
@file AQTitle subtitles format demuxer

@see http://web.archive.org/web/20070210095721/http://www.volny.cz/aberka/czech/aqt.html
@see https://trac.annodex.net/wiki/AQTitle
***********************************************************/

[CCode (cname="aqt_class",cheader_filename="subprojects/ffmpeg/libavformat/aqtitledec.c")]
public class AQTitleClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/aqtitledec.c")]
    public override string class_name {
        public get {
            return "aqtdec";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/aqtitledec.c")]
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
                    name = "subfps",
                    short_help_text = "set the movie frame rate",
                    offset = offsetof (
                        AQTitleContext,
                        frame_rate
                    ),
                    default_value = 25,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.SUBTITLE_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    )
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/aqtitledec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct AQTitleContext",cheader_filename="subprojects/ffmpeg/libavformat/aqtitledec.c")]
[Compact]
public class AQTitleDemuxerPrivateData { }

[CCode (cname="ff_aqtitle_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/aqtitledec.c")]
public class AQTitleDemuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/aqtitledec.c")]
    public override string name {
        public get {
            return "aqtitle";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/aqtitledec.c")]
    public override string long_name {
        public get {
            return "AQTitle subtitles";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/aqtitledec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (AQTitleDemuxerPrivateData);

        }

    }

    [CCode (cname="aqt_probe",cheader_filename="subprojects/ffmpeg/libavformat/aqtitledec.c")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="aqt_read_header",cheader_filename="subprojects/ffmpeg/libavformat/aqtitledec.c")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="aqt_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/aqtitledec.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="aqt_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/aqtitledec.c")]
    public override int read_seek2 (
        AVFormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );

    [CCode (cname="aqt_read_close",cheader_filename="subprojects/ffmpeg/libavformat/aqtitledec.c")]
    public override int read_close (
        AVFormatContext format_context
    );

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/aqtitledec.c")]
    public override string extensions {
        public get {
            return "aqt";

        }

    }
    //  .priv_class = aqt_class;
}

} // namespace LibAVFormat
