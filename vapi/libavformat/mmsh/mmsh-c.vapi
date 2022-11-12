/***********************************************************
@brief MMS protocol over HTTP
@copyright 2010 Zhentan Feng <spyfeng at gmail dot com>
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
@brief Reference
Windows Media HTTP Streaming Protocol.
http://msdn.microsoft.com/en-us/library/cc251059 (PROT.10).aspx
***********************************************************/

[CCode (cname="struct MMSHContext", cheader_filename="")]
public struct MMSHPrivateData { }

[CCode (cname="ff_mmsh_protocol", cheader_filename="")]
public class MMSHURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "mmsh";
        }
    }

    [CCode (cname="mmsh_open", cheader_filename="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="mmsh_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="mmsh_seek", cheader_filename="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );

    [CCode (cname="mmsh_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="mmsh_read_seek", cheader_filename="")]
    public override int64 url_read_seek (
        URLContext url_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MMSHPrivateData);
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
    //  .default_whitelist = "http,tcp";
}

} // namespace LibAVFormat
