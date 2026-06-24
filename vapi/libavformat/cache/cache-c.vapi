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

[CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/cache.c")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.IntOption () {
        name = "read_ahead_limit",
        short_help_text = "Amount in bytes that may be read ahead when seeking isn't supported, -1 for unlimited",
        offset = offsetof (
            Context,
            read_ahead_limit
        ),
        default_value = 65536,
        minimum_value = -1,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="struct Context",cheader_filename="subprojects/ffmpeg/libavformat/cache.c")]
[Compact]
public class CachePrivateData { }

[CCode (cname="cache_context_class",cheader_filename="subprojects/ffmpeg/libavformat/cache.c")]
public class CacheContextClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/cache.c")]
    public override string class_name {
        public get {
            return "Cache";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/cache.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/cache.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/cache.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_cache_protocol",cheader_filename="subprojects/ffmpeg/libavformat/cache.c")]
public class CacheURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/cache.c")]
    public override string name {
        public get {
            return "cache";

        }

    }

    [CCode (cname="cache_open",cheader_filename="subprojects/ffmpeg/libavformat/cache.c")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="cache_read",cheader_filename="subprojects/ffmpeg/libavformat/cache.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="cache_seek",cheader_filename="subprojects/ffmpeg/libavformat/cache.c")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );

    [CCode (cname="cache_close",cheader_filename="subprojects/ffmpeg/libavformat/cache.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/cache.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (CachePrivateData);

        }

    }
    //  .priv_data_class = cache_context_class;
}

} // namespace LibAVFormat
