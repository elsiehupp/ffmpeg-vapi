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
@file @ingroup lavf_io
Buffered I/O operations
***********************************************************/

[Flags]
public enum AVIOSeekableFlags {
    /***********************************************************
    @brief Seeking works like for a local file.
        ***********************************************************/
    AVIO_SEEKABLE_NORMAL,

    /***********************************************************
    @brief Seeking by timestamp with avio_seek_time () is possible.
        ***********************************************************/
    AVIO_SEEKABLE_TIME,
}

public delegate int InterruptCallbackDelegate (
    void *opaque
);

/***********************************************************
@brief Callback for checking whether to abort blocking functions.
AVERROR_EXIT is returned in this case by the interrupted
function. During blocking operations, callback is called with
opaque as parameter. If the callback returns 1, the
blocking operation will be aborted.

No members can be added to this struct without a major bump, if
new elements have been added after this struct in AVFormatContext
or AVIOContext.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public struct AVIOInterruptCB {
    [CCode (cname="", cheader_filename="")]
    public InterruptCallbackDelegate callback;

    [CCode (cname="", cheader_filename="")]
    public void *opaque;
}

/***********************************************************
@brief Directory entry types.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public enum AVIODirEntryType {
    AVIO_ENTRY_UNKNOWN,
    AVIO_ENTRY_BLOCK_DEVICE,
    AVIO_ENTRY_CHARACTER_DEVICE,
    AVIO_ENTRY_DIRECTORY,
    AVIO_ENTRY_NAMED_PIPE,
    AVIO_ENTRY_SYMBOLIC_LINK,
    AVIO_ENTRY_SOCKET,
    AVIO_ENTRY_FILE,
    AVIO_ENTRY_SERVER,
    AVIO_ENTRY_SHARE,
    AVIO_ENTRY_WORKGROUP,
}

/***********************************************************
@brief Describes single entry of the directory.

Only name and type fields are guaranteed be set.
Rest of fields are protocol or/and platform dependent and might be unknown.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public struct AVIODirEntry {
    /***********************************************************
    @brief Filename
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public string name;

    /***********************************************************
    @brief Type of the entry
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int type;

    /***********************************************************
    @brief Set to 1 when name is encoded with UTF-8, 0 otherwise.
    Name can be encoded with UTF-8 even though 0 is set.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int utf8;

    /***********************************************************
    @brief File size in bytes, -1 if unknown.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 size;

    /***********************************************************
    @brief Time of last modification in microseconds since unix
    epoch, -1 if unknown.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 modification_timestamp;

    /***********************************************************
    @brief Time of last access in microseconds since unix epoch,
    -1 if unknown.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 access_timestamp;

    /***********************************************************
    @brief Time of last status change in microseconds since unix
    epoch, -1 if unknown.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 status_change_timestamp;

    /***********************************************************
    User ID of owner, -1 if unknown.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 user_id;

    /***********************************************************
    @brief Group ID of owner, -1 if unknown.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 group_id;

    /***********************************************************
    Unix file mode, -1 if unknown.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 filemode;
}

[CCode (cname="struct AVIODirContext", cheader_filename="")]
public struct AVIODirContext {
    [CCode (cname="", cheader_filename="")]
    public URLContext url_context;
}

/***********************************************************
@brief Different data types that can be returned via the AVIO
write_data_type callback.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public enum AVIODataMarkerType {
    /***********************************************************
    @brief Header data; this needs to be present for the stream to be decodeable.
        ***********************************************************/
    AVIO_DATA_MARKER_HEADER,
    /***********************************************************
    @brief A point in the output bytestream where a decoder can start decoding
    (i.e. a keyframe). A demuxer/decoder given the data flagged with
    AVIO_DATA_MARKER_HEADER, followed by any AVIO_DATA_MARKER_SYNC_POINT,
    should give decodeable results.
        ***********************************************************/
    AVIO_DATA_MARKER_SYNC_POINT,
    /***********************************************************
    @brief A point in the output bytestream where a demuxer can start parsing
    (for non self synchronizing bytestream formats). That is, any
    non-keyframe packet start point.
        ***********************************************************/
    AVIO_DATA_MARKER_BOUNDARY_POINT,
    /***********************************************************
    @brief This is any, unlabelled data. It can either be a muxer not marking
    any positions at all, it can be an actual boundary/sync point
    that the muxer chooses not to mark, or a later part of a packet/fragment
    that is cut into multiple write callbacks due to limited IO buffer size.
        ***********************************************************/
    AVIO_DATA_MARKER_UNKNOWN,
    /***********************************************************
    @brief Trailer data, which doesn't contain actual content, but only for
    finalizing the output file.
        ***********************************************************/
    AVIO_DATA_MARKER_TRAILER,
    /***********************************************************
    @brief A point in the output bytestream where the underlying AVIOContext might
    flush the buffer depending on latency or buffering requirements. Typically
    means the end of a packet.
        ***********************************************************/
    AVIO_DATA_MARKER_FLUSH_POINT,
}

/***********************************************************
Bytestream IO Context.
New fields can be added to the end with minor version bumps.
Removal, reordering and changes to existing fields require a major
version bump.
sizeof (AVIOContext) must not be used outside libav*.

@note None of the function pointers in AVIOContext should be called
    directly, they should only be set by the client application
    when implementing custom I/O. Normally these are set to the
    function pointers specified in avio_alloc_context ()
***********************************************************/
[CCode (cname="", cheader_filename="")]
public abstract class AVIOContext {
    /***********************************************************
    @brief A class for private options.

    If this AVIOContext is created by avio_open2 (), av_class is set and
    passes the options down to protocols.

    If this AVIOContext is manually allocated, then av_class may be set by
    the caller.

    warning -- this field can be NULL, be sure to not pass this AVIOContext
    to any av_opt_* functions in that case.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Class av_class;

    /***********************************************************
    @brief The following shows the relationship between buffer, buf_ptr,
    buf_ptr_max, buf_end, buf_size, and pos, when reading and when writing
    (since AVIOContext is used for both):

     **********************************************************************************
                                      READING
     **********************************************************************************

                               |              buffer_size              |
                               |---------------------------------------|
                               |                                       |

                            buffer buf_ptr buf_end
                               +---------------+-----------------------+
                               |/ / / / / / / /|/ / / / / / /|         |
     read buffer:              |/ / consumed / | to be read /|         |
                               |/ / / / / / / /|/ / / / / / /|         |
                               +---------------+-----------------------+

                                                            pos
                 +-------------------------------------------+-----------------+
     input file: |                                           |                 |
                 +-------------------------------------------+-----------------+


     **********************************************************************************
                                      WRITING
     **********************************************************************************

                                |          buffer_size                 |
                                |--------------------------------------|
                                |                                      |

                                                   buf_ptr_max
                             buffer (buf_ptr)       buf_end
                                +-----------------------+--------------+
                                |/ / / / / / / / / / / /|              |
     write buffer:              | / / to be flushed / / |              |
                                |/ / / / / / / / / / / /|              |
                                +-----------------------+--------------+
                                  buf_ptr can be in this
                                  due to a backward seek

                               pos
                  +-------------+----------------------------------------------+
     output file: |             |                                              |
                  +-------------+----------------------------------------------+

    ***********************************************************/

    /***********************************************************
    @brief Start of the buffer.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uchar[] buffer;

    /***********************************************************
    @brief Maximum buffer size
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int buffer_size;

    /***********************************************************
    @brief Current position in the buffer
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uchar[] buf_ptr;

    /***********************************************************
    @brief End of the data, may be less than buffer + buffer_size if
    the read function returned less data than requested, e.g.
    for streams where no more data has been received yet.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uchar[] buf_end;

    /***********************************************************
    @brief A private pointer, passed to the read/write/seek/...
    functions.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public void *opaque;

    [CCode (cname="", cheader_filename="")]
    public abstract int read_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int64 seek (
        void *opaque,
        int64 offset,
        int whence
    );

    /***********************************************************
    @brief Position in the file of the current buffer
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 pos;

    /***********************************************************
    @brief True if was unable to read due to error or eof
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int eof_reached;

    /***********************************************************
    @brief True if open for writing
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int write_flag;

    [CCode (cname="", cheader_filename="")]
    public int max_packet_size;

    [CCode (cname="", cheader_filename="")]
    public ulong checksum;

    [CCode (cname="", cheader_filename="")]
    public ustring checksum_ptr;

    [CCode (cname="", cheader_filename="")]
    public abstract ulong update_checksum (
        ulong checksum,
        uint8[] buffer,
        uint size
    );

    /***********************************************************
    @brief Contains the error code or 0 if no error happened
        ***********************************************************/
    int error;

    /***********************************************************
    @brief Pause or resume playback for network streaming protocols - e.g. MMS.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public abstract int read_pause (
        void *opaque,
        int pause
    );

    /***********************************************************
    @brief Seek to a given timestamp in stream with the specified stream_index.
    Needed for some network streaming protocols which don't support seeking
    to byte position.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public abstract int64 read_seek (
        void *opaque,
        int stream_index,
        int64 timestamp,
        int flags
    );

    /***********************************************************
    @brief A combination of AVIO_SEEKABLE_ flags or 0 when the stream is not seekable.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int seekable;

    /***********************************************************
    @brief Max filesize, used to limit allocations
    This field is internal to libavformat and access from outside is not allowed.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 maxsize;

    /***********************************************************
    @brief Avio_read and avio_write should if possible be satisfied directly
    instead of going through a buffer, and avio_seek will always
    call the underlying seek function directly.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int direct;

    /***********************************************************
    @brief Bytes read statistic
    This field is internal to libavformat and access from outside is not allowed.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 bytes_read;

    /***********************************************************
    @brief Seek statistic
    This field is internal to libavformat and access from outside is not allowed.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int seek_count;

    /***********************************************************
    @brief Writeout statistic
    This field is internal to libavformat and access from outside is not allowed.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int writeout_count;

    /***********************************************************
    @brief Original buffer size
    used internally after probing and ensure seekback to reset the buffer size
    This field is internal to libavformat and access from outside is not allowed.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int orig_buffer_size;

    /***********************************************************
    @brief Threshold to favor readahead over seek.
    This is current internal only, do not use from outside.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int short_seek_threshold;

    /***********************************************************
    ',' separated list of allowed protocols.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public string protocol_whitelist;

    /***********************************************************
    ',' separated list of disallowed protocols.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public string protocol_blacklist;

    /***********************************************************
    @brief A callback that is used instead of write_packet.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public abstract int write_data_type (
        void *opaque,
        uint8[] buffer,
        int buf_size,
        AVIODataMarkerType type,
        int64 time
    );

    /***********************************************************
    @brief If set, don't call write_data_type separately for AVIO_DATA_MARKER_BOUNDARY_POINT,
    but ignore them and treat them as AVIO_DATA_MARKER_UNKNOWN (to avoid needlessly
    small chunks of data returned from the callback).
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int ignore_boundary_point;

    /***********************************************************
    @brief Internal, not meant to be used from outside of AVIOContext.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public AVIODataMarkerType current_type;

    [CCode (cname="", cheader_filename="")]
    public int64 last_time;

    /***********************************************************
    @brief A callback that is used instead of short_seek_threshold.
    This is current internal only, do not use from outside.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public abstract int short_seek_get (
        void *opaque
    );

    [CCode (cname="", cheader_filename="")]
    public int64 written;

    /***********************************************************
    @brief Maximum reached position before a backward seek in the write buffer,
    used keeping track of already written data for a later flush.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public ustring buf_ptr_max;

    /***********************************************************
    @brief Try to buffer at least this amount of data before flushing it
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int min_packet_size;
}

/***********************************************************
@brief Return the name of the protocol that will handle the passed URL.

NULL is returned if no protocol could be found for the given URL.

@return Name of the protocol or NULL.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public string avio_find_protocol_name (
    string url
);

/***********************************************************
@brief Return AVIO_FLAG_* access flags corresponding to the access permissions
of the resource in url, or a negative value corresponding to an
LibAVUtil.ErrorCode code in case of failure. The returned access flags are
masked by the value in flags.

@note This function is intrinsically unsafe, in the sense that the
checked resource may change its existence or permission status from
one call to another. Thus you should not trust the returned value,
unless you are sure that no other processes are accessing the
checked resource.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_check (
    string url,
    int flags
);

/***********************************************************
@brief Move or rename a resource.

@note url_src and url_dst should share the same protocol and authority.

@param url_src url to resource to be moved
@param url_dst new url to resource if the operation succeeded
@return >=0 on success or negative on error.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avpriv_io_move (
    string url_src,
    string url_dst
);

/***********************************************************
@brief Delete a resource.

@param url resource to be deleted.
@return >=0 on success or negative on error.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avpriv_io_delete (
    string url
);

/***********************************************************
@brief Open directory for reading.

@param io_context directory read context. Pointer to a NULL pointer must be passed.
@param url directory to be listed.
@param options A dictionary filled with protocol-private options. On return
               this parameter will be destroyed and replaced with a dictionary
               containing options that were not found. May be NULL.
@return >=0 on success or negative on error.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_open_dir (
    out AVIODirContext io_dir_context,
    string url,
    out LibAVUtil.Dictionary options
);

/***********************************************************
@brief Get next directory entry.

Returned entry must be freed with avio_free_directory_entry (). In particular
it may outlive AVIODirContext.

@param io_dir_context directory read context.
@param[out] next next entry or NULL when no more entries.
@return >=0 on success or negative on error. End of list is not considered an
            error.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_read_dir (
    AVIODirContext io_dir_context,
    out AVIODirEntry next
);

/***********************************************************
@brief Close directory.

@note Entries created using avio_read_dir () are not deleted and must be
freeded with avio_free_directory_entry ().

@param io_dir_context directory read context.
@return >=0 on success or negative on error.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_close_dir (
    out AVIODirContext io_dir_context
);

/***********************************************************
@brief Free entry allocated by avio_read_dir ().

@param entry entry to be freed.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void avio_free_directory_entry (
    out AVIODirEntry entry
);

//  public delegate int ReadPacketDelegate (
//      void *opaque,
//      uint8[] buffer,
//      int buf_size
//  );
//  public delegate int WritePacketDelegate (
//      void *opaque,
//      uint8[] buffer,
//      int buf_size
//  );
//  public delegate int64 SeekDelegate (
//      void *opaque,
//      int64 offset,
//      int whence
//  );

/***********************************************************
@brief Allocate and initialize an AVIOContext for buffered I/O. It must be later
freed with avio_context_free ().

@param buffer Memory block for input/output operations via AVIOContext.
       The buffer must be allocated with av_malloc () and friends.
       It may be freed and replaced with a new buffer by libavformat.
       AVIOContext.buffer holds the buffer currently in use,
       which must be later freed with av_free ().
@param buffer_size The buffer size is very important for performance.
       For protocols with fixed blocksize it should be set to this blocksize.
       For others a typical size is a cache page, e.g. 4kb.
@param write_flag Set to 1 if the buffer should be writable, 0 otherwise.
@param opaque An opaque pointer to user-specific data.
@param read_packet A function for refilling the buffer, may be NULL.
                    For stream protocols, must never return 0 but rather
                    a proper LibAVUtil.ErrorCode code.
@param write_packet A function for writing the buffer contents, may be NULL.
       The function may not change the input buffers content.
@param seek A function for seeking to specified byte position, may be NULL.

@return Allocated AVIOContext or NULL on failure.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public AVIOContext avio_alloc_context (
    uchar[] buffer,
    int buffer_size,
    int write_flag,
    void *opaque,
    ReadPacketDelegate read_packet,
    WritePacketDelegate write_packet,
    SeekDelegate seek
);

/***********************************************************
@brief Free the supplied IO context and everything associated with it.

@param io_context Double pointer to the IO context. This function will write NULL
into io_context.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void avio_context_free (
    out AVIOContext io_context
);

[CCode (cname="", cheader_filename="")]
public void avio_w8 (
    AVIOContext io_context,
    int b
);

[CCode (cname="", cheader_filename="")]
public void avio_write (
    AVIOContext io_context,
    uchar[] buffer,
    int size
);

[CCode (cname="", cheader_filename="")]
public void avio_wl64 (
    AVIOContext io_context,
    uint64 val
);

[CCode (cname="", cheader_filename="")]
public void avio_wb64 (
    AVIOContext io_context,
    uint64 val
);

[CCode (cname="", cheader_filename="")]
public void avio_wl32 (
    AVIOContext io_context,
    uint val
);

[CCode (cname="", cheader_filename="")]
public void avio_wb32 (
    AVIOContext io_context,
    uint val
);

[CCode (cname="", cheader_filename="")]
public void avio_wl24 (
    AVIOContext io_context,
    uint val
);

[CCode (cname="", cheader_filename="")]
public void avio_wb24 (
    AVIOContext io_context,
    uint val
);

[CCode (cname="", cheader_filename="")]
public void avio_wl16 (
    AVIOContext io_context,
    uint val
);

[CCode (cname="", cheader_filename="")]
public void avio_wb16 (
    AVIOContext io_context,
    uint val
);

/***********************************************************
@brief Write a NULL-terminated string.
@return number of bytes written.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_put_str (
    AVIOContext io_context,
    string str
);

/***********************************************************
@brief Convert an UTF-8 string to UTF-16LE and write it.
@param io_context the AVIOContext
@param str NULL-terminated UTF-8 string

@return number of bytes written.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_put_str16le (
    AVIOContext io_context,
    string str
);

/***********************************************************
@brief Convert an UTF-8 string to UTF-16BE and write it.
@param io_context the AVIOContext
@param str NULL-terminated UTF-8 string

@return number of bytes written.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_put_str16be (
    AVIOContext io_context,
    string str
);

/***********************************************************
@brief Mark the written bytestream as a specific type.

Zero-length ranges are omitted from the output.

@param time the stream time the current bytestream pos corresponds to
            (in AV_TIME_BASE units), or AV_NOPTS_VALUE if unknown or not
            applicable
@param type the kind of data written starting at the current pos
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void avio_write_marker (
    AVIOContext io_context,
    int64 time,
    AVIODataMarkerType type
);

[Flags]
public enum AVSeekWhence {
    /***********************************************************
    @brief ORing this as the "whence" parameter to a seek function causes it to
    return the filesize without seeking anywhere. Supporting this is optional.
    If it is not supported then the seek function will return <0.
        ***********************************************************/
    AVSEEK_SIZE,

    /***********************************************************
    @brief Passing this flag as the "whence" parameter to a seek function causes it to
    seek by any means (like reopening and linear reading) or other normally unreasonable
    means that can be extremely slow.
    This may be ignored by the seek code.
        ***********************************************************/
    AVSEEK_FORCE,
}

/***********************************************************
@brief Fseek () equivalent for AVIOContext.
@return new position or LibAVUtil.ErrorCode.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int64 avio_seek (
    AVIOContext io_context,
    int64 offset,
    int whence
);

/***********************************************************
@brief Skip given number of bytes forward
@return new position or LibAVUtil.ErrorCode.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int64 avio_skip (
    AVIOContext io_context,
    int64 offset
);

/***********************************************************
@brief Ftell () equivalent for AVIOContext.
@return position or LibAVUtil.ErrorCode.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int64 avio_tell (
    AVIOContext io_context
);

/***********************************************************
@brief Get the filesize.
@return filesize or LibAVUtil.ErrorCode
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int64 avio_size (
    AVIOContext io_context
);

/***********************************************************
@brief Similar to feof () but also returns nonzero on read errors.
@return non zero if and only if at end of file or a read error happened when reading.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_feof (
    AVIOContext io_context
);

/***********************************************************
@warning Writes up to 4 KiB per call
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_printf (
    AVIOContext io_context,
    string fmt,
    ...
); // av_printf_format (2, 3);

/***********************************************************
@brief Force flushing of buffered data.

For write streams, force the buffered data to be immediately written to the output,
without to wait to fill the internal buffer.

For read streams, discard all currently buffered data, and advance the
reported file position to that of the underlying stream. This does not
read new data, and does not perform any seeks.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void avio_flush (
    AVIOContext io_context
);

/***********************************************************
@brief Read size bytes from AVIOContext into buffer.
@return number of bytes read or LibAVUtil.ErrorCode
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_read (
    AVIOContext io_context,
    uchar[] buffer,
    int size
);

/***********************************************************
@brief Read size bytes from AVIOContext into buffer. Unlike avio_read (), this is allowed
to read fewer bytes than requested. The missing bytes can be read in the next
call. This always tries to read at least 1 byte.
Useful to reduce latency in certain cases.
@return number of bytes read or LibAVUtil.ErrorCode
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_read_partial (
    AVIOContext io_context,
    uchar[] buffer,
    int size
);

/***********************************************************
@name Functions for reading from AVIOContext
@{

@note return 0 if EOF, so you cannot use it if EOF handling is
      necessary
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_r8 (
    AVIOContext io_context
);

[CCode (cname="", cheader_filename="")]
public uint avio_rl16 (
    AVIOContext io_context
);

[CCode (cname="", cheader_filename="")]
public uint avio_rl24 (
    AVIOContext io_context
);

[CCode (cname="", cheader_filename="")]
public uint avio_rl32 (
    AVIOContext io_context
);

[CCode (cname="", cheader_filename="")]
public uint64 avio_rl64 (
    AVIOContext io_context
);

[CCode (cname="", cheader_filename="")]
public uint avio_rb16 (
    AVIOContext io_context
);

[CCode (cname="", cheader_filename="")]
public uint avio_rb24 (
    AVIOContext io_context
);

[CCode (cname="", cheader_filename="")]
public uint avio_rb32 (
    AVIOContext io_context
);

[CCode (cname="", cheader_filename="")]
public uint64 avio_rb64 (
    AVIOContext io_context
);

/***********************************************************
@}
***********************************************************/

/***********************************************************
@brief Read a string from pb into buffer. The reading will terminate when either
a NULL character was encountered, maxlen bytes have been read, or nothing
more can be read from pb. The result is guaranteed to be NULL-terminated, it
will be truncated if buffer is too small.
Note that the string is not interpreted or validated in any way, it
might get truncated in the middle of a sequence for multi-byte encodings.

@return number of bytes read (is always <= maxlen).
If reading ends on EOF or error, the return value will be one more than
bytes actually read.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_get_str (
    AVIOContext pb,
    int maxlen,
    string buffer,
    int buflen
);

/***********************************************************
@brief Read a UTF-16 string from pb and convert it to UTF-8.
The reading will terminate when either a null or invalid character was
encountered or maxlen bytes have been read.
@return number of bytes read (is always <= maxlen)
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_get_str16le (
    AVIOContext pb,
    int maxlen,
    string buffer,
    int buflen
);

[CCode (cname="", cheader_filename="")]
public int avio_get_str16be (
    AVIOContext pb,
    int maxlen,
    string buffer,
    int buflen
);

[Flags]
public enum AVIOOpenFlags {
    /***********************************************************
    @name URL open modes
    The flags argument to avio_open must be one of the following
    constants, optionally ORed with other flags.
    @{
    ***********************************************************/

    /***********************************************************
    @brief Read-only
        ***********************************************************/
    AVIO_FLAG_READ,
    /***********************************************************
    @brief Write-only
        ***********************************************************/
    AVIO_FLAG_WRITE,
    /***********************************************************
    @brief Read-write pseudo flag
        ***********************************************************/
    AVIO_FLAG_READ_WRITE,

    /***********************************************************
    @}
    ***********************************************************/

    /***********************************************************
    Use non-blocking mode.
    If this flag is set, operations on the context will return
    LibAVUtil.ErrorCode (EAGAIN) if they can not be performed immediately.
    If this flag is not set, operations on the context will never return
    LibAVUtil.ErrorCode (EAGAIN).
    Note that this flag does not affect the opening/connecting of the
    context. Connecting a protocol will always block if necessary (e.g. on
    network protocols) but never hang (e.g. on busy devices).
    Warning: non-blocking protocols is work-in-progress; this flag may be
    silently ignored.
        ***********************************************************/
    AVIO_FLAG_NONBLOCK,

    /***********************************************************
    Use direct mode.
    avio_read and avio_write should if possible be satisfied directly
    instead of going through a buffer, and avio_seek will always
    call the underlying seek function directly.
        ***********************************************************/
    AVIO_FLAG_DIRECT,
}

/***********************************************************
@brief Create and initialize a AVIOContext for accessing the
resource indicated by url.
@note When the resource indicated by url has been opened in
read+write mode, the AVIOContext can be used only for writing.

@param io_context Used to return the pointer to the created AVIOContext.
In case of failure the pointed to value is set to NULL.
@param url resource to access
@param flags flags which control how the resource indicated by url
is to be opened
@return >= 0 in case of success, a negative value corresponding to an
LibAVUtil.ErrorCode code in case of failure
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_open (
    out AVIOContext io_context,
    string url,
    int flags
);

/***********************************************************
@brief Create and initialize a AVIOContext for accessing the
resource indicated by url.
@note When the resource indicated by url has been opened in
read+write mode, the AVIOContext can be used only for writing.

@param io_context Used to return the pointer to the created AVIOContext.
In case of failure the pointed to value is set to NULL.
@param url resource to access
@param flags flags which control how the resource indicated by url
is to be opened
@param int_cb an interrupt callback to be used at the protocols level
@param options A dictionary filled with protocol-private options. On return
this parameter will be destroyed and replaced with a dict containing options
that were not found. May be NULL.
@return >= 0 in case of success, a negative value corresponding to an
LibAVUtil.ErrorCode code in case of failure
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_open2 (
    out AVIOContext io_context,
    string url,
    int flags,
    AVIOInterruptCB int_cb,
    out LibAVUtil.Dictionary options
);

/***********************************************************
@brief Close the resource accessed by the AVIOContext io_context and free it.
This function can only be used if io_context was opened by avio_open ().

The internal buffer is automatically flushed before closing the
resource.

@return 0 on success, an LibAVUtil.ErrorCode < 0 on error.
@see avio_closep
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_close (
    AVIOContext io_context
);

/***********************************************************
@brief Close the resource accessed by the AVIOContext io_context, free it
and set the pointer pointing to it to NULL.
This function can only be used if io_context was opened by avio_open ().

The internal buffer is automatically flushed before closing the
resource.

@return 0 on success, an LibAVUtil.ErrorCode < 0 on error.
@see avio_close
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_closep (
    out AVIOContext io_context
);


/***********************************************************
@brief Open a write only memory stream.

@param io_context new IO context
@return zero if no error.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_open_dyn_buf (
    out AVIOContext io_context
);

/***********************************************************
@brief Return the written size and a pointer to the buffer.
The AVIOContext stream is left intact.
The buffer must NOT be freed.
No padding is added to the buffer.

@param io_context IO context
@param pbuffer pointer to a byte buffer
@return the length of the byte buffer
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_get_dyn_buf (
    AVIOContext io_context,
    out uint8[] pbuffer
);

/***********************************************************
@brief Return the written size and a pointer to the buffer. The buffer
must be freed with av_free ().
Padding of AV_INPUT_BUFFER_PADDING_SIZE is added to the buffer.

@param io_context IO context
@param pbuffer pointer to a byte buffer
@return the length of the byte buffer
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_close_dyn_buf (
    AVIOContext io_context,
    out uint8[] pbuffer
);

/***********************************************************
@brief Iterate through names of available protocols.

@param opaque A private pointer representing current protocol.
       It must be a pointer to NULL on first iteration and will
       be updated by successive calls to avio_enum_protocols.
@param output If set to 1, iterate over output protocols,
              otherwise over input protocols.

@return A static string containing the name of current protocol or NULL
***********************************************************/
[CCode (cname="", cheader_filename="")]
public string avio_enum_protocols (
    out void *opaque,
    int output
);

/***********************************************************
@brief Pause and resume playing - only meaningful if using a network streaming
protocol (e.g. MMS).

@param h IO context from which to call the read_pause function pointer
@param pause 1 for pause, 0 for resume
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_pause (
    AVIOContext h,
    int pause
);

/***********************************************************
@brief Seek to a given timestamp relative to some component stream.
Only meaningful if using a network streaming protocol (e.g. MMS.).

@param h IO context from which to call the seek function pointers
@param stream_index The stream index that the timestamp is relative to.
       If stream_index is (-1) the timestamp should be in AV_TIME_BASE
       units from the beginning of the presentation.
       If a stream_index >= 0 is used and the protocol does not support
       seeking based on component streams, the call will fail.
@param timestamp timestamp in AVStream.time_base units
       or if there is no stream specified then in AV_TIME_BASE units.
@param flags Optional combination of AVSEEK_FLAG_BACKWARD, AVSEEK_FLAG_BYTE
       and AVSEEK_FLAG_ANY. The protocol may silently ignore
       AVSEEK_FLAG_BACKWARD and AVSEEK_FLAG_ANY, but AVSEEK_FLAG_BYTE will
       fail if used and not supported.
@return >= 0 on success
@see AVInputFormat::read_seek
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int64 avio_seek_time (
    AVIOContext h,
    int stream_index,
    int64 timestamp,
    int flags
);

/***********************************************************
@brief Read contents of h into print buffer, up to max_size bytes, or up to EOF.

@return 0 for success (max_size bytes read or EOF reached), negative error
code otherwise
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_read_to_bprint (
    AVIOContext h,
    LibAVUtil.BPrintBuffer pb,
    size_t max_size
);

/***********************************************************
@brief Accept and allocate a client context on a server context.
@param server_io_context the server context
@param client_io_context the client context, must be unallocated
@return   >= 0 on success or a negative value corresponding
          to an LibAVUtil.ErrorCode on failure
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_accept (
    AVIOContext server_io_context,
    out AVIOContext client_io_context
);

/***********************************************************
@brief Perform one step of the protocol handshake to accept a new client.
This function must be called on a client returned by avio_accept () before
using it as a read/write context.
It is separate from avio_accept () because it may block.
A step of the handshake is defined by places where the application may
decide to change the proceedings.
For example, on a protocol with a request header and a reply header, each
one can constitute a step because the application may use the parameters
from the request to change parameters in the reply; or each individual
chunk of the request can constitute a step.
If the handshake is already finished, avio_handshake () does nothing and
returns 0 immediately.

@param client_io_context the client context to perform the handshake on
@return 0 on a complete and successful handshake
          > 0 if the handshake progressed, but is not complete
          < 0 for an LibAVUtil.ErrorCode code
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int avio_handshake (
    AVIOContext client_io_context
);

} // namespace LibAVFormat
