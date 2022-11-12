/***********************************************************
FIFO pseudo-muxer
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
along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVFormat {

//  #define OFFSET(x) offsetof(FifoContext, x)
//  static const LibAVUtil.Option options[] = {
//      {"fifo_format", "Target muxer", OFFSET(format),
//          AV_OPT_TYPE_STRING, {.str = NULL}, 0, 0, AV_OPT_FLAG_ENCODING_PARAM},

//      {"queue_size", "Size of fifo queue", OFFSET(queue_size),
//          AV_OPT_TYPE_INT, {.i64 = FIFO_DEFAULT_QUEUE_SIZE}, 1, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM},

//      {"format_opts", "Options to be passed to underlying muxer", OFFSET(format_options_str),
//          AV_OPT_TYPE_STRING, {.str = NULL}, 0, 0, AV_OPT_FLAG_ENCODING_PARAM},

//      {"drop_pkts_on_overflow", "Drop packets on fifo queue overflow not to block encoder", OFFSET(drop_pkts_on_overflow),
//          AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},

//      {"restart_with_keyframe", "Wait for keyframe when restarting output", OFFSET(restart_with_keyframe),
//          AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},

//      {"attempt_recovery", "Attempt recovery in case of failure", OFFSET(attempt_recovery),
//      AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},

//      {"max_recovery_attempts", "Maximal number of recovery attempts", OFFSET(max_recovery_attempts),
//          AV_OPT_TYPE_INT, {.i64 = FIFO_DEFAULT_MAX_RECOVERY_ATTEMPTS}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM},

//      {"recovery_wait_time", "Waiting time between recovery attempts", OFFSET(recovery_wait_time),
//          AV_OPT_TYPE_DURATION, {.i64 = FIFO_DEFAULT_RECOVERY_WAIT_TIME_USEC}, 0, INT64_MAX, AV_OPT_FLAG_ENCODING_PARAM},

//      {"recovery_wait_streamtime", "Use stream time instead of real time while waiting for recovery",
//          OFFSET(recovery_wait_streamtime), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},

//      {"recover_any_error", "Attempt recovery regardless of type of the error", OFFSET(recover_any_error),
//          AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},

//          {NULL},
//  }

[CCode (cname="fifo_muxer_class", cheader_filename="")]
public class FifoMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "Fifo muxer";
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

[CCode (cname="struct FifoContext", cheader_filename="")]
public struct FifoMuxerPrivateData { }

[CCode (cname="ff_fifo_muxer", cheader_filename="")]
public class FifoMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "fifo";
        }
    }
    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "FIFO queue pseudo-muxer";
        }
    }
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FifoMuxerPrivateData);
        }
    }
    [CCode (cname="fifo_init", cheader_filename="")]
    public override int init (
        AVFormatContext format_context
    );
    [CCode (cname="fifo_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="fifo_write_packet", cheader_filename="")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="fifo_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="fifo_deinit", cheader_filename="")]
    public override void deinit (
        AVFormatContext format_context
    );
    //  .priv_class = fifo_muxer_class,
    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOFILE | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE;
        }
    }
}

} // namespace LibAVFormat
