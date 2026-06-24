/***********************************************************
@copyright 2012 Nicolas George
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with FFmpeg; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVFormat {

[CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.BoolOption () {
        name = "safe",
        short_help_text = "enable safe mode",
        offset = offsetof (
            ConcatContext,
            safe
        ),
        default_value = 1,
        minimum_value = -1,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "auto_convert",
        short_help_text = "automatically convert bitstream format",
        offset = offsetof (
            ConcatContext,
            auto_convert
        ),
        default_value = 1,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "segment_time_metadata",
        short_help_text = "output file segment start time and duration as packet metadata",
        offset = offsetof (
            ConcatContext,
            segment_time_metadata
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    {
        NULL
    }
}

[CCode (cname="concat_class",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
public class ConcatDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
    public override string class_name {
        public get {
            return "concat demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct ConcatContext",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
[Compact]
public class ConcatDemuxerPrivateData { }

[CCode (cname="ff_concat_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
public class ConcatDemuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
    public override string name {
        public get {
            return "concat";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
    public override string long_name {
        public get {
            return "Virtual concatenation script";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ConcatDemuxerPrivateData);

        }

    }

    [CCode (cname="concat_probe",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="concat_read_header",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="concat_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="concat_read_close",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
    public override int read_close (
        AVFormatContext format_context
    );

    [CCode (cname="concat_seek",cheader_filename="subprojects/ffmpeg/libavformat/concatdec.c")]
    public override int read_seek2 (
        AVFormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );
    //  .priv_class = concat_class;
}

} // namespace LibAVFormat
