/***********************************************************
@copyright 2013 Lukasz Marek <lukasz.m.luki@gmail.com>
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

//  #define OFFSET(x) offsetof(LIBSSHContext, x)
//  #define D AV_OPT_FLAG_DECODING_PARAM
//  #define E AV_OPT_FLAG_ENCODING_PARAM
//  static const AVOption options[] = {
//      {"timeout", "set timeout of socket I/O operations", OFFSET(rw_timeout), AV_OPT_TYPE_INT, {.i64 = -1}, -1, INT_MAX, D|E },
//      {"truncate", "Truncate existing files on write", OFFSET(trunc), AV_OPT_TYPE_INT, { .i64 = 1 }, 0, 1, E },
//      {"private_key", "set path to private key", OFFSET(priv_key), AV_OPT_TYPE_STRING, { .str = NULL }, 0, 0, D|E },
//      {NULL}
//  }

[CCode (cname="libssh_context_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "libssh"
    //  .item_name = av_default_item_name,
    //  .option = options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_libssh_protocol", cheader="")]
public class LibSSHURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "sftp"
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    ); // = libssh_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    ); // = libssh_read,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    ); // = libssh_write,
    [CCode (cname="", cheader="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    ); // = libssh_seek,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext url_context
    ); // = libssh_close,
    [CCode (cname="", cheader="")]
    public override int url_delete (
        URLContext url_context
    ); // = libssh_delete,
    [CCode (cname="", cheader="")]
    public override int url_move (
        URLContext h_src,
        URLContext h_dst
    ); // = libssh_move,
    [CCode (cname="", cheader="")]
    public override int url_open_dir (
        URLContext url_context
    ); // = libssh_open_dir,
    [CCode (cname="", cheader="")]
    public override int url_read_dir (
        URLContext url_context,
        out AVIODirEntry next
    ); // = libssh_read_dir,
    [CCode (cname="", cheader="")]
    public override int url_close_dir (
        URLContext url_context
    ); // = libssh_close_dir,
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (LIBSSHContext);
        }
    }
    //  .priv_data_class = libssh_context_class,
    //  .flags = URL_PROTOCOL_FLAG_NETWORK,
}
