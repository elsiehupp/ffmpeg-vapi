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

//  #define OFFSET(x) offsetof(FailingMuxerContext, x)
//  static const LibAVUtil.Option options[] = {
//          {"write_header_ret", "write_header() return value", OFFSET(write_header_ret),
//           AV_OPT_TYPE_INT, {.i64 = 0}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM},
//          {"write_trailer_ret", "write_trailer() return value", OFFSET(write_trailer_ret),
//           AV_OPT_TYPE_INT, {.i64 = 0}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM},
//          {"print_deinit_summary", "print summary when deinitializing muxer", OFFSET(print_deinit_summary),
//           AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},
//          {NULL}
//      }

[CCode (cname="failing_muxer_class", cheader_filename="")]
public class FifoTestMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "Fifo test muxer";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="struct FailingMuxerContext", cheader_filename="")]
public struct FifoTestMuxerPrivateData { }

[CCode (cname="ff_fifo_test_muxer", cheader_filename="")]
public class FifoTestMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "fifo_test";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Fifo test muxer";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FifoTestMuxerPrivateData);
        }
    }

    [CCode (cname="failing_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="failing_write_packet", cheader_filename="")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="failing_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="failing_deinit", cheader_filename="")]
    public override void deinit (
        AVFormatContext format_context
    );
    //  .priv_class = failing_muxer_class,
    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOFILE | AVFMT_ALLOW_FLUSH;
        }
    }
}

} // namespace LibAVFormat
