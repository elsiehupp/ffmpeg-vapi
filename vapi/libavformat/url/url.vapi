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
@file unbuffered private I/O API
***********************************************************/
[Flags]
public enum URLProtocolFlags {
    /***********************************************************
    @brief The protocol name can be the first part of a nested protocol scheme
        ***********************************************************/
    URL_PROTOCOL_FLAG_NESTED_SCHEME,
    /***********************************************************
    @brief The protocol uses network
        ***********************************************************/
    URL_PROTOCOL_FLAG_NETWORK,
}

//  extern const LibAVUtil.Class ffurl_context_class;

[CCode (cname="struct URLContext", cheader_filename="")]
public struct URLContext {
    /***********************************************************
    @brief Information for av_log (). Set by url_open ().
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Class av_class;

    [CCode (cname="", cheader_filename="")]
    public URLProtocol prot;

    [CCode (cname="", cheader_filename="")]
    public void *priv_data;

    /***********************************************************
    @brief Specified URL
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public string filename;

    [CCode (cname="", cheader_filename="")]
    public int flags;

    /***********************************************************
    @brief If non zero, the stream is packetized with this max packet size
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int max_packet_size;

    /***********************************************************
    @brief True if streamed (no seek possible), default = false
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int is_streamed;

    [CCode (cname="", cheader_filename="")]
    public int is_connected;

    [CCode (cname="", cheader_filename="")]
    public AVIOInterruptCB interrupt_callback;

    /***********************************************************
    @brief Maximum time to wait for (network) read/write operation completion, in mcs
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 rw_timeout;

    [CCode (cname="", cheader_filename="")]
    public string protocol_whitelist;

    [CCode (cname="", cheader_filename="")]
    public string protocol_blacklist;

    /***********************************************************
    @brief If non zero, the stream is packetized with this min packet size
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int min_packet_size;
}

[CCode (cname="", cheader_filename="")]
public abstract class URLProtocol {
    [CCode (cname="", cheader_filename="")]
    public abstract string name { public get; }

    [CCode (cname="", cheader_filename="")]
    public abstract int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    /***********************************************************
    @brief This callback is to be used by protocols which open further nested
    protocols. options are then to be passed to ffurl_open ()/ffurl_connect ()
    for those nested protocols.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public abstract int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int url_accept (
        URLContext server_url_context,
        out URLContext client_url_context
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int url_handshake (
        URLContext client_url_context
    );

    /***********************************************************
    @brief Read data from the protocol.
    If data is immediately available (even less than size), EOF is
    reached or an error occurs (including EINTR), return immediately.
    Otherwise:
    In non-blocking mode, return LibAVUtil.ErrorCode (EAGAIN) immediately.
    In blocking mode, wait for data/EOF/error with a short timeout (0.1s),
    and return LibAVUtil.ErrorCode (EAGAIN) on timeout.
    Checking interrupt_callback, looping on EINTR and EAGAIN and until
    enough data has been read is left to the calling function; see
    retry_transfer_wrapper in avio.c.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public abstract int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int url_close (
        URLContext url_context
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int url_get_multi_file_handle (
        URLContext url_context,
        out int[] handles,
        out int numhandles
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int url_get_short_seek (
        URLContext url_context
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int url_shutdown (
        URLContext url_context,
        int flags
    );

    [CCode (cname="", cheader_filename="")]
    public abstract size_t priv_data_size { public get; }

    [CCode (cname="", cheader_filename="")]
    public abstract LibAVUtil.Class priv_data_class { public get; }

    [CCode (cname="", cheader_filename="")]
    public abstract URLProtocolFlags flags { public get; }

    [CCode (cname="", cheader_filename="")]
    public abstract int url_check (
        URLContext url_context,
        int mask
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int url_open_dir (
        URLContext url_context
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int url_read_dir (
        URLContext url_context,
        out AVIODirEntry next
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int url_close_dir (
        URLContext url_context
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int url_delete (
        URLContext url_context
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int url_move (
        URLContext h_src,
        URLContext h_dst
    );

    [CCode (cname="", cheader_filename="")]
    public string default_whitelist;
}

/***********************************************************
@brief Create a URLContext for accessing to the resource indicated by
url, but do not initiate the connection yet.

@param puc pointer to the location where, in case of success, the
function puts the pointer to the created URLContext
@param flags flags which control how the resource indicated by url
is to be opened
@param int_cb interrupt callback to use for the URLContext, may be
NULL
@return >= 0 in case of success, a negative value corresponding to an
LibAVUtil.ErrorCode code in case of failure
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffurl_alloc (
    out URLContext puc,
    string filename,
    int flags,
    AVIOInterruptCB int_cb
);

/***********************************************************
@brief Connect an URLContext that has been allocated by ffurl_alloc

@param options A dictionary filled with options for nested protocols,
i.e. it will be passed to url_open2 () for protocols implementing it.
This parameter will be destroyed and replaced with a dict containing options
that were not found. May be NULL.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffurl_connect (
    URLContext uc,
    out LibAVUtil.Dictionary options
);

/***********************************************************
@brief Create an URLContext for accessing to the resource indicated by
url, and open it.

@param puc pointer to the location where, in case of success, the
function puts the pointer to the created URLContext
@param flags flags which control how the resource indicated by url
is to be opened
@param int_cb interrupt callback to use for the URLContext, may be
NULL
@param options A dictionary filled with protocol-private options. On return
this parameter will be destroyed and replaced with a dict containing options
that were not found. May be NULL.
@param parent An enclosing URLContext, whose generic options should
              be applied to this URLContext as well.
@return >= 0 in case of success, a negative value corresponding to an
LibAVUtil.ErrorCode code in case of failure
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffurl_open_whitelist (
    out URLContext puc,
    string filename,
    int flags,
    AVIOInterruptCB int_cb,
    out LibAVUtil.Dictionary options,
    string whitelist,
    char* blacklist,
    URLContext parent
);

[CCode (cname="", cheader_filename="")]
public int ffurl_open (
    out URLContext puc,
    string filename,
    int flags,
    AVIOInterruptCB int_cb,
    out LibAVUtil.Dictionary options
);

/***********************************************************
@brief Accept an URLContext client_url_context on an URLContext server_url_context

@param server_url_context server context
@param client_url_context client context, must be unallocated.
@return >= 0 on success, ff_neterrno () on failure.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffurl_accept (
    URLContext server_url_context,
    out URLContext client_url_context
);

/***********************************************************
@brief Perform one step of the protocol handshake to accept a new client.
See avio_handshake () for details.
Implementations should try to return decreasing values.
If the protocol uses an underlying protocol, the underlying handshake is
usually the first step, and the return value can be:
(largest value for this protocol) + (return value from other protocol)

@param client_url_context the client context
@return >= 0 on success or a negative value corresponding
        to an LibAVUtil.ErrorCode code on failure
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffurl_handshake (
    URLContext client_url_context
);

/***********************************************************
@brief Read up to size bytes from the resource accessed by h, and store
the read bytes in buffer.

@return The number of bytes actually read, or a negative value
corresponding to an LibAVUtil.ErrorCode code in case of error. A value of zero
indicates that it is not possible to read more from the accessed
resource (except if the value of the size argument is also zero).
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffurl_read (
    URLContext url_context,
    uchar[] buffer,
    int size
);

/***********************************************************
@brief Read as many bytes as possible (up to size), calling the
read function multiple times if necessary.
This makes special short-read handling in applications
unnecessary, if the return value is < size then it is
certain there was either an error or the end of file was reached.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffurl_read_complete (
    URLContext url_context,
    uchar[] buffer,
    int size
);

/***********************************************************
@brief Write size bytes from buffer to the resource accessed by h.

@return the number of bytes actually written, or a negative value
corresponding to an LibAVUtil.ErrorCode code in case of failure
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffurl_write (
    URLContext url_context,
    uchar[] buffer,
    int size
);

/***********************************************************
@brief Change the position that will be used by the next read/write
operation on the resource accessed by h.

@param pos specifies the new position to set
@param whence specifies how pos should be interpreted, it must be
one of SEEK_SET (seek from the beginning), SEEK_CUR (seek from the
current position), SEEK_END (seek from the end), or AVSEEK_SIZE
(return the filesize of the requested resource, pos is ignored).
@return a negative value corresponding to an LibAVUtil.ErrorCode code in case
of failure, or the resulting file position, measured in bytes from
the beginning of the file. You can use this feature together with
SEEK_CUR to read the current file position.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int64 ffurl_seek (
    URLContext url_context,
    int64 pos,
    int whence
);

/***********************************************************
@brief Close the resource accessed by the URLContext url_context, and free the
memory used by it. Also set the URLContext pointer to NULL.

@return a negative value if an error condition occurred, 0
otherwise
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffurl_closep (
    out URLContext url_context
);

[CCode (cname="", cheader_filename="")]
public int ffurl_close (
    URLContext url_context
);

/***********************************************************
@brief Return the filesize of the resource accessed by h, LibAVUtil.ErrorCode (ENOSYS)
if the operation is not supported by h, or another negative value
corresponding to an LibAVUtil.ErrorCode error code in case of failure.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int64 ffurl_size (
    URLContext url_context
);

/***********************************************************
@brief Return the file descriptor associated with this URL. For RTP, this
will return only the RTP file descriptor, not the RTCP file descriptor.

@return the file descriptor associated with this URL, or <0 on error.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffurl_get_file_handle (
    URLContext url_context
);

/***********************************************************
@brief Return the file descriptors associated with this URL.

@return 0 on success or <0 on error.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffurl_get_multi_file_handle (
    URLContext url_context,
    out int[] handles,
    out int numhandles
);

/***********************************************************
@brief Return the current short seek threshold value for this URL.

@return threshold (>0) on success or <=0 on error.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffurl_get_short_seek (
    URLContext url_context
);

/***********************************************************
@brief Signal the URLContext that we are done reading or writing the stream.

@param h pointer to the resource
@param flags flags which control how the resource indicated by url
is to be shutdown

@return a negative value if an error condition occurred, 0
otherwise
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ffurl_shutdown (
    URLContext url_context,
    int flags
);

/***********************************************************
@brief Check if the user has requested to interrupt a blocking function
associated with cb.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_check_interrupt (
    AVIOInterruptCB cb
);

/***********************************************************
@brief Udp.c
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_udp_set_remote_url (
    URLContext url_context,
    string uri
);

[CCode (cname="", cheader_filename="")]
public int ff_udp_get_local_port (
    URLContext url_context
);

/***********************************************************
@brief Assemble a URL string from components. This is the reverse operation
of av_url_split.

Note, this requires networking to be initialized, so the caller must
ensure ff_network_init has been called.

@see av_url_split

@param str the buffer to fill with the url
@param size the size of the str buffer
@param proto the protocol identifier, if null, the separator
             after the identifier is left out, too
@param authorization an optional authorization string, may be null.
                     An empty string is treated the same as a null string.
@param hostname the host name string
@param port the port number, left out from the string if negative
@param fmt a generic format string for everything to add after the
           host/port, may be null
@return the number of characters written to the destination buffer
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_url_join (
    string str,
    int size,
    string proto,
    string authorization,
    string hostname,
    int port,
    string fmt,
    ...
); // av_printf_format (7, 8);

/***********************************************************
@brief Convert a relative url into an absolute url, given a base url.

@param buffer the buffer where output absolute url is written
@param size the size of buffer
@param base the base url, may be equal to buffer.
@param rel the new url, which is interpreted relative to base
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void ff_make_absolute_url (
    string buffer,
    int size,
    string base_url,
    string rel
);

/***********************************************************
@brief Allocate directory entry with default values.

@return entry or NULL on error
***********************************************************/
[CCode (cname="", cheader_filename="")]
public AVIODirEntry ff_alloc_dir_entry ();

[CCode (cname="", cheader_filename="")]
public LibAVUtil.Class ff_urlcontext_child_class_next (
    LibAVUtil.Class prev
);

/***********************************************************
@brief Construct a list of protocols matching a given whitelist and/or blacklist.

@param whitelist a comma-separated list of allowed protocol names or NULL. If
                 this is a non-empty string, only protocols in this list will
                 be included.
@param blacklist a comma-separated list of forbidden protocol names or NULL.
                 If this is a non-empty string, all protocols in this list
                 will be excluded.

@return a NULL-terminated array of matching protocols. The array must be
freed by the caller.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public URLProtocol[] ffurl_get_protocols (
    string whitelist,
    string blacklist
);

} // namespace LibAVFormat
