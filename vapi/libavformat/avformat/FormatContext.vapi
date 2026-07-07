/***********************************************************
@copyright 2001 Fabrice Bellard
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
@file @ingroup libavf
Main libavformat public API header
***********************************************************/

/***********************************************************
@brief Format I/O context.
New fields can be added to the end with minor version bumps.
Removal, reordering and changes to existing fields require a major
version bump.
sizeof (LibAVFormat.FormatContext) must not be used outside libav*, use
avformat_alloc_context () to create an LibAVFormat.FormatContext.

Fields can be accessed through AVOptions (av_opt*),
the name string used matches the associated command line parameter name and
can be found in libavformat/options_table.h.
The LibAVUtil.Option/command line parameter names differ in some cases from the C
structure field names for historic reasons or brevity.
***********************************************************/
[CCode (cname="struct AVFormatContext",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public abstract class LibAVFormat.FormatContext {
    /***********************************************************
    @brief Name of this format context, only used for logging purposes.
    ***********************************************************/
    [CCode (cname="name")]
    public string name;

    /***********************************************************
    @brief A class for logging and @ref avoptions. Set by avformat_alloc_context ().
    Exports (de)muxer private options if they exist.
    ***********************************************************/
    [CCode (cname="av_class")]
    public LibAVUtil.Log.Class? av_class;

    /***********************************************************
    @brief The input container format.

    Demuxing only, set by avformat_open_input ().
    ***********************************************************/
    [CCode (cname="iformat")]
    public LibAVFormat.InputFormat? iformat;

    /***********************************************************
    @brief The output container format.

    Muxing only, must be set by the caller before avformat_write_header ().
    ***********************************************************/
    [CCode (cname="oformat")]
    public LibAVFormat.OutputFormat? oformat;

    /***********************************************************
    @brief Format private data. This is an AVOptions-enabled struct
    if and only if iformat/oformat.priv_class is not NULL.

    - muxing: set by avformat_write_header ()
    - demuxing: set by avformat_open_input ()
    ***********************************************************/
    [CCode (cname="priv_data")]
    public void *priv_data;

    /***********************************************************
    @brief I/O context.

    - demuxing: either set by the user before avformat_open_input () (then
                the user must close it manually) or set by avformat_open_input ().
    - muxing: set by the user before avformat_write_header (). The caller must
              take care of closing / freeing the IO context.

    Do NOT set this field if LibAVFormat.FormatFlags1.NO_FILE flag is set in
    iformat/oformat.flags. In such a case, the (de)muxer will handle
    I/O in some other way and this field will be NULL.
    ***********************************************************/
    [CCode (cname="pb")]
    public LibAVFormat.IOContext? pb;

    /***********************************************************
    @brief Stream info
    ***********************************************************/

    /***********************************************************
    @brief Flags signalling stream properties. A combination of LibAVFormat.FormatContextFlags.
    Set by libavformat.
    ***********************************************************/
    [CCode (cname="ctx_flags")]
    public LibAVFormat.FormatContextFlags ctx_flags;

    /***********************************************************
    @brief A list of all streams in the file. New streams are created with
    avformat_new_stream ().

    - demuxing: streams are created by libavformat in avformat_open_input ().
                If LibAVFormat.FormatContextFlags.NO_HEADER is set in ctx_flags, then new streams may also
                appear in av_read_frame ().
    - muxing: streams are created by the user before avformat_write_header ().

    Freed by libavformat in avformat_free_context ().
    ***********************************************************/
    [CCode (cname="streams")]
    public LibAVFormat.Stream[] streams;

    /***********************************************************
    @brief Number of elements in LibAVFormat.FormatContext.streams.

    Set by avformat_new_stream (), must not be modified by any other code.
    ***********************************************************/
    [CCode (cname="nb_streams")]
    public uint nb_streams;

    /***********************************************************
    @brief Input or output URL. Unlike the old filename field, this field has no
    length restriction.

    - demuxing: set by avformat_open_input (), initialized to an empty
                string if url parameter was NULL in avformat_open_input ().
    - muxing: may be set by the caller before calling avformat_write_header ()
              (or avformat_init_output () if that is called first) to a string
              which is freeable by av_free (). Set to an empty string if it
              was NULL in avformat_init_output ().

    Freed by libavformat in avformat_free_context ().
    ***********************************************************/
    [CCode (cname="url")]
    public string url;

    /***********************************************************
    @brief Position of the first frame of the component, in
    AV_TIME_BASE fractional seconds. NEVER set this value directly:
    It is deduced from the LibAVFormat.Stream values.

    Demuxing only, set by libavformat.
    ***********************************************************/
    [CCode (cname="start_time")]
    public int64 start_time;

    /***********************************************************
    @brief Duration of the stream, in AV_TIME_BASE fractional
    seconds. Only set this value if you know none of the individual stream
    durations and also do not set any of them. This is deduced from the
    LibAVFormat.Stream values if not set.

    Demuxing only, set by libavformat.
    ***********************************************************/
    [CCode (cname="duration")]
    public int64 duration;

    /***********************************************************
    @brief Total stream bitrate in bit/s, 0 if not
    available. Never set it directly if the file_size and the
    duration are known as FFmpeg can compute it automatically.
    ***********************************************************/
    [CCode (cname="bit_rate")]
    public int64 bit_rate;

    [CCode (cname="packet_size")]
    public uint packet_size;

    [CCode (cname="max_delay")]
    public int max_delay;

    /***********************************************************
    @brief Flags modifying the (de)muxer behaviour. A combination of LibAVFormat.FormatFlags.*.
    Set by the user before avformat_open_input () / avformat_write_header ().
    ***********************************************************/
    [CCode (cname="flags")]
    public LibAVFormat.FormatFlags flags;

    /***********************************************************
    Maximum number of bytes read from input in order to determine stream
    properties. Used when reading the global header and in
    avformat_find_stream_info ().

    Demuxing only, set by the caller before avformat_open_input ().

    @note this is \e not  used for determining the @ref LibAVFormat.InputFormat
          "input format"
    @see format_probesize
    ***********************************************************/
    [CCode (cname="probesize")]
    public int64 probesize;

    /***********************************************************
    @brief Maximum duration (in AV_TIME_BASE units) of the data read
    from input in avformat_find_stream_info ().
    Demuxing only, set by the caller before avformat_find_stream_info ().
    Can be set to 0 to let avformat choose using a heuristic.
    ***********************************************************/
    [CCode (cname="max_analyze_duration")]
    public int64 max_analyze_duration;

    [CCode (cname="key")]
    public uint8[] key;

    [CCode (cname="keylen")]
    public int keylen;

    [CCode (cname="programs")]
    public LibAVFormat.Program[] programs;

    [CCode (cname="nb_programs")]
    public uint nb_programs;

    /***********************************************************
    @brief Forced video codec_id.
    Demuxing: Set by user.
    ***********************************************************/
    [CCode (cname="video_codec_id")]
    public LibAVCodec.CodecID video_codec_id;

    /***********************************************************
    @brief Forced audio codec_id.
    Demuxing: Set by user.
    ***********************************************************/
    [CCode (cname="audio_codec_id")]
    public LibAVCodec.CodecID audio_codec_id;

    /***********************************************************
    @brief Forced subtitle codec_id.
    Demuxing: Set by user.
    ***********************************************************/
    [CCode (cname="subtitle_codec_id")]
    public LibAVCodec.CodecID subtitle_codec_id;

    /***********************************************************
    @brief Maximum amount of memory in bytes to use for the index of each stream.
    If the index exceeds this size, entries will be discarded as
    needed to maintain a smaller size. This can lead to slower or less
    accurate seeking (depends on demuxer).
    Demuxers for which a full in-memory index is mandatory will ignore
    this.
    - muxing: unused
    - demuxing: set by user
    ***********************************************************/
    [CCode (cname="max_index_size")]
    public uint max_index_size;

    /***********************************************************
    @brief Maximum amount of memory in bytes to use for buffering frames
    obtained from realtime capture devices.
    ***********************************************************/
    [CCode (cname="max_picture_buffer")]
    public uint max_picture_buffer;

    /***********************************************************
    A list of all stream groups in the file. New groups are created with
    avformat_stream_group_create (), and filled with avformat_stream_group_add_stream ().

    - demuxing: groups may be created by libavformat in avformat_open_input ().
                If LibAVFormat.FormatContextFlags.NO_HEADER is set in ctx_flags, then new groups may also
                appear in av_read_frame ().
    - muxing: groups may be created by the user before avformat_write_header ().

    Freed by libavformat in avformat_free_context ().
    ***********************************************************/
    [CCode (cname="stream_groups")]
    public LibAVFormat.StreamGroup[] stream_groups;

    /***********************************************************
    Number of elements in LibAVFormat.FormatContext.stream_groups.

    Set by avformat_stream_group_create (), must not be modified by any other code.
    ***********************************************************/
    [CCode (cname="nb_stream_groups")]
    public uint nb_stream_groups;

    [CCode (cname="chapters")]
    public LibAVFormat.Chapter[] chapters;

    /***********************************************************
    @brief Number of chapters in LibAVFormat.Chapter array.
    When muxing, chapters are normally written in the file header,
    so nb_chapters should normally be initialized before write_header
    is called. Some muxers (e.g. mov and mkv) can also write chapters
    in the trailer.  To write chapters in the trailer, nb_chapters
    must be zero when write_header is called and non-zero when
    write_trailer is called.
    - muxing: set by user
    - demuxing: set by libavformat
    ***********************************************************/
    [CCode (cname="nb_chapters")]
    public uint nb_chapters;

    /***********************************************************
    @brief Metadata that applies to the whole file.

    - demuxing: set by libavformat in avformat_open_input ()
    - muxing: may be set by the caller before avformat_write_header ()

    Freed by libavformat in avformat_free_context ().
    ***********************************************************/
    [CCode (cname="metadata")]
    public LibAVUtil.Dictionary? metadata;

    /***********************************************************
    @brief Start time of the stream in real world time, in microseconds
    since the Unix epoch (00:00 1st January 1970). That is, pts=0 in the
    stream was captured at this real world time.
    - muxing: Set by the caller before avformat_write_header (). If set to
              either 0 or AV_NOPTS_VALUE, then the current wall-time will
              be used.
    - demuxing: Set by libavformat. AV_NOPTS_VALUE if unknown. Note that
                the value may become known after some number of frames
                have been received.
    ***********************************************************/
    [CCode (cname="start_time_realtime")]
    public int64 start_time_realtime;

    /***********************************************************
    @brief The number of frames used for determining the framerate in
    avformat_find_stream_info ().
    Demuxing only, set by the caller before avformat_find_stream_info ().
    ***********************************************************/
    [CCode (cname="fps_probe_size")]
    public int fps_probe_size;

    /***********************************************************
    @brief Error recognition; higher values will detect more errors but may
    misdetect some more or less valid parts as errors.
    Demuxing only, set by the caller before avformat_open_input ().
    ***********************************************************/
    [CCode (cname="error_recognition")]
    public int error_recognition;

    /***********************************************************
    @brief Custom interrupt callbacks for the I/O layer.

    demuxing: set by the user before avformat_open_input ().
    muxing: set by the user before avformat_write_header ()
    (mainly useful for LibAVFormat.FormatFlags1.NO_FILE formats). The callback
    should also be passed to avio_open2 () if it's used to
    open the file.
    ***********************************************************/
    [CCode (cname="interrupt_callback")]
    public LibAVFormat.IOInterruptCallback interrupt_callback;

    /***********************************************************
    @brief Flags to enable debugging.
    ***********************************************************/
    [CCode (cname="debug")]
    public LibAVFormat.FormatDebugFlags debug;

    /***********************************************************
    @brief Maximum buffering duration for interleaving.

    To ensure all the streams are interleaved correctly,
    av_interleaved_write_frame () will wait until it has at least one packet
    for each stream before actually writing any packets to the output file.
    When some streams are "sparse" (i.e. there are large gaps between
    successive packets), this can result in excessive buffering.

    This field specifies the maximum difference between the timestamps of the
    first and the last packet in the muxing queue, above which libavformat
    will output a packet regardless of whether it has queued a packet for all
    the streams.

    Muxing only, set by the caller before avformat_write_header ().
    ***********************************************************/
    [CCode (cname="max_interleave_delta")]
    public int64 max_interleave_delta;

    /***********************************************************
    @brief Allow non-standard and experimental extension
    @see LibAVCodec.CodecContext.strict_std_compliance
    ***********************************************************/
    [CCode (cname="strict_std_compliance")]
    public int strict_std_compliance;

    /***********************************************************
    @brief Flags for the user to detect events happening on the file. Flags must
    be cleared by the user once the event has been handled.
    A combination of AVFMT_EVENT_FLAG_*.
    ***********************************************************/
    [CCode (cname="event_flags")]
    public LibAVFormat.FormatEventFlags event_flags;

    /***********************************************************
    @brief Maximum number of packets to read while waiting for the first timestamp.
    Decoding only.
    ***********************************************************/
    [CCode (cname="max_ts_probe")]
    public int max_ts_probe;

    /***********************************************************
    @brief Avoid negative timestamps during muxing.
    Any value of the LibAVFormat.FormatAvoidNegativeTimestampFlags.* constants.
    Note, this only works when using av_interleaved_write_frame. (interleave_packet_per_dts is in use)
    - muxing: Set by user
    - demuxing: unused
    ***********************************************************/
    [CCode (cname="avoid_negative_ts")]
    public LibAVFormat.FormatAvoidNegativeTimestampFlags avoid_negative_ts;

    /***********************************************************
    @brief Transport stream id.
    This will be moved into demuxer private options. Thus no API/ABI compatibility
    ***********************************************************/
    [CCode (cname="ts_id")]
    public int ts_id;

    /***********************************************************
    @brief Audio preload in microseconds.
    Note, not all formats support this and unpredictable things may happen if it is used when not supported.
    - encoding: Set by user
    - decoding: unused
    ***********************************************************/
    [CCode (cname="audio_preload")]
    public int audio_preload;

    /***********************************************************
    @brief Max chunk time in microseconds.
    Note, not all formats support this and unpredictable things may happen if it is used when not supported.
    - encoding: Set by user
    - decoding: unused
    ***********************************************************/
    [CCode (cname="max_chunk_duration")]
    public int max_chunk_duration;

    /***********************************************************
    @brief Max chunk size in bytes
    Note, not all formats support this and unpredictable things may happen if it is used when not supported.
    - encoding: Set by user
    - decoding: unused
    ***********************************************************/
    [CCode (cname="max_chunk_size")]
    public int max_chunk_size;

    /***********************************************************
    Maximum number of packets that can be probed
    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="max_probe_packets")]
    public int max_probe_packets;

    /***********************************************************
    @brief Forces the use of wallclock timestamps as pts/dts of packets
    This has undefined results in the presence of B frames.
    - encoding: unused
    - decoding: Set by user
    ***********************************************************/
    [CCode (cname="use_wallclock_as_timestamps")]
    public int use_wallclock_as_timestamps;

    /***********************************************************
    @brief Avio flags, used to force LibAVFormat.IOOpenFlags.DIRECT.
    - encoding: unused
    - decoding: Set by user
    ***********************************************************/
    [CCode (cname="avio_flags")]
    public LibAVFormat.IOOpenFlags avio_flags;

    /***********************************************************
    @brief The duration field can be estimated through various ways, and this field can be used
    to know how the duration was estimated.
    - encoding: unused
    - decoding: Read by user
    ***********************************************************/
    [CCode (cname="duration_estimation_method")]
    public LibAVFormat.DurationEstimationMethod duration_estimation_method;

    /***********************************************************
    @brief Skip initial bytes when opening stream
    - encoding: unused
    - decoding: Set by user
    ***********************************************************/
    [CCode (cname="skip_initial_bytes")]
    public int64 skip_initial_bytes;

    /***********************************************************
    @brief Correct single timestamp overflows
    - encoding: unused
    - decoding: Set by user
    ***********************************************************/
    [CCode (cname="correct_ts_overflow")]
    public uint correct_ts_overflow;

    /***********************************************************
    @brief Force seeking to any (also non key) frames.
    - encoding: unused
    - decoding: Set by user
    ***********************************************************/
    [CCode (cname="seek2any")]
    public int seek2any;

    /***********************************************************
    @brief Flush the I/O context after each packet.
    - encoding: Set by user
    - decoding: unused
    ***********************************************************/
    [CCode (cname="flush_packets")]
    public int flush_packets;

    /***********************************************************
    @brief Format probing score.
    The maximal score is AVPROBE_SCORE_MAX, its set when the demuxer probes
    the format.
    - encoding: unused
    - decoding: set by avformat, read by user
    ***********************************************************/
    [CCode (cname="probe_score")]
    public int probe_score;

    /***********************************************************
    @brief Number of bytes to read maximally to identify format.
    - encoding: unused
    - decoding: set by user

    Maximum number of bytes read from input in order to identify the
    @ref LibAVFormat.InputFormat "input format". Only used when the format is not set
    explicitly by the caller.

    Demuxing only, set by the caller before avformat_open_input ().

    @see probesize
    ***********************************************************/
    [CCode (cname="format_probesize")]
    public int format_probesize;

    /***********************************************************
    ',' separated list of allowed decoders.
    If NULL then all are allowed
    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="codec_whitelist")]
    public string codec_whitelist;

    /***********************************************************
    ',' separated list of allowed demuxers.
    If NULL then all are allowed
    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="format_whitelist")]
    public string format_whitelist;

    /***********************************************************
    @brief An opaque field for libavformat internal usage.
    Must not be accessed in any way by callers.
    ***********************************************************/
    [CCode (cname="internal")]
    public AVFormatInternal internal;

    /***********************************************************
    @brief IO repositioned flag.
    This is set by avformat when the underlaying IO context read pointer
    is repositioned, for example when doing byte based seeking.
    Demuxers can use the flag to detect such changes.
    ***********************************************************/
    [CCode (cname="io_repositioned")]
    public int io_repositioned;

    /***********************************************************
    @brief Forced video codec.
    This allows forcing a specific decoder, even when there are multiple with
    the same codec_id.
    Demuxing: Set by user
    ***********************************************************/
    [CCode (cname="video_codec")]
    public abstract LibAVCodec.Codec? video_codec { public get; }

    /***********************************************************
    @brief Forced audio codec.
    This allows forcing a specific decoder, even when there are multiple with
    the same codec_id.
    Demuxing: Set by user
    ***********************************************************/
    [CCode (cname="audio_codec")]
    public abstract LibAVCodec.Codec? audio_codec { public get; }

    /***********************************************************
    @brief Forced subtitle codec.
    This allows forcing a specific decoder, even when there are multiple with
    the same codec_id.
    Demuxing: Set by user
    ***********************************************************/
    [CCode (cname="subtitle_codec")]
    public abstract LibAVCodec.Codec? subtitle_codec { public get; }

    /***********************************************************
    @brief Forced data codec.
    This allows forcing a specific decoder, even when there are multiple with
    the same codec_id.
    Demuxing: Set by user
    ***********************************************************/
    [CCode (cname="data_codec")]
    public abstract LibAVCodec.Codec? data_codec { public get; }

    /***********************************************************
    @brief Number of bytes to be written as padding in a metadata header.
    Demuxing: Unused.
    Muxing: Set by user via av_format_set_metadata_header_padding.
    ***********************************************************/
    [CCode (cname="metadata_header_padding")]
    public int metadata_header_padding;

    /***********************************************************
    User data.
    This is a place for some private data of the user.
    ***********************************************************/
    [CCode (cname="opaque")]
    public void *opaque;

    /***********************************************************
    @brief Callback used by devices to communicate with application.
    ***********************************************************/
    [CCode (cname="av_format_control_message")]
    public delegate int AVFormatControlMessage (
        LibAVFormat.FormatContext? format_context,
        int type,
        void *data,
        size_t data_size
    );

    //  [CCode (cname="AVOpenCallback",cheader_filename="subprojects/ffmpeg/libavformat/avformat.h")]
    //  public delegate int AVOpenCallback (
    //      LibAVFormat.FormatContext? format_context,
    //      out LibAVFormat.IOContext? pb,
    //      string url,
    //      int flags,
    //      LibAVFormat.IOInterruptCallback? int_cb,
    //      LibAVUtil.Dictionary[] options
    //  );

    /***********************************************************
    @brief User data.
    This is a place for some private data of the user.
    ***********************************************************/
    [CCode (cname="opaque")]
    public void *opaque;

    /***********************************************************
    @brief Callback used by devices to communicate with application.
    ***********************************************************/
    [CCode (cname="control_message_cb")]
    public AVFormatControlMessage control_message_cb;

    /***********************************************************
    @brief Output timestamp offset, in microseconds.
    Muxing: set by user
    ***********************************************************/
    [CCode (cname="output_ts_offset")]
    public int64 output_ts_offset;

    /***********************************************************
    @brief Dump format separator.
    can be ", " or "\n      " or anything else
    - muxing: Set by user.
    - demuxing: Set by user.
    ***********************************************************/
    [CCode (cname="dump_separator")]
    public uint8[] dump_separator;

    /***********************************************************
    @brief Forced Data codec_id.
    Demuxing: Set by user.
    ***********************************************************/
    [CCode (cname="data_codec_id")]
    public LibAVCodec.CodecID data_codec_id;

    /***********************************************************
    ',' separated list of allowed protocols.
    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="protocol_whitelist")]
    public string protocol_whitelist;

    /***********************************************************
    @brief A callback for opening new IO streams.

    Whenever a muxer or a demuxer needs to open an IO stream (typically from
    avformat_open_input () for demuxers, but for certain formats can happen at
    other times as well), it will call this callback to obtain an IO context.

    @param format_context the format context
    @param pb on success, the newly opened IO context should be returned here
    @param url the url to open
    @param flags a combination of LibAVFormat.IOOpenFlags.*
    @param options a dictionary of additional options, with the same
                   semantics as in avio_open2 ()
    @return 0 on success, a negative LibAVUtil.ErrorCode code on failure

    @note Certain muxers and demuxers do nesting, i.e. they open one or more
    additional internal format contexts. Thus the LibAVFormat.FormatContext pointer
    passed to this callback may be different from the one facing the caller.
    It will, however, have the same 'opaque' field.
    ***********************************************************/
    [CCode (cname="io_open")]
    public abstract int io_open (
        LibAVFormat.FormatContext? format_context,
        out LibAVFormat.IOContext pb,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    /***********************************************************
    @brief A callback for opening new IO streams.

    Whenever a muxer or a demuxer needs to open an IO stream (typically from
    avformat_open_input () for demuxers, but for certain formats can happen at
    other times as well), it will call this callback to obtain an IO context.

    @param format_context the format context
    @param pb on success, the newly opened IO context should be returned here
    @param url the url to open
    @param flags a combination of AVIO_FLAG_*
    @param options a dictionary of additional options, with the same
                   semantics as in avio_open2 ()
    @return 0 on success, a negative AVERROR code on failure

    @note Certain muxers and demuxers do nesting, i.e. they open one or more
    additional internal format contexts. Thus the LibAVFormat.FormatContext pointer
    passed to this callback may be different from the one facing the caller.
    It will, however, have the same 'opaque' field.
    ***********************************************************/
    [CCode (cname="io_open")]
    public abstract int io_open (
        LibAVFormat.FormatContext? format_context,
        out LibAVFormat.IOContext? pb,
        string url,
        int flags,
        ref LibAVUtil.Dictionary? options
    );

    /***********************************************************
    @brief A callback for closing the streams opened with LibAVFormat.FormatContext.io_open ().
    ***********************************************************/
    [CCode (cname="io_close")]
    public abstract void io_close (
        LibAVFormat.FormatContext? format_context,
        LibAVFormat.IOContext pb
    );

    /***********************************************************
    @brief A callback for closing the streams opened with LibAVFormat.FormatContext.io_open ().

    @param format_context the format context
    @param pb IO context to be closed and freed
    @return 0 on success, a negative AVERROR code on failure
    ***********************************************************/
    [CCode (cname="io_close2")]
    public abstract int io_close2 (
        LibAVFormat.FormatContext? format_context,
        LibAVFormat.IOContext? pb
    );

    /***********************************************************
    ',' separated list of disallowed protocols.
    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="protocol_blacklist")]
    public string protocol_blacklist;

    /***********************************************************
    @brief The maximum number of streams.
    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="max_streams")]
    public int max_streams;

    /***********************************************************
    @brief Skip duration calcuation in estimate_timings_from_pts.
    - encoding: unused
    - decoding: set by user

    @see duration_probesize
    ***********************************************************/
    [CCode (cname="skip_estimate_duration_from_pts")]
    public int skip_estimate_duration_from_pts;

    /***********************************************************
    @brief Maximum number of bytes read from input in order to determine stream durations
    when using estimate_timings_from_pts in avformat_find_stream_info ().
    Demuxing only, set by the caller before avformat_find_stream_info ().
    Can be set to 0 to let avformat choose using a heuristic.

    @see skip_estimate_duration_from_pts
    ***********************************************************/
    [CCode (cname="duration_probesize")]
    public int64 duration_probesize;

    /***********************************************************
    @brief This function will cause global side data to be injected in the next packet
    of each stream as well as after any subsequent seek.
    ***********************************************************/
    [CCode (cname="av_format_inject_global_side_data",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public void av_format_inject_global_side_data (
        LibAVFormat.FormatContext? format_context
    );

    /***********************************************************
    @brief Returns the method used to set format_context.duration.

    @return LibAVFormat.DurationEstimationMethod.FROM_PTS, LibAVFormat.DurationEstimationMethod.FROM_STREAM, or LibAVFormat.DurationEstimationMethod.FROM_BITRATE.
    ***********************************************************/
    [CCode (cname="av_fmt_ctx_get_duration_estimation_method",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVFormat.DurationEstimationMethod av_fmt_ctx_get_duration_estimation_method (
        LibAVFormat.FormatContext? format_context
    );

    /***********************************************************
    @brief Allocate an LibAVFormat.FormatContext.
    avformat_free_context () can be used to free the context and everything
    allocated by the framework within it.
    ***********************************************************/
    [CCode (cname="avformat_alloc_context",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVFormat.FormatContext? avformat_alloc_context ();

    /***********************************************************
    @brief Free an LibAVFormat.FormatContext and all its streams.
    @param format_context context to free
    ***********************************************************/
    [CCode (cname="avformat_free_context",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public void avformat_free_context (
        LibAVFormat.FormatContext? format_context
    );

    /***********************************************************
    @brief Get the LibAVUtil.Log.Class for LibAVFormat.FormatContext. It can be used in combination with
    OptionSearchFlags.FAKE_OBJECT_PARAMETER for examining options.

    @see av_opt_find ().
    ***********************************************************/
    [CCode (cname="avformat_get_class",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVUtil.Log.Class? avformat_get_class ();

    /***********************************************************
    @brief Allocate an LibAVFormat.FormatContext for an output format.
    avformat_free_context () can be used to free the context and
    everything allocated by the framework within it.

    @param format_context is set to the created format context, or to NULL in
    case of failure
    @param oformat format to use for allocating the context, if NULL
    format_name and filename are used instead
    @param format_name the name of output format to use for allocating the
    context, if NULL filename is used instead
    @param filename the name of the filename to use for allocating the
    context, may be NULL
    @return >= 0 in case of success, a negative LibAVUtil.ErrorCode code in case of
    failure
    ***********************************************************/
    [CCode (cname="avformat_alloc_output_context2",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int avformat_alloc_output_context2 (
        out LibAVFormat.FormatContext? format_context,
        LibAVFormat.OutputFormat? oformat,
        string format_name,
        string filename
    );


    /***********************************************************
    @brief Open an input stream and read the header. The codecs are not opened.
    The stream must be closed with avformat_close_input ().

    @param ps Pointer to user-supplied LibAVFormat.FormatContext (allocated by avformat_alloc_context).
              May be a pointer to NULL, in which case an LibAVFormat.FormatContext is allocated by this
              function and written into ps.
              Note that a user-supplied LibAVFormat.FormatContext will be freed on failure.
    @param url URL of the stream to open.
    @param fmt If non-NULL, this parameter forces a specific input format.
               Otherwise the format is autodetected.
    @param options A dictionary filled with LibAVFormat.FormatContext and demuxer-private options.
                    On return this parameter will be destroyed and replaced with a dict containing
                    options that were not found. May be NULL.

    @return 0 on success, a negative LibAVUtil.ErrorCode on failure.

    @note If you want to use custom IO, preallocate the format context and set its pb field.
    ***********************************************************/
    [CCode (cname="avformat_open_input",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int avformat_open_input (
        out LibAVFormat.FormatContext? ps,
        string url,
        LibAVFormat.InputFormat? fmt,
        out LibAVUtil.Dictionary? options
    );

    /***********************************************************
    @brief Read packets of a media file to get stream information. This
    is useful for file formats with no headers such as MPEG. This
    function also computes the real framerate in case of MPEG-2 repeat
    frame mode.
    The logical file position is not changed by this function;
    examined packets may be buffered for later processing.

    @param ic media file handle
    @param options If non-NULL, an ic.nb_streams long array of pointers to
                    dictionaries, where i-th member contains options for
                    codec corresponding to i-th stream.
                    On return each dictionary will be filled with options that were not found.
    @return >=0 if OK, LibAVUtil.ErrorCode.xxx on error

    @note this function isn't guaranteed to open all the codecs, so
          options being non-empty at return is a perfectly normal behavior.

    @todo Let the user decide somehow what information is needed so that
          we do not waste time getting stuff the user does not need.
    ***********************************************************/
    [CCode (cname="avformat_find_stream_info",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int avformat_find_stream_info (
        LibAVFormat.FormatContext? ic,
        out LibAVUtil.Dictionary? options
    );

    /***********************************************************
    @brief Find the programs which belong to a given stream.

    @param ic media file handle
    @param last the last found program, the search will start after this
                 program, or from the beginning if it is NULL
    @param stream_index stream index
    @return the next program which belongs to stream_index, NULL if no program is found or
            the last program is not among the programs of ic.
    ***********************************************************/
    [CCode (cname="av_find_program_from_stream",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVFormat.Program? av_find_program_from_stream (
        LibAVFormat.FormatContext? ic,
        LibAVFormat.Program? last,
        int stream_index
    );

    [CCode (cname="av_program_add_stream_index",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public void av_program_add_stream_index (
        LibAVFormat.FormatContext? ac,
        int progid,
        uint idx
    );


    /***********************************************************
    @brief Find the "best" stream in the file.
    The best stream is determined according to various heuristics as the most
    likely to be what the user expects.
    If the decoder parameter is non-NULL, av_find_best_stream will find the
    default decoder for the stream's codec; streams for which no decoder can
    be found are ignored.

    @param ic media file handle
    @param type stream type: video, audio, subtitles, etc.
    @param wanted_stream_nb user-requested stream number,
                             or -1 for automatic selection
    @param related_stream try to find a stream related (eg. in the same
                             program) to this one, or -1 if none
    @param decoder_ret if non-NULL, returns the decoder for the
                             selected stream
    @param flags flags; none are currently defined
    @return the non-negative stream number in case of success,
             LibAVUtil.ErrorCode.STREAM_NOT_FOUND if no stream with the requested type
             could be found,
             LibAVUtil.ErrorCode.DECODER_NOT_FOUND if streams were found but no decoder
    @note If av_find_best_stream returns successfully and decoder_ret is not
           NULL, then decoder_ret is guaranteed to be set to a valid LibAVCodec.Codec.
    ***********************************************************/
    [CCode (cname="av_find_best_stream",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_find_best_stream (
        LibAVFormat.FormatContext? ic,
        LibAVUtil.MediaType type,
        int wanted_stream_nb,
        int related_stream,
        out LibAVCodec.Codec? decoder_ret,
        int flags
    );

    /***********************************************************
    @brief Return the next frame of a stream.
    This function returns what is stored in the file, and does not validate
    that what is there are valid frames for the decoder. It will split what is
    stored in the file into frames and return one for each call. It will not
    omit invalid data between valid frames so as to give the decoder the maximum
    information possible for decoding.

    If packet.buffer is NULL, then the packet is valid until the next
    av_read_frame () or until avformat_close_input (). Otherwise the packet
    is valid indefinitely. In both cases the packet must be freed with
    av_packet_unref when it is no longer needed. For video, the packet contains
    exactly one frame. For audio, it contains an integer number of frames if each
    frame has a known fixed size (e.g. PCM or ADPCM data). If the audio frames
    have a variable size (e.g. MPEG audio), then it contains one frame.

    packet.pts, packet.dts and packet.duration are always set to correct
    values in LibAVFormat.Stream.time_base units (and guessed if the format cannot
    provide them). packet.pts can be AV_NOPTS_VALUE if the video format
    has B-frames, so it is better to rely on packet.dts if you do not
    decompress the payload.

    @return 0 if OK, < 0 on error or end of file
    ***********************************************************/
    [CCode (cname="av_read_frame",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_read_frame (
        LibAVFormat.FormatContext? format_context,
        LibAVCodec.Packet? packet
    );

    /***********************************************************
    @brief Seek to the keyframe at timestamp.
    'timestamp' in 'stream_index'.

    @param format_context media file handle
    @param stream_index If stream_index is (-1), a default
    stream is selected, and timestamp is automatically converted
    from AV_TIME_BASE units to the stream specific time_base.
    @param timestamp Timestamp in LibAVFormat.Stream.time_base units
           or, if no stream is specified, in AV_TIME_BASE units.
    @param flags flags which select direction and seeking mode
    @return >= 0 on success
    ***********************************************************/
    [CCode (cname="av_seek_frame",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_seek_frame (
        LibAVFormat.FormatContext? format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    /***********************************************************
    @brief Seek to timestamp ts.
    Seeking will be done so that the point from which all active streams
    can be presented successfully will be closest to ts and within min/max_ts.
    Active streams are all streams that have LibAVFormat.Stream.discard < AVDISCARD_ALL.

    If flags contain LibAVFormat.FormatSeekFlags.BYTE, then all timestamps are in bytes and
    are the file position (this may not be supported by all demuxers).
    If flags contain LibAVFormat.FormatSeekFlags.FRAME, then all timestamps are in frames
    in the stream with stream_index (this may not be supported by all demuxers).
    Otherwise all timestamps are in units of the stream selected by stream_index
    or if stream_index is -1, in AV_TIME_BASE units.
    If flags contain LibAVFormat.FormatSeekFlags.ANY, then non-keyframes are treated as
    keyframes (this may not be supported by all demuxers).
    If flags contain LibAVFormat.FormatSeekFlags.BACKWARD, it is ignored.

    @param format_context media file handle
    @param stream_index index of the stream which is used as time base reference
    @param min_ts smallest acceptable timestamp
    @param ts target timestamp
    @param max_ts largest acceptable timestamp
    @param flags flags
    @return >=0 on success, error code otherwise

    @note This is part of the new seek API which is still under construction.
          Thus do not use this yet. It may change at any time, do not expect
          ABI compatibility yet!
    ***********************************************************/
    [CCode (cname="avformat_seek_file",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int avformat_seek_file (
        LibAVFormat.FormatContext? format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        LibAVFormat.FormatSeekFlags flags
    );

    /***********************************************************
    @brief Discard all internally buffered data. This can be useful when dealing with
    discontinuities in the byte stream. Generally works only with formats that
    can resync. This includes headerless formats like MPEG-TS/TS but should also
    work with NUT, Ogg and in a limited way AVI for example.

    The set of streams, the detected duration, stream parameters and codecs do
    not change when calling this function. If you want a complete reset, it's
    better to open a new LibAVFormat.FormatContext.

    This does not flush the LibAVFormat.IOContext (format_context.pb). If necessary, call
    avio_flush (format_context.pb) before calling this function.

    @param format_context media file handle
    @return >=0 on success, error code otherwise
    ***********************************************************/
    [CCode (cname="avformat_flush",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int avformat_flush (
        LibAVFormat.FormatContext? format_context
    );

    /***********************************************************
    @brief Start playing a network-based stream (e.g. RTSP stream) at the
    current position.
    ***********************************************************/
    [CCode (cname="av_read_play",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_read_play (
        LibAVFormat.FormatContext? format_context
    );

    /***********************************************************
    @brief Pause a network-based stream (e.g. RTSP stream).

    Use av_read_play () to resume it.
    ***********************************************************/
    [CCode (cname="av_read_pause",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_read_pause (
        LibAVFormat.FormatContext? format_context
    );

    /***********************************************************
    @brief Close an opened input LibAVFormat.FormatContext. Free it and all its contents
    and set format_context to NULL.
    ***********************************************************/
    [CCode (cname="avformat_close_input",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public void avformat_close_input (
        out LibAVFormat.FormatContext? format_context
    );

    /***********************************************************
    @addtogroup lavf_encoding
    @{
    ***********************************************************/

    /***********************************************************
    @brief Allocate the stream private data and write the stream header to
    an output media file.

    @param format_context Media file handle, must be allocated with avformat_alloc_context ().
             Its oformat field must be set to the desired output format;
             Its pb field must be set to an already opened LibAVFormat.IOContext.
    @param options An LibAVUtil.Dictionary filled with LibAVFormat.FormatContext and muxer-private options.
                    On return this parameter will be destroyed and replaced with a dict containing
                    options that were not found. May be NULL.

    @return LibAVFormat.FormatStreamInitializationFlags.WRITE_HEADER on success if the codec had not already been fully initialized in avformat_init,
            LibAVFormat.FormatStreamInitializationFlags.INIT_OUTPUT on success if the codec had already been fully initialized in avformat_init,
            negative LibAVUtil.ErrorCode on failure.

    @see av_opt_find, av_dict_set, avio_open, av_oformat_next, avformat_init_output.
    ***********************************************************/
    //  av_warn_unused_result
    [CCode (cname="avformat_write_header",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int avformat_write_header (
        LibAVFormat.FormatContext? format_context,
        ref LibAVUtil.Dictionary? options
    );

    /***********************************************************
    @brief Allocate the stream private data and initialize the codec, but do not write the header.
    May optionally be used before avformat_write_header to initialize stream parameters
    before actually writing the header.
    If using this function, do not pass the same options to avformat_write_header.

    @param format_context Media file handle, must be allocated with avformat_alloc_context ().
             Its oformat field must be set to the desired output format;
             Its pb field must be set to an already opened LibAVFormat.IOContext.
    @param options An LibAVUtil.Dictionary filled with LibAVFormat.FormatContext and muxer-private options.
                    On return this parameter will be destroyed and replaced with a dict containing
                    options that were not found. May be NULL.

    @return LibAVFormat.FormatStreamInitializationFlags.WRITE_HEADER on success if the codec requires avformat_write_header to fully initialize,
            LibAVFormat.FormatStreamInitializationFlags.INIT_OUTPUT on success if the codec has been fully initialized,
            negative LibAVUtil.ErrorCode on failure.

    @see av_opt_find, av_dict_set, avio_open, av_oformat_next, avformat_write_header.
    ***********************************************************/
    //  av_warn_unused_result
    [CCode (cname="avformat_init_output",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int avformat_init_output (
        LibAVFormat.FormatContext? format_context,
        ref LibAVUtil.Dictionary? options
    );

    /***********************************************************
    @brief Write a packet to an output media file.

    This function passes the packet directly to the muxer, without any buffering
    or reordering. The caller is responsible for correctly interleaving the
    packets if the format requires it. Callers that want libavformat to handle
    the interleaving should call av_interleaved_write_frame () instead of this
    function.

    @param format_context media file handle
    @param packet The packet containing the data to be written. Note that unlike
               av_interleaved_write_frame (), this function does not take
               ownership of the packet passed to it (though some muxers may make
               an internal reference to the input packet).
               <br>
               This parameter can be NULL (at any time, not just at the end), in
               order to immediately flush data buffered within the muxer, for
               muxers that buffer up data internally before writing it to the
               output.
               <br>
               Packet's @ref LibAVCodec.Packet.stream_index "stream_index" field must be
               set to the index of the corresponding stream in @ref
               LibAVFormat.FormatContext.streams "format_context.streams".
               <br>
               The timestamps (@ref LibAVCodec.Packet.pts "pts", @ref LibAVCodec.Packet.dts "dts")
               must be set to correct values in the stream's timebase (unless the
               output format is flagged with the LibAVFormat.FormatFlags1.NO_TIMESTAMPS flag, then
               they can be set to AV_NOPTS_VALUE).
               The dts for subsequent packets passed to this function must be strictly
               increasing when compared in their respective timebases (unless the
               output format is flagged with the LibAVFormat.FormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS, then they
               merely have to be nondecreasing).  @ref LibAVCodec.Packet.duration
               "duration") should also be set if known.
    @return < 0 on error, = 0 if OK, 1 if flushed and there is no more data to flush

    @see av_interleaved_write_frame ()
    ***********************************************************/
    [CCode (cname="av_write_frame",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_write_frame (
        LibAVFormat.FormatContext? format_context,
        LibAVCodec.Packet? packet
    );

    /***********************************************************
    @brief Write a packet to an output media file ensuring correct interleaving.

    This function will buffer the packets internally as needed to make sure the
    packets in the output file are properly interleaved in the order of
    increasing dts. Callers doing their own interleaving should call
    av_write_frame () instead of this function.

    Using this function instead of av_write_frame () can give muxers advance
    knowledge of future packets, improving e.g. the behaviour of the mp4
    muxer for VFR content in fragmenting mode.

    @param format_context media file handle
    @param packet The packet containing the data to be written.
               <br>
               If the packet is reference-counted, this function will take
               ownership of this reference and unreference it later when it sees
               fit.
               The caller must not access the data through this reference after
               this function returns. If the packet is not reference-counted,
               libavformat will make a copy.
               <br>
               This parameter can be NULL (at any time, not just at the end), to
               flush the interleaving queues.
               <br>
               Packet's @ref LibAVCodec.Packet.stream_index "stream_index" field must be
               set to the index of the corresponding stream in @ref
               LibAVFormat.FormatContext.streams "format_context.streams".
               <br>
               The timestamps (@ref LibAVCodec.Packet.pts "pts", @ref LibAVCodec.Packet.dts "dts")
               must be set to correct values in the stream's timebase (unless the
               output format is flagged with the LibAVFormat.FormatFlags1.NO_TIMESTAMPS flag, then
               they can be set to AV_NOPTS_VALUE).
               The dts for subsequent packets in one stream must be strictly
               increasing (unless the output format is flagged with the
               LibAVFormat.FormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS, then they merely have to be nondecreasing).
               @ref LibAVCodec.Packet.duration "duration") should also be set if known.

    @return 0 on success, a negative LibAVUtil.ErrorCode on error. Libavformat will always
            take care of freeing the packet, even if this function fails.

    @see av_write_frame (), LibAVFormat.FormatContext.max_interleave_delta
    ***********************************************************/
    [CCode (cname="av_interleaved_write_frame",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_interleaved_write_frame (
        LibAVFormat.FormatContext? format_context,
        LibAVCodec.Packet? packet
    );

    /***********************************************************
    @brief Write an uncoded frame to an output media file.

    The frame must be correctly interleaved according to the container
    specification; if not, then av_interleaved_write_frame () must be used.

    See av_interleaved_write_frame () for details.
    ***********************************************************/
    [CCode (cname="av_write_uncoded_frame",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_write_uncoded_frame (
        LibAVFormat.FormatContext? format_context,
        int stream_index,
        LibAVUtil.Frame? frame
    );

    /***********************************************************
    @brief Write an uncoded frame to an output media file.

    If the muxer supports it, this function makes it possible to write an LibAVUtil.Frame
    structure directly, without encoding it into a packet.
    It is mostly useful for devices and similar special muxers that use raw
    video or PCM data and will not serialize it into a byte stream.

    To test whether it is possible to use it with a given muxer and stream,
    use av_write_uncoded_frame_query ().

    The caller gives up ownership of the frame and must not access it
    afterwards.

    @return  >=0 for success, a negative code on error
    ***********************************************************/
    [CCode (cname="av_interleaved_write_uncoded_frame",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_interleaved_write_uncoded_frame (
        LibAVFormat.FormatContext? format_context,
        int stream_index,
        LibAVUtil.Frame? frame
    );

    /***********************************************************
    @brief Test whether a muxer supports uncoded frame.

    @return  >=0 if an uncoded frame can be written to that muxer and stream,
             <0 if not
    ***********************************************************/
    [CCode (cname="av_write_uncoded_frame_query",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_write_uncoded_frame_query (
        LibAVFormat.FormatContext? format_context,
        int stream_index
    );

    /***********************************************************
    @brief Write the stream trailer to an output media file and free the
    file private data.

    May only be called after a successful call to avformat_write_header.

    @param format_context media file handle
    @return 0 if OK, LibAVUtil.ErrorCode.xxx on error
    ***********************************************************/
    [CCode (cname="av_write_trailer",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_write_trailer (
        LibAVFormat.FormatContext? format_context
    );

    /***********************************************************
    @brief Get timing information for the data currently output.
    The exact meaning of "currently output" depends on the format.
    It is mostly relevant for devices that have an internal buffer and/or
    work in real time.
    @param format_context media file handle
    @param stream stream in the media file
    @param[out] dts DTS of the last packet output for the stream, in stream
                      time_base units
    @param[out] wall absolute time when that packet whas output,
                      in microsecond
    @return 0 if OK, LibAVUtil.ErrorCode (ENOSYS) if the format does not support it
    Note: some formats or devices may not allow to measure dts and wall
    atomically.
    ***********************************************************/
    [CCode (cname="av_get_output_timestamp",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_get_output_timestamp (
        LibAVFormat.FormatContext? format_context,
        int stream,
        out int64 dts,
        out int64 wall
    );

    [CCode (cname="av_find_default_stream_index",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_find_default_stream_index (
        LibAVFormat.FormatContext? format_context
    );

    /***********************************************************
    @brief Print detailed information about the input or output format, such as
    duration, bitrate, streams, container, programs, metadata, side data,
    codec and time base.

    @param ic the context to analyze
    @param index index of the stream to dump information about
    @param url the URL to print, such as source or destination file
    @param is_output Select whether the specified context is an input (0) or output (1)
    ***********************************************************/
    [CCode (cname="av_dump_format",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public void av_dump_format (
        LibAVFormat.FormatContext? ic,
        int index,
        string url,
        int is_output
    );

    /***********************************************************
    @brief Guess the sample aspect ratio of a frame, based on both the stream and the
    frame aspect ratio.

    Since the frame aspect ratio is set by the codec but the stream aspect ratio
    is set by the demuxer, these two may not be equal. This function tries to
    return the value that you should use if you would like to display the frame.

    Basic logic is to use the stream aspect ratio if it is set to something sane
    otherwise use the frame aspect ratio. This way a container setting, which is
    usually easy to modify can override the coded value in the frames.

    @param format the format context which the stream is part of
    @param stream the stream which the frame is part of
    @param frame the frame with the aspect ratio to be determined
    @return the guessed (valid) sample_aspect_ratio, 0/1 if no idea
    ***********************************************************/
    [CCode (cname="av_guess_sample_aspect_ratio",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVUtil.Rational av_guess_sample_aspect_ratio (
        LibAVFormat.FormatContext? format,
        LibAVFormat.Stream? stream,
        LibAVUtil.Frame? frame
    );

    /***********************************************************
    @brief Guess the frame rate, based on both the container and codec information.

    @param format_context the format context which the stream is part of
    @param stream the stream which the frame is part of
    @param frame the frame for which the frame rate should be determined, may be NULL
    @return the guessed (valid) frame rate, 0/1 if no idea
    ***********************************************************/
    [CCode (cname="av_guess_frame_rate",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVUtil.Rational av_guess_frame_rate (
        LibAVFormat.FormatContext? format_context,
        LibAVFormat.Stream? stream,
        LibAVUtil.Frame? frame
    );

    /***********************************************************
    @brief Check if the stream st contained in format_context is matched by the stream specifier
    spec.

    See the "stream specifiers" chapter in the documentation for the syntax
    of spec.

    @return  >0 if st is matched by spec;
             0 if st is not matched by spec;
             LibAVUtil.ErrorCode code if spec is invalid

    @note A stream specifier can match several streams in the format.
    ***********************************************************/
    [CCode (cname="avformat_match_stream_specifier",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int avformat_match_stream_specifier (
        LibAVFormat.FormatContext? format_context,
        LibAVFormat.Stream? st,
        string spec
    );

    [CCode (cname="avformat_queue_attached_pictures",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int avformat_queue_attached_pictures (
        LibAVFormat.FormatContext? format_context
    );

    /***********************************************************
    Send a command to the demuxer

    Sends the specified command and (depending on the command)
    optionally a command-specific payload to the demuxer to handle.

    @param format_context     Format context, must be allocated with
                ::avformat_alloc_context.
    @param id    Identifier of type ::LibAVFormat.FormatCommandID,
                indicating the command to send.
    @param data  Command-specific data, allocated by the caller
                and ownership remains with the caller.
                For details what is expected here, consult the
                documentation of the respective ::LibAVFormat.FormatCommandID.
    ***********************************************************/
    [CCode (cname="avformat_send_command",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public static int avformat_send_command (
        LibAVFormat.FormatContext? format_context,
        LibAVFormat.FormatCommandID id,
        void *data
    );








    /***********************************************************
    Receive a command reply from the demuxer

    Retrieves a reply for a previously sent command from the muxer.

    @param format_context         Format context, must be allocated with
                    ::avformat_alloc_context.
    @param id        Identifier of type ::LibAVFormat.FormatCommandID,
                    indicating the command for which to retrieve
                    the reply.
    @param data_out  Pointee is set to the command reply, the actual
                    type depends on the command. This is allocated by
                    the muxer and must be freed with ::av_free.
                    For details on the actual data set here, consult the
                    documentation of the respective ::LibAVFormat.FormatCommandID.
    ***********************************************************/
    [CCode (cname="avformat_receive_command_reply",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public static int avformat_receive_command_reply (
        LibAVFormat.FormatContext? format_context,
        LibAVFormat.FormatCommandID id,
        out void *data_out
    );

    /***********************************************************
    @}
    ***********************************************************/

}

} // namespace LibAVFormat
