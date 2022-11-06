/*
 * Tee output protocol
 * Copyright (c) 2016 Michael Niedermayer
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
 */

static const AVOption tee_options[] = {
    { NULL }
};

static const AVClass tee_class = {
    //  .class_name = "tee",
    //  .item_name  = av_default_item_name,
    //  .option     = tee_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

const URLProtocol ff_tee_protocol = {
    //  .name                = "tee",
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext h,
        string url,
        int flags
    );            = tee_open,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext h,
        uchar[] buf,
        int size
    );           = tee_write,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext h
    );           = tee_close,
    //  .priv_data_size      = sizeof(TeeContext),
    //  .priv_data_class     = &tee_class,
    //  .default_whitelist   = "crypto,file,http,https,httpproxy,rtmp,tcp,tls"
};
