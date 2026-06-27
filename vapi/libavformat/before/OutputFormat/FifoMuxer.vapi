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

[CCode (cname="fifo_muxer_class",cheader_filename="subprojects/ffmpeg/libavformat/fifo.c")]
public class FifoMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/fifo.c")]
    public override string class_name {
        public get {
            return "Fifo muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/fifo.c")]
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
                new LibAVUtil.StringOption () {
                    name = "fifo_format",
                    short_help_text = "Target muxer",
                    offset = offsetof (
                        FifoContext,
                        format
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "queue_size",
                    short_help_text = "Size of fifo queue",
                    offset = offsetof (
                        FifoContext,
                        queue_size
                    ),
                    default_value = FIFO_DEFAULT_QUEUE_SIZE,
                    minimum_value = 1,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "format_opts",
                    short_help_text = "Options to be passed to underlying muxer",
                    offset = offsetof (
                        FifoContext,
                        format_options_str
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "drop_pkts_on_overflow",
                    short_help_text = "Drop packets on fifo queue overflow not to block encoder",
                    offset = offsetof (
                        FifoContext,
                        drop_pkts_on_overflow
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "restart_with_keyframe",
                    short_help_text = "Wait for keyframe when restarting output",
                    offset = offsetof (
                        FifoContext,
                        restart_with_keyframe
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "attempt_recovery",
                    short_help_text = "Attempt recovery in case of failure",
                    offset = offsetof (
                        FifoContext,
                        attempt_recovery
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "max_recovery_attempts",
                    short_help_text = "Maximal number of recovery attempts",
                    offset = offsetof (
                        FifoContext,
                        max_recovery_attempts
                    ),
                    default_value = FIFO_DEFAULT_MAX_RECOVERY_ATTEMPTS,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.DurationOption () {
                    name = "recovery_wait_time",
                    short_help_text = "Waiting time between recovery attempts",
                    offset = offsetof (
                        FifoContext,
                        recovery_wait_time
                    ),
                    default_value = FIFO_DEFAULT_RECOVERY_WAIT_TIME_USEC,
                    minimum_value = 0,
                    maximum_value = int64.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "recovery_wait_streamtime",
                    short_help_text = "Use stream time instead of real time while waiting for recovery",
                    offset = offsetof (
                        FifoContext,
                        recovery_wait_streamtime
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "recover_any_error",
                    short_help_text = "Attempt recovery regardless of type of the error",
                    offset = offsetof (
                        FifoContext,
                        recover_any_error
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/fifo.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct FifoContext",cheader_filename="subprojects/ffmpeg/libavformat/fifo.c")]
[Compact]
public class FifoMuxerPrivateData { }

[CCode (cname="ff_fifo_muxer",cheader_filename="subprojects/ffmpeg/libavformat/fifo.c")]
public class FifoMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/fifo.c")]
    public override string name {
        public get {
            return "fifo";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/fifo.c")]
    public override string long_name {
        public get {
            return "FIFO queue pseudo-muxer";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/fifo.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FifoMuxerPrivateData);

        }

    }

    [CCode (cname="fifo_init",cheader_filename="subprojects/ffmpeg/libavformat/fifo.c")]
    public override int init (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="fifo_write_header",cheader_filename="subprojects/ffmpeg/libavformat/fifo.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="fifo_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/fifo.c")]
    public override int write_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="fifo_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/fifo.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="fifo_deinit",cheader_filename="subprojects/ffmpeg/libavformat/fifo.c")]
    public override void deinit (
        LibAVFormat.FormatContext format_context
    );
    //  .priv_class = fifo_muxer_class,

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/fifo.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_FILE | AVFormatFlags1.ALLOWS_FLUSH | AVFormatFlags1.ALLOW_NEGATIVE_TIMESTAMPS;

        }

    }
}

} // namespace LibAVFormat
