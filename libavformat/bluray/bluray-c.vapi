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
BluRay (libbluray) protocol

@copyright 2012 Petri Hintukainen <phintuka <at> users.sourceforge.net>
***********************************************************/
//  #define OFFSET(x) offsetof(BlurayContext, x)
//  static const AVOption options[] = {
//      {"playlist", "", OFFSET(playlist), AV_OPT_TYPE_INT, { .i64=-1 }, -1,  99999, AV_OPT_FLAG_DECODING_PARAM },
//      {"angle",    "", OFFSET(angle),    AV_OPT_TYPE_INT, { .i64=0 },   0,   0xfe, AV_OPT_FLAG_DECODING_PARAM },
//      {"chapter",  "", OFFSET(chapter),  AV_OPT_TYPE_INT, { .i64=1 },   1, 0xfffe, AV_OPT_FLAG_DECODING_PARAM },
//      /*{"region",   "bluray player region code (1 = region A, 2 = region B, 4 = region C)", OFFSET(region), AV_OPT_TYPE_INT, { .i64=0 }, 0, 3, AV_OPT_FLAG_DECODING_PARAM },*/
//      {NULL}
//  }

[CCode (cname="bluray_context_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "bluray"
    //  .item_name = av_default_item_name,
    //  .option = options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_bluray_protocol", cheader="")]
public class BluRayURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "bluray"
    [CCode (cname="bluray_close", cheader="")]
    public override int url_close (
        URLContext url_context
    );
    [CCode (cname="bluray_open", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );
    [CCode (cname="bluray_read", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="bluray_seek", cheader="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (BlurayContext);
        }
    }
    //  .priv_data_class = bluray_context_class,
}
