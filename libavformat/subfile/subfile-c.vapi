/***********************************************************
@copyright 2014 Nicolas George
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with FFmpeg; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

//  #define OFFSET(field) offsetof(SubfileContext, field)
//  #define D AV_OPT_FLAG_DECODING_PARAM

//  static const AVOption subfile_options[] = {
//      { "start", "start offset", OFFSET(start), AV_OPT_TYPE_INT64, {.i64 = 0}, 0, INT64_MAX, D },
//      { "end",   "end offset",   OFFSET(end),   AV_OPT_TYPE_INT64, {.i64 = 0}, 0, INT64_MAX, D },
//      { NULL }
//  }

//  #undef OFFSET
//  #undef D

[CCode (cname="subfile_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "subfile";
        }
    }
    [CCode (cname="item_name", cheader="")]
    public override string item_name (
        void *class_context
    ) {
        return av_default_item_name (
            class_context
        );
    }
    //  .option = subfile_options,
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_subfile_protocol", cheader="")]
public class SubFileURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "subfile";
        }
    }
    [CCode (cname="", cheader="")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    ); // = subfile_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    ); // = subfile_read,
    [CCode (cname="", cheader="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    ); // = subfile_seek,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext url_context
    ); // = subfile_close,
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SubfileContext);
        }
    }
    //  .priv_data_class = subfile_class,
    //  .default_whitelist = "file";
        }
    }
}
