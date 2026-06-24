/***********************************************************
@copyright 2014 Lukasz Marek <lukasz.m.luki@gmail.com>
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
***********************************************************/

namespace LibAVFormat {

[CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.IntOption () {
        name = "timeout",
        short_help_text = "set timeout in ms of socket I/O operations",
        offset = offsetof (
            LIBSMBContext,
            timeout
        ),
        default_value = -1,
        minimum_value = -1,
        maximum_value = int.MAX,
        option_flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.IntOption () {
        name = "truncate",
        short_help_text = "truncate existing files on write",
        offset = offsetof (
            LIBSMBContext,
            trunc
        ),
        default_value = 1,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    new LibAVUtil.StringOption () {
        name = "workgroup",
        short_help_text = "set the workgroup used for making connections",
        offset = offsetof (
            LIBSMBContext,
            workgroup
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = 0,
        option_flags = (
            LibAVUtil.OptionFlags.DECODING_PARAM |
            LibAVUtil.OptionFlags.ENCODING_PARAM
        )
    },
    {
        NULL
    }

};

[CCode (cname="libsmbclient_context_class",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
public class LibSMBClientURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override string class_name {
        public get {
            return "libsmbc";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = options,

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct LIBSMBContext",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
[Compact]
public class LibSMBClientPrivateData { }

[CCode (cname="ff_libsmbclient_protocol",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
public class LibSMBClientURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override string name {
        public get {
            return "smb";

        }

    }

    [CCode (cname="libsmbc_open",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="libsmbc_read",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="libsmbc_write",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="libsmbc_seek",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );

    [CCode (cname="libsmbc_close",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="libsmbc_delete",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override int url_delete (
        URLContext url_context
    );

    [CCode (cname="libsmbc_move",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override int url_move (
        URLContext h_src,
        URLContext h_dst
    );

    [CCode (cname="libsmbc_open_dir",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override int url_open_dir (
        URLContext url_context
    );

    [CCode (cname="libsmbc_read_dir",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override int url_read_dir (
        URLContext url_context,
        out AVIODirEntry next
    );

    [CCode (cname="libsmbc_close_dir",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override int url_close_dir (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (LibSMBClientPrivateData);

        }

    }
    //  .priv_data_class = libsmbclient_context_class,

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/libsmbclient.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
}

} // namespace LibAVFormat
