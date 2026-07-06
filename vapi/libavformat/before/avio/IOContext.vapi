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

/***********************************************************
Bytestream IO Context.
New fields can be added to the end with minor version bumps.
Removal, reordering and changes to existing fields require a major
version bump.
sizeof (LibAVFormat.IOContext) must not be used outside libav*.

@note None of the function pointers in LibAVFormat.IOContext should be called
    directly, they should only be set by the client application
    when implementing custom I/O. Normally these are set to the
    function pointers specified in avio_alloc_context ()
***********************************************************/
[CCode (cname="struct AVIOContext",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
public abstract class LibAVFormat.IOContext {
    /***********************************************************
    @brief A class for private options.

    If this LibAVFormat.IOContext is created by avio_open2 (), av_class is set and
    passes the options down to protocols.

    If this LibAVFormat.IOContext is manually allocated, then av_class may be set by
    the caller.

    warning -- this field can be NULL, be sure to not pass this LibAVFormat.IOContext
    to any av_opt_* functions in that case.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Log.Class av_class;

    /***********************************************************
    @brief The following shows the relationship between buffer, buf_ptr,
    buf_ptr_max, buf_end, buf_size, and pos, when reading and when writing
    (since LibAVFormat.IOContext is used for both):

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
    [CCode (cname="")]
    public uchar[] buffer;

    /***********************************************************
    @brief Maximum buffer size
    ***********************************************************/
    [CCode (cname="")]
    public int buffer_size;

    /***********************************************************
    @brief Current position in the buffer
    ***********************************************************/
    [CCode (cname="")]
    public uchar[] buf_ptr;

    /***********************************************************
    @brief End of the data, may be less than buffer + buffer_size if
    the read function returned less data than requested, e.g.
    for streams where no more data has been received yet.
    ***********************************************************/
    [CCode (cname="")]
    public uchar[] buf_end;

    /***********************************************************
    @brief A private pointer, passed to the read/write/seek/...
    functions.
    ***********************************************************/
    [CCode (cname="")]
    public void *opaque;

    [CCode (cname="")]
    public abstract int read_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="")]
    public abstract int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="")]
    public abstract int64 seek (
        void *opaque,
        int64 offset,
        int whence
    );

    /***********************************************************
    @brief Position in the file of the current buffer
    ***********************************************************/
    [CCode (cname="")]
    public int64 pos;

    /***********************************************************
    @brief True if was unable to read due to error or eof
    ***********************************************************/
    [CCode (cname="")]
    public int eof_reached;

    /***********************************************************
    @brief True if open for writing
    ***********************************************************/
    [CCode (cname="")]
    public int write_flag;

    [CCode (cname="")]
    public int max_packet_size;

    [CCode (cname="")]
    public ulong checksum;

    [CCode (cname="")]
    public ustring checksum_ptr;

    [CCode (cname="")]
    public abstract ulong update_checksum (
        ulong checksum,
        uint8[] buffer,
        uint size
    );

    /***********************************************************
    @brief Contains the error code or 0 if no error happened
    ***********************************************************/
    [CCode (cname="")]
    public int error;

    /***********************************************************
    @brief Pause or resume playback for network streaming protocols - e.g. MMS.
    ***********************************************************/
    [CCode (cname="")]
    public abstract int read_pause (
        void *opaque,
        int pause
    );

    /***********************************************************
    @brief Seek to a given timestamp in stream with the specified stream_index.
    Needed for some network streaming protocols which don't support seeking
    to byte position.
    ***********************************************************/
    [CCode (cname="")]
    public abstract int64 read_seek (
        void *opaque,
        int stream_index,
        int64 timestamp,
        int flags
    );

    /***********************************************************
    @brief A combination of LibAVFormat.IOSeekableFlags. flags or 0 when the stream is not seekable.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.IOSeekableFlags seekable;

    /***********************************************************
    @brief Max filesize, used to limit allocations
    This field is internal to libavformat and access from outside is not allowed.
    ***********************************************************/
    [CCode (cname="")]
    public int64 maxsize;

    /***********************************************************
    @brief Avio_read and avio_write should if possible be satisfied directly
    instead of going through a buffer, and avio_seek will always
    call the underlying seek function directly.
    ***********************************************************/
    [CCode (cname="")]
    public int direct;

    /***********************************************************
    @brief Bytes read statistic
    This field is internal to libavformat and access from outside is not allowed.
    ***********************************************************/
    [CCode (cname="")]
    public int64 bytes_read;

    /***********************************************************
    @brief Seek statistic
    This field is internal to libavformat and access from outside is not allowed.
    ***********************************************************/
    [CCode (cname="")]
    public int seek_count;

    /***********************************************************
    @brief Writeout statistic
    This field is internal to libavformat and access from outside is not allowed.
    ***********************************************************/
    [CCode (cname="")]
    public int writeout_count;

    /***********************************************************
    @brief Original buffer size
    used internally after probing and ensure seekback to reset the buffer size
    This field is internal to libavformat and access from outside is not allowed.
    ***********************************************************/
    [CCode (cname="")]
    public int orig_buffer_size;

    /***********************************************************
    @brief Threshold to favor readahead over seek.
    This is current internal only, do not use from outside.
    ***********************************************************/
    [CCode (cname="")]
    public int short_seek_threshold;

    /***********************************************************
    ',' separated list of allowed protocols.
    ***********************************************************/
    [CCode (cname="")]
    public string protocol_whitelist;

    /***********************************************************
    ',' separated list of disallowed protocols.
    ***********************************************************/
    [CCode (cname="")]
    public string protocol_blacklist;

    /***********************************************************
    @brief A callback that is used instead of write_packet.
    ***********************************************************/
    [CCode (cname="")]
    public abstract int write_data_type (
        void *opaque,
        uint8[] buffer,
        int buf_size,
        LibAVFormat.IODataMarkerType type,
        int64 time
    );

    /***********************************************************
    @brief If set, don't call write_data_type separately for LibAVFormat.IODataMarkerType.BOUNDARY_POINT,
    but ignore them and treat them as LibAVFormat.IODataMarkerType.UNKNOWN (to avoid needlessly
    small chunks of data returned from the callback).
    ***********************************************************/
    [CCode (cname="")]
    public int ignore_boundary_point;

    /***********************************************************
    @brief Internal, not meant to be used from outside of LibAVFormat.IOContext.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.IODataMarkerType current_type;

    [CCode (cname="")]
    public int64 last_time;

    /***********************************************************
    @brief A callback that is used instead of short_seek_threshold.
    This is current internal only, do not use from outside.
    ***********************************************************/
    [CCode (cname="")]
    public abstract int short_seek_get (
        void *opaque
    );

    [CCode (cname="")]
    public int64 written;

    /***********************************************************
    @brief Maximum reached position before a backward seek in the write buffer,
    used keeping track of already written data for a later flush.
    ***********************************************************/
    [CCode (cname="")]
    public ustring buf_ptr_max;

    /***********************************************************
    @brief Try to buffer at least this amount of data before flushing it
    ***********************************************************/
    [CCode (cname="")]
    public int min_packet_size;

    public delegate int ReadPacketDelegate (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    public delegate int WritePacketDelegate (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    public delegate int64 SeekDelegate (
        void *opaque,
        int64 offset,
        int whence
    );

    /***********************************************************
    @brief Allocate and initialize an LibAVFormat.IOContext for buffered I/O. It must be later
    freed with avio_context_free ().

    @param buffer Memory block for input/output operations via LibAVFormat.IOContext.
           The buffer must be allocated with av_malloc () and friends.
           It may be freed and replaced with a new buffer by libavformat.
           LibAVFormat.IOContext.buffer holds the buffer currently in use,
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

    @return Allocated LibAVFormat.IOContext or NULL on failure.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public LibAVFormat.IOContext avio_alloc_context (
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
    public into io_context.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public void avio_context_free (
        out LibAVFormat.IOContext io_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public void avio_w8 (
        LibAVFormat.IOContext io_context,
        int b
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public void avio_write (
        LibAVFormat.IOContext io_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public void avio_wl64 (
        LibAVFormat.IOContext io_context,
        uint64 val
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public void avio_wb64 (
        LibAVFormat.IOContext io_context,
        uint64 val
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public void avio_wl32 (
        LibAVFormat.IOContext io_context,
        uint val
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public void avio_wb32 (
        LibAVFormat.IOContext io_context,
        uint val
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public void avio_wl24 (
        LibAVFormat.IOContext io_context,
        uint val
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public void avio_wb24 (
        LibAVFormat.IOContext io_context,
        uint val
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public void avio_wl16 (
        LibAVFormat.IOContext io_context,
        uint val
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public void avio_wb16 (
        LibAVFormat.IOContext io_context,
        uint val
    );

    /***********************************************************
    @brief Write a NULL-terminated string.
    @return number of bytes written.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_put_str (
        LibAVFormat.IOContext io_context,
        string str
    );

    /***********************************************************
    @brief Convert an UTF-8 string to UTF-16LE and write it.
    @param io_context the LibAVFormat.IOContext
    @param str NULL-terminated UTF-8 string

    @return number of bytes written.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_put_str16le (
        LibAVFormat.IOContext io_context,
        string str
    );

    /***********************************************************
    @brief Convert an UTF-8 string to UTF-16BE and write it.
    @param io_context the LibAVFormat.IOContext
    @param str NULL-terminated UTF-8 string

    @return number of bytes written.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_put_str16be (
        LibAVFormat.IOContext io_context,
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
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public void avio_write_marker (
        LibAVFormat.IOContext io_context,
        int64 time,
        LibAVFormat.IODataMarkerType type
    );

    [Flags]
    [CCode (cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public enum AVSeekWhence {
        /***********************************************************
        @brief ORing this as the "whence" parameter to a seek function causes it to
        return the filesize without seeking anywhere. Supporting this is optional.
        If it is not supported then the seek function will return <0.
        ***********************************************************/
        [CCode (cname="AVSEEK_SIZE")]
        SIZE,

        /***********************************************************
        @brief Passing this flag as the "whence" parameter to a seek function causes it to
        seek by any means (like reopening and linear reading) or other normally unreasonable
        means that can be extremely slow.
        This may be ignored by the seek code.
        ***********************************************************/
        [CCode (cname="AVSEEK_FORCE")]
        FORCE;
    }

    /***********************************************************
    @brief Fseek () equivalent for LibAVFormat.IOContext.
    @return new position or LibAVUtil.ErrorCode.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int64 avio_seek (
        LibAVFormat.IOContext io_context,
        int64 offset,
        int whence
    );

    /***********************************************************
    @brief Skip given number of bytes forward
    @return new position or LibAVUtil.ErrorCode.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int64 avio_skip (
        LibAVFormat.IOContext io_context,
        int64 offset
    );

    /***********************************************************
    @brief Ftell () equivalent for LibAVFormat.IOContext.
    @return position or LibAVUtil.ErrorCode.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int64 avio_tell (
        LibAVFormat.IOContext io_context
    );

    /***********************************************************
    @brief Get the filesize.
    @return filesize or LibAVUtil.ErrorCode
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int64 avio_size (
        LibAVFormat.IOContext io_context
    );

    /***********************************************************
    @brief Similar to feof () but also returns nonzero on read errors.
    @return non zero if and only if at end of file or a read error happened when reading.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_feof (
        LibAVFormat.IOContext io_context
    );

    /***********************************************************
    @warning Writes up to 4 KiB per call
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_printf (
        LibAVFormat.IOContext io_context,
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
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public void avio_flush (
        LibAVFormat.IOContext io_context
    );

    /***********************************************************
    @brief Read size bytes from LibAVFormat.IOContext into buffer.
    @return number of bytes read or LibAVUtil.ErrorCode
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_read (
        LibAVFormat.IOContext io_context,
        uchar[] buffer,
        int size
    );

    /***********************************************************
    @brief Read size bytes from LibAVFormat.IOContext into buffer. Unlike avio_read (), this is allowed
    to read fewer bytes than requested. The missing bytes can be read in the next
    call. This always tries to read at least 1 byte.
    Useful to reduce latency in certain cases.
    @return number of bytes read or LibAVUtil.ErrorCode
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_read_partial (
        LibAVFormat.IOContext io_context,
        uchar[] buffer,
        int size
    );

    /***********************************************************
    @name Functions for reading from LibAVFormat.IOContext
    @{

    @note return 0 if EOF, so you cannot use it if EOF handling is
          necessary
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_r8 (
        LibAVFormat.IOContext io_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public uint avio_rl16 (
        LibAVFormat.IOContext io_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public uint avio_rl24 (
        LibAVFormat.IOContext io_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public uint avio_rl32 (
        LibAVFormat.IOContext io_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public uint64 avio_rl64 (
        LibAVFormat.IOContext io_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public uint avio_rb16 (
        LibAVFormat.IOContext io_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public uint avio_rb24 (
        LibAVFormat.IOContext io_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public uint avio_rb32 (
        LibAVFormat.IOContext io_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public uint64 avio_rb64 (
        LibAVFormat.IOContext io_context
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
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_get_str (
        LibAVFormat.IOContext pb,
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
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_get_str16le (
        LibAVFormat.IOContext pb,
        int maxlen,
        string buffer,
        int buflen
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_get_str16be (
        LibAVFormat.IOContext pb,
        int maxlen,
        string buffer,
        int buflen
    );

    /***********************************************************
    @brief Create and initialize a LibAVFormat.IOContext for accessing the
    resource indicated by url.
    @note When the resource indicated by url has been opened in
    read+write mode, the LibAVFormat.IOContext can be used only for writing.

    @param io_context Used to return the pointer to the created LibAVFormat.IOContext.
    In case of failure the pointed to value is set to NULL.
    @param url resource to access
    @param flags flags which control how the resource indicated by url
    is to be opened
    @return >= 0 in case of success, a negative value corresponding to an
    LibAVUtil.ErrorCode code in case of failure
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_open (
        out LibAVFormat.IOContext io_context,
        string url,
        int flags
    );

    /***********************************************************
    @brief Create and initialize a LibAVFormat.IOContext for accessing the
    resource indicated by url.
    @note When the resource indicated by url has been opened in
    read+write mode, the LibAVFormat.IOContext can be used only for writing.

    @param io_context Used to return the pointer to the created LibAVFormat.IOContext.
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
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_open2 (
        out LibAVFormat.IOContext io_context,
        string url,
        int flags,
        LibAVFormat.IOInterruptCallback int_cb,
        out LibAVUtil.Dictionary options
    );

    /***********************************************************
    @brief Close the resource accessed by the LibAVFormat.IOContext io_context and free it.
    This function can only be used if io_context was opened by avio_open ().

    The internal buffer is automatically flushed before closing the
    resource.

    @return 0 on success, an LibAVUtil.ErrorCode < 0 on error.
    @see avio_closep
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_close (
        LibAVFormat.IOContext io_context
    );

    /***********************************************************
    @brief Close the resource accessed by the LibAVFormat.IOContext io_context, free it
    and set the pointer pointing to it to NULL.
    This function can only be used if io_context was opened by avio_open ().

    The internal buffer is automatically flushed before closing the
    resource.

    @return 0 on success, an LibAVUtil.ErrorCode < 0 on error.
    @see avio_close
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_closep (
        out LibAVFormat.IOContext io_context
    );


    /***********************************************************
    @brief Open a write only memory stream.

    @param io_context new IO context
    @return zero if no error.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_open_dyn_buf (
        out LibAVFormat.IOContext io_context
    );

    /***********************************************************
    @brief Return the written size and a pointer to the buffer.
    The LibAVFormat.IOContext stream is left intact.
    The buffer must NOT be freed.
    No padding is added to the buffer.

    @param io_context IO context
    @param pbuffer pointer to a byte buffer
    @return the length of the byte buffer
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_get_dyn_buf (
        LibAVFormat.IOContext io_context,
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
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_close_dyn_buf (
        LibAVFormat.IOContext io_context,
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
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public string avio_enum_protocols (
        out void *opaque,
        int output
    );

    /***********************************************************
    @brief Pause and resume playing - only meaningful if using a network streaming
    protocol (e.g. MMS).

    @param avio_context IO context from which to call the read_pause function pointer
    @param pause 1 for pause, 0 for resume
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_pause (
        LibAVFormat.IOContext avio_context,
        int pause
    );

    /***********************************************************
    @brief Seek to a given timestamp relative to some component stream.
    Only meaningful if using a network streaming protocol (e.g. MMS.).

    @param avio_context IO context from which to call the seek function pointers
    @param stream_index The stream index that the timestamp is relative to.
           If stream_index is (-1) the timestamp should be in AV_TIME_BASE
           units from the beginning of the presentation.
           If a stream_index >= 0 is used and the protocol does not support
           seeking based on component streams, the call will fail.
    @param timestamp timestamp in LibAVFormat.Stream.time_base units
           or if there is no stream specified then in AV_TIME_BASE units.
    @param flags Optional combination of LibAVFormat.FormatSeekFlags.BACKWARD, LibAVFormat.FormatSeekFlags.BYTE
           and LibAVFormat.FormatSeekFlags.ANY. The protocol may silently ignore
           LibAVFormat.FormatSeekFlags.BACKWARD and LibAVFormat.FormatSeekFlags.ANY, but LibAVFormat.FormatSeekFlags.BYTE will
           fail if used and not supported.
    @return >= 0 on success
    @see LibAVFormat.InputFormat::read_seek
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int64 avio_seek_time (
        LibAVFormat.IOContext avio_context,
        int stream_index,
        int64 timestamp,
        LibAVFormat.FormatSeekFlags flags
    );

    /***********************************************************
    @brief Read contents of avio_context into print buffer, up to max_size bytes, or up to EOF.

    @return 0 for success (max_size bytes read or EOF reached), negative error
    code otherwise
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_read_to_bprint (
        LibAVFormat.IOContext avio_context,
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
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_accept (
        LibAVFormat.IOContext server_io_context,
        out LibAVFormat.IOContext client_io_context
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
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public int avio_handshake (
        LibAVFormat.IOContext client_io_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public delegate int ReadPacketDelegate (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public delegate int WritePacketDelegate (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public delegate int64 SeekDelegate (
        void *opaque,
        int64 offset,
        int whence
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public int ffio_init_context (
        LibAVFormat.IOContext io_context,
        uchar[] buffer,
        int buffer_size,
        int write_flag,
        void *opaque,
        ReadPacketDelegate read_packet,
        WritePacketDelegate write_packet,
        SeekDelegate seek
    );

    /***********************************************************
    @brief Read size bytes from LibAVFormat.IOContext, returning a pointer.
    Note that the data pointed at by the returned pointer is only
    valid until the next call that references the same IO context.
    @param io_context IO context
    @param buffer pointer to buffer into which to assemble the requested
        data if it is not available in contiguous addresses in the
        underlying buffer
    @param size number of bytes requested
    @param data address at which to store pointer: this will be a
        a direct pointer into the underlying buffer if the requested
        number of bytes are available at contiguous addresses, otherwise
        will be a copy of buffer
    @return number of bytes read or LibAVUtil.ErrorCode
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public int ffio_read_indirect (
        LibAVFormat.IOContext io_context,
        uchar[] buffer,
        int size,
        out uchar[] data
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public void ffio_fill (
        LibAVFormat.IOContext io_context,
        int b,
        int count
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public void ffio_wfourcc (
        LibAVFormat.IOContext pb,
        uint8[] io_context
    );

    /***********************************************************
    @brief Rewind the LibAVFormat.IOContext using the specified buffer containing the first buf_size bytes of the file.
    Used after probing to avoid seeking.
    Joins buffer and io_context.buffer, taking any overlap into consideration.
    @note io_context.buffer must overlap with buffer or they can't be joined and the function fails

    @param io_context The read-only LibAVFormat.IOContext to rewind
    @param buffer The probe buffer containing the first buf_size bytes of the file
    @param buf_size The size of buffer
    @return >= 0 in case of success, a negative value corresponding to an
    LibAVUtil.ErrorCode code in case of failure
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public int ffio_rewind_with_probe_data (
        LibAVFormat.IOContext io_context,
        out uchar[] buffer,
        int buf_size
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public uint64 ffio_read_varlen (
        LibAVFormat.IOContext bc
    );

    /***********************************************************
    @brief Read size bytes from LibAVFormat.IOContext into buffer.
    Check that exactly size bytes have been read.
    @return number of bytes read or LibAVUtil.ErrorCode
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public int ffio_read_size (
        LibAVFormat.IOContext io_context,
        uchar[] buffer,
        int size
    );

    /***********************************************************
    @warning must be called before any I/O
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public int ffio_set_buf_size (
        LibAVFormat.IOContext io_context,
        int buf_size
    );

    /***********************************************************
    @brief Ensures that the requested seekback buffer size will be available

    Will ensure that when reading sequentially up to buf_size, seeking
    within the current pos and pos+buf_size is possible.
    Once the stream position moves outside this window this guarantee is lost.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public int ffio_ensure_seekback (
        LibAVFormat.IOContext io_context,
        int64 buf_size
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public int ffio_limit (
        LibAVFormat.IOContext io_context,
        int size
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public delegate ulong UpdateChecksumDelegate (
        ulong c,
        uint8[] p,
        uint len
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public void ffio_init_checksum (
        LibAVFormat.IOContext io_context,
        UpdateChecksumDelegate update_checksum,
        ulong checksum
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public ulong ffio_get_checksum (
        LibAVFormat.IOContext io_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public ulong ff_crc04C11DB7_update (
        ulong checksum,
        uint8[] buffer,
        uint len
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public ulong ff_crcEDB88320_update (
        ulong checksum,
        uint8[] buffer,
        uint len
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public ulong ff_crcA001_update (
        ulong checksum,
        uint8[] buffer,
        uint len
    );

    /***********************************************************
    @brief Open a write only packetized memory stream with a maximum packet
    size of 'max_packet_size'.  The stream is stored in a memory buffer
    with a big-endian 4 byte header giving the packet size in bytes.

    @param io_context new IO context
    @param max_packet_size maximum packet size (must be > 0)
    @return zero if no error.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public int ffio_open_dyn_packet_buf (
        out LibAVFormat.IOContext io_context,
        int max_packet_size
    );

    /***********************************************************
    @brief Create and initialize a LibAVFormat.IOContext for accessing the
    resource referenced by the URLContext url_context.
    @note When the URLContext url_context has been opened in read+write mode, the
    LibAVFormat.IOContext can be used only for writing.

    @param io_context Used to return the pointer to the created LibAVFormat.IOContext.
    In case of failure the pointed to value is set to NULL.
    @return >= 0 in case of success, a negative value corresponding to an
    LibAVUtil.ErrorCode code in case of failure
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public int ffio_fdopen (
        out LibAVFormat.IOContext io_context,
        URLContext url_context
    );

    /***********************************************************
    @brief Return the URLContext associated with the LibAVFormat.IOContext

    @param io_context IO context
    @return pointer to URLContext or NULL.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public URLContext ffio_geturlcontext (
        LibAVFormat.IOContext io_context
    );

    /***********************************************************
    @brief Open a write-only fake memory stream. The written data is not stored
    anywhere - this is only used for measuring the amount of data
    written.

    @param io_context new IO context
    @return zero if no error.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public int ffio_open_null_buf (
        out LibAVFormat.IOContext io_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public int ffio_open_whitelist (
        out LibAVFormat.IOContext io_context,
        string url,
        int flags,
        LibAVFormat.IOInterruptCallback int_cb,
        out LibAVUtil.Dictionary options,
        string whitelist,
        string blacklist
    );

    /***********************************************************
    @brief Close a null buffer.

    @param io_context an IO context opened by ffio_open_null_buf
    @return the number of bytes written to the null buffer
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public int ffio_close_null_buf (
        LibAVFormat.IOContext io_context
    );

    /***********************************************************
    @brief Free a dynamic buffer.

    @param io_context a pointer to an IO context opened by avio_open_dyn_buf ()
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio_internal.h")]
    public void ffio_free_dyn_buf (
        out LibAVFormat.IOContext io_context
    );

}

} // namespace LibAVFormat
