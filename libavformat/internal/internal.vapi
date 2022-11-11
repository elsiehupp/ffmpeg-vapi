/***********************************************************
@copyright 2001 Fabrice Bellard
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

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

public const size_t MAX_URL_SIZE;

/***********************************************************
size of probe buffer, for guessing file type from file contents
***********************************************************/
public const size_t PROBE_BUF_MIN;
public const size_t PROBE_BUF_MAX;

public const size_t MAX_PROBE_PACKETS;

//  #ifdef DEBUG
//  #    define hex_dump_debug (class, buffer, size) av_hex_dump_log (class, AV_LOG_DEBUG, buffer, size)
//  #else
//  #    define hex_dump_debug (class, buffer, size) do { if (0) av_hex_dump_log (class, AV_LOG_DEBUG, buffer, size); } while (0)
//  #endif

public struct AVCodecTag {
    public LibAVCodec.CodecID id;
    public uint tag;
}

public struct CodecMime {
    public char str[32];
    public LibAVCodec.CodecID id;
}

/*************************************************/
/***********************************************************
fractional numbers for exact pts handling
***********************************************************/

/***********************************************************
The exact value of the fractional number is: 'val + num / den'.
num is assumed to be 0 <= num < den.
***********************************************************/
public struct FFFrac {
    public int64 val;
    public int64 num;
    public int64 den;
}


public struct AVFormatInternal {
    /***********************************************************
    Number of streams relevant for interleaving.
    Muxing only.
    ***********************************************************/
    public int nb_interleaved_streams;

    /***********************************************************
    This buffer is only needed when packets were already buffered but
    not decoded, for example to get the codec parameters in MPEG
    streams.
    ***********************************************************/
    public AVPacketList packet_buffer;
    public AVPacketList packet_buffer_end;

    /***********************************************************
    av_seek_frame () support
    ***********************************************************/

    /***********************************************************
    offset of the first packet
    ***********************************************************/
    public int64 data_offset;

    /***********************************************************
    Raw packets from the demuxer, prior to parsing and decoding.
    This buffer is used for buffering packets until the codec can
    be identified, as parsing cannot be done without knowing the
    codec.
    ***********************************************************/
    public AVPacketList raw_packet_buffer;
    public AVPacketList raw_packet_buffer_end;
    /***********************************************************
    Packets split by the parser get queued here.
    ***********************************************************/
    public AVPacketList parse_queue;
    public AVPacketList parse_queue_end;
    /***********************************************************
    Remaining size available for raw_packet_buffer, in bytes.
    ***********************************************************/
    public int raw_packet_buffer_remaining_size;

    public size_t RAW_PACKET_BUFFER_SIZE;

    /***********************************************************
    Offset to remap timestamps to be non-negative.
    Expressed in timebase units.
    @see AVStream.mux_ts_offset
    ***********************************************************/
    public int64 offset;

    /***********************************************************
    Timebase for the timestamp offset.
    ***********************************************************/
    public LibAVUtil.Rational offset_timebase;

#if FF_API_COMPUTE_PKT_FIELDS2
    public int missing_ts_warning;
#endif

    public int inject_global_side_data;

    public int avoid_negative_ts_use_pts;

    /***********************************************************
    Timestamp of the end of the shortest stream.
    ***********************************************************/
    public int64 shortest_end;

    /***********************************************************
    Whether or not avformat_init_output has already been called
    ***********************************************************/
    public int initialized;

    /***********************************************************
    Whether or not avformat_init_output fully initialized streams
    ***********************************************************/
    public int streams_initialized;

    /***********************************************************
    ID3v2 tag useful for MP3 demuxing
    ***********************************************************/
    public LibAVUtil.Dictionary id3v2_meta;

    /***********************************************************
    Prefer the codec framerate for avg_frame_rate computation.
    ***********************************************************/
    public int prefer_codec_framerate;
}

public struct AVStreamInternal {
    /***********************************************************
    Set to 1 if the codec allows reordering, so pts can be different
    from dts.
    ***********************************************************/
    public int reorder;

    /***********************************************************
    bitstream filters to run on stream
    - encoding: Set by muxer using ff_stream_add_bitstream_filter
    - decoding: unused
    ***********************************************************/
    public LibAVCodec.BitStreamFilterContext[] bsfcs;
    public int nb_bsfcs;

    /***********************************************************
    Whether or not check_bitstream should still be run on each packet
    ***********************************************************/
    public int bitstream_checked;

    /***********************************************************
    The codec context used by avformat_find_stream_info, the parser, etc.
    ***********************************************************/
    public LibAVCodec.CodecContext avctx;
    /***********************************************************
    1 if avctx has been initialized with the values from the codec parameters
    ***********************************************************/
    public int avctx_inited;

    public LibAVCodec.CodecID orig_codec_id;

    /***********************************************************
    the context for extracting extradata in find_stream_info ()
    inited=1/bsf=NULL signals that extracting is not possible (codec not
    supported)
    ***********************************************************/
    public ExtractExtraData extract_extradata;

    /***********************************************************
    Whether the internal avctx needs to be updated from codecpar (after a late change to codecpar)
    ***********************************************************/
    public int need_context_update;

    public FFFrac priv_pts;
}

public struct ExtractExtraData {
    public LibAVCodec.BitStreamFilterContext bsf;
    public LibAVCodec.Packet packet;
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
Automatically create sub-directories

@param path will create sub-directories by path
@return 0, or < 0 on error
***********************************************************/
public int ff_mkdir_p (
    string path
);

public string ff_data_to_hex (
    string buffer,
    uint8[] src,
    int size,
    int lowercase
);

/***********************************************************
Parse a string of hexadecimal strings. Any space between the hexadecimal
digits is ignored.

@param data if non-null, the parsed data is written to this pointer
@param p the string to parse
@return the number of bytes written (or to be written, if data is null)
***********************************************************/
public int ff_hex_to_data (
    uint8[] data,
    string p
);

public delegate int PacketComparisonDelegate (
    AVFormatContext context,
    LibAVCodec.Packet packet_1,
    LibAVCodec.Packet packet_2
);

/***********************************************************
Add packet to AVFormatContext.packet_buffer list, determining its
interleaved position using compare () function argument.
@return 0, or < 0 on error
***********************************************************/
public int ff_interleave_add_packet (
    AVFormatContext format_context,
    LibAVCodec.Packet packet,
    PacketComparisonDelegate compare
);

public void ff_read_frame_flush (
    AVFormatContext format_context
);

public const uint64 NTP_OFFSET;
public const uint64 NTP_OFFSET_US;

/***********************************************************
Get the current time since NTP epoch in microseconds.
***********************************************************/
public uint64 ff_ntp_time ();

/***********************************************************
Get the NTP time stamp formatted as per the RFC-5905.

@param ntp_time NTP time in micro seconds (since NTP epoch)
@return the formatted NTP time stamp
***********************************************************/
public uint64 ff_get_formatted_ntp_time (
    uint64 ntp_time_us
);

/***********************************************************
Append the media-specific SDP fragment for the media stream c
to the buffer buff.

Note, the buffer needs to be initialized, since it is appended to
existing content.

@param buff the buffer to append the SDP fragment to
@param size the size of the buff buffer
@param st the AVStream of the media to describe
@param idx the global stream index
@param dest_addr the destination address of the media stream, may be NULL
@param dest_type the destination address type, may be NULL
@param port the destination port of the media stream, 0 if unknown
@param ttl the time to live of the stream, 0 if not multicast
@param fmt the AVFormatContext, which might contain options modifying
           the generated SDP
***********************************************************/
public void ff_sdp_write_media (
    string buff,
    int size,
    AVStream st,
    int idx,
    string dest_addr,
    string dest_type,
    int port,
    int ttl,
    AVFormatContext fmt
);

/***********************************************************
Write a packet to another muxer than the one the user originally
intended. Useful when chaining muxers, where one muxer internally
writes a received packet to another muxer.

@param dst the muxer to write the packet to
@param dst_stream the stream index within dst to write the packet to
@param packet the packet to be written
@param src the muxer the packet originally was intended for
@param interleave 0->use av_write_frame, 1->av_interleaved_write_frame
@return the value av_write_frame returned
***********************************************************/
public int ff_write_chained (
    AVFormatContext dst,
    int dst_stream,
    LibAVCodec.Packet packet,
    AVFormatContext src,
    int interleave
);

/***********************************************************
Get the length in bytes which is needed to store val as v.
***********************************************************/
public int ff_get_v_length (
    uint64 val
);

/***********************************************************
Put val using a variable number of bytes.
***********************************************************/
public void ff_put_v (
    AVIOContext bc,
    uint64 val
);

/***********************************************************
Read a whole line of text from AVIOContext. Stop reading after reaching
either a \\n, a \\0 or EOF. The returned string is always \\0-terminated,
and may be truncated if the buffer is too small.

@param io_context the read-only AVIOContext
@param buffer buffer to store the read line
@param maxlen size of the buffer
@return the length of the string written in the buffer, not including the
        final \\0
***********************************************************/
public int ff_get_line (
    AVIOContext io_context,
    string buffer,
    int maxlen
);

/***********************************************************
Same as ff_get_line but strip the white-space characters in the text tail

@param io_context the read-only AVIOContext
@param buffer buffer to store the read line
@param maxlen size of the buffer
@return the length of the string written in the buffer
***********************************************************/
public int ff_get_chomp_line (
    AVIOContext io_context,
    string buffer,
    int maxlen
);

/***********************************************************
Read a whole line of text from AVIOContext to an LibAVUtil.BPrintBuffer buffer. Stop
reading after reaching a \\r, a \\n, a \\r\\n, a \\0 or EOF.  The line
ending characters are NOT included in the buffer, but they are skipped on
the input.

@param io_context the read-only AVIOContext
@param bp the LibAVUtil.BPrintBuffer buffer
@return the length of the read line, not including the line endings,
        negative on error.
***********************************************************/
public int64 ff_read_line_to_bprint (
    AVIOContext io_context,
    LibAVUtil.BPrintBuffer bp
);

/***********************************************************
Read a whole line of text from AVIOContext to an LibAVUtil.BPrintBuffer buffer overwriting
its contents. Stop reading after reaching a \\r, a \\n, a \\r\\n, a \\0 or
EOF. The line ending characters are NOT included in the buffer, but they
are skipped on the input.

@param io_context the read-only AVIOContext
@param bp the LibAVUtil.BPrintBuffer buffer
@return the length of the read line not including the line endings,
        negative on error, or if the buffer becomes truncated.
***********************************************************/
public int64 ff_read_line_to_bprint_overwrite (
    AVIOContext io_context,
    LibAVUtil.BPrintBuffer bp
);

public const string SPACE_CHARS;

/***********************************************************
Callback function type for ff_parse_key_value.

@param key a pointer to the key
@param key_len the number of bytes that belong to the key, including the '='
               char
@param dest return the destination pointer for the value in dest, may
            be null to ignore the value
@param dest_len the length of the dest buffer
***********************************************************/
public delegate void ff_parse_key_val_cb (
    void *context,
    string key,
    int key_len,
    out string dest,
    out int dest_len
);

/***********************************************************
Parse a string with comma-separated key=value pairs. The value strings
may be quoted and may contain escaped characters within quoted strings.

@param str the string to parse
@param callback_get_buf function that returns where to store the
                        unescaped value string.
@param context the opaque context pointer to pass to callback_get_buf
***********************************************************/
public void ff_parse_key_value (
    string str,
    ff_parse_key_val_cb callback_get_buf,
    void *context
);

/***********************************************************
Find stream index based on format-specific stream ID
@return stream index, or < 0 on error
***********************************************************/
public int ff_find_stream_index (
    AVFormatContext format_context,
    int id
);

/***********************************************************
Internal version of av_index_search_timestamp
***********************************************************/
public int ff_index_search_timestamp (
    AVIndexEntry[] entries,
    int nb_entries,
    int64 wanted_timestamp,
    int flags
);

/***********************************************************
Internal version of av_add_index_entry
***********************************************************/
public int ff_add_index_entry (
    out AVIndexEntry[] index_entries,
    out int nb_index_entries,
    out uint index_entries_allocated_size,
    int64 pos,
    int64 timestamp,
    int size,
    int distance,
    int flags
);

public void ff_configure_buffers_for_index (
    AVFormatContext format_context,
    int64 time_tolerance
);

/***********************************************************
Add a new chapter.

@param format_context media file handle
@param id unique ID for this chapter
@param start chapter start time in time_base units
@param end chapter end time in time_base units
@param title chapter title

@return AVChapter or NULL on error
***********************************************************/
public AVChapter avpriv_new_chapter (
    AVFormatContext format_context,
    int id,
    LibAVUtil.Rational time_base,
    int64 start,
    int64 end,
    string title
);

/***********************************************************
Ensure the index uses less memory than the maximum specified in
AVFormatContext.max_index_size by discarding entries if it grows
too large.
***********************************************************/
public void ff_reduce_index (
    AVFormatContext format_context,
    int stream_index
);

public LibAVCodec.CodecID ff_guess_image2_codec (
    string filename
);

/***********************************************************
Perform a binary search using av_index_search_timestamp () and
public class InputDemuxer : AVInputFormat.read_timestamp ().

@param target_ts target timestamp in the time base of the given stream
@param stream_index stream number
***********************************************************/
public int ff_seek_frame_binary (
    AVFormatContext format_context,
    int stream_index,
    int64 target_ts,
    int flags
);

/***********************************************************
Update cur_dts of all streams based on the given timestamp and AVStream.

Stream ref_st unchanged, others set cur_dts in their native time base.
Only needed for timestamp wrapping or if (dts not set and pts!=dts).
@param timestamp new dts expressed in time_base of param ref_st
@param ref_st reference stream giving time_base of param timestamp
***********************************************************/
public void ff_update_cur_dts (
    AVFormatContext format_context,
    AVStream ref_st,
    int64 timestamp
);

public delegate int64 ReadTimeStampeDelegate (
    AVFormatContext format_context,
    int arg1,
    out int64 arg2,
    int64 arg3
);

public int ff_find_last_ts (
    AVFormatContext format_context,
    int stream_index,
    out int64 ts,
    out int64 pos,
    ReadTimeStampeDelegate read_timestamp
);

/***********************************************************
Perform a binary search using read_timestamp ().

@param target_ts target timestamp in the time base of the given stream
@param stream_index stream number
***********************************************************/
public int64 ff_gen_search (
    AVFormatContext format_context,
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
Set the time base and wrapping info for a given stream. This will be used
to interpret the stream's timestamps. If the new time base is invalid
(numerator or denominator are non-positive), it leaves the stream
unchanged.

@param stream stream
@param pts_wrap_bits number of bits effectively used by the pts
       (used for wrap control)
@param pts_num time base numerator
@param pts_den time base denominator
***********************************************************/
public void avpriv_set_pts_info (
    AVStream stream,
    int pts_wrap_bits,
    uint pts_num,
    uint pts_den
);

/***********************************************************
Add side data to a packet for changing parameters to the given values.
Parameters set to 0 aren't included in the change.
***********************************************************/
public int ff_add_param_change (
    LibAVCodec.Packet packet,
    int32 channels,
    uint64 channel_layout,
    int32 sample_rate,
    int32 width,
    int32 height
);

/***********************************************************
Set the timebase for each stream from the corresponding codec timebase and
print it.
***********************************************************/
public int ff_framehash_write_header (
    AVFormatContext format_context
);

/***********************************************************
Read a transport packet from a media file.

@param format_context media file handle
@param packet is filled
@return 0 if OK, AVERROR_xxx on error
***********************************************************/
public int ff_read_packet (
    AVFormatContext format_context,
    LibAVCodec.Packet packet
);

/***********************************************************
Interleave a packet per dts in an output media file.

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
public int ff_interleave_packet_per_dts (
    AVFormatContext format_context,
    LibAVCodec.Packet output,
    LibAVCodec.Packet packet,
    int flush
);

public void ff_free_stream (
    AVFormatContext format_context,
    AVStream st
);

/***********************************************************
Return the frame duration in seconds. Return 0 if not available.
***********************************************************/
public void ff_compute_frame_duration (
    AVFormatContext format_context,
    out int pnum,
    out int pden,
    AVStream st,
    LibAVCodec.CodecParserContext pc,
    LibAVCodec.Packet packet
);

public uint ff_codec_get_tag (
    AVCodecTag tags,
    LibAVCodec.CodecID id
);

public LibAVCodec.CodecID ff_codec_get_id (
    AVCodecTag tags,
    uint tag
);

/***********************************************************
Select a PCM codec based on the given parameters.

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
public LibAVCodec.CodecID ff_get_pcm_codec_id (
    int bps,
    int flt,
    int be,
    int sflags
);

/***********************************************************
Chooses a timebase for muxing the specified stream.

The chosen timebase allows sample accurate timestamps based
on the framerate or sample rate for audio streams. It also is
at least as precise as 1/min_precision would be.
***********************************************************/
public LibAVUtil.Rational ff_choose_timebase (
    AVFormatContext format_context,
    AVStream st,
    int min_precision
);

/***********************************************************
Chooses a timebase for muxing the specified stream.
***********************************************************/
public LibAVUtil.ChromaLocation ff_choose_chroma_location (
    AVFormatContext format_context,
    AVStream st
);

/***********************************************************
Generate standard extradata for AVC-Intra based on width/height and field
order.
***********************************************************/
public int ff_generate_avci_extradata (
    AVStream st
);

/***********************************************************
Add a bitstream filter to a stream.

@param st output stream to add a filter to
@param name the name of the filter to add
@param args filter-specific argument string
@return  >0 on success;
         LibAVUtil.ErrorCode code on failure
***********************************************************/
public int ff_stream_add_bitstream_filter (
    AVStream st,
    string name,
    string args
);

/***********************************************************
Copy encoding parameters from source to destination stream

@param dst pointer to destination AVStream
@param src pointer to source AVStream
@return >=0 on success, LibAVUtil.ErrorCode code on error
***********************************************************/
public int ff_stream_encode_params_copy (
    AVStream dst,
    AVStream src
);

/***********************************************************
Wrap errno on rename () error.

@param oldpath source path
@param newpath destination path
@return 0 or LibAVUtil.ErrorCode on failure
***********************************************************/
public static int ff_rename (
    string oldpath,
    string newpath,
    void *logctx
);

/***********************************************************
Allocate extradata with additional AV_INPUT_BUFFER_PADDING_SIZE at end
which is always set to 0.

Previously allocated extradata in par will be freed.

@param size size of extradata
@return 0 if OK, AVERROR_xxx on error
***********************************************************/
public int ff_alloc_extradata (
    LibAVCodec.CodecParameters par,
    int size
);

/***********************************************************
Allocate extradata with additional AV_INPUT_BUFFER_PADDING_SIZE at end
which is always set to 0 and fill it from pb.

@param size size of extradata
@return >= 0 if OK, AVERROR_xxx on error
***********************************************************/
public int ff_get_extradata (
    AVFormatContext format_context,
    LibAVCodec.CodecParameters par,
    AVIOContext pb,
    int size
);

/***********************************************************
add frame for rfps calculation.

@param dts timestamp of the i-th frame
@return 0 if OK, AVERROR_xxx on error
***********************************************************/
public int ff_rfps_add_frame (
    AVFormatContext ic,
    AVStream st,
    int64 dts
);

public void ff_rfps_calculate (
    AVFormatContext ic
);

/***********************************************************
Flags for AVFormatContext.write_uncoded_frame ()
***********************************************************/
public enum AVWriteUncodedFrameFlags {
    /***********************************************************
    Query whether the feature is possible on this stream.
    The frame argument is ignored.
    ***********************************************************/
    AV_WRITE_UNCODED_FRAME_QUERY,
}

/***********************************************************
Copies the whilelists from one context to the other
***********************************************************/
public int ff_copy_whiteblacklists (
    AVFormatContext dst,
    AVFormatContext src
);

/***********************************************************
Returned by demuxers to indicate that data was consumed but discarded
(ignored streams or junk data). The framework will re-call the demuxer.
***********************************************************/
//  #define FFERROR_REDO FFERRTAG ('R','E','D','O')

/***********************************************************
Utility function to open IO stream of output format.

@param format_context AVFormatContext
@param url URL or file name to open for writing
@options optional options which will be passed to io_open callback
@return >=0 on success, negative LibAVUtil.ErrorCode in case of failure
***********************************************************/
public int ff_format_output_open (
    AVFormatContext format_context,
    string url,
    out LibAVUtil.Dictionary options
);

/***********************************************************
A wrapper around AVFormatContext.io_close that should be used
instead of calling the pointer directly.
***********************************************************/
public void ff_format_io_close (
    AVFormatContext format_context,
    out AVIOContext pb
);

/***********************************************************
Utility function to check if the file uses http or https protocol

@param format_context AVFormatContext
@param filename URL or file name to open for writing
***********************************************************/
public int ff_is_http_proto (
    string filename
);

/***********************************************************
Parse creation_time in AVFormatContext metadata if exists and warn if the
parsing fails.

@param format_context AVFormatContext
@param timestamp parsed timestamp in microseconds, only set on successful parsing
@param return_seconds set this to get the number of seconds in timestamp instead of microseconds
@return 1 if OK, 0 if the metadata was not present, LibAVUtil.ErrorCode (EINVAL) on parse error
***********************************************************/
public int ff_parse_creation_time_metadata (
    AVFormatContext format_context,
    int64[] timestamp,
    int return_seconds
);

/***********************************************************
Standardize creation_time metadata in AVFormatContext to an ISO-8601
timestamp string.

@param format_context AVFormatContext
@return <0 on error
***********************************************************/
public int ff_standardize_creation_time (
    AVFormatContext format_context
);

public const int CONTAINS_PAL;

/***********************************************************
Reshuffles the lines to use the user specified stride.

@param ppkt input and output packet
@return negative error code or
        0 if no new packet was allocated
        non-zero if a new packet was allocated and ppkt has to be freed
        CONTAINS_PAL if in addition to a new packet the old contained a palette
***********************************************************/
public int ff_reshuffle_raw_rgb (
    AVFormatContext format_context,
    out LibAVCodec.Packet ppkt,
    LibAVCodec.CodecParameters par,
    int expected_stride
);

/***********************************************************
Retrieves the palette from a packet, either from side data, or
appended to the video data in the packet itself (raw video only).
It is commonly used after a call to ff_reshuffle_raw_rgb ().

Use 0 for the ret parameter to check for side data only.

@param packet pointer to packet before calling ff_reshuffle_raw_rgb ()
@param ret return value from ff_reshuffle_raw_rgb (), or 0
@param palette pointer to palette buffer
@return negative error code or
        1 if the packet has a palette, else 0
***********************************************************/
public int ff_get_packet_palette (
    AVFormatContext format_context,
    LibAVCodec.Packet packet,
    int ret,
    uint32[] palette
);

/***********************************************************
Finalize buffer into extradata and set its size appropriately.
***********************************************************/
public int ff_bprint_to_codecpar_extradata (
    LibAVCodec.CodecParameters par,
    LibAVUtil.BPrintBuffer buffer
);

/***********************************************************
Find the next packet in the interleaving queue for the given stream.
The packet parameter is filled in with the queued packet, including
references to the data (which the caller is not allowed to keep or
modify).

@return 0 if a packet was found, a negative value if no packet was found
***********************************************************/
public int ff_interleaved_peek (
    AVFormatContext format_context,
    int stream,
    LibAVCodec.Packet packet,
    int add_offset
);


public int ff_lock_avformat ();
public int ff_unlock_avformat ();

/***********************************************************
Set AVFormatContext url field to the provided pointer. The pointer must
point to a valid string. The existing url field is freed if necessary. Also
set the legacy filename field to the same string which was provided in url.
***********************************************************/
public void ff_format_set_url (
    AVFormatContext format_context,
    string url
);

[Flags]
public enum PacketListFlags {
    /***********************************************************
    Create a new reference for the packet instead of
    transferring the ownership of the existing one to the list.
    ***********************************************************/
    FF_PACKETLIST_FLAG_REF_PACKET,
}

/***********************************************************
Append an LibAVCodec.Packet to the list.

@param head List head element
@param tail List tail element
@param packet The packet being appended
@param flags Any combination of FF_PACKETLIST_FLAG_* flags
@return 0 on success, negative LibAVUtil.ErrorCode value on failure. On failure,
           the list is unchanged
***********************************************************/
public int ff_packet_list_put (
    out AVPacketList head,
    out AVPacketList tail,
    LibAVCodec.Packet packet,
    int flags
);

/***********************************************************
Remove the oldest LibAVCodec.Packet in the list and return it.

@note The packet will be overwritten completely. The caller owns the
      packet and must unref it by itself.

@param head List head element
@param tail List tail element
@param packet Pointer to an initialized LibAVCodec.Packet struct
***********************************************************/
public int ff_packet_list_get (
    out AVPacketList head,
    out AVPacketList tail,
    LibAVCodec.Packet packet
);

/***********************************************************
Wipe the list and unref all the packets in it.

@param head List head element
@param tail List tail element
***********************************************************/
public void ff_packet_list_free (
    out AVPacketList head,
    out AVPacketList tail
);

public void avpriv_register_devices (
    AVOutputFormat[] o,
    AVInputFormat[] i
);

} // namespace LibAVFormat
