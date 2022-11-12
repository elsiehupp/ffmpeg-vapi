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

//  #define OFFSET(x) offsetof(HLSContext, x)
//  #define E AV_OPT_FLAG_ENCODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      {"start_number",  "set first number in the sequence",        OFFSET(start_sequence),AV_OPT_TYPE_INT64,  {.i64 = 0},     0, INT64_MAX, E},
//      {"hls_time",      "set segment length in seconds",           OFFSET(time),    AV_OPT_TYPE_FLOAT,  {.dbl = 2},     0, FLT_MAX, E},
//      {"hls_init_time", "set segment length in seconds at init list",           OFFSET(init_time),    AV_OPT_TYPE_FLOAT,  {.dbl = 0},     0, FLT_MAX, E},
//      {"hls_list_size", "set maximum number of playlist entries",  OFFSET(max_nb_segments),    AV_OPT_TYPE_INT,    {.i64 = 5},     0, INT_MAX, E},
//      {"hls_delete_threshold", "set number of unreferenced segments to keep before deleting",  OFFSET(hls_delete_threshold),    AV_OPT_TYPE_INT,    {.i64 = 1},     1, INT_MAX, E},
//      {"hls_ts_options","set hls mpegts list of options for the container format used for hls", OFFSET(format_options_str), AV_OPT_TYPE_STRING, {.str = NULL},  0, 0,    E},
//      {"hls_vtt_options","set hls vtt list of options for the container format used for hls", OFFSET(vtt_format_options_str), AV_OPT_TYPE_STRING, {.str = NULL},  0, 0,    E},
//  #if FF_API_HLS_WRAP
//      {"hls_wrap",      "set number after which the index wraps (will be deprecated)",  OFFSET(wrap),    AV_OPT_TYPE_INT,    {.i64 = 0},     0, INT_MAX, E},
//  #endif
//      {"hls_allow_cache", "explicitly set whether the client MAY (1) or MUST NOT (0) cache media segments", OFFSET(allowcache), AV_OPT_TYPE_INT, {.i64 = -1}, INT_MIN, INT_MAX, E},
//      {"hls_base_url",  "url to prepend to each playlist entry",   OFFSET(baseurl), AV_OPT_TYPE_STRING, {.str = NULL},  0, 0,       E},
//      {"hls_segment_filename", "filename template for segment files", OFFSET(segment_filename),   AV_OPT_TYPE_STRING, {.str = NULL},            0,       0,         E},
//      {"hls_segment_size", "maximum size per segment file, (in bytes)",  OFFSET(max_seg_size),    AV_OPT_TYPE_INT,    {.i64 = 0},               0,       INT_MAX,   E},
//      {"hls_key_info_file",    "file with key URI and key file path", OFFSET(key_info_file),      AV_OPT_TYPE_STRING, {.str = NULL},            0,       0,         E},
//      {"hls_enc",    "enable AES128 encryption support", OFFSET(encrypt),      AV_OPT_TYPE_BOOL, {.i64 = 0},            0,       1,         E},
//      {"hls_enc_key",    "hex-coded 16 byte key to encrypt the segments", OFFSET(key),      AV_OPT_TYPE_STRING, .flags = E},
//      {"hls_enc_key_url",    "url to access the key to decrypt the segments", OFFSET(key_url),      AV_OPT_TYPE_STRING, {.str = NULL},            0,       0,         E},
//      {"hls_enc_iv",    "hex-coded 16 byte initialization vector", OFFSET(iv),      AV_OPT_TYPE_STRING, .flags = E},
//      {"hls_subtitle_path",     "set path of hls subtitles", OFFSET(subtitle_filename), AV_OPT_TYPE_STRING, {.str = NULL},  0, 0,    E},
//      {"hls_segment_type",     "set hls segment files type", OFFSET(segment_type), AV_OPT_TYPE_INT, {.i64 = SEGMENT_TYPE_MPEGTS }, 0, SEGMENT_TYPE_FMP4, E, "segment_type"},
//      {"mpegts",   "make segment file to mpegts files in m3u8", 0, AV_OPT_TYPE_CONST, {.i64 = SEGMENT_TYPE_MPEGTS }, 0, UINT_MAX,   E, "segment_type"},
//      {"fmp4",   "make segment file to fragment mp4 files in m3u8", 0, AV_OPT_TYPE_CONST, {.i64 = SEGMENT_TYPE_FMP4 }, 0, UINT_MAX,   E, "segment_type"},
//      {"hls_fmp4_init_filename", "set fragment mp4 file init filename", OFFSET(fmp4_init_filename),   AV_OPT_TYPE_STRING, {.str = "init.mp4"},            0,       0,         E},
//      {"hls_flags",     "set flags affecting HLS playlist and media file generation", OFFSET(flags), AV_OPT_TYPE_FLAGS, {.i64 = 0 }, 0, UINT_MAX, E, "flags"},
//      {"single_file",   "generate a single media file indexed with byte ranges", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_SINGLE_FILE }, 0, UINT_MAX,   E, "flags"},
//      {"temp_file", "write segment and playlist to temporary file and rename when complete", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_TEMP_FILE }, 0, UINT_MAX,   E, "flags"},
//      {"delete_segments", "delete segment files that are no longer part of the playlist", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_DELETE_SEGMENTS }, 0, UINT_MAX,   E, "flags"},
//      {"round_durations", "round durations in m3u8 to whole numbers", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_ROUND_DURATIONS }, 0, UINT_MAX,   E, "flags"},
//      {"discont_start", "start the playlist with a discontinuity tag", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_DISCONT_START }, 0, UINT_MAX,   E, "flags"},
//      {"omit_endlist", "Do not append an endlist when ending stream", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_OMIT_ENDLIST }, 0, UINT_MAX,   E, "flags"},
//      {"split_by_time", "split the hls segment by time which user set by hls_time", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_SPLIT_BY_TIME }, 0, UINT_MAX,   E, "flags"},
//      {"append_list", "append the new segments into old hls segment list", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_APPEND_LIST }, 0, UINT_MAX,   E, "flags"},
//      {"program_date_time", "add EXT-X-PROGRAM-DATE-TIME", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_PROGRAM_DATE_TIME }, 0, UINT_MAX,   E, "flags"},
//      {"second_level_segment_index", "include segment index in segment filenames when use_localtime", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_SECOND_LEVEL_SEGMENT_INDEX }, 0, UINT_MAX,   E, "flags"},
//      {"second_level_segment_duration", "include segment duration in segment filenames when use_localtime", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_SECOND_LEVEL_SEGMENT_DURATION }, 0, UINT_MAX,   E, "flags"},
//      {"second_level_segment_size", "include segment size in segment filenames when use_localtime", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_SECOND_LEVEL_SEGMENT_SIZE }, 0, UINT_MAX,   E, "flags"},
//      {"periodic_rekey", "reload keyinfo file periodically for re-keying", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_PERIODIC_REKEY }, 0, UINT_MAX,   E, "flags"},
//      {"independent_segments", "add EXT-X-INDEPENDENT-SEGMENTS, whenever applicable", 0, AV_OPT_TYPE_CONST, { .i64 = HLS_INDEPENDENT_SEGMENTS }, 0, UINT_MAX, E, "flags"},
//      {"iframes_only", "add EXT-X-I-FRAMES-ONLY, whenever applicable", 0, AV_OPT_TYPE_CONST, { .i64 = HLS_I_FRAMES_ONLY }, 0, UINT_MAX, E, "flags"},
//  #if FF_API_HLS_USE_LOCALTIME
//      {"use_localtime", "set filename expansion with strftime at segment creation(will be deprecated )", OFFSET(use_localtime), AV_OPT_TYPE_BOOL, {.i64 = 0 }, 0, 1, E },
//  #endif
//      {"strftime", "set filename expansion with strftime at segment creation", OFFSET(use_localtime), AV_OPT_TYPE_BOOL, {.i64 = 0 }, 0, 1, E },
//  #if FF_API_HLS_USE_LOCALTIME
//      {"use_localtime_mkdir", "create last directory component in strftime-generated filename(will be deprecated)", OFFSET(use_localtime_mkdir), AV_OPT_TYPE_BOOL, {.i64 = 0 }, 0, 1, E },
//  #endif
//      {"strftime_mkdir", "create last directory component in strftime-generated filename", OFFSET(use_localtime_mkdir), AV_OPT_TYPE_BOOL, {.i64 = 0 }, 0, 1, E },
//      {"hls_playlist_type", "set the HLS playlist type", OFFSET(pl_type), AV_OPT_TYPE_INT, {.i64 = PLAYLIST_TYPE_NONE }, 0, PLAYLIST_TYPE_NB-1, E, "pl_type" },
//      {"event", "EVENT playlist", 0, AV_OPT_TYPE_CONST, {.i64 = PLAYLIST_TYPE_EVENT }, INT_MIN, INT_MAX, E, "pl_type" },
//      {"vod", "VOD playlist", 0, AV_OPT_TYPE_CONST, {.i64 = PLAYLIST_TYPE_VOD }, INT_MIN, INT_MAX, E, "pl_type" },
//      {"method", "set the HTTP method(default: PUT)", OFFSET(method), AV_OPT_TYPE_STRING, {.str = NULL},  0, 0,    E},
//      {"hls_start_number_source", "set source of first number in sequence", OFFSET(start_sequence_source_type), AV_OPT_TYPE_INT, {.i64 = HLS_START_SEQUENCE_AS_START_NUMBER }, 0, HLS_START_SEQUENCE_AS_FORMATTED_DATETIME, E, "start_sequence_source_type" },
//      {"generic", "start_number value (default)", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_START_SEQUENCE_AS_START_NUMBER }, INT_MIN, INT_MAX, E, "start_sequence_source_type" },
//      {"epoch", "seconds since epoch", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_START_SEQUENCE_AS_SECONDS_SINCE_EPOCH }, INT_MIN, INT_MAX, E, "start_sequence_source_type" },
//      {"datetime", "current datetime as YYYYMMDDhhmmss", 0, AV_OPT_TYPE_CONST, {.i64 = HLS_START_SEQUENCE_AS_FORMATTED_DATETIME }, INT_MIN, INT_MAX, E, "start_sequence_source_type" },
//      {"http_user_agent", "override User-Agent field in HTTP header", OFFSET(user_agent), AV_OPT_TYPE_STRING, {.str = NULL},  0, 0,    E},
//      {"var_stream_map", "Variant stream map string", OFFSET(var_stream_map), AV_OPT_TYPE_STRING, {.str = NULL},  0, 0,    E},
//      {"cc_stream_map", "Closed captions stream map string", OFFSET(cc_stream_map), AV_OPT_TYPE_STRING, {.str = NULL},  0, 0,    E},
//      {"master_pl_name", "Create HLS master playlist with this name", OFFSET(master_pl_name), AV_OPT_TYPE_STRING, {.str = NULL},  0, 0,    E},
//      {"master_pl_publish_rate", "Publish master play list every after this many segment intervals", OFFSET(master_publish_rate), AV_OPT_TYPE_INT, {.i64 = 0}, 0, UINT_MAX, E},
//      {"http_persistent", "Use persistent HTTP connections", OFFSET(http_persistent), AV_OPT_TYPE_BOOL, {.i64 = 0 }, 0, 1, E },
//      {"timeout", "set timeout for socket I/O operations", OFFSET(timeout), AV_OPT_TYPE_DURATION, { .i64 = -1 }, -1, INT_MAX, .flags = E },
//      {"ignore_io_errors", "Ignore IO errors for stable long-duration runs with network output", OFFSET(ignore_io_errors), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, E },
//      {"headers", "set custom HTTP headers, can override built in default headers", OFFSET(headers), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, E },
//      { NULL },
//  }

[CCode (cname="hls_class", cheader_filename="")]
public class HLSMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "hls muxer";
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

[CCode (cname="struct HLSContext", cheader_filename="")]
public struct HLSMuxerPrivateData { }

[CCode (cname="ff_hls_muxer", cheader_filename="")]
public class HLSMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "hls";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Apple HTTP Live Streaming";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "m3u8";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HLSMuxerPrivateData);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;
        }
    }

    [CCode (cname="subtitle_codec", cheader_filename="")]
    public override LibAVCodec.CodecID subtitle_codec {
        public get {
            return LibAVCodec.CodecID.WEBVTT;
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOFILE | AVFMT_GLOBALHEADER | AVFMT_ALLOW_FLUSH | AVFMT_NODIMENSIONS;
        }
    }

    [CCode (cname="hls_init", cheader_filename="")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="hls_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="hls_write_packet", cheader_filename="")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="hls_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = hls_class,
}

} // namespace LibAVFormat
