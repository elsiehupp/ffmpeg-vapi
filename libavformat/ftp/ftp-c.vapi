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

[CCode (cname="ff_ftp_protocol", cheader="")]
public class FTPURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "ftp";
        }
    }
    [CCode (cname="ftp_open", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );
    [CCode (cname="ftp_read", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="ftp_write", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="ftp_seek", cheader="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );
    [CCode (cname="ftp_close", cheader="")]
    public override int url_close (
        URLContext url_context
    );
    [CCode (cname="ftp_get_file_handle", cheader="")]
    public override int url_get_file_handle (
        URLContext url_context
    );
    [CCode (cname="ftp_shutdown", cheader="")]
    public override int url_shutdown (
        URLContext url_context,
        int flags
    );
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FTPContext);
        }
    }
    //  .priv_data_class = ftp_context_class,
    [CCode (cname="ftp_open_dir", cheader="")]
    public override int url_open_dir (
        URLContext url_context
    );
    [CCode (cname="ftp_read_dir", cheader="")]
    public override int url_read_dir (
        URLContext url_context,
        out AVIODirEntry next
    );
    [CCode (cname="ftp_close_dir", cheader="")]
    public override int url_close_dir (
        URLContext url_context
    );
    [CCode (cname="ftp_delete", cheader="")]
    public override int url_delete (
        URLContext url_context
    );
    [CCode (cname="ftp_move", cheader="")]
    public override int url_move (
        URLContext h_src,
        URLContext h_dst
    );
    [CCode (cname="flags", cheader="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
    //  .default_whitelist = "tcp";
}
