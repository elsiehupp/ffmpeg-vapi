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

[CCode (cname="struct URLProtocol",cheader_filename="subprojects/ffmpeg/libformat/url.h")]
public abstract class URLProtocol {
    [CCode (cname="")]
    public abstract string name { public get; }

    [CCode (cname="")]
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
    [CCode (cname="")]
    public abstract int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="")]
    public abstract int url_accept (
        URLContext server_url_context,
        out URLContext client_url_context
    );

    [CCode (cname="")]
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
    [CCode (cname="")]
    public abstract int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="")]
    public abstract int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="")]
    public abstract int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );

    [CCode (cname="")]
    public abstract int url_close (
        URLContext url_context
    );

    [CCode (cname="")]
    public abstract int url_read_pause (
        URLContext url_context,
        int pause
    );

    [CCode (cname="")]
    public abstract int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="")]
    public abstract int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="")]
    public abstract int url_get_multi_file_handle (
        URLContext url_context,
        out int[] handles,
        out int numhandles
    );

    [CCode (cname="")]
    public abstract int url_get_short_seek (
        URLContext url_context
    );

    [CCode (cname="")]
    public abstract int url_shutdown (
        URLContext url_context,
        int flags
    );

    [CCode (cname="")]
    public abstract size_t priv_data_size { public get; }

    [CCode (cname="")]
    public abstract LibAVUtil.Class priv_data_class { public get; }

    [CCode (cname="")]
    public abstract URLProtocolFlags flags { public get; }

    [CCode (cname="")]
    public abstract int url_check (
        URLContext url_context,
        int mask
    );

    [CCode (cname="")]
    public abstract int url_open_dir (
        URLContext url_context
    );

    [CCode (cname="")]
    public abstract int url_read_dir (
        URLContext url_context,
        out AVIODirEntry next
    );

    [CCode (cname="")]
    public abstract int url_close_dir (
        URLContext url_context
    );

    [CCode (cname="")]
    public abstract int url_delete (
        URLContext url_context
    );

    [CCode (cname="")]
    public abstract int url_move (
        URLContext h_src,
        URLContext h_dst
    );

    [CCode (cname="")]
    public string default_whitelist;
}
