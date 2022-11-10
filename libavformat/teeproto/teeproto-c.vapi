/***********************************************************
Tee output protocol
@copyright 2016 Michael Niedermayer
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

//  static const AVOption tee_options[] = {
//      { NULL }
//  }

[CCode (cname="tee_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "tee"
    //  .item_name = av_default_item_name,
    //  .option = tee_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_tee_protocol", cheader="")]
public class TeeURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "tee"
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    ); // = tee_open,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    ); // = tee_write,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext url_context
    ); // = tee_close,
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (TeeContext);
        }
    }
    //  .priv_data_class = tee_class,
    //  .default_whitelist = "crypto,file,http,https,httpproxy,rtmp,tcp,tls"
}
