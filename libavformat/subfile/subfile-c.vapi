/*
 * Copyright (c) 2014 Nicolas George
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with FFmpeg; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#define OFFSET(field) offsetof(SubfileContext, field)
#define D AV_OPT_FLAG_DECODING_PARAM

static const AVOption subfile_options[] = {
    { "start", "start offset", OFFSET(start), AV_OPT_TYPE_INT64, {.i64 = 0}, 0, INT64_MAX, D },
    { "end",   "end offset",   OFFSET(end),   AV_OPT_TYPE_INT64, {.i64 = 0}, 0, INT64_MAX, D },
    { NULL }
};

#undef OFFSET
#undef D

static const AVClass subfile_class = {
    //  .class_name = "subfile",
    //  .item_name  = av_default_item_name,
    //  .option     = subfile_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

[CCode (cname="ff_subfile_protocol", cheader="")]
public class SubFileURLProtocol : URLProtocol {
    //  .name                = "subfile",
    [CCode (cname="", cheader="")]
    public override int url_open2 (
        URLContext h,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );           = subfile_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext h,
        uchar[] buf,
        int size
    );            = subfile_read,
    [CCode (cname="", cheader="")]
    public override int64 url_seek (
        URLContext h,
        int64 pos,
        int whence
    );            = subfile_seek,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext h
    );           = subfile_close,
    //  .priv_data_size      = sizeof(SubfileContext),
    //  .priv_data_class     = &subfile_class,
    //  .default_whitelist   = "file",
};
