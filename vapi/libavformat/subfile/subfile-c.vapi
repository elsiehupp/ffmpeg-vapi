/***********************************************************
@copyright 2014 Nicolas George
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

namespace LibAVFormat {

static const LibAVUtil.Option subfile_options[] = {
    new LibAVUtil.Int64Option () {
        name = "start",
        short_help_text = "start offset",
        offsetof (
            SubfileContext,
            start
        ),
        {
            .i64 = 0
        },
        0,
        int64.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.Int64Option () {
        name = "end",
        short_help_text = "end offset",
        offsetof (
            SubfileContext,
            end
        ),
        {
            .i64 = 0
        },
        0,
        int64.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    {
        NULL
    }
}

//  #undef OFFSET
//  #undef LibAVUtil.OptionFlags.DECODING_PARAM

[CCode (cname="subfile_class",cheader_filename="")]
public class SubFileURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="")]
    public override string class_name {
        public get {
            return "subfile";

        }

    }

    [CCode (cname="item_name",cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = subfile_options,

    [CCode (cname="version",cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct SubfileContext",cheader_filename="")]
[Compact]
public class SubFilePrivateData { }

[CCode (cname="ff_subfile_protocol",cheader_filename="")]
public class SubFileURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="")]
    public override string name {
        public get {
            return "subfile";

        }

    }

    [CCode (cname="subfile_open",cheader_filename="")]
    public override int url_open2 (
        URLContext url_context,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    [CCode (cname="subfile_read",cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="subfile_seek",cheader_filename="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );

    [CCode (cname="subfile_close",cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SubFilePrivateData);

        }

    }
    //  .priv_data_class = subfile_class,
    //  .default_whitelist = "file";
    //      }
    //  }
}

} // namespace LibAVFormat
