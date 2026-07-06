/***********************************************************
@copyright 2000, 2001, 2002 Fabrice Bellard
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
@file Options definition for LibAVFormat.FormatContext.
***********************************************************/

[CCode (cname="av_format_context_class",cheader_filename="subprojects/ffmpeg/libavformat/options.c")]
public class AVFormatContextClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/options.c")]
    public override string class_name {
        public get {
            return "LibAVFormat.FormatContext";

        }

    }
    //  .item_name = format_to_name,

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.FlagsOption () {
                    name = "avioflags",
                    short_help_text = "",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        avio_flags
                    ),
                    default_value = DEFAULT,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "avioflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "direct",
                    short_help_text = "reduce buffering",
                    offset = 0,
                    default_value = LibAVFormat.IOOpenFlags.DIRECT,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "avioflags"
                },
                new LibAVUtil.Int64Option () {
                    name = "probesize",
                    short_help_text = "set probing size",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        probesize
                    ),
                    default_value = 5000000,
                    minimum_value = 32,
                    maximum_value = int64.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "formatprobesize",
                    short_help_text = "number of bytes to probe file format",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        format_probesize
                    ),
                    default_value = PROBE_BUF_MAX,
                    minimum_value = 0,
                    maximum_value = (
                        int.MAX - 1
                    ),
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "packetsize",
                    short_help_text = "set packet size",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        packet_size
                    ),
                    default_value = DEFAULT,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.FlagsOption () {
                    name = "fflags",
                    short_help_text = "",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        flags
                    ),
                    default_value = LibAVFormat.FormatFlags.AUTO_BSF,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "fflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "flush_packets",
                    short_help_text = "reduce the latency by flushing out packets immediately",
                    offset = 0,
                    default_value = LibAVFormat.FormatFlags.FLUSH_PACKETS,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "fflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "ignidx",
                    short_help_text = "ignore index",
                    offset = 0,
                    default_value = LibAVFormat.FormatFlags.IGNORE_INDEX,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "fflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "genpts",
                    short_help_text = "generate pts",
                    offset = 0,
                    default_value = LibAVFormat.FormatFlags.GENERATE_MISSING_PTS,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "fflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "nofillin",
                    short_help_text = "do not fill in missing values that can be exactly calculated",
                    offset = 0,
                    default_value = LibAVFormat.FormatFlags.DO_NOT_INFER,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "fflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "noparse",
                    short_help_text = "disable AVParsers, this needs nofillin too",
                    offset = 0,
                    default_value = LibAVFormat.FormatFlags.DO_NOT_PARSE,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "fflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "igndts",
                    short_help_text = "ignore dts",
                    offset = 0,
                    default_value = LibAVFormat.FormatFlags.IGNORE_DTS,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "fflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "discardcorrupt",
                    short_help_text = "discard corrupted frames",
                    offset = 0,
                    default_value = LibAVFormat.FormatFlags.DISCARD_CORRUPT,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "fflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "sortdts",
                    short_help_text = "try to interleave outputted packets by dts",
                    offset = 0,
                    default_value = LibAVFormat.FormatFlags.SORT_DTS,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "fflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "fastseek",
                    short_help_text = "fast but inaccurate seeks",
                    offset = 0,
                    default_value = LibAVFormat.FormatFlags.FAST_SEEK,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "fflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "nobuffer",
                    short_help_text = "reduce the latency introduced by optional buffering",
                    offset = 0,
                    default_value = LibAVFormat.FormatFlags.DO_NOT_BUFFER,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "fflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "bitexact",
                    short_help_text = "do not write random/volatile data",
                    offset = 0,
                    default_value = LibAVFormat.FormatFlags.BIT_EXACT,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "fflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "shortest",
                    short_help_text = "stop muxing with the shortest stream",
                    offset = 0,
                    default_value = LibAVFormat.FormatFlags.SHORTEST,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "fflags"
                },
                new LibAVUtil.ConstOption () {
                    name = "autobsf",
                    short_help_text = "add needed bsfs automatically",
                    offset = 0,
                    default_value = LibAVFormat.FormatFlags.AUTO_BSF,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "fflags"
                },
                new LibAVUtil.BoolOption () {
                    name = "seek2any",
                    short_help_text = "allow seeking to non-keyframes on demuxer level when supported",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        seek2any
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.Int64Option () {
                    name = "analyzeduration",
                    short_help_text = "specify how many microseconds are analyzed to probe the input",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        max_analyze_duration
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int64.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.BinaryOption () {
                    name = "cryptokey",
                    short_help_text = "decryption key",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        key
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "indexmem",
                    short_help_text = "max memory used for timestamp index (per stream)",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        max_index_size
                    ),
                    default_value = (
                        1 << 20
                    ),
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "rtbufsize",
                    short_help_text = "max memory used for buffering real-time frames",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        max_picture_buffer
                    ),
                    default_value = 3041280,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                }, /* defaults to 1s of 15fps 352x288 YUYV422 video */
                new LibAVUtil.FlagsOption () {
                    name = "fdebug",
                    short_help_text = "print specific debug info",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        debug
                    ),
                    default_value = DEFAULT,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "fdebug"
                },
                new LibAVUtil.ConstOption () {
                    name = "ts",
                    short_help_text = "",
                    offset = 0,
                    default_value = LibAVFormat.FormatDebugFlags.TS,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "fdebug"
                },
                new LibAVUtil.IntOption () {
                    name = "max_delay",
                    short_help_text = "maximum muxing or demuxing delay in microseconds",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        max_delay
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.Int64Option () {
                    name = "start_time_realtime",
                    short_help_text = "wall-clock time when stream begins (PTS==0)",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        start_time_realtime
                    ),
                    default_value = AV_NOPTS_VALUE,
                    minimum_value = int64.MIN,
                    maximum_value = int64.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "fpsprobesize",
                    short_help_text = "number of frames used to probe fps",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        fps_probe_size
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = (
                        int.MAX - 1
                    ),
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "audio_preload",
                    short_help_text = "microseconds by which audio packets should be interleaved earlier",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        audio_preload
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = (
                        int.MAX - 1
                    ),
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "chunk_duration",
                    short_help_text = "microseconds for each chunk",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        max_chunk_duration
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = (
                        int.MAX - 1
                    ),
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "chunk_size",
                    short_help_text = "size in bytes for each chunk",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        max_chunk_size
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = (
                        int.MAX - 1
                    ),
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                /***********************************************************
                this is a crutch for avconv, since it cannot deal with identically named options in different contexts.
                to be removed when avconv is fixed
                ***********************************************************/
                new LibAVUtil.FlagsOption () {
                    name = "f_err_detect",
                    short_help_text = "set error detection flags (deprecated; use err_detect, save via avconv)",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        error_recognition
                    ),
                    default_value = ErrorRecognitionFlags.CRC_CHECK,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "err_detect"
                },
                new LibAVUtil.FlagsOption () {
                    name = "err_detect",
                    short_help_text = "set error detection flags",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        error_recognition
                    ),
                    default_value = ErrorRecognitionFlags.CRC_CHECK,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "err_detect"
                },
                new LibAVUtil.ConstOption () {
                    name = "crccheck",
                    short_help_text = "verify embedded CRCs",
                    offset = 0,
                    default_value = ErrorRecognitionFlags.CRC_CHECK,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "err_detect"
                },
                new LibAVUtil.ConstOption () {
                    name = "bitstream",
                    short_help_text = "detect bitstream specification deviations",
                    offset = 0,
                    default_value = ErrorRecognitionFlags.BITSTREAM,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "err_detect"
                },
                new LibAVUtil.ConstOption () {
                    name = "buffer",
                    short_help_text = "detect improper bitstream length",
                    offset = 0,
                    default_value = ErrorRecognitionFlags.BUFFER,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "err_detect"
                },
                new LibAVUtil.ConstOption () {
                    name = "explode",
                    short_help_text = "abort decoding on minor error detection",
                    offset = 0,
                    default_value = ErrorRecognitionFlags.EXPLODE,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "err_detect"
                },
                new LibAVUtil.ConstOption () {
                    name = "ignore_err",
                    short_help_text = "ignore errors",
                    offset = 0,
                    default_value = ErrorRecognitionFlags.IGNORE_ERRORS,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "err_detect"
                },
                new LibAVUtil.ConstOption () {
                    name = "careful",
                    short_help_text = "consider things that violate the spec, are fast to check and have not been seen in the wild as errors",
                    offset = 0,
                    default_value = ErrorRecognitionFlags.CAREFUL,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "err_detect"
                },
                new LibAVUtil.ConstOption () {
                    name = "compliant",
                    short_help_text = "consider all spec non compliancies as errors",
                    offset = 0,
                    default_value = ErrorRecognitionFlags.COMPLIANT,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "err_detect"
                },
                new LibAVUtil.ConstOption () {
                    name = "aggressive",
                    short_help_text = "consider things that a sane encoder shouldn't do as an error",
                    offset = 0,
                    default_value = ErrorRecognitionFlags.AGGRESSIVE,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM,
                    unit = "err_detect"
                },
                new LibAVUtil.BoolOption () {
                    name = "use_wallclock_as_timestamps",
                    short_help_text = "use wallclock as timestamps",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        use_wallclock_as_timestamps
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.Int64Option () {
                    name = "skip_initial_bytes",
                    short_help_text = "set number of bytes to skip before reading header and frames",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        skip_initial_bytes
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = (
                        int64.MAX - 1
                    ),
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "correct_ts_overflow",
                    short_help_text = "correct single timestamp overflows",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        correct_ts_overflow
                    ),
                    default_value = 1,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "flush_packets",
                    short_help_text = "enable flushing of the I/O context after each packet",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        flush_packets
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "metadata_header_padding",
                    short_help_text = "set number of bytes to be written as padding in a metadata header",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        metadata_header_padding
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.DurationOption () {
                    name = "output_ts_offset",
                    short_help_text = "set output timestamp offset",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        output_ts_offset
                    ),
                    default_value = 0,
                    minimum_value = -int64.MAX,
                    maximum_value = int64.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.Int64Option () {
                    name = "max_interleave_delta",
                    short_help_text = "maximum buffering duration for interleaving",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        max_interleave_delta
                    ),
                    default_value = 10000000,
                    minimum_value = 0,
                    maximum_value = int64.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "f_strict",
                    short_help_text = "how strictly to follow the standards (deprecated; use strict, save via avconv)",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        strict_std_compliance
                    ),
                    default_value = DEFAULT,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "strict"
                },
                new LibAVUtil.IntOption () {
                    name = "strict",
                    short_help_text = "how strictly to follow the standards",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        strict_std_compliance
                    ),
                    default_value = DEFAULT,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "strict"
                },
                new LibAVUtil.ConstOption () {
                    name = "very",
                    short_help_text = "strictly conform to a older more strict version of the spec or reference software",
                    offset = 0,
                    default_value = StrictStandardsCompliance.VERY_STRICT,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "strict"
                },
                new LibAVUtil.ConstOption () {
                    name = "strict",
                    short_help_text = "strictly conform to all the things in the spec no matter what the consequences",
                    offset = 0,
                    default_value = StrictStandardsCompliance.STRICT,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "strict"
                },
                new LibAVUtil.ConstOption () {
                    name = "normal",
                    short_help_text = "",
                    offset = 0,
                    default_value = StrictStandardsCompliance.NORMAL,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "strict"
                },
                new LibAVUtil.ConstOption () {
                    name = "unofficial",
                    short_help_text = "allow unofficial extensions",
                    offset = 0,
                    default_value = StrictStandardsCompliance.UNOFFICIAL,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "strict"
                },
                new LibAVUtil.ConstOption () {
                    name = "experimental",
                    short_help_text = "allow non-standardized experimental variants",
                    offset = 0,
                    default_value = StrictStandardsCompliance.EXPERIMENTAL,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "strict"
                },
                new LibAVUtil.IntOption () {
                    name = "max_ts_probe",
                    short_help_text = "maximum number of packets to read while waiting for the first timestamp",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        max_ts_probe
                    ),
                    default_value = 50,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "avoid_negative_ts",
                    short_help_text = "shift timestamps so they start at 0",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        avoid_negative_ts
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = 2,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "avoid_negative_ts"
                },
                new LibAVUtil.ConstOption () {
                    name = "auto",
                    short_help_text = "enabled when required by target format",
                    offset = 0,
                    default_value = LibAVFormat.FormatAvoidNegativeTimestampFlags.AUTO,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "avoid_negative_ts"
                },
                new LibAVUtil.ConstOption () {
                    name = "disabled",
                    short_help_text = "do not change timestamps",
                    offset = 0,
                    default_value = 0,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "avoid_negative_ts"
                },
                new LibAVUtil.ConstOption () {
                    name = "make_non_negative",
                    short_help_text = "shift timestamps so they are non negative",
                    offset = 0,
                    default_value = LibAVFormat.FormatAvoidNegativeTimestampFlags.MAKE_NON_NEGATIVE,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "avoid_negative_ts"
                },
                new LibAVUtil.ConstOption () {
                    name = "make_zero",
                    short_help_text = "shift timestamps so they start at 0",
                    offset = 0,
                    default_value = LibAVFormat.FormatAvoidNegativeTimestampFlags.MAKE_ZERO,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    ),
                    unit = "avoid_negative_ts"
                },
                new LibAVUtil.StringOption () {
                    name = "dump_separator",
                    short_help_text = "set information dump field separator",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        dump_separator
                    ),
                    default_value = ", ",
                    minimum_value = char.MIN,
                    maximum_value = char.MAX,
                    option_flags = (
                        LibAVUtil.OptionFlags.DECODING_PARAM |
                        LibAVUtil.OptionFlags.ENCODING_PARAM
                    )
                },
                new LibAVUtil.StringOption () {
                    name = "codec_whitelist",
                    short_help_text = "List of decoders that are allowed to be used",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        codec_whitelist
                    ),
                    default_value = "",
                    minimum_value = char.MIN,
                    maximum_value = char.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "format_whitelist",
                    short_help_text = "List of demuxers that are allowed to be used",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        format_whitelist
                    ),
                    default_value = "",
                    minimum_value = char.MIN,
                    maximum_value = char.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "protocol_whitelist",
                    short_help_text = "List of protocols that are allowed to be used",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        protocol_whitelist
                    ),
                    default_value = "",
                    minimum_value = char.MIN,
                    maximum_value = char.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "protocol_blacklist",
                    short_help_text = "List of protocols that are not allowed to be used",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        protocol_blacklist
                    ),
                    default_value = "",
                    minimum_value = char.MIN,
                    maximum_value = char.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "max_streams",
                    short_help_text = "maximum number of streams",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        max_streams
                    ),
                    default_value = 1000,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "skip_estimate_duration_from_pts",
                    short_help_text = "skip duration calculation in estimate_timings_from_pts",
                    offset = offsetof (
                        LibAVFormat.FormatContext,
                        skip_estimate_duration_from_pts
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/options.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }

    [CCode (cname="format_child_next",cheader_filename="subprojects/ffmpeg/libavformat/options.c")]
    public override void *child_next (
        void *obj,
        void *prev
    );

    [CCode (cname="format_child_class_next",cheader_filename="subprojects/ffmpeg/libavformat/options.c")]
    public override LibAVUtil.Log.Class child_class_next (
        LibAVUtil.Log.Class prev
    );
    //  .category = LibAVUtil.Log.ClassCategory.MUXER,

    [CCode (cname="get_category",cheader_filename="subprojects/ffmpeg/libavformat/options.c")]
    public override LibAVUtil.Log.ClassCategory get_category (
        void *class_context
    );

}

} // namespace LibAVFormat
