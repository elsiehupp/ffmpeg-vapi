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

//  extern const LibAVUtil.Class ff_avio_class;

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

[CCode (cname="", cheader_filename="")]
public int ffio_init_context (
    AVIOContext io_context,
    uchar[] buffer,
    int buffer_size,
    int write_flag,
    void *opaque,
    ReadPacketDelegate read_packet,
    WritePacketDelegate write_packet,
    SeekDelegate seek
);

/***********************************************************
@brief Read size bytes from AVIOContext, returning a pointer.
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
[CCode (cname="", cheader_filename="")]
public int ffio_read_indirect (
    AVIOContext io_context,
    uchar[] buffer,
    int size,
    out uchar[] data
);

[CCode (cname="", cheader_filename="")]
public void ffio_fill (
    AVIOContext io_context,
    int b,
    int count
);

[CCode (cname="", cheader_filename="")]
public void ffio_wfourcc (
    AVIOContext pb,
    uint8[] io_context
);

/***********************************************************
@brief Rewind the AVIOContext using the specified buffer containing the first buf_size bytes of the file.
Used after probing to avoid seeking.
Joins buffer and io_context.buffer, taking any overlap into consideration.
@note io_context.buffer must overlap with buffer or they can't be joined and the function fails

@param io_context The read-only AVIOContext to rewind
@param buffer The probe buffer containing the first buf_size bytes of the file
@param buf_size The size of buffer
@return >= 0 in case of success, a negative value corresponding to an
LibAVUtil.ErrorCode code in case of failure
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffio_rewind_with_probe_data (
    AVIOContext io_context,
    out uchar[] buffer,
    int buf_size
);

[CCode (cname="", cheader_filename="")]
public uint64 ffio_read_varlen (
    AVIOContext bc
);

/***********************************************************
@brief Read size bytes from AVIOContext into buffer.
Check that exactly size bytes have been read.
@return number of bytes read or LibAVUtil.ErrorCode
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffio_read_size (
    AVIOContext io_context,
    uchar[] buffer,
    int size
);

/***********************************************************
@warning must be called before any I/O
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffio_set_buf_size (
    AVIOContext io_context,
    int buf_size
);

/***********************************************************
@brief Ensures that the requested seekback buffer size will be available

Will ensure that when reading sequentially up to buf_size, seeking
within the current pos and pos+buf_size is possible.
Once the stream position moves outside this window this guarantee is lost.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffio_ensure_seekback (
    AVIOContext io_context,
    int64 buf_size
);

[CCode (cname="", cheader_filename="")]
public int ffio_limit (
    AVIOContext io_context,
    int size
);

public delegate ulong UpdateChecksumDelegate (
    ulong c,
    uint8[] p,
    uint len
);

[CCode (cname="", cheader_filename="")]
public void ffio_init_checksum (
    AVIOContext io_context,
    UpdateChecksumDelegate update_checksum,
    ulong checksum
);

[CCode (cname="", cheader_filename="")]
public ulong ffio_get_checksum (
    AVIOContext io_context
);

[CCode (cname="", cheader_filename="")]
public ulong ff_crc04C11DB7_update (
    ulong checksum,
    uint8[] buffer,
    uint len
);

[CCode (cname="", cheader_filename="")]
public ulong ff_crcEDB88320_update (
    ulong checksum,
    uint8[] buffer,
    uint len
);

[CCode (cname="", cheader_filename="")]
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
[CCode (cname="", cheader_filename="")]
public int ffio_open_dyn_packet_buf (
    out AVIOContext io_context,
    int max_packet_size
);

/***********************************************************
@brief Create and initialize a AVIOContext for accessing the
resource referenced by the URLContext url_context.
@note When the URLContext url_context has been opened in read+write mode, the
AVIOContext can be used only for writing.

@param io_context Used to return the pointer to the created AVIOContext.
In case of failure the pointed to value is set to NULL.
@return >= 0 in case of success, a negative value corresponding to an
LibAVUtil.ErrorCode code in case of failure
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffio_fdopen (
    out AVIOContext io_context,
    URLContext url_context
);

/***********************************************************
@brief Return the URLContext associated with the AVIOContext

@param io_context IO context
@return pointer to URLContext or NULL.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public URLContext ffio_geturlcontext (
    AVIOContext io_context
);

/***********************************************************
@brief Open a write-only fake memory stream. The written data is not stored
anywhere - this is only used for measuring the amount of data
written.

@param io_context new IO context
@return zero if no error.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffio_open_null_buf (
    out AVIOContext io_context
);

[CCode (cname="", cheader_filename="")]
public int ffio_open_whitelist (
    out AVIOContext io_context,
    string url,
    int flags,
    AVIOInterruptCB int_cb,
    out LibAVUtil.Dictionary options,
    string whitelist,
    string blacklist
);

/***********************************************************
@brief Close a null buffer.

@param io_context an IO context opened by ffio_open_null_buf
@return the number of bytes written to the null buffer
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffio_close_null_buf (
    AVIOContext io_context
);

/***********************************************************
@brief Free a dynamic buffer.

@param io_context a pointer to an IO context opened by avio_open_dyn_buf ()
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void ffio_free_dyn_buf (
    out AVIOContext io_context
);

} // namespace LibAVFormat
