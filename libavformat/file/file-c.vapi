/***********************************************************
@brief Buffered file I/O
@copyright 2001 Fabrice Bellard
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

//  static const LibAVUtil.Option file_options[] = {
//      { "truncate", "truncate existing files on write", offsetof(FileContext, trunc), AV_OPT_TYPE_BOOL, { .i64 = 1 }, 0, 1, AV_OPT_FLAG_ENCODING_PARAM },
//      { "blocksize", "set I/O operation maximum block size", offsetof(FileContext, blocksize), AV_OPT_TYPE_INT, { .i64 = INT_MAX }, 1, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "follow", "Follow a file as it is being written", offsetof(FileContext, follow), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, 1, AV_OPT_FLAG_DECODING_PARAM },
//      { "seekable", "Sets if the file is seekable", offsetof(FileContext, seekable), AV_OPT_TYPE_INT, { .i64 = -1 }, -1, 0, AV_OPT_FLAG_DECODING_PARAM | AV_OPT_FLAG_ENCODING_PARAM },
//      { NULL }
//  }

//  static const LibAVUtil.Option pipe_options[] = {
//      { "blocksize", "set I/O operation maximum block size", offsetof(FileContext, blocksize), AV_OPT_TYPE_INT, { .i64 = INT_MAX }, 1, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { NULL }
//  }

[CCode (cname="file_class", cheader_filename="")]
public class FileClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "file";
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
    //  .option = file_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="pipe_class", cheader_filename="")]
public class PipeClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "pipe";
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
    //  .option = pipe_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

#if CONFIG_FILE_PROTOCOL

[CCode (cname="ff_file_protocol", cheader_filename="")]
public class FileURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "file";
        }
    }

    [CCode (cname="file_open", cheader_filename="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="file_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="file_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="file_seek", cheader_filename="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );

    [CCode (cname="file_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="file_get_handle", cheader_filename="")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="file_check", cheader_filename="")]
    public override int url_check (
        URLContext url_context,
        int mask
    );

    [CCode (cname="file_delete", cheader_filename="")]
    public override int url_delete (
        URLContext url_context
    );

    [CCode (cname="file_move", cheader_filename="")]
    public override int url_move (
        URLContext h_src,
        URLContext h_dst
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FileContext);
        }
    }
    //  .priv_data_class = file_class,
    [CCode (cname="file_open_dir", cheader_filename="")]
    public override int url_open_dir (
        URLContext url_context
    );

    [CCode (cname="file_read_dir", cheader_filename="")]
    public override int url_read_dir (
        URLContext url_context,
        out AVIODirEntry next
    );

    [CCode (cname="file_close_dir", cheader_filename="")]
    public override int url_close_dir (
        URLContext url_context
    );
    //  .default_whitelist = "file,crypto";
}

#endif /* CONFIG_FILE_PROTOCOL */

#if CONFIG_PIPE_PROTOCOL

[CCode (cname="ff_pipe_protocol", cheader_filename="")]
public class PipeURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "pipe";
        }
    }

    [CCode (cname="pipe_open", cheader_filename="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="file_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="file_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="file_get_handle", cheader_filename="")]
    public override int url_get_file_handle (
        URLContext url_context
    );

    [CCode (cname="file_check", cheader_filename="")]
    public override int url_check (
        URLContext url_context,
        int mask
    );

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FileContext);
        }
    }
    //  .priv_data_class = pipe_class,
    //  .default_whitelist = "crypto";
}

#endif /* CONFIG_PIPE_PROTOCOL */

} // namespace LibAVFormat
