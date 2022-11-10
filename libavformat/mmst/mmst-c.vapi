/***********************************************************
MMS protocol over TCP
@copyright 2006,2007 Ryan Martell
@copyright 2007 Björn Axelsson
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
References
 MMS protocol specification:
  [1]http://msdn.microsoft.com/en-us/library/cc234711(PROT.10).aspx
 ASF specification. Revision 01.20.03.
  [2]http://msdn.microsoft.com/en-us/library/bb643323.aspx
***********************************************************/

[CCode (cname="ff_mmst_protocol", cheader="")]
public class MMSTURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "mmst"
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    ); // = mms_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    ); // = mms_read,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext url_context
    ); // = mms_close,
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MMSTContext);
        }
    }
    //  .flags = URL_PROTOCOL_FLAG_NETWORK,
}
