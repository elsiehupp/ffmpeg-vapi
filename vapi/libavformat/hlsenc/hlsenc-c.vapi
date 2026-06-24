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

[CCode (cname="hls_class",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
public class HLSMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override string class_name {
        public get {
            return "hls muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="option",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.Int64Option () {
                    name = "start_number",
                    short_help_text = "set first number in the sequence",
                    offset = offsetof (
                        HLSContext,
                        start_sequence
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int64.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.FloatOption () {
                    name = "hls_time",
                    short_help_text = "set segment length in seconds",
                    offset = offsetof (
                        HLSContext,
                        time
                    ),
                    default_value = 2,
                    minimum_value = 0,
                    maximum_value = iFLT_MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.FloatOption () {
                    name = "hls_init_time",
                    short_help_text = "set segment length in seconds at init list",
                    offset = offsetof (
                        HLSContext,
                        init_time
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = iFLT_MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "hls_list_size",
                    short_help_text = "set maximum number of playlist entries",
                    offset = offsetof (
                        HLSContext,
                        max_nb_segments
                    ),
                    default_value = 5,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "hls_delete_threshold",
                    short_help_text = "set number of unreferenced segments to keep before deleting",
                    offset = offsetof (
                        HLSContext,
                        hls_delete_threshold
                    ),
                    default_value = 1,
                    minimum_value = 1,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "hls_ts_options","set hls mpegts list of options for the container format used for hls",
                    offset = offsetof (
                        HLSContext,
                        format_options_str
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "hls_vtt_options","set hls vtt list of options for the container format used for hls",
                    offset = offsetof (
                        HLSContext,
                        vtt_format_options_str
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
            #if FF_API_HLS_WRAP
                new LibAVUtil.IntOption () {
                    name = "hls_wrap",
                    short_help_text = "set number after which the index wraps (will be deprecated)",
                    offset = offsetof (
                        HLSContext,
                        wrap
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
            #endif
                new LibAVUtil.IntOption () {
                    name = "hls_allow_cache",
                    short_help_text = "explicitly set whether the client MAY (1) or MUST NOT (0) cache media segments",
                    offset = offsetof (
                        HLSContext,
                        allowcache
                    ),
                    default_value = -1,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "hls_base_url",
                    short_help_text = "url to prepend to each playlist entry",
                    offset = offsetof (
                        HLSContext,
                        baseurl
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "hls_segment_filename",
                    short_help_text = "filename template for segment files",
                    offset = offsetof (
                        HLSContext,
                        segment_filename
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "hls_segment_size",
                    short_help_text = "maximum size per segment file, (in bytes)",
                    offset = offsetof (
                        HLSContext,
                        max_seg_size
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "hls_key_info_file",
                    short_help_text = "file with key URI and key file path",
                    offset = offsetof (
                        HLSContext,
                        key_info_file
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "hls_enc",
                    short_help_text = "enable AES128 encryption support",
                    offset = offsetof (
                        HLSContext,
                        encrypt
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "hls_enc_key",
                    short_help_text = "hex-coded 16 byte key to encrypt the segments",
                    offset = offsetof (
                        HLSContext,
                        key
                    ),
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "hls_enc_key_url",
                    short_help_text = "url to access the key to decrypt the segments",
                    offset = offsetof (
                        HLSContext,
                        key_url
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "hls_enc_iv",
                    short_help_text = "hex-coded 16 byte initialization vector",
                    offset = offsetof (
                        HLSContext,
                        iv
                    ),
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "hls_subtitle_path",
                    short_help_text = "set path of hls subtitles",
                    offset = offsetof (
                        HLSContext,
                        subtitle_filename
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "hls_segment_type",
                    short_help_text = "set hls segment files type",
                    offset = offsetof (
                        HLSContext,
                        segment_type
                    ),
                    default_value = SEGMENT_TYPE_MPEGTS,
                    minimum_value = 0,
                    maximum_value = SEGMENT_TYPE_FMP4,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "segment_type"
                },
                new LibAVUtil.ConstOption () {
                    name = "mpegts",
                    short_help_text = "make segment file to mpegts files in m3u8",
                    offset = 0,
                    default_value = SEGMENT_TYPE_MPEGTS,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "segment_type"
                },
                new LibAVUtil.ConstOption () {
                    name = "fmp4",
                    short_help_text = "make segment file to fragment mp4 files in m3u8",
                    offset = 0,
                    default_value = SEGMENT_TYPE_FMP4,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "segment_type"
                },
                new LibAVUtil.StringOption () {
                    name = "hls_fmp4_init_filename",
                    short_help_text = "set fragment mp4 file init filename",
                    offset = offsetof (
                        HLSContext,
                        fmp4_init_filename
                    ),
                    default_value = "init.mp4",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.FlagsOption () {
                    name = "hls_flags",
                    short_help_text = "set flags affecting HLS playlist and media file generation",
                    offset = offsetof (
                        HLSContext,
                        flags
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "single_file",
                    short_help_text = "generate a single media file indexed with byte ranges",
                    offset = 0,
                    default_value = HLS_SINGLE_FILE,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "temp_file",
                    short_help_text = "write segment and playlist to temporary file and rename when complete",
                    offset = 0,
                    default_value = HLS_TEMP_FILE,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "delete_segments",
                    short_help_text = "delete segment files that are no longer part of the playlist",
                    offset = 0,
                    default_value = HLS_DELETE_SEGMENTS,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "round_durations",
                    short_help_text = "round durations in m3u8 to whole numbers",
                    offset = 0,
                    default_value = HLS_ROUND_DURATIONS,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "discont_start",
                    short_help_text = "start the playlist with a discontinuity tag",
                    offset = 0,
                    default_value = HLS_DISCONT_START,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "omit_endlist",
                    short_help_text = "Do not append an endlist when ending stream",
                    offset = 0,
                    default_value = HLS_OMIT_ENDLIST,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "split_by_time",
                    short_help_text = "split the hls segment by time which user set by hls_time",
                    offset = 0,
                    default_value = HLS_SPLIT_BY_TIME,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "append_list",
                    short_help_text = "append the new segments into old hls segment list",
                    offset = 0,
                    default_value = HLS_APPEND_LIST,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "program_date_time",
                    short_help_text = "add EXT-X-PROGRAM-DATE-TIME",
                    offset = 0,
                    default_value = HLS_PROGRAM_DATE_TIME,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "second_level_segment_index",
                    short_help_text = "include segment index in segment filenames when use_localtime",
                    offset = 0,
                    default_value = HLS_SECOND_LEVEL_SEGMENT_INDEX,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "second_level_segment_duration",
                    short_help_text = "include segment duration in segment filenames when use_localtime",
                    offset = 0,
                    default_value = HLS_SECOND_LEVEL_SEGMENT_DURATION,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "second_level_segment_size",
                    short_help_text = "include segment size in segment filenames when use_localtime",
                    offset = 0,
                    default_value = HLS_SECOND_LEVEL_SEGMENT_SIZE,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "periodic_rekey",
                    short_help_text = "reload keyinfo file periodically for re-keying",
                    offset = 0,
                    default_value = HLS_PERIODIC_REKEY,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "independent_segments",
                    short_help_text = "add EXT-X-INDEPENDENT-SEGMENTS, whenever applicable",
                    offset = 0,
                    default_value = HLS_INDEPENDENT_SEGMENTS,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
                new LibAVUtil.ConstOption () {
                    name = "iframes_only",
                    short_help_text = "add EXT-X-I-FRAMES-ONLY, whenever applicable",
                    offset = 0,
                    default_value = HLS_I_FRAMES_ONLY,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "flags"
                },
            #if FF_API_HLS_USE_LOCALTIME
                new LibAVUtil.BoolOption () {
                    name = "use_localtime",
                    short_help_text = "set filename expansion with strftime at segment creation (will be deprecated )",
                    offset = offsetof (
                        HLSContext,
                        use_localtime
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
            #endif
                new LibAVUtil.BoolOption () {
                    name = "strftime",
                    short_help_text = "set filename expansion with strftime at segment creation",
                    offset = offsetof (
                        HLSContext,
                        use_localtime
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
            #if FF_API_HLS_USE_LOCALTIME
                new LibAVUtil.BoolOption () {
                    name = "use_localtime_mkdir",
                    short_help_text = "create last directory component in strftime-generated filename (will be deprecated)",
                    offset = offsetof (
                        HLSContext,
                        use_localtime_mkdir
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
            #endif
                new LibAVUtil.BoolOption () {
                    name = "strftime_mkdir",
                    short_help_text = "create last directory component in strftime-generated filename",
                    offset = offsetof (
                        HLSContext,
                        use_localtime_mkdir
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "hls_playlist_type",
                    short_help_text = "set the HLS playlist type",
                    offset = offsetof (
                        HLSContext,
                        pl_type
                    ),
                    default_value = PlaylistType.NONE,
                    minimum_value = 0,
                    maximum_value = (
                        PlaylistType.NB - 1
                    ),
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "pl_type"
                },
                new LibAVUtil.ConstOption () {
                    name = "event",
                    short_help_text = "EVENT playlist",
                    offset = 0,
                    default_value = PlaylistType.EVENT,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "pl_type"
                },
                new LibAVUtil.ConstOption () {
                    name = "vod",
                    short_help_text = "VOD playlist",
                    offset = 0,
                    default_value = PlaylistType.VOD,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "pl_type"
                },
                new LibAVUtil.StringOption () {
                    name = "method",
                    short_help_text = "set the HTTP method (default: PUT)",
                    offset = offsetof (
                        HLSContext,
                        method
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "hls_start_number_source",
                    short_help_text = "set source of first number in sequence",
                    offset = offsetof (
                        HLSContext,
                        start_sequence_source_type
                    ),
                    default_value = HLS_START_SEQUENCE_AS_START_NUMBER,
                    minimum_value = 0,
                    maximum_value = HLS_START_SEQUENCE_AS_FORMATTED_DATETIME,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "start_sequence_source_type"
                },
                new LibAVUtil.ConstOption () {
                    name = "generic",
                    short_help_text = "start_number value (default)",
                    offset = 0,
                    default_value = HLS_START_SEQUENCE_AS_START_NUMBER,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "start_sequence_source_type"
                },
                new LibAVUtil.ConstOption () {
                    name = "epoch",
                    short_help_text = "seconds since epoch",
                    offset = 0,
                    default_value = HLS_START_SEQUENCE_AS_SECONDS_SINCE_EPOCH,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "start_sequence_source_type"
                },
                new LibAVUtil.ConstOption () {
                    name = "datetime",
                    short_help_text = "current datetime as YYYYMMDDhhmmss",
                    offset = 0,
                    default_value = HLS_START_SEQUENCE_AS_FORMATTED_DATETIME,
                    minimum_value = int.MIN,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
                    unit = "start_sequence_source_type"
                },
                new LibAVUtil.StringOption () {
                    name = "http_user_agent",
                    short_help_text = "override User-Agent field in HTTP header",
                    offset = offsetof (
                        HLSContext,
                        user_agent
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "var_stream_map",
                    short_help_text = "Variant stream map string",
                    offset = offsetof (
                        HLSContext,
                        var_stream_map
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "cc_stream_map",
                    short_help_text = "Closed captions stream map string",
                    offset = offsetof (
                        HLSContext,
                        cc_stream_map
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "master_pl_name",
                    short_help_text = "Create HLS master playlist with this name",
                    offset = offsetof (
                        HLSContext,
                        master_pl_name
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "master_pl_publish_rate",
                    short_help_text = "Publish master play list every after this many segment intervals",
                    offset = offsetof (
                        HLSContext,
                        master_publish_rate
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = uint.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "http_persistent",
                    short_help_text = "Use persistent HTTP connections",
                    offset = offsetof (
                        HLSContext,
                        http_persistent
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.DurationOption () {
                    name = "timeout",
                    short_help_text = "set timeout for socket I/O operations",
                    offset = offsetof (
                        HLSContext,
                        timeout
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "ignore_io_errors",
                    short_help_text = "Ignore IO errors for stable long-duration runs with network output",
                    offset = offsetof (
                        HLSContext,
                        ignore_io_errors
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "headers",
                    short_help_text = "set custom HTTP headers, can override built in default headers",
                    offset = offsetof (
                        HLSContext,
                        headers
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct HLSContext",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
[Compact]
public class HLSMuxerPrivateData { }

[CCode (cname="ff_hls_muxer",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
public class HLSMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override string name {
        public get {
            return "hls";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override string long_name {
        public get {
            return "Apple HTTP Live Streaming";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override string extensions {
        public get {
            return "m3u8";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HLSMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;

        }

    }

    [CCode (cname="subtitle_codec",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override LibAVCodec.CodecID subtitle_codec {
        public get {
            return LibAVCodec.CodecID.WEBVTT;

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_FILE | AVFormatFlags1.WANTS_GLOBAL_HEADER | AVFormatFlags1.ALLOWS_FLUSH | AVFormatFlags1.NO_DIMENSIONS;

        }

    }

    [CCode (cname="hls_init",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="hls_write_header",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="hls_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="hls_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/hlsenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = hls_class;
}

} // namespace LibAVFormat
