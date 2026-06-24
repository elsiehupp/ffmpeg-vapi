/***********************************************************
@brief Input async protocol.
@copyright 2015 Zhang Rui <bbcallen@gmail.com>
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

Based on libavformat/cache.c by Michael Niedermayer
***********************************************************/

namespace LibAVFormat {

/***********************************************************
@todo
    support timeout
    support work with concatdec, hls
***********************************************************/

static const LibAVUtil.Option options[] = {
    {
        NULL
    }

};
//  #undef LibAVUtil.OptionFlags.DECODING_PARAM
//  #undef OFFSET

[CCode (cname="async_context_class",cheader_filename="ffmpeg/libformat/async.c")]
public class AsyncContextClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/async.c")]
    public override string class_name {
        public get {
            return "Async";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/async.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/async.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/async.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct Context",cheader_filename="ffmpeg/libformat/async.c")]
[Compact]
public class AsyncPrivateData { }

[CCode (cname="ff_async_protocol",cheader_filename="ffmpeg/libformat/async.c")]
public class AsyncURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/async.c")]
    public override string name {
        public get {
            return "async";

        }

    }

    [CCode (cname="async_open",cheader_filename="ffmpeg/libformat/async.c")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="async_read",cheader_filename="ffmpeg/libformat/async.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="async_seek",cheader_filename="ffmpeg/libformat/async.c")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );

    [CCode (cname="async_close",cheader_filename="ffmpeg/libformat/async.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/async.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (AsyncPrivateData);

        }

    }
    //  .priv_data_class = async_context_class;
}

#if 0

[CCode (cname="async_test_options",cheader_filename="")]
static const LibAVUtil.Option async_test_options[] = {
    new LibAVUtil.IntOption () {
        name = "async-test-read-error",
        short_help_text = "cause read fail",
        offset = offsetof (
            TestContext,
            opt_read_error
        ),
        default_value = 0,
        minimum_value = int.MIN,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    {
        NULL
    }

};
#undef LibAVUtil.OptionFlags.DECODING_PARAM
#undef OFFSET

[CCode (cname="async_test_context_class",cheader_filename="ffmpeg/libformat/async.c")]
public class AsyncTestContextClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/async.c")]
    public override string class_name {
        public get {
            return "Async-Test";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/async.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = async_test_options,

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/async.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_async_test_protocol",cheader_filename="ffmpeg/libformat/async.c")]
public class AsyncTestURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/async.c")]
    public override string name {
        public get {
            return "async-test";

        }

    }

    [CCode (cname="async_test_open",cheader_filename="ffmpeg/libformat/async.c")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="async_test_read",cheader_filename="ffmpeg/libformat/async.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="async_test_seek",cheader_filename="ffmpeg/libformat/async.c")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );

    [CCode (cname="async_test_close",cheader_filename="ffmpeg/libformat/async.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/async.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (TestContext);

        }

    }
    //  .priv_data_class = async_test_context_class;
}

#endif

} // namespace LibAVFormat
