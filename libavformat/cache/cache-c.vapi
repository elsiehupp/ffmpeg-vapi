/*
 * Input cache protocol.
 * Copyright (c) 2011,2014 Michael Niedermayer
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 *
 * Based on file.c by Fabrice Bellard
 */

/**
 * @TODO
 *      support keeping files
 *      support filling with a background thread
 */

#define OFFSET(x) offsetof(Context, x)
#define D AV_OPT_FLAG_DECODING_PARAM

static const AVOption options[] = {
    { "read_ahead_limit", "Amount in bytes that may be read ahead when seeking isn't supported, -1 for unlimited", OFFSET(read_ahead_limit), AV_OPT_TYPE_INT, { .i64 = 65536 }, -1, INT_MAX, D },
    {NULL},
};

static const AVClass cache_context_class = {
    //  .class_name = "Cache",
    //  .item_name  = av_default_item_name,
    //  .option     = options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

[CCode (cname="ff_cache_protocol", cheader="")]
public class CacheURLProtocol : URLProtocol {
    //  .name                = "cache",
    [CCode (cname="", cheader="")]
    public override int url_open2 (
        URLContext h,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );           = cache_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext h,
        uchar[] buf,
        int size
    );            = cache_read,
    [CCode (cname="", cheader="")]
    public override int64 url_seek (
        URLContext h,
        int64 pos,
        int whence
    );            = cache_seek,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext h
    );           = cache_close,
    //  .priv_data_size      = sizeof(Context),
    //  .priv_data_class     = &cache_context_class,
};
