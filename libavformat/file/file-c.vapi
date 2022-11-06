/*
 * buffered file I/O
 * Copyright (c) 2001 Fabrice Bellard
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

static const AVOption file_options[] = {
    { "truncate", "truncate existing files on write", offsetof(FileContext, trunc), AV_OPT_TYPE_BOOL, { .i64 = 1 }, 0, 1, AV_OPT_FLAG_ENCODING_PARAM },
    { "blocksize", "set I/O operation maximum block size", offsetof(FileContext, blocksize), AV_OPT_TYPE_INT, { .i64 = INT_MAX }, 1, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
    { "follow", "Follow a file as it is being written", offsetof(FileContext, follow), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, 1, AV_OPT_FLAG_DECODING_PARAM },
    { "seekable", "Sets if the file is seekable", offsetof(FileContext, seekable), AV_OPT_TYPE_INT, { .i64 = -1 }, -1, 0, AV_OPT_FLAG_DECODING_PARAM | AV_OPT_FLAG_ENCODING_PARAM },
    { NULL }
};

static const AVOption pipe_options[] = {
    { "blocksize", "set I/O operation maximum block size", offsetof(FileContext, blocksize), AV_OPT_TYPE_INT, { .i64 = INT_MAX }, 1, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
    { NULL }
};

static const AVClass file_class = {
    //  .class_name = "file",
    //  .item_name  = av_default_item_name,
    //  .option     = file_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

static const AVClass pipe_class = {
    //  .class_name = "pipe",
    //  .item_name  = av_default_item_name,
    //  .option     = pipe_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

#if CONFIG_FILE_PROTOCOL

[CCode (cname="ff_file_protocol", cheader="")]
public class FileURLProtocol : URLProtocol {
    //  .name                = "file",
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext h,
        string url,
        int flags
    );            = file_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext h,
        uchar[] buf,
        int size
    );            = file_read,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext h,
        uchar[] buf,
        int size
    );           = file_write,
    [CCode (cname="", cheader="")]
    public override int64 url_seek (
        URLContext h,
        int64 pos,
        int whence
    );            = file_seek,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext h
    );           = file_close,
    [CCode (cname="", cheader="")]
    public override int url_get_file_handle (
        URLContext h
    ); = file_get_handle,
    [CCode (cname="", cheader="")]
    public override int url_check (
        URLContext h,
        int mask
    );           = file_check,
    [CCode (cname="", cheader="")]
    public override int url_delete (
        URLContext h
    );          = file_delete,
    [CCode (cname="", cheader="")]
    public override int url_move (
        URLContext h_src,
        URLContext h_dst
    );            = file_move,
    //  .priv_data_size      = sizeof(FileContext),
    //  .priv_data_class     = &file_class,
    [CCode (cname="", cheader="")]
    public override int url_open_dir (
        URLContext h
    );        = file_open_dir,
    [CCode (cname="", cheader="")]
    public override int url_read_dir (
        URLContext h,
        out AVIODirEntry next
    );        = file_read_dir,
    [CCode (cname="", cheader="")]
    public override int url_close_dir (
        URLContext h
    );       = file_close_dir,
    //  .default_whitelist   = "file,crypto"
};

#endif /* CONFIG_FILE_PROTOCOL */

#if CONFIG_PIPE_PROTOCOL

[CCode (cname="ff_pipe_protocol", cheader="")]
public class URLProtocol : URLProtocol ff_pipe_protocol = {
    //  .name                = "pipe",
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext h,
        string url,
        int flags
    );            = pipe_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext h,
        uchar[] buf,
        int size
    );            = file_read,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext h,
        uchar[] buf,
        int size
    );           = file_write,
    [CCode (cname="", cheader="")]
    public override int url_get_file_handle (
        URLContext h
    ); = file_get_handle,
    [CCode (cname="", cheader="")]
    public override int url_check (
        URLContext h,
        int mask
    );           = file_check,
    //  .priv_data_size      = sizeof(FileContext),
    //  .priv_data_class     = &pipe_class,
    //  .default_whitelist   = "crypto"
};

#endif /* CONFIG_PIPE_PROTOCOL */
