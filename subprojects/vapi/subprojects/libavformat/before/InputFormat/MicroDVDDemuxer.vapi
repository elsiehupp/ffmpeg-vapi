/***********************************************************
@brief MicroDVD subtitle demuxer
@copyright 2010 Aurelien Jacobs <aurel@gnuage.org>
@copyright 2012 Clément Bœsch <u pkh me>
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

[CCode (cname="microdvd_class",cheader_filename="subprojects/ffmpeg/libavformat/microdvddec.c")]
public class MicroDVDDemuxerClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/microdvddec.c")]
    public override string class_name {
        public get {
            return "microdvddec";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/microdvddec.c")]
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
                    short_help_text = "set the movie frame rate fallback",
                    offset = offsetof (
                        MicroDVDContext,
                        frame_rate
                    ),
                    default_value = 0,
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

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/microdvddec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct MicroDVDContext",cheader_filename="subprojects/ffmpeg/libavformat/microdvddec.c")]
[Compact]
public class MicroDVDDemuxerPrivateData { }

[CCode (cname="ff_microdvd_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/microdvddec.c")]
public class MicroDVDDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/microdvddec.c")]
    public override string name {
        public get {
            return "microdvd";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/microdvddec.c")]
    public override string long_name {
        public get {
            return "MicroDVD subtitle format";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/microdvddec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MicroDVDDemuxerPrivateData);

        }

    }

    [CCode (cname="microdvd_probe",cheader_filename="subprojects/ffmpeg/libavformat/microdvddec.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="microdvd_read_header",cheader_filename="subprojects/ffmpeg/libavformat/microdvddec.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="microdvd_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/microdvddec.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="microdvd_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/microdvddec.c")]
    public override int read_seek2 (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );

    [CCode (cname="microdvd_read_close",cheader_filename="subprojects/ffmpeg/libavformat/microdvddec.c")]
    public override int read_close (
        LibAVFormat.FormatContext format_context
    );
    //  .priv_class = microdvd_class;
}

} // namespace LibAVFormat
