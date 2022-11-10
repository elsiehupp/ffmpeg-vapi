/***********************************************************
FIFO test pseudo-muxer
@copyright 2016 Jan Sebechlebsky
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with FFmpeg; if not, write to the Free Software * Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

//  #define OFFSET(x) offsetof(FailingMuxerContext, x)
//  static const AVOption options[] = {
//          {"write_header_ret", "write_header() return value", OFFSET(write_header_ret),
//           AV_OPT_TYPE_INT, {.i64 = 0}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM},
//          {"write_trailer_ret", "write_trailer() return value", OFFSET(write_trailer_ret),
//           AV_OPT_TYPE_INT, {.i64 = 0}, INT_MIN, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM},
//          {"print_deinit_summary", "print summary when deinitializing muxer", OFFSET(print_deinit_summary),
//           AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},
//          {NULL}
//      }

[CCode (cname="failing_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "Fifo test muxer"
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_fifo_test_muxer", cheader="")]
public class FifoTestOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "fifo_test"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "Fifo test muxer"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FailingMuxerContext);
        }
    }
    [CCode (cname="failing_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="failing_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="failing_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="failing_deinit", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    );
    //  .priv_class = failing_muxer_class,
    //  .flags = AVFMT_NOFILE | AVFMT_ALLOW_FLUSH,
}

