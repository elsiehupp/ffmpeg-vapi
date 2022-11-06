/***********************************************************
Concat URL protocol
@copyright 2006 Steve Lhomme
@copyright 2007 Wolfram Gloger
@copyright 2010 Michele Orrù

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

[CCode (cname="ff_concat_protocol", cheader="")]
public class ConcatURLProtocol : URLProtocol {
    //  .name           = "concat",
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext h,
        string url,
        int flags
    );       = concat_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext h,
        uchar[] buf,
        int size
    );       = concat_read,
    [CCode (cname="", cheader="")]
    public override int64 url_seek (
        URLContext h,
        int64 pos,
        int whence
    );       = concat_seek,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext h
    );      = concat_close,
    //  .priv_data_size = sizeof(struct concat_data),
    //  .default_whitelist = "concat,file,subfile",
}
