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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public const size_t MAX_URL_SIZE;

/***********************************************************
@brief Size of probe buffer, for guessing file type from file contents
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public const size_t PROBE_BUF_MIN;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public const size_t PROBE_BUF_MAX;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public const size_t MAX_PROBE_PACKETS;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public define hex_dump_debug (
    void *class,
    void *buffer,
    void *size
);
//  #ifdef DEBUG
//  av_hex_dump_log (class, LibAVUtil.Log.Level.DEBUG, buffer, size)
//  #else
//  {
//      if (0) av_hex_dump_log (class, LibAVUtil.Log.Level.DEBUG, buffer, size);
//  }
//  #endif

[CCode (cname="struct AVCodecTag",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
[Compact]
public class LibAVFormat.CodecTag {
    [CCode (cname="id")]
    public LibAVCodec.CodecID codec_id;

    [CCode (cname="tag")]
    public uint tag;
}

[CCode (cname="struct CodecMime",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
[Compact]
public class CodecMime {
    [CCode (cname="")]
    public char str[32];

    [CCode (cname="")]
    public LibAVCodec.CodecID id;
}

/*************************************************/
/***********************************************************
@brief Fractional numbers for exact pts handling
***********************************************************/

/***********************************************************
@brief The exact value of the fractional number is: 'val + num / den'.
num is assumed to be 0 <= num < den.
***********************************************************/
[CCode (cname="struct FFFrac",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
[Compact]
public class FFFrac {
    [CCode (cname="")]
    public int64 val;

    [CCode (cname="")]
    public int64 num;

    [CCode (cname="")]
    public int64 den;
}


[CCode (cname="struct AVFormatInternal",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
[Compact]
public class AVFormatInternal {
    /***********************************************************
    @brief Number of streams relevant for interleaving.
    Muxing only.
    ***********************************************************/
    [CCode (cname="")]
    public int nb_interleaved_streams;

    /***********************************************************
    @brief This buffer is only needed when packets were already buffered but
    not decoded, for example to get the codec parameters in MPEG
    streams.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.PacketList packet_buffer;

    [CCode (cname="")]
    public LibAVFormat.PacketList packet_buffer_end;

    /***********************************************************
    @brief Av_seek_frame () support
    ***********************************************************/

    /***********************************************************
    @brief Offset of the first packet
    ***********************************************************/
    [CCode (cname="")]
    public int64 data_offset;

    /***********************************************************
    @brief Raw packets from the demuxer, prior to parsing and decoding.
    This buffer is used for buffering packets until the codec can
    be identified, as parsing cannot be done without knowing the
    codec.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.PacketList raw_packet_buffer;

    [CCode (cname="")]
    public LibAVFormat.PacketList raw_packet_buffer_end;

    /***********************************************************
    @brief Packets split by the parser get queued here.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.PacketList parse_queue;

    [CCode (cname="")]
    public LibAVFormat.PacketList parse_queue_end;

    /***********************************************************
    @brief Remaining size available for raw_packet_buffer, in bytes.
    ***********************************************************/
    [CCode (cname="")]
    public int raw_packet_buffer_remaining_size;

    [CCode (cname="")]
    public size_t RAW_PACKET_BUFFER_SIZE;

    /***********************************************************
    @brief Offset to remap timestamps to be non-negative.
    Expressed in timebase units.
    @see LibAVFormat.Stream.mux_ts_offset
    ***********************************************************/
    [CCode (cname="")]
    public int64 offset;

    /***********************************************************
    @brief Timebase for the timestamp offset.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Rational offset_timebase;

    [CCode (cname="")]
    public int inject_global_side_data;

    [CCode (cname="")]
    public int avoid_negative_ts_use_pts;

    /***********************************************************
    @brief Timestamp of the end of the shortest stream.
    ***********************************************************/
    [CCode (cname="")]
    public int64 shortest_end;

    /***********************************************************
    @brief Whether or not avformat_init_output has already been called
    ***********************************************************/
    [CCode (cname="")]
    public int initialized;

    /***********************************************************
    @brief Whether or not avformat_init_output fully initialized streams
    ***********************************************************/
    [CCode (cname="")]
    public int streams_initialized;

    /***********************************************************
    @brief ID3v2 tag useful for MP3 demuxing
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Dictionary id3v2_meta;

    /***********************************************************
    @brief Prefer the codec framerate for avg_frame_rate computation.
    ***********************************************************/
    [CCode (cname="")]
    public int prefer_codec_framerate;
}

[CCode (cname="struct AVStreamInternal",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
[Compact]
public class AVStreamInternal {
    /***********************************************************
    @brief Set to 1 if the codec allows reordering, so pts can be different
    from dts.
    ***********************************************************/
    [CCode (cname="")]
    public int reorder;

    /***********************************************************
    @brief Bitstream filters to run on stream
    - encoding: Set by muxer using ff_stream_add_bitstream_filter
    - decoding: unused
    ***********************************************************/
    [CCode (cname="")]
    public LibAVCodec.BitStreamFilterContext[] bsfcs;

    [CCode (cname="")]
    public int nb_bsfcs;

    /***********************************************************
    @brief Whether or not check_bitstream should still be run on each packet
    ***********************************************************/
    [CCode (cname="")]
    public int bitstream_checked;

    /***********************************************************
    @brief The codec context used by avformat_find_stream_info, the parser, etc.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVCodec.CodecContext avctx;

    /***********************************************************
    1 if avctx has been initialized with the values from the codec parameters
    ***********************************************************/
    [CCode (cname="")]
    public int avctx_inited;

    [CCode (cname="")]
    public LibAVCodec.CodecID orig_codec_id;

    /***********************************************************
    @brief The context for extracting extradata in find_stream_info ()
    inited=1/bsf=NULL signals that extracting is not possible (codec not
    supported)
    ***********************************************************/
    [CCode (cname="")]
    public ExtractExtraData extract_extradata;

    /***********************************************************
    @brief Whether the internal avctx needs to be updated from codecpar (after a late change to codecpar)
    ***********************************************************/
    [CCode (cname="")]
    public int need_context_update;

    [CCode (cname="")]
    public FFFrac priv_pts;
}

[CCode (cname="struct ExtractExtraData",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
[Compact]
public class ExtractExtraData {
    [CCode (cname="")]
    public LibAVCodec.BitStreamFilterContext bsf;

    [CCode (cname="")]
    public LibAVCodec.Packet packet;

    [CCode (cname="")]
    public int inited;
}

//  #ifdef __GNUC__
//  #define dynarray_add (tab, nb_ptr, elem)\
//  do {
//      __typeof__ (tab) _tab = (tab);\
//      __typeof__ (elem) _elem = (elem);\
//      ()sizeof (**_tab == _elem); /* check that types are compatible */\
//      av_dynarray_add (_tab, nb_ptr, _elem);\
//  } while (0)
//  #else
//  #define dynarray_add (tab, nb_ptr, elem)\
//  do {
//      av_dynarray_add ((tab), nb_ptr, (elem));\
//  } while (0)
//  #endif

//  public tm ff_brktimegm (
//      time_t secs,
//      tm tm
//  );

/***********************************************************
@brief Automatically create sub-directories

@param path will create sub-directories by path
@return 0, or < 0 on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_mkdir_p (
    string path
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public string ff_data_to_hex (
    string buffer,
    uint8[] src,
    int size,
    int lowercase
);

/***********************************************************
@brief Parse a string of hexadecimal strings. Any space between the hexadecimal
digits is ignored.

@param data if non-null, the parsed data is written to this pointer
@param p the string to parse
@return the number of bytes written (or to be written, if data is null)
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_hex_to_data (
    uint8[] data,
    string p
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public delegate int PacketComparisonDelegate (
    LibAVFormat.FormatContext context,
    LibAVCodec.Packet packet_1,
    LibAVCodec.Packet packet_2
);

/***********************************************************
@brief Add packet to LibAVFormat.FormatContext.packet_buffer list, determining its
public interleaved position using compare () function argument.
@return 0, or < 0 on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_interleave_add_packet (
    LibAVFormat.FormatContext format_context,
    LibAVCodec.Packet packet,
    PacketComparisonDelegate compare
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public void ff_read_frame_flush (
    LibAVFormat.FormatContext format_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public const uint64 NTP_OFFSET;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public const uint64 NTP_OFFSET_US;

/***********************************************************
@brief Get the current time since NTP epoch in microseconds.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public uint64 ff_ntp_time ();

/***********************************************************
@brief Get the NTP time stamp formatted as per the RFC-5905.

@param ntp_time NTP time in micro seconds (since NTP epoch)
@return the formatted NTP time stamp
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public uint64 ff_get_formatted_ntp_time (
    uint64 ntp_time_us
);

/***********************************************************
@brief Append the media-specific SDP fragment for the media stream c
to the buffer buff.

Note, the buffer needs to be initialized, since it is appended to
existing content.

@param buff the buffer to append the SDP fragment to
@param size the size of the buff buffer
@param stream the LibAVFormat.Stream of the media to describe
@param idx the global stream index
@param dest_addr the destination address of the media stream, may be NULL
@param dest_type the destination address type, may be NULL
@param port the destination port of the media stream, 0 if unknown
@param ttl the time to live of the stream, 0 if not multicast
@param fmt the LibAVFormat.FormatContext, which might contain options modifying
           the generated SDP
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public void ff_sdp_write_media (
    string buff,
    int size,
    LibAVFormat.Stream stream,
    int idx,
    string dest_addr,
    string dest_type,
    int port,
    int ttl,
    LibAVFormat.FormatContext fmt
);

/***********************************************************
@brief Write a packet to another muxer than the one the user originally
public intended. Useful when chaining muxers, where one muxer internally
writes a received packet to another muxer.

@param dst the muxer to write the packet to
@param dst_stream the stream index within dst to write the packet to
@param packet the packet to be written
@param src the muxer the packet originally was intended for
@param interleave 0->use av_write_frame, 1->av_interleaved_write_frame
@return the value av_write_frame returned
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_write_chained (
    LibAVFormat.FormatContext dst,
    int dst_stream,
    LibAVCodec.Packet packet,
    LibAVFormat.FormatContext src,
    int interleave
);

/***********************************************************
@brief Get the length in bytes which is needed to store val as v.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_get_v_length (
    uint64 val
);

/***********************************************************
@brief Put val using a variable number of bytes.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public void ff_put_v (
    LibAVFormat.IOContext bc,
    uint64 val
);

/***********************************************************
@brief Read a whole line of text from LibAVFormat.IOContext. Stop reading after reaching
either a \\n, a \\0 or EOF. The returned string is always \\0-terminated,
and may be truncated if the buffer is too small.

@param io_context the read-only LibAVFormat.IOContext
@param buffer buffer to store the read line
@param maxlen size of the buffer
@return the length of the string written in the buffer, not including the
        final \\0
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_get_line (
    LibAVFormat.IOContext io_context,
    string buffer,
    int maxlen
);

/***********************************************************
@brief Same as ff_get_line but strip the white-space characters in the text tail

@param io_context the read-only LibAVFormat.IOContext
@param buffer buffer to store the read line
@param maxlen size of the buffer
@return the length of the string written in the buffer
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_get_chomp_line (
    LibAVFormat.IOContext io_context,
    string buffer,
    int maxlen
);

/***********************************************************
@brief Read a whole line of text from LibAVFormat.IOContext to an LibAVUtil.BPrintBuffer buffer. Stop
reading after reaching a \\r, a \\n, a \\r\\n, a \\0 or EOF.  The line
ending characters are NOT included in the buffer, but they are skipped on
the input.

@param io_context the read-only LibAVFormat.IOContext
@param bp the LibAVUtil.BPrintBuffer buffer
@return the length of the read line, not including the line endings,
        negative on error.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int64 ff_read_line_to_bprint (
    LibAVFormat.IOContext io_context,
    LibAVUtil.BPrintBuffer bp
);

/***********************************************************
@brief Read a whole line of text from LibAVFormat.IOContext to an LibAVUtil.BPrintBuffer buffer overwriting
its contents. Stop reading after reaching a \\r, a \\n, a \\r\\n, a \\0 or
EOF. The line ending characters are NOT included in the buffer, but they
are skipped on the input.

@param io_context the read-only LibAVFormat.IOContext
@param bp the LibAVUtil.BPrintBuffer buffer
@return the length of the read line not including the line endings,
        negative on error, or if the buffer becomes truncated.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int64 ff_read_line_to_bprint_overwrite (
    LibAVFormat.IOContext io_context,
    LibAVUtil.BPrintBuffer bp
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public const string SPACE_CHARS;

/***********************************************************
@brief Callback function type for ff_parse_key_value.

@param key a pointer to the key
@param key_len the number of bytes that belong to the key, including the '='
               char
@param dest return the destination pointer for the value in dest, may
            be null to ignore the value
@param dest_len the length of the dest buffer
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public delegate void ff_parse_key_val_cb (
    void *context,
    string key,
    int key_len,
    out string dest,
    out int dest_len
);

/***********************************************************
@brief Parse a string with comma-separated key=value pairs. The value strings
may be quoted and may contain escaped characters within quoted strings.

@param str the string to parse
@param callback_get_buf function that returns where to store the
                        unescaped value string.
@param context the opaque context pointer to pass to callback_get_buf
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public void ff_parse_key_value (
    string str,
    ff_parse_key_val_cb callback_get_buf,
    void *context
);

/***********************************************************
@brief Find stream index based on format-specific stream ID
@return stream index, or < 0 on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_find_stream_index (
    LibAVFormat.FormatContext format_context,
    int id
);

/***********************************************************
@brief Internal version of av_index_search_timestamp
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_index_search_timestamp (
    LibAVFormat.IndexEntry[] entries,
    int nb_entries,
    int64 wanted_timestamp,
    int flags
);

/***********************************************************
@brief Internal version of av_add_index_entry
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_add_index_entry (
    out LibAVFormat.IndexEntry[] index_entries,
    out int nb_index_entries,
    out uint index_entries_allocated_size,
    int64 pos,
    int64 timestamp,
    int size,
    int distance,
    int flags
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public void ff_configure_buffers_for_index (
    LibAVFormat.FormatContext format_context,
    int64 time_tolerance
);

/***********************************************************
@brief Add a new chapter.

@param format_context media file handle
@param id unique ID for this chapter
@param start chapter start time in time_base units
@param end chapter end time in time_base units
@param title chapter title

@return LibAVFormat.Chapter or NULL on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public LibAVFormat.Chapter avpriv_new_chapter (
    LibAVFormat.FormatContext format_context,
    int id,
    LibAVUtil.Rational time_base,
    int64 start,
    int64 end,
    string title
);

/***********************************************************
@brief Ensure the index uses less memory than the maximum specified in
LibAVFormat.FormatContext.max_index_size by discarding entries if it grows
too large.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public void ff_reduce_index (
    LibAVFormat.FormatContext format_context,
    int stream_index
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public LibAVCodec.CodecID ff_guess_image2_codec (
    string filename
);

/***********************************************************
@brief Perform a binary search using av_index_search_timestamp () and
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public class Demuxer : LibAVFormat.InputFormat.read_timestamp ().

@param target_ts target timestamp in the time base of the given stream
@param stream_index stream number
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_seek_frame_binary (
    LibAVFormat.FormatContext format_context,
    int stream_index,
    int64 target_ts,
    int flags
);

/***********************************************************
@brief Update cur_dts of all streams based on the given timestamp and LibAVFormat.Stream.

Stream ref_st unchanged, others set cur_dts in their native time base.
Only needed for timestamp wrapping or if (dts not set and pts!=dts).
@param timestamp new dts expressed in time_base of param ref_st
@param ref_st reference stream giving time_base of param timestamp
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public void ff_update_cur_dts (
    LibAVFormat.FormatContext format_context,
    LibAVFormat.Stream ref_st,
    int64 timestamp
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public delegate int64 ReadTimeStampeDelegate (
    LibAVFormat.FormatContext format_context,
    int arg1,
    out int64 arg2,
    int64 arg3
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_find_last_ts (
    LibAVFormat.FormatContext format_context,
    int stream_index,
    out int64 ts,
    out int64 pos,
    ReadTimeStampeDelegate read_timestamp
);

/***********************************************************
@brief Perform a binary search using read_timestamp ().

@param target_ts target timestamp in the time base of the given stream
@param stream_index stream number
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int64 ff_gen_search (
    LibAVFormat.FormatContext format_context,
    int stream_index,
    int64 target_ts,
    int64 pos_min,
    int64 pos_max,
    int64 pos_limit,
    int64 ts_min,
    int64 ts_max,
    int flags,
    out int64 ts_ret,
    ReadTimeStampeDelegate read_timestamp
);

/***********************************************************
@brief Set the time base and wrapping info for a given stream. This will be used
to interpret the stream's timestamps. If the new time base is invalid
(numerator or denominator are non-positive), it leaves the stream
unchanged.

@param stream LibAVFormat.Stream
@param pts_wrap_bits number of bits effectively used by the pts
       (used for wrap control)
@param pts_num time base numerator
@param pts_den time base denominator
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public void avpriv_set_pts_info (
    LibAVFormat.Stream stream,
    int pts_wrap_bits,
    uint pts_num,
    uint pts_den
);

/***********************************************************
@brief Add side data to a packet for changing parameters to the given values.
Parameters set to 0 aren't included in the change.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_add_param_change (
    LibAVCodec.Packet packet,
    int32 channels,
    uint64 channel_layout,
    int32 sample_rate,
    int32 width,
    int32 height
);

/***********************************************************
@brief Set the timebase for each stream from the corresponding codec timebase and
print it.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_framehash_write_header (
    LibAVFormat.FormatContext format_context
);

/***********************************************************
@brief Read a transport packet from a media file.

@param format_context media file handle
@param packet is filled
@return 0 if OK, LibAVUtil.ErrorCode.xxx on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_read_packet (
    LibAVFormat.FormatContext format_context,
    LibAVCodec.Packet packet
);

/***********************************************************
@brief Interleave a packet per dts in an output media file.

Packets with packet.destruct == av_destruct_packet will be freed inside this
function, so they cannot be used after it. Note that calling av_packet_unref ()
on them is still safe.

@param format_context media file handle
@param output the interleaved packet will be output here
@param packet the input packet
@param flush 1 if no further packets are available as input and all
             remaining packets should be output
@return 1 if a packet was output, 0 if no packet could be output,
        < 0 if an error occurred
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_interleave_packet_per_dts (
    LibAVFormat.FormatContext format_context,
    LibAVCodec.Packet output,
    LibAVCodec.Packet packet,
    int flush
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public void ff_free_stream (
    LibAVFormat.FormatContext format_context,
    LibAVFormat.Stream stream
);

/***********************************************************
@brief Return the frame duration in seconds. Return 0 if not available.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public void ff_compute_frame_duration (
    LibAVFormat.FormatContext format_context,
    out int pnum,
    out int pden,
    LibAVFormat.Stream stream,
    LibAVCodec.CodecParserContext pc,
    LibAVCodec.Packet packet
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public uint ff_codec_get_tag (
    LibAVFormat.CodecTag tags,
    LibAVCodec.CodecID id
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public LibAVCodec.CodecID ff_codec_get_id (
    LibAVFormat.CodecTag tags,
    uint tag
);

/***********************************************************
@brief Select a PCM codec based on the given parameters.

@param bps bits-per-sample
@param flt floating-point
@param be big-endian
@param sflags signed flags. each bit corresponds to one byte of bit depth.
               e.g. the 1st bit indicates if 8-bit should be signed or
               uint, the 2nd bit indicates if 16-bit should be signed or
               uint, etc... This is useful for formats such as WAVE where
               only 8-bit is uint and all other bit depths are signed.
@return a PCM codec id or LibAVCodec.CodecID.NONE
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public LibAVCodec.CodecID ff_get_pcm_codec_id (
    int bps,
    int flt,
    int be,
    int sflags
);

/***********************************************************
@brief Chooses a timebase for muxing the specified stream.

The chosen timebase allows sample accurate timestamps based
on the framerate or sample rate for audio streams. It also is
at least as precise as 1/min_precision would be.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public LibAVUtil.Rational ff_choose_timebase (
    LibAVFormat.FormatContext format_context,
    LibAVFormat.Stream stream,
    int min_precision
);

/***********************************************************
@brief Chooses a timebase for muxing the specified stream.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public LibAVUtil.ChromaLocation ff_choose_chroma_location (
    LibAVFormat.FormatContext format_context,
    LibAVFormat.Stream stream
);

/***********************************************************
@brief Generate standard extradata for AVC-Intra based on width/height and field
order.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_generate_avci_extradata (
    LibAVFormat.Stream stream
);

/***********************************************************
@brief Add a bitstream filter to a stream.

@param stream output stream to add a filter to
@param name the name of the filter to add
@param args filter-specific argument string
@return  >0 on success;
         LibAVUtil.ErrorCode code on failure
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_stream_add_bitstream_filter (
    LibAVFormat.Stream stream,
    string name,
    string args
);

/***********************************************************
@brief Copy encoding parameters from source to destination stream

@param dst pointer to destination LibAVFormat.Stream
@param src pointer to source LibAVFormat.Stream
@return >=0 on success, LibAVUtil.ErrorCode code on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_stream_encode_params_copy (
    LibAVFormat.Stream dst,
    LibAVFormat.Stream src
);

/***********************************************************
@brief Wrap errno on rename () error.

@param oldpath source path
@param newpath destination path
@return 0 or LibAVUtil.ErrorCode on failure
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public static int ff_rename (
    string oldpath,
    string newpath,
    void *logctx
);

/***********************************************************
@brief Allocate extradata with additional AV_INPUT_BUFFER_PADDING_SIZE at end
which is always set to 0.

Previously allocated extradata in par will be freed.

@param size size of extradata
@return 0 if OK, LibAVUtil.ErrorCode.xxx on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_alloc_extradata (
    LibAVCodec.CodecParameters par,
    int size
);

/***********************************************************
@brief Allocate extradata with additional AV_INPUT_BUFFER_PADDING_SIZE at end
which is always set to 0 and fill it from pb.

@param size size of extradata
@return >= 0 if OK, LibAVUtil.ErrorCode.xxx on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_get_extradata (
    LibAVFormat.FormatContext format_context,
    LibAVCodec.CodecParameters par,
    LibAVFormat.IOContext pb,
    int size
);

/***********************************************************
@brief Add frame for rfps calculation.

@param dts timestamp of the i-th frame
@return 0 if OK, LibAVUtil.ErrorCode.xxx on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_rfps_add_frame (
    LibAVFormat.FormatContext ic,
    LibAVFormat.Stream stream,
    int64 dts
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public void ff_rfps_calculate (
    LibAVFormat.FormatContext ic
);

/***********************************************************
@brief Flags for LibAVFormat.FormatContext.write_uncoded_frame ()
***********************************************************/
[CCode (cname="enum AVWriteUncodedFrameFlags",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public enum AVWriteUncodedFrameFlags {
    /***********************************************************
    @brief Query whether the feature is possible on this stream.
    The frame argument is ignored.
    ***********************************************************/
    [CCode (cname="AV_WRITE_UNCODED_FRAME_QUERY")]
    QUERY;
}

/***********************************************************
@brief Copies the whilelists from one context to the other
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_copy_whiteblacklists (
    LibAVFormat.FormatContext dst,
    LibAVFormat.FormatContext src
);

[CCode (cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public enum FFError {
    /***********************************************************
    @brief Returned by demuxers to indicate that data was consumed but discarded
    (ignored streams or junk data). The framework will re-call the demuxer.
    ***********************************************************/
    [CCode (cname="FFERROR_REDO")]
    REDO;
    //  FFERRTAG (
    //      'R',
    //      'E',
    //      'D',
    //      'O'
    //  );

}

/***********************************************************
@brief Utility function to open IO stream of output format.

@param format_context LibAVFormat.FormatContext
@param url URL or file name to open for writing
@options optional options which will be passed to io_open callback
@return >=0 on success, negative LibAVUtil.ErrorCode in case of failure
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_format_output_open (
    LibAVFormat.FormatContext format_context,
    string url,
    out LibAVUtil.Dictionary options
);

/***********************************************************
@brief A wrapper around LibAVFormat.FormatContext.io_close that should be used
instead of calling the pointer directly.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public void ff_format_io_close (
    LibAVFormat.FormatContext format_context,
    out LibAVFormat.IOContext pb
);

/***********************************************************
@brief Utility function to check if the file uses http or https protocol

@param format_context LibAVFormat.FormatContext
@param filename URL or file name to open for writing
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_is_http_proto (
    string filename
);

/***********************************************************
@brief Parse creation_time in LibAVFormat.FormatContext metadata if exists and warn if the
parsing fails.

@param format_context LibAVFormat.FormatContext
@param timestamp parsed timestamp in microseconds, only set on successful parsing
@param return_seconds set this to get the number of seconds in timestamp instead of microseconds
@return 1 if OK, 0 if the metadata was not present, LibAVUtil.ErrorCode (EINVAL) on parse error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_parse_creation_time_metadata (
    LibAVFormat.FormatContext format_context,
    int64[] timestamp,
    int return_seconds
);

/***********************************************************
@brief Standardize creation_time metadata in LibAVFormat.FormatContext to an ISO-8601
timestamp string.

@param format_context LibAVFormat.FormatContext
@return <0 on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_standardize_creation_time (
    LibAVFormat.FormatContext format_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public const int CONTAINS_PAL;

/***********************************************************
@brief Reshuffles the lines to use the user specified stride.

@param ppkt input and output packet
@return negative error code or
        0 if no new packet was allocated
        non-zero if a new packet was allocated and ppkt has to be freed
        CONTAINS_PAL if in addition to a new packet the old contained a palette
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_reshuffle_raw_rgb (
    LibAVFormat.FormatContext format_context,
    out LibAVCodec.Packet ppkt,
    LibAVCodec.CodecParameters par,
    int expected_stride
);

/***********************************************************
@brief Retrieves the palette from a packet, either from side data, or
appended to the video data in the packet itself (raw video only).
It is commonly used after a call to ff_reshuffle_raw_rgb ().

Use 0 for the ret parameter to check for side data only.

@param packet pointer to packet before calling ff_reshuffle_raw_rgb ()
@param ret return value from ff_reshuffle_raw_rgb (), or 0
@param palette pointer to palette buffer
@return negative error code or
        1 if the packet has a palette, else 0
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_get_packet_palette (
    LibAVFormat.FormatContext format_context,
    LibAVCodec.Packet packet,
    int ret,
    uint32[] palette
);

/***********************************************************
@brief Finalize buffer into extradata and set its size appropriately.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_bprint_to_codecpar_extradata (
    LibAVCodec.CodecParameters par,
    LibAVUtil.BPrintBuffer buffer
);

/***********************************************************
@brief Find the next packet in the interleaving queue for the given stream.
The packet parameter is filled in with the queued packet, including
references to the data (which the caller is not allowed to keep or
modify).

@return 0 if a packet was found, a negative value if no packet was found
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_interleaved_peek (
    LibAVFormat.FormatContext format_context,
    int stream,
    LibAVCodec.Packet packet,
    int add_offset
);


[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_lock_avformat ();

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_unlock_avformat ();

/***********************************************************
@brief Set LibAVFormat.FormatContext url field to the provided pointer. The pointer must
point to a valid string. The existing url field is freed if necessary. Also
set the legacy filename field to the same string which was provided in url.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public void ff_format_set_url (
    LibAVFormat.FormatContext format_context,
    string url
);

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public enum PacketListFlags {
    /***********************************************************
    @brief Create a new reference for the packet instead of
    transferring the ownership of the existing one to the list.
    ***********************************************************/
    [CCode (cname="FF_PACKETLIST_FLAG_REF_PACKET")]
    REF_PACKET;
}

/***********************************************************
@brief Append an LibAVCodec.Packet to the list.

@param head List head element
@param tail List tail element
@param packet The packet being appended
@param flags Any combination of PacketListFlags flags
@return 0 on success, negative LibAVUtil.ErrorCode value on failure. On failure,
           the list is unchanged
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_packet_list_put (
    out LibAVFormat.PacketList head,
    out LibAVFormat.PacketList tail,
    LibAVCodec.Packet packet,
    PacketListFlags flags
);

/***********************************************************
@brief Remove the oldest LibAVCodec.Packet in the list and return it.

@note The packet will be overwritten completely. The caller owns the
      packet and must unref it by itself.

@param head List head element
@param tail List tail element
@param packet Pointer to an initialized LibAVCodec.Packet struct
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public int ff_packet_list_get (
    out LibAVFormat.PacketList head,
    out LibAVFormat.PacketList tail,
    LibAVCodec.Packet packet
);

/***********************************************************
@brief Wipe the list and unref all the packets in it.

@param head List head element
@param tail List tail element
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public void ff_packet_list_free (
    out LibAVFormat.PacketList head,
    out LibAVFormat.PacketList tail
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/internal.h")]
public void avpriv_register_devices (
    LibAVFormat.OutputFormat[] av_output_format,
    LibAVFormat.InputFormat[] av_input_format
);

} // namespace LibAVFormat
