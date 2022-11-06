/***********************************************************
@copyright 2014 Lukasz Marek <lukasz.m.luki@gmail.com>

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

#define OFFSET(x) offsetof(LIBSMBContext, x)
#define D AV_OPT_FLAG_DECODING_PARAM
#define E AV_OPT_FLAG_ENCODING_PARAM
static const AVOption options[] = {
    {"timeout",   "set timeout in ms of socket I/O operations",    OFFSET(timeout), AV_OPT_TYPE_INT, {.i64 = -1}, -1, INT_MAX, D|E },
    {"truncate",  "truncate existing files on write",              OFFSET(trunc),   AV_OPT_TYPE_INT, { .i64 = 1 }, 0, 1, E },
    {"workgroup", "set the workgroup used for making connections", OFFSET(workgroup), AV_OPT_TYPE_STRING, { 0 }, 0, 0, D|E },
    {NULL}
}

static const AVClass libsmbclient_context_class = {
    //  .class_name     = "libsmbc",
    //  .item_name      = av_default_item_name,
    //  .option         = options,
    //  .version        = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_libsmbclient_protocol", cheader="")]
public class LibSMBClientURLProtocol : URLProtocol {
    //  .name                = "smb",
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext h,
        string url,
        int flags
    );            = libsmbc_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext h,
        uchar[] buf,
        int size
    );            = libsmbc_read,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext h,
        uchar[] buf,
        int size
    );           = libsmbc_write,
    [CCode (cname="", cheader="")]
    public override int64 url_seek (
        URLContext h,
        int64 pos,
        int whence
    );            = libsmbc_seek,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext h
    );           = libsmbc_close,
    [CCode (cname="", cheader="")]
    public override int url_delete (
        URLContext h
    );          = libsmbc_delete,
    [CCode (cname="", cheader="")]
    public override int url_move (
        URLContext h_src,
        URLContext h_dst
    );            = libsmbc_move,
    [CCode (cname="", cheader="")]
    public override int url_open_dir (
        URLContext h
    );        = libsmbc_open_dir,
    [CCode (cname="", cheader="")]
    public override int url_read_dir (
        URLContext h,
        out AVIODirEntry next
    );        = libsmbc_read_dir,
    [CCode (cname="", cheader="")]
    public override int url_close_dir (
        URLContext h
    );       = libsmbc_close_dir,
    //  .priv_data_size      = sizeof(LIBSMBContext),
    //  .priv_data_class     = &libsmbclient_context_class,
    //  .flags               = URL_PROTOCOL_FLAG_NETWORK,
}
