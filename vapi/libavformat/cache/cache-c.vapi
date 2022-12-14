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

Based on file.c by Fabrice Bellard
***********************************************************/

namespace LibAVFormat {

/***********************************************************
@brief Input cache protocol.
@copyright 2011, 2014 Michael Niedermayer
***********************************************************/
/***********************************************************
@todo
    support keeping files
    support filling with a background thread
***********************************************************/

//  #define OFFSET (x) offsetof (Context, x)
//  #define D AV_OPT_FLAG_DECODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      { "read_ahead_limit", "Amount in bytes that may be read ahead when seeking isn't supported, -1 for unlimited", OFFSET (read_ahead_limit), AV_OPT_TYPE_INT, { .i64 = 65536 }, -1, INT_MAX, D },
//      {NULL},
//  }

[CCode (cname="struct Context", cheader_filename="")]
public struct CachePrivateData { }

[CCode (cname="cache_context_class", cheader_filename="")]
public class CacheContextClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "Cache";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_cache_protocol", cheader_filename="")]
public class CacheURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "cache";
        }
    }

    [CCode (cname="cache_open", cheader_filename="")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="cache_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="cache_seek", cheader_filename="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );

    [CCode (cname="cache_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (CachePrivateData);
        }
    }
    //  .priv_data_class = cache_context_class,
}

} // namespace LibAVFormat
