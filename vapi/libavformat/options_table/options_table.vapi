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

//  #define offsetof (AVFormatContext, x) offsetof (AVFormatContext,x)
/***********************************************************
should be NAN but it does not work as it is not a constant
in glibc as required by ANSI/ISO C
these names are too long to be readable
***********************************************************/
//  #define DEFAULT 0

[CCode (cname="avformat_options",cheader_filename="subprojects/ffmpeg/libformat/options_table.h")]
public const LibAVUtil.Option avformat_options[] = {
    new LibAVUtil.FlagsOption () {
        name = "avioflags",
        NULL,
        offsetof (
            AVFormatContext,
            avio_flags
        ),
        {
            .i64 = DEFAULT
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "avioflags"
    },
    new LibAVUtil.ConstOption () {
        name = "direct",
        short_help_text = "reduce buffering",
        0,
        {
            .i64 = AVIO_FLAG_DIRECT
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "avioflags"
    },
    new LibAVUtil.Int64Option () {
        name = "probesize",
        short_help_text = "set probing size",
        offsetof (
            AVFormatContext,
            probesize
        ),
        {
            .i64 = 5000000
        },
        32,
        int64.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "formatprobesize",
        short_help_text = "number of bytes to probe file format",
        offsetof (
            AVFormatContext,
            format_probesize
        ),
        {
            .i64 = PROBE_BUF_MAX
        },
        0,
        int.MAX - 1,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "packetsize",
        short_help_text = "set packet size",
        offsetof (
            AVFormatContext,
            packet_size
        ),
        {
            .i64 = DEFAULT
        },
        0,
        int.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.FlagsOption () {
        name = "fflags",
        NULL,
        offsetof (
            AVFormatContext,
            flags
        ),
        {
            .i64 = AVFMT_FLAG_AUTO_BSF
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "fflags"
    },
    new LibAVUtil.ConstOption () {
        name = "flush_packets",
        short_help_text = "reduce the latency by flushing out packets immediately",
        0,
        {
            .i64 = AVFMT_FLAG_FLUSH_PACKETS
        },
        int.MIN,
        int.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "fflags"
    },
    new LibAVUtil.ConstOption () {
        name = "ignidx",
        short_help_text = "ignore index",
        0,
        {
            .i64 = AVFMT_FLAG_IGNIDX
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "fflags"
    },
    new LibAVUtil.ConstOption () {
        name = "genpts",
        short_help_text = "generate pts",
        0,
        {
            .i64 = AVFMT_FLAG_GENPTS
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "fflags"
    },
    new LibAVUtil.ConstOption () {
        name = "nofillin",
        short_help_text = "do not fill in missing values that can be exactly calculated",
        0,
        {
            .i64 = AVFMT_FLAG_NOFILLIN
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "fflags"
    },
    new LibAVUtil.ConstOption () {
        name = "noparse",
        short_help_text = "disable AVParsers, this needs nofillin too",
        0,
        {
            .i64 = AVFMT_FLAG_NOPARSE
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "fflags"
    },
    new LibAVUtil.ConstOption () {
        name = "igndts",
        short_help_text = "ignore dts",
        0,
        {
            .i64 = AVFMT_FLAG_IGNDTS
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "fflags"
    },
    new LibAVUtil.ConstOption () {
        name = "discardcorrupt",
        short_help_text = "discard corrupted frames",
        0,
        {
            .i64 = AVFMT_FLAG_DISCARD_CORRUPT
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "fflags"
    },
    new LibAVUtil.ConstOption () {
        name = "sortdts",
        short_help_text = "try to interleave outputted packets by dts",
        0,
        {
            .i64 = AVFMT_FLAG_SORT_DTS
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "fflags"
    },
#if FF_API_LAVF_KEEPSIDE_FLAG
    new LibAVUtil.ConstOption () {
        name = "keepside",
        short_help_text = "deprecated, does nothing",
        0,
        {
            .i64 = AVFMT_FLAG_KEEP_SIDE_DATA
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "fflags"
    },
#endif

    new LibAVUtil.ConstOption () {
        name = "fastseek",
        short_help_text = "fast but inaccurate seeks",
        0,
        {
            .i64 = AVFMT_FLAG_FAST_SEEK
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "fflags"
    },
#if FF_API_LAVF_MP4A_LATM
    new LibAVUtil.ConstOption () {
        name = "latm",
        short_help_text = "deprecated, does nothing",
        0,
        {
            .i64 = AVFMT_FLAG_MP4A_LATM
        },
        int.MIN,
        int.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "fflags"
    },
#endif

    new LibAVUtil.ConstOption () {
        name = "nobuffer",
        short_help_text = "reduce the latency introduced by optional buffering",
        0,
        {
            .i64 = AVFMT_FLAG_NOBUFFER
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "fflags"
    },
    new LibAVUtil.ConstOption () {
        name = "bitexact",
        short_help_text = "do not write random/volatile data",
        0,
        {
            .i64 = AVFMT_FLAG_BITEXACT
        },
        0,
        0,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "fflags"
    },
    new LibAVUtil.ConstOption () {
        name = "shortest",
        short_help_text = "stop muxing with the shortest stream",
        0,
        {
            .i64 = AVFMT_FLAG_SHORTEST
        },
        0,
        0,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "fflags"
    },
    new LibAVUtil.ConstOption () {
        name = "autobsf",
        short_help_text = "add needed bsfs automatically",
        0,
        {
            .i64 = AVFMT_FLAG_AUTO_BSF
        },
        0,
        0,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "fflags"
    },
    new LibAVUtil.BoolOption () {
        name = "seek2any",
        short_help_text = "allow seeking to non-keyframes on demuxer level when supported",
        offsetof (
            AVFormatContext,
            seek2any
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.Int64Option () {
        name = "analyzeduration",
        short_help_text = "specify how many microseconds are analyzed to probe the input",
        offsetof (
            AVFormatContext,
            max_analyze_duration
        ),
        {
            .i64 = 0
        },
        0,
        int64.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.BinaryOption () {
        name = "cryptokey",
        short_help_text = "decryption key",
        offsetof (
            AVFormatContext,
            key
        ),
        {
            .dbl = 0
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "indexmem",
        short_help_text = "max memory used for timestamp index (per stream)",
        offsetof (
            AVFormatContext,
            max_index_size
        ),
        {
            .i64 = 1<<20
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "rtbufsize",
        short_help_text = "max memory used for buffering real-time frames",
        offsetof (
            AVFormatContext,
            max_picture_buffer
        ),
        {
            .i64 = 3041280
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    }, /* defaults to 1s of 15fps 352x288 YUYV422 video */
    new LibAVUtil.FlagsOption () {
        name = "fdebug",
        short_help_text = "print specific debug info",
        offsetof (
            AVFormatContext,
            debug
        ),
        {
            .i64 = DEFAULT
        },
        0,
        int.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "fdebug"
    },
    new LibAVUtil.ConstOption () {
        name = "ts",
        NULL,
        0,
        {
            .i64 = FF_FDEBUG_TS
        },
        int.MIN,
        int.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "fdebug"
    },
    new LibAVUtil.IntOption () {
        name = "max_delay",
        short_help_text = "maximum muxing or demuxing delay in microseconds",
        offsetof (
            AVFormatContext,
            max_delay
        ),
        {
            .i64 = -1
        },
        -1,
        int.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.Int64Option () {
        name = "start_time_realtime",
        short_help_text = "wall-clock time when stream begins (PTS==0)",
        offsetof (
            AVFormatContext,
            start_time_realtime
        ),
        {
            .i64 = AV_NOPTS_VALUE
        },
        int64.MIN,
        int64.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.IntOption () {
        name = "fpsprobesize",
        short_help_text = "number of frames used to probe fps",
        offsetof (
            AVFormatContext,
            fps_probe_size
        ),
        {
            .i64 = -1
        },
        -1,
        int.MAX - 1,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "audio_preload",
        short_help_text = "microseconds by which audio packets should be interleaved earlier",
        offsetof (
            AVFormatContext,
            audio_preload
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX - 1,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.IntOption () {
        name = "chunk_duration",
        short_help_text = "microseconds for each chunk",
        offsetof (
            AVFormatContext,
            max_chunk_duration
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX - 1,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.IntOption () {
        name = "chunk_size",
        short_help_text = "size in bytes for each chunk",
        offsetof (
            AVFormatContext,
            max_chunk_size
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX - 1,
        .flags = (
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
        offsetof (
            AVFormatContext,
            error_recognition
        ),
        {
            .i64 = AV_EF_CRCCHECK
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "err_detect"
    },
    new LibAVUtil.FlagsOption () {
        name = "err_detect",
        short_help_text = "set error detection flags",
        offsetof (
            AVFormatContext,
            error_recognition
        ),
        {
            .i64 = AV_EF_CRCCHECK
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "err_detect"
    },
    new LibAVUtil.ConstOption () {
        name = "crccheck",
        short_help_text = "verify embedded CRCs",
        0,
        {
            .i64 = AV_EF_CRCCHECK
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "err_detect"
    },
    new LibAVUtil.ConstOption () {
        name = "bitstream",
        short_help_text = "detect bitstream specification deviations",
        0,
        {
            .i64 = AV_EF_BITSTREAM
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "err_detect"
    },
    new LibAVUtil.ConstOption () {
        name = "buffer",
        short_help_text = "detect improper bitstream length",
        0,
        {
            .i64 = AV_EF_BUFFER
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "err_detect"
    },
    new LibAVUtil.ConstOption () {
        name = "explode",
        short_help_text = "abort decoding on minor error detection",
        0,
        {
            .i64 = AV_EF_EXPLODE
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "err_detect"
    },
    new LibAVUtil.ConstOption () {
        name = "ignore_err",
        short_help_text = "ignore errors",
        0,
        {
            .i64 = AV_EF_IGNORE_ERR
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "err_detect"
    },
    new LibAVUtil.ConstOption () {
        name = "careful",
        short_help_text = "consider things that violate the spec, are fast to check and have not been seen in the wild as errors",
        0,
        {
            .i64 = AV_EF_CAREFUL
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "err_detect"
    },
    new LibAVUtil.ConstOption () {
        name = "compliant",
        short_help_text = "consider all spec non compliancies as errors",
        0,
        {
            .i64 = AV_EF_COMPLIANT
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "err_detect"
    },
    new LibAVUtil.ConstOption () {
        name = "aggressive",
        short_help_text = "consider things that a sane encoder shouldn't do as an error",
        0,
        {
            .i64 = AV_EF_AGGRESSIVE
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM,
        "err_detect"
    },
    new LibAVUtil.BoolOption () {
        name = "use_wallclock_as_timestamps",
        short_help_text = "use wallclock as timestamps",
        offsetof (
            AVFormatContext,
            use_wallclock_as_timestamps
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.Int64Option () {
        name = "skip_initial_bytes",
        short_help_text = "set number of bytes to skip before reading header and frames",
        offsetof (
            AVFormatContext,
            skip_initial_bytes
        ),
        {
            .i64 = 0
        },
        0,
        int64.MAX - 1,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "correct_ts_overflow",
        short_help_text = "correct single timestamp overflows",
        offsetof (
            AVFormatContext,
            correct_ts_overflow
        ),
        {
            .i64 = 1
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "flush_packets",
        short_help_text = "enable flushing of the I/O context after each packet",
        offsetof (
            AVFormatContext,
            flush_packets
        ),
        {
            .i64 = -1
        },
        -1,
        1,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.IntOption () {
        name = "metadata_header_padding",
        short_help_text = "set number of bytes to be written as padding in a metadata header",
        offsetof (
            AVFormatContext,
            metadata_header_padding
        ),
        {
            .i64 = -1
        },
        -1,
        int.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.DurationOption () {
        name = "output_ts_offset",
        short_help_text = "set output timestamp offset",
        offsetof (
            AVFormatContext,
            output_ts_offset
        ),
        {
            .i64 = 0
        },
        -int64.MAX,
        int64.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.Int64Option () {
        name = "max_interleave_delta",
        short_help_text = "maximum buffering duration for interleaving",
        offsetof (
            AVFormatContext,
            max_interleave_delta
        ),
        {
            .i64 = 10000000
        },
        0,
        int64.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.IntOption () {
        name = "f_strict",
        short_help_text = "how strictly to follow the standards (deprecated; use strict, save via avconv)",
        offsetof (
            AVFormatContext,
            strict_std_compliance
        ),
        {
            .i64 = DEFAULT
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "strict"
    },
    new LibAVUtil.IntOption () {
        name = "strict",
        short_help_text = "how strictly to follow the standards",
        offsetof (
            AVFormatContext,
            strict_std_compliance
        ),
        {
            .i64 = DEFAULT
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "strict"
    },
    new LibAVUtil.ConstOption () {
        name = "very",
        short_help_text = "strictly conform to a older more strict version of the spec or reference software",
        0,
        {
            .i64 = FF_COMPLIANCE_VERY_STRICT
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "strict"
    },
    new LibAVUtil.ConstOption () {
        name = "strict",
        short_help_text = "strictly conform to all the things in the spec no matter what the consequences",
        0,
        {
            .i64 = FF_COMPLIANCE_STRICT
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "strict"
    },
    new LibAVUtil.ConstOption () {
        name = "normal",
        NULL,
        0,
        {
            .i64 = FF_COMPLIANCE_NORMAL
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "strict"
    },
    new LibAVUtil.ConstOption () {
        name = "unofficial",
        short_help_text = "allow unofficial extensions",
        0,
        {
            .i64 = FF_COMPLIANCE_UNOFFICIAL
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "strict"
    },
    new LibAVUtil.ConstOption () {
        name = "experimental",
        short_help_text = "allow non-standardized experimental variants",
        0,
        {
            .i64 = FF_COMPLIANCE_EXPERIMENTAL
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "strict"
    },
    new LibAVUtil.IntOption () {
        name = "max_ts_probe",
        short_help_text = "maximum number of packets to read while waiting for the first timestamp",
        offsetof (
            AVFormatContext,
            max_ts_probe
        ),
        {
            .i64 = 50
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "avoid_negative_ts",
        short_help_text = "shift timestamps so they start at 0",
        offsetof (
            AVFormatContext,
            avoid_negative_ts
        ),
        {
            .i64 = -1
        },
        -1,
        2,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "avoid_negative_ts"
    },
    new LibAVUtil.ConstOption () {
        name = "auto",
        short_help_text = "enabled when required by target format",
        0,
        {
            .i64 = AVFMT_AVOID_NEG_TS_AUTO
        },
        int.MIN,
        int.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "avoid_negative_ts"
    },
    new LibAVUtil.ConstOption () {
        name = "disabled",
        short_help_text = "do not change timestamps",
        0,
        {
            .i64 = 0
        },
        int.MIN,
        int.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "avoid_negative_ts"
    },
    new LibAVUtil.ConstOption () {
        name = "make_non_negative",
        short_help_text = "shift timestamps so they are non negative",
        0,
        {
            .i64 = AVFMT_AVOID_NEG_TS_MAKE_NON_NEGATIVE
        },
        int.MIN,
        int.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "avoid_negative_ts"
    },
    new LibAVUtil.ConstOption () {
        name = "make_zero",
        short_help_text = "shift timestamps so they start at 0",
        0,
        {
            .i64 = AVFMT_AVOID_NEG_TS_MAKE_ZERO
        },
        int.MIN,
        int.MAX,
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        ),
        "avoid_negative_ts"
    },
    new LibAVUtil.StringOption () {
        name = "dump_separator",
        short_help_text = "set information dump field separator",
        offsetof (
            AVFormatContext,
            dump_separator
        ),
        {
            .str = ", "
        },
        char.MIN,
        char.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM|
        .flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.StringOption () {
        name = "codec_whitelist",
        short_help_text = "List of decoders that are allowed to be used",
        offsetof (
            AVFormatContext,
            codec_whitelist
        ),
        {
            .str = NULL
        },
        char.MIN,
        char.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "format_whitelist",
        short_help_text = "List of demuxers that are allowed to be used",
        offsetof (
            AVFormatContext,
            format_whitelist
        ),
        {
            .str = NULL
        },
        char.MIN,
        char.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "protocol_whitelist",
        short_help_text = "List of protocols that are allowed to be used",
        offsetof (
            AVFormatContext,
            protocol_whitelist
        ),
        {
            .str = NULL
        },
        char.MIN,
        char.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "protocol_blacklist",
        short_help_text = "List of protocols that are not allowed to be used",
        offsetof (
            AVFormatContext,
            protocol_blacklist
        ),
        {
            .str = NULL
        },
        char.MIN,
        char.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "max_streams",
        short_help_text = "maximum number of streams",
        offsetof (
            AVFormatContext,
            max_streams
        ),
        {
            .i64 = 1000
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "skip_estimate_duration_from_pts",
        short_help_text = "skip duration calculation in estimate_timings_from_pts",
        offsetof (
            AVFormatContext,
            skip_estimate_duration_from_pts
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    {
        NULL
    }

}

} // namespace LibAVFormat
