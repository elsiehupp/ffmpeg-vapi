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
@brief Stream structure.
New fields can be added to the end with minor version bumps.
Removal, reordering and changes to existing fields require a major
version bump.
sizeof (LibAVFormat.Stream) must not be used outside libav*.
***********************************************************/
[CCode (cname="struct AVStream",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.Stream {
    /***********************************************************
    @brief Stream index in LibAVFormat.FormatContext
    ***********************************************************/
    [CCode (cname="")]
    public int index;

    /***********************************************************
    @brief Format-specific stream ID.

    - decoding: set by libavformat
    - encoding: set by the user, replaced by libavformat if left unset
    ***********************************************************/
    [CCode (cname="")]
    public int id;

    [CCode (cname="")]
    public void *priv_data;

    /***********************************************************
    @brief This is the fundamental unit of time (in seconds) in terms
    of which frame timestamps are represented.

    decoding: set by libavformat
    encoding: May be set by the caller before avformat_write_header () to
              provide a hint to the muxer about the desired timebase. In
              avformat_write_header (), the muxer will overwrite this field
              with the timebase that will actually be used for the timestamps
              written into the file (which may or may not be related to the
              user-provided one, depending on the format).
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Rational time_base;

    /***********************************************************
    @brief Decoding: pts of the first frame of the stream in presentation order, in stream time base.
    Only set this if you are absolutely 100% sure that the value you set
    it to really is the pts of the first frame.
    This may be undefined (AV_NOPTS_VALUE).
    @note The ASF header does NOT contain a correct start_time the ASF
    demuxer must NOT set this.
    ***********************************************************/
    [CCode (cname="")]
    public int64 start_time;

    /***********************************************************
    @brief Decoding: duration of the stream, in stream time base.
    If a source file does not specify a duration, but does specify
    a bitrate, this value will be estimated from bitrate and file size.

    Encoding: May be set by the caller before avformat_write_header () to
    provide a hint to the muxer about the estimated duration.
    ***********************************************************/
    [CCode (cname="")]
    public int64 duration;

    /***********************************************************
    @brief Number of frames in this stream if known or 0
    ***********************************************************/
    [CCode (cname="")]
    public int64 nb_frames;

    /***********************************************************
    @brief LibAVFormat.DispositionFlags bit field
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.DispositionFlags disposition;

    /***********************************************************
    @brief Selects which packets can be discarded at will and do not need to be demuxed.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVCodec.Discard discard;

    /***********************************************************
    @brief Sample aspect ratio (0 if unknown)

    - encoding: Set by user.
    - decoding: Set by libavformat.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Rational sample_aspect_ratio;

    [CCode (cname="")]
    public LibAVUtil.Dictionary metadata;

    /***********************************************************
    @brief Average framerate

    - demuxing: May be set by libavformat when creating the stream or in
                avformat_find_stream_info ().
    - muxing: May be set by the caller before avformat_write_header ().
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Rational avg_frame_rate;

    /***********************************************************
    @brief For streams with LibAVFormat.DispositionFlags.ATTACHED_PIC disposition, this packet
    will contain the attached picture.

    decoding: set by libavformat, must not be modified by the caller.
    encoding: unused
    ***********************************************************/
    [CCode (cname="")]
    public LibAVCodec.Packet attached_pic;

    /***********************************************************
    @brief An array of side data that applies to the whole stream (i.e. the
    container does not allow it to change between packets).

    There may be no overlap between the side data in this array and side data
    in the packets. I.e. a given side data is either exported by the muxer
    (demuxing) / set by the caller (muxing) in this array, then it never
    appears in the packets, or the side data is exported / sent through
    the packets (always in the first packet where the value becomes known or
    changes), then it does not appear in this array.

    - demuxing: Set by libavformat when the stream is created.
    - muxing: May be set by the caller before avformat_write_header ().

    Freed by libavformat in avformat_free_context ().

    @see av_format_inject_global_side_data ()
    ***********************************************************/
    [CCode (cname="")]
    public LibAVCodec.PacketSideData[] side_data;

    /***********************************************************
    @brief The number of elements in the LibAVFormat.Stream.side_data array.
    ***********************************************************/
    [CCode (cname="")]
    public int nb_side_data;

    /***********************************************************
    @brief Flags for the user to detect events happening on the stream. Flags must
    be cleared by the user once the event has been handled.
    A combination of LibAVFormat.FormatStreamEventFlags.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.FormatStreamEventFlags event_flags;

    /***********************************************************
    @brief Real base framerate of the stream.
    This is the lowest framerate with which all timestamps can be
    represented accurately (it is the least common multiple of all
    framerates in the stream). Note, this value is just a guess!
    For example, if the time base is 1/90000 and all frames have either
    approximately 3600 or 1800 timer ticks, then r_frame_rate will be 50/1.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Rational r_frame_rate;

    /***********************************************************
    @brief Codec parameters associated with this stream. Allocated and freed by
    libavformat in avformat_new_stream () and avformat_free_context ()
    respectively.

    - demuxing: filled by libavformat on stream creation or in
                avformat_find_stream_info ()
    - muxing: filled by the caller before avformat_write_header ()
    ***********************************************************/
    [CCode (cname="")]
    public LibAVCodec.CodecParameters codecpar;

    //  /***********************************************************
    //  All fields below this line are not part of the public API. They
    //  may not be used outside of libavformat and can be changed and
    //  removed at will.
    //  Internal note: be aware that physically removing these fields
    //  will break ABI. Replace removed fields with dummy fields, and
    //  add new fields to AVStreamInternal.
    //  ***********************************************************/

    //  /***********************************************************
    //  Stream information used internally by avformat_find_stream_info ()
    //  ***********************************************************/
    //  public public struct StreamInfo {
    //      public int64 last_dts;

    //      public int64 duration_gcd;

    //      public int duration_count;

    //      public int64 rfps_duration_sum;

    //      public public const int MAX_STD_TIMEBASES;

    //      public double duration_error)[2][MAX_STD_TIMEBASES];

    //      public int64 codec_info_duration;

    //      public int64 codec_info_duration_fields;

    //      public int frame_delay_evidence;

    //      /***********************************************************
    //      0 -> decoder has not been searched for yet.
    //      >0 -> decoder found
    //      <0 -> decoder with codec_id == -found_decoder has not been found
    //      ***********************************************************/
    //      public int found_decoder;

    //      public int64 last_duration;

    //      /***********************************************************
    //      Those are used for average framerate estimation.
    //      ***********************************************************/
    //      public int64 fps_first_dts;

    //      public int fps_first_dts_idx;

    //      public int64 fps_last_dts;

    //      public int fps_last_dts_idx;

    //  }
    //  /***********************************************************
    //  Stream information used internally by avformat_find_stream_info ()
    //  ***********************************************************/
    //  public StreamInfo info;

    //  /***********************************************************
    //  number of bits in pts (used for wrapping control)
    //  ***********************************************************/
    //  public int pts_wrap_bits;

    //  // Timestamp generation support:
    //  /***********************************************************
    //  Timestamp corresponding to the last dts sync point.

    //  Initialized when LibAVCodec.CodecParserContext.dts_sync_point >= 0 and
    //  a DTS is received from the underlying container. Otherwise set to
    //  AV_NOPTS_VALUE by default.
    //  ***********************************************************/
    //  public int64 first_dts;

    //  public int64 cur_dts;

    //  public int64 last_IP_pts;

    //  public int last_IP_duration;

    //  /***********************************************************
    //  Number of packets to buffer for codec probing
    //  ***********************************************************/
    //  public int probe_packets;

    //  /***********************************************************
    //  Number of frames that have been demuxed during avformat_find_stream_info ()
    //  ***********************************************************/
    //  public int codec_info_nb_frames;

    //  /***********************************************************
    //  av_read_frame () support
    //  ***********************************************************/
    //  public abstract LibAVFormat.StreamParseType need_parsing { public get; }
    //  public LibAVCodec.CodecParserContext parser;

    //  /***********************************************************
    //  last packet in packet_buffer for this stream when muxing.
    //  ***********************************************************/
    //  public LibAVFormat.PacketList last_in_packet_buffer;

    //  public LibAVFormat.ProbeData probe_data;

    //  public const int MAX_REORDER_DELAY;

    //  public int64 pts_buffer[MAX_REORDER_DELAY+1];

    //  /***********************************************************
    //  Only used if the format does not support seeking natively.
    //  ***********************************************************/
    //  public LibAVFormat.IndexEntry[] index_entries;

    //  public int nb_index_entries;

    //  public uint index_entries_allocated_size;

    //  /***********************************************************
    //  Stream Identifier
    //  This is the MPEG-TS stream identifier +1
    //  0 means unknown
    //  ***********************************************************/
    //  public int stream_identifier;

    //  /***********************************************************
    //  Details of the MPEG-TS program which created this stream.
    //  ***********************************************************/
    //  public int program_num;

    //  public int pmt_version;

    //  public int pmt_stream_idx;

    //  public int64 interleaver_chunk_size;

    //  public int64 interleaver_chunk_duration;

    //  /***********************************************************
    //  stream probing state
    //  -1 -> probing finished
    //   0 -> no probing requested
    //  rest -> perform probing with request_probe being the minimum score to accept.
    //  NOT PART OF PUBLIC API
    //  ***********************************************************/
    //  public int request_probe;

    //  /***********************************************************
    //  Indicates that everything up to the next keyframe
    //  should be discarded.
    //  ***********************************************************/
    //  public int skip_to_keyframe;

    //  /***********************************************************
    //  Number of samples to skip at the start of the frame decoded from the next packet.
    //  ***********************************************************/
    //  public int skip_samples;

    //  /***********************************************************
    //  If not 0, the number of samples that should be skipped from the start of
    //  the stream (the samples are removed from packets with pts==0, which also
    //  assumes negative timestamps do not happen).
    //  Intended for use with formats such as mp3 with ad-hoc gapless audio
    //  support.
    //  ***********************************************************/
    //  public int64 start_skip_samples;

    //  /***********************************************************
    //  If not 0, the first audio sample that should be discarded from the stream.
    //  This is broken by design (needs global sample count), but can't be
    //  avoided for broken by design formats such as mp3 with ad-hoc gapless
    //  audio support.
    //  ***********************************************************/
    //  public int64 first_discard_sample;

    //  /***********************************************************
    //  The sample after last sample that is intended to be discarded after
    //  first_discard_sample. Works on frame boundaries only. Used to prevent
    //  early EOF if the gapless info is broken (considered concatenated mp3s).
    //  ***********************************************************/
    //  public int64 last_discard_sample;

    //  /***********************************************************
    //  Number of internally decoded frames, used internally in libavformat, do not access
    //  its lifetime differs from info which is why it is not in that structure.
    //  ***********************************************************/
    //  public int nb_decoded_frames;

    //  /***********************************************************
    //  Timestamp offset added to timestamps before muxing
    //  NOT PART OF PUBLIC API
    //  ***********************************************************/
    //  public int64 mux_ts_offset;

    //  /***********************************************************
    //  Internal data to check for wrapping of the time stamp
    //  ***********************************************************/
    //  public int64 pts_wrap_reference;

    //  /***********************************************************
    //  Options for behavior, when a wrap is detected.

    //  Defined by LibAVFormat.FormatParseTimestampWrapDetection. values.

    //  If correction is enabled, there are two possibilities:
    //  If the first time stamp is near the wrap point, the wrap offset
    //  will be subtracted, which will create negative time stamps.
    //  Otherwise the offset will be added.
    //  ***********************************************************/
    //  public LibAVFormat.FormatParseTimestampWrapDetection pts_wrap_behavior;

    //  /***********************************************************
    //  Internal data to prevent doing update_initial_durations () twice
    //  ***********************************************************/
    //  public int update_initial_durations_done;

    //  /***********************************************************
    //  Internal data to generate dts from pts
    //  ***********************************************************/
    //  public int64 pts_reorder_error[MAX_REORDER_DELAY+1];

    //  public uint8 pts_reorder_error_count[MAX_REORDER_DELAY+1];

    //  /***********************************************************
    //  Internal data to analyze DTS and detect faulty mpeg streams
    //  ***********************************************************/
    //  public int64 last_dts_for_order_check;

    //  public uint8 dts_ordered;

    //  public uint8 dts_misordered;

    //  /***********************************************************
    //  Internal data to inject global side data
    //  ***********************************************************/
    //  public int inject_global_side_data;

    //  /***********************************************************
    //  display aspect ratio (0 if unknown)
    //  - encoding: unused
    //  - decoding: Set by libavformat to calculate sample_aspect_ratio internally
    //  ***********************************************************/
    //  public LibAVUtil.Rational display_aspect_ratio;

    //  /***********************************************************
    //  An opaque field for libavformat internal usage.
    //  Must not be accessed in any way by callers.
    //  ***********************************************************/
    //  public AVStreamInternal internal;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVCodec.CodecParserContext? av_stream_get_parser (
        LibAVFormat.Stream? stream
    );

    /***********************************************************
    @brief Returns the pts of the last muxed packet + its duration

    the retuned value is undefined when used with a demuxer.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int64 av_stream_get_end_pts (
        LibAVFormat.Stream stream
    );

    /***********************************************************
    @defgroup lavf_core Core functions
    @ingroup libavf

    Functions for querying libavformat capabilities, allocating core structures,
    etc.
    @{
    ***********************************************************/

    /***********************************************************
    @brief Add a new stream to a media file.

    When demuxing, it is called by the demuxer in read_header (). If the
    flag LibAVFormat.FormatContextFlags.NO_HEADER is set in format_context.ctx_flags, then it may also
    be called in read_packet ().

    When muxing, should be called by the user before avformat_write_header ().

    User is required to call avcodec_close () and avformat_free_context () to
    clean up the allocation by avformat_new_stream ().

    @param format_context media file handle
    @param codec If non-NULL, the LibAVCodec.CodecContext corresponding to the new stream
    will be initialized to use this codec. This is needed for e.g. codec-specific
    defaults to be set, so codec should be provided if it is known.

    @return newly created stream or NULL on error.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVFormat.Stream? avformat_new_stream (
        LibAVFormat.FormatContext? format_context,
        LibAVCodec.Codec? codec
    );

    /***********************************************************
    @}
    ***********************************************************/

    /***********************************************************
    @brief Get the index for a specific timestamp.

    @param stream stream that the timestamp belongs to
    @param timestamp timestamp to retrieve the index for
    @param flags if LibAVFormat.FormatSeekFlags.BACKWARD then the returned index will correspond
                    to the timestamp which is <= the requested one, if backward
                    is 0, then it will be >=
                 if LibAVFormat.FormatSeekFlags.ANY seek to any frame, only keyframes otherwise
    @return < 0 if no such timestamp could be found
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_index_search_timestamp (
        LibAVFormat.Stream? stream,
        int64 timestamp,
        LibAVFormat.FormatSeekFlags flags
    );

    /***********************************************************
    @brief Add an index entry into a sorted list. Update the entry if the list
    already contains it.

    @param timestamp timestamp in the time base of the given stream
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_add_index_entry (
        LibAVFormat.Stream? stream,
        int64 pos,
        int64 timestamp,
        int size,
        int distance,
        int flags
    );

    /***********************************************************
    @brief Send a nice dump of a packet to the specified file stream.

    @param file The file stream pointer where the dump should be sent to.
    @param packet packet to dump
    @param dump_payload True if the payload must be displayed, too.
    @param stream LibAVFormat.Stream that the packet belongs to
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public void av_pkt_dump2 (
        GLib.File? file,
        LibAVCodec.Packet? packet,
        int dump_payload,
        LibAVFormat.Stream? stream
    );


    /***********************************************************
    @brief Send a nice dump of a packet to the log.

    @param avcl A pointer to an arbitrary struct of which the first field is a
    pointer to an LibAVUtil.Log.Class struct.
    @param level The importance level of the message, lower values signifying
    higher importance.
    @param packet packet to dump
    @param dump_payload True if the payload must be displayed, too.
    @param stream LibAVFormat.Stream that the packet belongs to
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public void av_pkt_dump_log2 (
        void *avcl,
        int level,
        LibAVCodec.Packet? packet,
        int dump_payload,
        LibAVFormat.Stream? stream
    );

    /***********************************************************
    @brief Get the internal codec timebase from a stream.

    @param stream input stream to extract the timebase from
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVUtil.Rational av_stream_get_codec_timebase (
        LibAVFormat.Stream? stream
    );

}

} // namespace LibAVFormat

/***********************************************************
Stream structure.
New fields can be added to the end with minor version bumps.
Removal, reordering and changes to existing fields require a major
version bump.
sizeof (LibAVFormat.Stream) must not be used outside libav*.
***********************************************************/
typedef struct LibAVFormat.Stream {
    /***********************************************************
    A class for @ref avoptions. Set on stream creation.
    ***********************************************************/
    public LibAVUtil.Log.Class? av_class;

    int index;    /**< stream index in LibAVFormat.FormatContext */
    /***********************************************************
    Format-specific stream ID.
    decoding: set by libavformat
    encoding: set by the user, replaced by libavformat if left unset
    ***********************************************************/
    int id;

    /***********************************************************
    Codec parameters associated with this stream. Allocated and freed by
    libavformat in avformat_new_stream () and avformat_free_context ()
    respectively.

    - demuxing: filled by libavformat on stream creation or in
                avformat_find_stream_info ()
    - muxing: filled by the caller before avformat_write_header ()
    ***********************************************************/
    LibAVCodec.CodecParameters *codecpar;

    void *priv_data;

    /***********************************************************
    This is the fundamental unit of time (in seconds) in terms
    of which frame timestamps are represented.

    decoding: set by libavformat
    encoding: May be set by the caller before avformat_write_header () to
              provide a hint to the muxer about the desired timebase. In
              avformat_write_header (), the muxer will overwrite this field
              with the timebase that will actually be used for the timestamps
              written into the file (which may or may not be related to the
              user-provided one, depending on the format).
    ***********************************************************/
    LibAVUtil.Rational time_base;

    /***********************************************************
    Decoding: pts of the first frame of the stream in presentation order, in stream time base.
    Only set this if you are absolutely 100% sure that the value you set
    it to really is the pts of the first frame.
    This may be undefined (AV_NOPTS_VALUE).
    @note The ASF header does NOT contain a correct start_time the ASF
    demuxer must NOT set this.
    ***********************************************************/
    int64_t start_time;

    /***********************************************************
    Decoding: duration of the stream, in stream time base.
    If a source file does not specify a duration, but does specify
    a bitrate, this value will be estimated from bitrate and file size.

    Encoding: May be set by the caller before avformat_write_header () to
    provide a hint to the muxer about the estimated duration.
    ***********************************************************/
    int64_t duration;

    int64_t nb_frames;                 ///< number of frames in this stream if known or 0

    /***********************************************************
    Stream disposition - a combination of LibAVFormat.DispositionFlags flags.
    - demuxing: set by libavformat when creating the stream or in
                avformat_find_stream_info ().
    - muxing: may be set by the caller before avformat_write_header ().
    ***********************************************************/
    LibAVFormat.DispositionFlags disposition;

    enum AVDiscard discard; ///< Selects which packets can be discarded at will and do not need to be demuxed.

    /***********************************************************
    sample aspect ratio (0 if unknown)
    - encoding: Set by user.
    - decoding: Set by libavformat.
    ***********************************************************/
    LibAVUtil.Rational sample_aspect_ratio;

    LibAVUtil.Dictionary *metadata;

    /***********************************************************
    Average framerate

    - demuxing: May be set by libavformat when creating the stream or in
                avformat_find_stream_info ().
    - muxing: May be set by the caller before avformat_write_header ().
    ***********************************************************/
    LibAVUtil.Rational avg_frame_rate;

    /***********************************************************
    For streams with LibAVFormat.DispositionFlags.ATTACHED_PIC disposition, this packet
    will contain the attached picture.

    decoding: set by libavformat, must not be modified by the caller.
    encoding: unused
    ***********************************************************/
    LibAVCodec.Packet attached_pic;

    /***********************************************************
    Flags indicating events happening on the stream, a combination of
    LibAVFormat.FormatStreamEventFlags.

    - demuxing: may be set by the demuxer in avformat_open_input (),
      avformat_find_stream_info () and av_read_frame (). Flags must be cleared
      by the user once the event has been handled.
    - muxing: may be set by the user after avformat_write_header (). to
      indicate a user-triggered event.  The muxer will clear the flags for
      events it has handled in av_[interleaved]_write_frame ().
    ***********************************************************/
    LibAVFormat.FormatStreamEventFlags event_flags;

    /***********************************************************
    Real base framerate of the stream.
    This is the lowest framerate with which all timestamps can be
    represented accurately (it is the least common multiple of all
    framerates in the stream). Note, this value is just a guess!
    For example, if the time base is 1/90000 and all frames have either
    approximately 3600 or 1800 timer ticks, then r_frame_rate will be 50/1.
    ***********************************************************/
    LibAVUtil.Rational r_frame_rate;

    /***********************************************************
    Number of bits in timestamps. Used for wrapping control.

    - demuxing: set by libavformat
    - muxing: set by libavformat

    ***********************************************************/
    int pts_wrap_bits;
} LibAVFormat.Stream;

/***********************************************************
@defgroup lavf_core Core functions
@ingroup libavf

Functions for querying libavformat capabilities, allocating core structures,
etc.
@{
***********************************************************/

/***********************************************************
Get the LibAVUtil.Log.Class for LibAVFormat.Stream. It can be used in combination with
AV_OPT_SEARCH_FAKE_OBJ for examining options.

@see av_opt_find ().
***********************************************************/
public static LibAVUtil.Log.Class? av_stream_get_class ();

/***********************************************************
@}
***********************************************************/

/***********************************************************
@defgroup lavf_core Core functions
@ingroup libavf

Functions for querying libavformat capabilities, allocating core structures,
etc.
@{
***********************************************************/


/***********************************************************
Add a new stream to a media file.

When demuxing, it is called by the demuxer in read_header (). If the
flag LibAVFormat.FormatContextFlags.NO_HEADER is set in s.ctx_flags, then it may also
be called in read_packet ().

When muxing, should be called by the user before avformat_write_header ().

User is required to call avformat_free_context () to clean up the allocation
by avformat_new_stream ().

@param s media file handle
@param c unused, does nothing

@return newly created stream or NULL on error.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static LibAVFormat.Stream? avformat_new_stream (
    LibAVFormat.FormatContext? s,
    AVCodec? c
);

/***********************************************************
Get the index entry count for the given LibAVFormat.Stream.

@param stream stream
@return the number of index entries in the stream
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static int avformat_index_get_entries_count (
    LibAVFormat.Stream? stream
);

/***********************************************************
Get the LibAVFormat.IndexEntry corresponding to the given index.

@param stream          Stream containing the requested LibAVFormat.IndexEntry.
@param idx         The desired index.
@return A pointer to the requested LibAVFormat.IndexEntry if it exists, NULL otherwise.

@note The pointer returned by this function is only guaranteed to be valid
      until any function that takes the stream or the parent LibAVFormat.FormatContext
      as input argument is called.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static LibAVFormat.IndexEntry? avformat_index_get_entry (
    LibAVFormat.Stream? stream,
    int idx
);

/***********************************************************
Get the LibAVFormat.IndexEntry corresponding to the given timestamp.

@param stream          Stream containing the requested LibAVFormat.IndexEntry.
@param wanted_timestamp   Timestamp to retrieve the index entry for.
@param flags       If AVSEEK_FLAG_BACKWARD then the returned entry will correspond
                   to the timestamp which is <= the requested one, if backward
                   is 0, then it will be >=
                   if AVSEEK_FLAG_ANY seek to any frame, only keyframes otherwise.
@return A pointer to the requested LibAVFormat.IndexEntry if it exists, NULL otherwise.

@note The pointer returned by this function is only guaranteed to be valid
      until any function that takes the stream or the parent LibAVFormat.FormatContext
      as input argument is called.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static LibAVFormat.IndexEntry? avformat_index_get_entry_from_timestamp (
    LibAVFormat.Stream? stream,
    int64_t wanted_timestamp,
    int flags
);


/***********************************************************
@}
***********************************************************/
