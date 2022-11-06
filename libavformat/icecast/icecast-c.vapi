/*
 * Icecast protocol for FFmpeg
 * Copyright (c) 2014 Marvin Scholz
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

static const AVClass icecast_context_class = {
    //  .class_name     = "icecast",
    //  .item_name      = av_default_item_name,
    //  .option         = options,
    //  .version        = LIBAVUTIL_VERSION_INT,
};

const URLProtocol ff_icecast_protocol = {
    //  .name            = "icecast",
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext h,
        string url,
        int flags
    );        = icecast_open,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext h,
        uchar[] buf,
        int size
    );       = icecast_write,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext h
    );       = icecast_close,
    //  .priv_data_size  = sizeof(IcecastContext),
    //  .priv_data_class = &icecast_context_class,
    //  .flags           = URL_PROTOCOL_FLAG_NETWORK,
};
