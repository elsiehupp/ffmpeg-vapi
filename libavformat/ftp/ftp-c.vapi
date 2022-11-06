/*
 * Copyright (c) 2013 Lukasz Marek <lukasz.m.luki@gmail.com>
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

[CCode (cname="ff_ftp_protocol", cheader="")]
public class FTPURLProtocol : URLProtocol {
    //  .name                = "ftp",
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext h,
        string url,
        int flags
    );            = ftp_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext h,
        uchar[] buf,
        int size
    );            = ftp_read,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext h,
        uchar[] buf,
        int size
    );           = ftp_write,
    [CCode (cname="", cheader="")]
    public override int64 url_seek (
        URLContext h,
        int64 pos,
        int whence
    );            = ftp_seek,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext h
    );           = ftp_close,
    [CCode (cname="", cheader="")]
    public override int url_get_file_handle (
        URLContext h
    ); = ftp_get_file_handle,
    [CCode (cname="", cheader="")]
    public override int url_shutdown (
        URLContext h,
        int flags
    );        = ftp_shutdown,
    //  .priv_data_size      = sizeof(FTPContext),
    //  .priv_data_class     = &ftp_context_class,
    [CCode (cname="", cheader="")]
    public override int url_open_dir (
        URLContext h
    );        = ftp_open_dir,
    [CCode (cname="", cheader="")]
    public override int url_read_dir (
        URLContext h,
        out AVIODirEntry next
    );        = ftp_read_dir,
    [CCode (cname="", cheader="")]
    public override int url_close_dir (
        URLContext h
    );       = ftp_close_dir,
    [CCode (cname="", cheader="")]
    public override int url_delete (
        URLContext h
    );          = ftp_delete,
    [CCode (cname="", cheader="")]
    public override int url_move (
        URLContext h_src,
        URLContext h_dst
    );            = ftp_move,
    //  .flags               = URL_PROTOCOL_FLAG_NETWORK,
    //  .default_whitelist   = "tcp",
};
