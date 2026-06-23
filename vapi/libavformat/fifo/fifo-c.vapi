/***********************************************************
@brief FIFO pseudo-muxer
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

[CCode (cname="",cheader_filename="")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.StringOption () {
        name = "fifo_format",
        short_help_text = "Target muxer",
        offsetof (
            FifoContext,
            format
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "queue_size",
        short_help_text = "Size of fifo queue",
        offsetof (
            FifoContext,
            queue_size
        ),
        {
            .i64 = FIFO_DEFAULT_QUEUE_SIZE
        },
        1,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "format_opts",
        short_help_text = "Options to be passed to underlying muxer",
        offsetof (
            FifoContext,
            format_options_str
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "drop_pkts_on_overflow",
        short_help_text = "Drop packets on fifo queue overflow not to block encoder",
        offsetof (
            FifoContext,
            drop_pkts_on_overflow
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "restart_with_keyframe",
        short_help_text = "Wait for keyframe when restarting output",
        offsetof (
            FifoContext,
            restart_with_keyframe
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "attempt_recovery",
        short_help_text = "Attempt recovery in case of failure",
        offsetof (
            FifoContext,
            attempt_recovery
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "max_recovery_attempts",
        short_help_text = "Maximal number of recovery attempts",
        offsetof (
            FifoContext,
            max_recovery_attempts
        ),
        {
            .i64 = FIFO_DEFAULT_MAX_RECOVERY_ATTEMPTS
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.DurationOption () {
        name = "recovery_wait_time",
        short_help_text = "Waiting time between recovery attempts",
        offsetof (
            FifoContext,
            recovery_wait_time
        ),
        {
            .i64 = FIFO_DEFAULT_RECOVERY_WAIT_TIME_USEC
        },
        0,
        int64.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "recovery_wait_streamtime",
        short_help_text = "Use stream time instead of real time while waiting for recovery",
        offsetof (
            FifoContext,
            recovery_wait_streamtime
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "recover_any_error",
        short_help_text = "Attempt recovery regardless of type of the error",
        offsetof (
            FifoContext,
            recover_any_error
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="fifo_muxer_class",cheader_filename="ffmpeg/libformat/fifo.c")]
public class FifoMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/fifo.c")]
    public override string class_name {
        public get {
            return "Fifo muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/fifo.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/fifo.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/fifo.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct FifoContext",cheader_filename="ffmpeg/libformat/fifo.c")]
[Compact]
public class FifoMuxerPrivateData { }

[CCode (cname="ff_fifo_muxer",cheader_filename="ffmpeg/libformat/fifo.c")]
public class FifoMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/fifo.c")]
    public override string name {
        public get {
            return "fifo";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/fifo.c")]
    public override string long_name {
        public get {
            return "FIFO queue pseudo-muxer";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/fifo.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FifoMuxerPrivateData);

        }

    }

    [CCode (cname="fifo_init",cheader_filename="ffmpeg/libformat/fifo.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="fifo_write_header",cheader_filename="ffmpeg/libformat/fifo.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="fifo_write_packet",cheader_filename="ffmpeg/libformat/fifo.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="fifo_write_trailer",cheader_filename="ffmpeg/libformat/fifo.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="fifo_deinit",cheader_filename="ffmpeg/libformat/fifo.c")]
    public override void deinit (
        AVFormatContext format_context
    );
    //  .priv_class = fifo_muxer_class,

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/fifo.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOFILE | AVFMT_ALLOW_FLUSH | AVFMT_TS_NEGATIVE;

        }

    }
}

} // namespace LibAVFormat
