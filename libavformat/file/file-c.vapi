/***********************************************************
buffered file I/O
@copyright 2001 Fabrice Bellard
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

//  static const AVOption file_options[] = {
//      { "truncate", "truncate existing files on write", offsetof(FileContext, trunc), AV_OPT_TYPE_BOOL, { .i64 = 1 }, 0, 1, AV_OPT_FLAG_ENCODING_PARAM },
//      { "blocksize", "set I/O operation maximum block size", offsetof(FileContext, blocksize), AV_OPT_TYPE_INT, { .i64 = INT_MAX }, 1, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { "follow", "Follow a file as it is being written", offsetof(FileContext, follow), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, 1, AV_OPT_FLAG_DECODING_PARAM },
//      { "seekable", "Sets if the file is seekable", offsetof(FileContext, seekable), AV_OPT_TYPE_INT, { .i64 = -1 }, -1, 0, AV_OPT_FLAG_DECODING_PARAM | AV_OPT_FLAG_ENCODING_PARAM },
//      { NULL }
//  }

//  static const AVOption pipe_options[] = {
//      { "blocksize", "set I/O operation maximum block size", offsetof(FileContext, blocksize), AV_OPT_TYPE_INT, { .i64 = INT_MAX }, 1, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
//      { NULL }
//  }

[CCode (cname="file_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "file"
    //  .item_name = av_default_item_name,
    //  .option = file_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="pipe_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "pipe"
    //  .item_name = av_default_item_name,
    //  .option = pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

#if CONFIG_FILE_PROTOCOL

[CCode (cname="ff_file_protocol", cheader="")]
public class FileURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "file"
    [CCode (cname="file_open", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );
    [CCode (cname="file_read", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="file_write", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="file_seek", cheader="")]
    public override int64 url_seek (
        URLContext url_context,
        int64 pos,
        int whence
    );
    [CCode (cname="file_close", cheader="")]
    public override int url_close (
        URLContext url_context
    );
    [CCode (cname="file_get_handle", cheader="")]
    public override int url_get_file_handle (
        URLContext url_context
    );
    [CCode (cname="file_check", cheader="")]
    public override int url_check (
        URLContext url_context,
        int mask
    );
    [CCode (cname="file_delete", cheader="")]
    public override int url_delete (
        URLContext url_context
    );
    [CCode (cname="file_move", cheader="")]
    public override int url_move (
        URLContext h_src,
        URLContext h_dst
    );
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FileContext);
        }
    }
    //  .priv_data_class = file_class,
    [CCode (cname="file_open_dir", cheader="")]
    public override int url_open_dir (
        URLContext url_context
    );
    [CCode (cname="file_read_dir", cheader="")]
    public override int url_read_dir (
        URLContext url_context,
        out AVIODirEntry next
    );
    [CCode (cname="file_close_dir", cheader="")]
    public override int url_close_dir (
        URLContext url_context
    );
    //  .default_whitelist = "file,crypto"
}

#endif /* CONFIG_FILE_PROTOCOL */

#if CONFIG_PIPE_PROTOCOL

[CCode (cname="ff_pipe_protocol", cheader="")]
public class URLProtocol : URLProtocol ff_pipe_protocol = {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "pipe"
    [CCode (cname="pipe_open", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );
    [CCode (cname="file_read", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="file_write", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="file_get_handle", cheader="")]
    public override int url_get_file_handle (
        URLContext url_context
    );
    [CCode (cname="file_check", cheader="")]
    public override int url_check (
        URLContext url_context,
        int mask
    );
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FileContext);
        }
    }
    //  .priv_data_class = pipe_class,
    //  .default_whitelist = "crypto"
}

#endif /* CONFIG_PIPE_PROTOCOL */
