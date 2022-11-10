/***********************************************************
MMS protocol over HTTP
@copyright 2010 Zhentan Feng <spyfeng at gmail dot com>
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

/***********************************************************
Reference
Windows Media HTTP Streaming Protocol.
http://msdn.microsoft.com/en-us/library/cc251059(PROT.10).aspx
***********************************************************/

[CCode (cname="ff_mmsh_protocol", cheader="")]
public class MMSHURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "mmsh"
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    ); // = mmsh_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    ); // = mmsh_read,
    [CCode (cname="", cheader="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    ); // = mmsh_seek,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext url_context
    ); // = mmsh_close,
    [CCode (cname="", cheader="")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    ); // = mmsh_read_seek,
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MMSHContext);
        }
    }
    //  .flags = URL_PROTOCOL_FLAG_NETWORK,
    //  .default_whitelist = "http,tcp"
}
