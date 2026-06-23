/***********************************************************
@brief Apple HTTP Live Streaming segmenter
@copyright 2012, Luca Barbato
@copyright 2017 Akamai Technologies, Inc.
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

[CCode (cname="",cheader_filename="")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.Int64Option () {
        name = "start_number",
        short_help_text = "set first number in the sequence",
        offsetof (
            HLSContext,
            start_sequence
        ),
        {
            .i64 = 0
        },
        0,
        int64.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.FloatOption () {
        name = "hls_time",
        short_help_text = "set segment length in seconds",
        offsetof (
            HLSContext,
            time
        ),
        {
            .dbl = 2
        },
        0,
        FLT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.FloatOption () {
        name = "hls_init_time",
        short_help_text = "set segment length in seconds at init list",
        offsetof (
            HLSContext,
            init_time
        ),
        {
            .dbl = 0
        },
        0,
        FLT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "hls_list_size",
        short_help_text = "set maximum number of playlist entries",
        offsetof (
            HLSContext,
            max_nb_segments
        ),
        {
            .i64 = 5
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "hls_delete_threshold",
        short_help_text = "set number of unreferenced segments to keep before deleting",
        offsetof (
            HLSContext,
            hls_delete_threshold
        ),
        {
            .i64 = 1
        },
        1,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "hls_ts_options","set hls mpegts list of options for the container format used for hls",
        offsetof (
            HLSContext,
            format_options_str
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "hls_vtt_options","set hls vtt list of options for the container format used for hls",
        offsetof (
            HLSContext,
            vtt_format_options_str
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
#if FF_API_HLS_WRAP
    new LibAVUtil.IntOption () {
        name = "hls_wrap",
        short_help_text = "set number after which the index wraps (will be deprecated)",
        offsetof (
            HLSContext,
            wrap
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
#endif

    new LibAVUtil.IntOption () {
        name = "hls_allow_cache",
        short_help_text = "explicitly set whether the client MAY (1) or MUST NOT (0) cache media segments",
        offsetof (
            HLSContext,
            allowcache
        ),
        {
            .i64 = -1
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "hls_base_url",
        short_help_text = "url to prepend to each playlist entry",
        offsetof (
            HLSContext,
            baseurl
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "hls_segment_filename",
        short_help_text = "filename template for segment files",
        offsetof (
            HLSContext,
            segment_filename
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "hls_segment_size",
        short_help_text = "maximum size per segment file, (in bytes)",
        offsetof (
            HLSContext,
            max_seg_size
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "hls_key_info_file",
        short_help_text = "file with key URI and key file path",
        offsetof (
            HLSContext,
            key_info_file
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "hls_enc",
        short_help_text = "enable AES128 encryption support",
        offsetof (
            HLSContext,
            encrypt
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "hls_enc_key",
        short_help_text = "hex-coded 16 byte key to encrypt the segments",
        offsetof (
            HLSContext,
            key
        ),
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "hls_enc_key_url",
        short_help_text = "url to access the key to decrypt the segments",
        offsetof (
            HLSContext,
            key_url
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "hls_enc_iv",
        short_help_text = "hex-coded 16 byte initialization vector",
        offsetof (
            HLSContext,
            iv
        ),
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "hls_subtitle_path",
        short_help_text = "set path of hls subtitles",
        offsetof (
            HLSContext,
            subtitle_filename
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "hls_segment_type",
        short_help_text = "set hls segment files type",
        offsetof (
            HLSContext,
            segment_type
        ),
        {
            .i64 = SEGMENT_TYPE_MPEGTS
        },
        0,
        SEGMENT_TYPE_FMP4,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "segment_type"
    },
    new LibAVUtil.ConstOption () {
        name = "mpegts",
        short_help_text = "make segment file to mpegts files in m3u8",
        0,
        {
            .i64 = SEGMENT_TYPE_MPEGTS
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "segment_type"
    },
    new LibAVUtil.ConstOption () {
        name = "fmp4",
        short_help_text = "make segment file to fragment mp4 files in m3u8",
        0,
        {
            .i64 = SEGMENT_TYPE_FMP4
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "segment_type"
    },
    new LibAVUtil.StringOption () {
        name = "hls_fmp4_init_filename",
        short_help_text = "set fragment mp4 file init filename",
        offsetof (
            HLSContext,
            fmp4_init_filename
        ),
        {
            .str = "init.mp4"
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.FlagsOption () {
        name = "hls_flags",
        short_help_text = "set flags affecting HLS playlist and media file generation",
        offsetof (
            HLSContext,
            flags
        ),
        {
            .i64 = 0
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
    new LibAVUtil.ConstOption () {
        name = "single_file",
        short_help_text = "generate a single media file indexed with byte ranges",
        0,
        {
            .i64 = HLS_SINGLE_FILE
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
    new LibAVUtil.ConstOption () {
        name = "temp_file",
        short_help_text = "write segment and playlist to temporary file and rename when complete",
        0,
        {
            .i64 = HLS_TEMP_FILE
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
    new LibAVUtil.ConstOption () {
        name = "delete_segments",
        short_help_text = "delete segment files that are no longer part of the playlist",
        0,
        {
            .i64 = HLS_DELETE_SEGMENTS
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
    new LibAVUtil.ConstOption () {
        name = "round_durations",
        short_help_text = "round durations in m3u8 to whole numbers",
        0,
        {
            .i64 = HLS_ROUND_DURATIONS
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
    new LibAVUtil.ConstOption () {
        name = "discont_start",
        short_help_text = "start the playlist with a discontinuity tag",
        0,
        {
            .i64 = HLS_DISCONT_START
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
    new LibAVUtil.ConstOption () {
        name = "omit_endlist",
        short_help_text = "Do not append an endlist when ending stream",
        0,
        {
            .i64 = HLS_OMIT_ENDLIST
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
    new LibAVUtil.ConstOption () {
        name = "split_by_time",
        short_help_text = "split the hls segment by time which user set by hls_time",
        0,
        {
            .i64 = HLS_SPLIT_BY_TIME
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
    new LibAVUtil.ConstOption () {
        name = "append_list",
        short_help_text = "append the new segments into old hls segment list",
        0,
        {
            .i64 = HLS_APPEND_LIST
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
    new LibAVUtil.ConstOption () {
        name = "program_date_time",
        short_help_text = "add EXT-X-PROGRAM-DATE-TIME",
        0,
        {
            .i64 = HLS_PROGRAM_DATE_TIME
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
    new LibAVUtil.ConstOption () {
        name = "second_level_segment_index",
        short_help_text = "include segment index in segment filenames when use_localtime",
        0,
        {
            .i64 = HLS_SECOND_LEVEL_SEGMENT_INDEX
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
    new LibAVUtil.ConstOption () {
        name = "second_level_segment_duration",
        short_help_text = "include segment duration in segment filenames when use_localtime",
        0,
        {
            .i64 = HLS_SECOND_LEVEL_SEGMENT_DURATION
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
    new LibAVUtil.ConstOption () {
        name = "second_level_segment_size",
        short_help_text = "include segment size in segment filenames when use_localtime",
        0,
        {
            .i64 = HLS_SECOND_LEVEL_SEGMENT_SIZE
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
    new LibAVUtil.ConstOption () {
        name = "periodic_rekey",
        short_help_text = "reload keyinfo file periodically for re-keying",
        0,
        {
            .i64 = HLS_PERIODIC_REKEY
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
    new LibAVUtil.ConstOption () {
        name = "independent_segments",
        short_help_text = "add EXT-X-INDEPENDENT-SEGMENTS, whenever applicable",
        0,
        {
            .i64 = HLS_INDEPENDENT_SEGMENTS
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
    new LibAVUtil.ConstOption () {
        name = "iframes_only",
        short_help_text = "add EXT-X-I-FRAMES-ONLY, whenever applicable",
        0,
        {
            .i64 = HLS_I_FRAMES_ONLY
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "flags"
    },
#if FF_API_HLS_USE_LOCALTIME
    new LibAVUtil.BoolOption () {
        name = "use_localtime",
        short_help_text = "set filename expansion with strftime at segment creation (will be deprecated )",
        offsetof (
            HLSContext,
            use_localtime
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
#endif

    new LibAVUtil.BoolOption () {
        name = "strftime",
        short_help_text = "set filename expansion with strftime at segment creation",
        offsetof (
            HLSContext,
            use_localtime
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
#if FF_API_HLS_USE_LOCALTIME
    new LibAVUtil.BoolOption () {
        name = "use_localtime_mkdir",
        short_help_text = "create last directory component in strftime-generated filename (will be deprecated)",
        offsetof (
            HLSContext,
            use_localtime_mkdir
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
#endif

    new LibAVUtil.BoolOption () {
        name = "strftime_mkdir",
        short_help_text = "create last directory component in strftime-generated filename",
        offsetof (
            HLSContext,
            use_localtime_mkdir
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "hls_playlist_type",
        short_help_text = "set the HLS playlist type",
        offsetof (
            HLSContext,
            pl_type
        ),
        {
            .i64 = PLAYLIST_TYPE_NONE
        },
        0,
        PLAYLIST_TYPE_NB - 1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "pl_type"
    },
    new LibAVUtil.ConstOption () {
        name = "event",
        short_help_text = "EVENT playlist",
        0,
        {
            .i64 = PLAYLIST_TYPE_EVENT
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "pl_type"
    },
    new LibAVUtil.ConstOption () {
        name = "vod",
        short_help_text = "VOD playlist",
        0,
        {
            .i64 = PLAYLIST_TYPE_VOD
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "pl_type"
    },
    new LibAVUtil.StringOption () {
        name = "method",
        short_help_text = "set the HTTP method (default: PUT)",
        offsetof (
            HLSContext,
            method
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "hls_start_number_source",
        short_help_text = "set source of first number in sequence",
        offsetof (
            HLSContext,
            start_sequence_source_type
        ),
        {
            .i64 = HLS_START_SEQUENCE_AS_START_NUMBER
        },
        0,
        HLS_START_SEQUENCE_AS_FORMATTED_DATETIME,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "start_sequence_source_type"
    },
    new LibAVUtil.ConstOption () {
        name = "generic",
        short_help_text = "start_number value (default)",
        0,
        {
            .i64 = HLS_START_SEQUENCE_AS_START_NUMBER
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "start_sequence_source_type"
    },
    new LibAVUtil.ConstOption () {
        name = "epoch",
        short_help_text = "seconds since epoch",
        0,
        {
            .i64 = HLS_START_SEQUENCE_AS_SECONDS_SINCE_EPOCH
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "start_sequence_source_type"
    },
    new LibAVUtil.ConstOption () {
        name = "datetime",
        short_help_text = "current datetime as YYYYMMDDhhmmss",
        0,
        {
            .i64 = HLS_START_SEQUENCE_AS_FORMATTED_DATETIME
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "start_sequence_source_type"
    },
    new LibAVUtil.StringOption () {
        name = "http_user_agent",
        short_help_text = "override User-Agent field in HTTP header",
        offsetof (
            HLSContext,
            user_agent
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "var_stream_map",
        short_help_text = "Variant stream map string",
        offsetof (
            HLSContext,
            var_stream_map
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "cc_stream_map",
        short_help_text = "Closed captions stream map string",
        offsetof (
            HLSContext,
            cc_stream_map
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "master_pl_name",
        short_help_text = "Create HLS master playlist with this name",
        offsetof (
            HLSContext,
            master_pl_name
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "master_pl_publish_rate",
        short_help_text = "Publish master play list every after this many segment intervals",
        offsetof (
            HLSContext,
            master_publish_rate
        ),
        {
            .i64 = 0
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "http_persistent",
        short_help_text = "Use persistent HTTP connections",
        offsetof (
            HLSContext,
            http_persistent
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.DurationOption () {
        name = "timeout",
        short_help_text = "set timeout for socket I/O operations",
        offsetof (
            HLSContext,
            timeout
        ),
        {
            .i64 = -1
        },
        -1,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "ignore_io_errors",
        short_help_text = "Ignore IO errors for stable long-duration runs with network output",
        offsetof (
            HLSContext,
            ignore_io_errors
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "headers",
        short_help_text = "set custom HTTP headers, can override built in default headers",
        offsetof (
            HLSContext,
            headers
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="hls_class",cheader_filename="ffmpeg/libformat/hlsenc.c")]
public class HLSMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override string class_name {
        public get {
            return "hls muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct HLSContext",cheader_filename="ffmpeg/libformat/hlsenc.c")]
[Compact]
public class HLSMuxerPrivateData { }

[CCode (cname="ff_hls_muxer",cheader_filename="ffmpeg/libformat/hlsenc.c")]
public class HLSMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override string name {
        public get {
            return "hls";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override string long_name {
        public get {
            return "Apple HTTP Live Streaming";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override string extensions {
        public get {
            return "m3u8";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HLSMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;

        }

    }

    [CCode (cname="subtitle_codec",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override LibAVCodec.CodecID subtitle_codec {
        public get {
            return LibAVCodec.CodecID.WEBVTT;

        }

    }

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOFILE | AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_NODIMENSIONS;

        }

    }

    [CCode (cname="hls_init",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="hls_write_header",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="hls_write_packet",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="hls_write_trailer",cheader_filename="ffmpeg/libformat/hlsenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = hls_class;
}

} // namespace LibAVFormat
