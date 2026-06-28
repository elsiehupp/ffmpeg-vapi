/***********************************************************
@brief SBG (SBaGen) file format decoder
@copyright 2011 Nicolas George
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

[CCode (cname="sbg_demuxer_class",cheader_filename="subprojects/ffmpeg/libavformat/sbgdec.c")]
public class SBGDemuxerClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/sbgdec.c")]
    public override string class_name {
        public get {
            return "sbg_demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/sbgdec.c")]
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
                    name = "sample_rate",
                    short_help_text = "",
                    offset = offsetof (
                        sbg_demuxer,
                        sample_rate
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "frame_size",
                    short_help_text = "",
                    offset = offsetof (
                        sbg_demuxer,
                        frame_size
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "max_file_size",
                    short_help_text = "",
                    offset = offsetof (
                        sbg_demuxer,
                        max_file_size
                    ),
                    default_value = 5000000,
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

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/sbgdec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct sbg_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/sbgdec.c")]
[Compact]
public class SBGDemuxerPrivateData { }

[CCode (cname="ff_sbg_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/sbgdec.c")]
public class SBGDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/sbgdec.c")]
    public override string name {
        public get {
            return "sbg";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/sbgdec.c")]
    public override string long_name {
        public get {
            return "SBaGen binaural beats script";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/sbgdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SBGDemuxerPrivateData);

        }

    }

    [CCode (cname="sbg_read_probe",cheader_filename="subprojects/ffmpeg/libavformat/sbgdec.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="sbg_read_header",cheader_filename="subprojects/ffmpeg/libavformat/sbgdec.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="sbg_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/sbgdec.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="sbg_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/sbgdec.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="sbg_read_seek2",cheader_filename="subprojects/ffmpeg/libavformat/sbgdec.c")]
    public override int read_seek2 (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/sbgdec.c")]
    public override string extensions {
        public get {
            return "sbg";

        }

    }
    //  .priv_class = sbg_demuxer_class;
}

} // namespace LibAVFormat
