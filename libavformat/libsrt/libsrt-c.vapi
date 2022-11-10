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
@file Haivision Open SRT (Secure Reliable Transport) protocol
***********************************************************/

[CCode (cname="libsrt_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "libsrt"
    //  .item_name = av_default_item_name,
    //  .option = libsrt_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_libsrt_protocol", cheader="")]
public class LibSRTURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "srt"
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    ); // = libsrt_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    ); // = libsrt_read,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    ); // = libsrt_write,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext url_context
    ); // = libsrt_close,
    [CCode (cname="", cheader="")]
    public override int url_get_file_handle (
        URLContext url_context
    ); // = libsrt_get_file_handle,
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SRTContext);
        }
    }
    //  .flags = URL_PROTOCOL_FLAG_NETWORK,
    //  .priv_data_class = libsrt_class,
}
