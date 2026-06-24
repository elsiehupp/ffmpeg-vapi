/***********************************************************
@brief FIFO test pseudo-muxer
@copyright 2016 Jan Sebechlebsky
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
along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVFormat {

[CCode (cname="options",cheader_filename="")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.IntOption () {
        name = "write_header_ret",
        short_help_text = "write_header () return value",
        offset = offsetof (
            FailingMuxerContext,
            write_header_ret
        ),
        default_value = 0,
        minimum_value = int.MIN,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "write_trailer_ret",
        short_help_text = "write_trailer () return value",
        offset = offsetof (
            FailingMuxerContext,
            write_trailer_ret
        ),
        default_value = 0,
        minimum_value = int.MIN,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "print_deinit_summary",
        short_help_text = "print summary when deinitializing muxer",
        offset = offsetof (
            FailingMuxerContext,
            print_deinit_summary
        ),
        default_value = 1,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="failing_muxer_class",cheader_filename="ffmpeg/libformat/fifo_test.c")]
public class FifoTestMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/fifo_test.c")]
    public override string class_name {
        public get {
            return "Fifo test muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/fifo_test.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/fifo_test.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/fifo_test.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct FailingMuxerContext",cheader_filename="ffmpeg/libformat/fifo_test.c")]
[Compact]
public class FifoTestMuxerPrivateData { }

[CCode (cname="ff_fifo_test_muxer",cheader_filename="ffmpeg/libformat/fifo_test.c")]
public class FifoTestMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/fifo_test.c")]
    public override string name {
        public get {
            return "fifo_test";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/fifo_test.c")]
    public override string long_name {
        public get {
            return "Fifo test muxer";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/fifo_test.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FifoTestMuxerPrivateData);

        }

    }

    [CCode (cname="failing_write_header",cheader_filename="ffmpeg/libformat/fifo_test.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="failing_write_packet",cheader_filename="ffmpeg/libformat/fifo_test.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="failing_write_trailer",cheader_filename="ffmpeg/libformat/fifo_test.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="failing_deinit",cheader_filename="ffmpeg/libformat/fifo_test.c")]
    public override void deinit (
        AVFormatContext format_context
    );
    //  .priv_class = failing_muxer_class,

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/fifo_test.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_FILE | AVFormatFlags1.ALLOWS_FLUSH;

        }

    }
}

} // namespace LibAVFormat
