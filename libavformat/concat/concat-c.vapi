/***********************************************************
Concat URL protocol
@copyright 2006 Steve Lhomme
@copyright 2007 Wolfram Gloger
@copyright 2010 Michele Orrù
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

namespace LibAVFormat {

[CCode (cname="struct concat_data", cheader_filename="")]
public struct ConcatPrivateData { }

[CCode (cname="ff_concat_protocol", cheader_filename="")]
public class ConcatURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "concat";
        }
    }
    [CCode (cname="concat_open", cheader_filename="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );
    [CCode (cname="concat_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="concat_seek", cheader_filename="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );
    [CCode (cname="concat_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ConcatPrivateData);
        }
    }
    //  .default_whitelist = "concat,file,subfile";
}

} // namespace LibAVFormat
