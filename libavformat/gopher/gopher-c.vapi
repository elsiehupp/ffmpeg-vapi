/*
 * Gopher protocol
 *
 * Copyright (c) 2009 Toshimitsu Kimura
 *
 * based on libavformat/http.c, Copyright (c) 2000, 2001 Fabrice Bellard
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

[CCode (cname="ff_gopher_protocol", cheader="")]
public class GopherURLProtocol : URLProtocol {
    //  .name           = "gopher",
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext h,
        string url,
        int flags
    );       = gopher_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext h,
        uchar[] buf,
        int size
    );       = gopher_read,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext h,
        uchar[] buf,
        int size
    );      = gopher_write,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext h
    );      = gopher_close,
    //  .priv_data_size = sizeof(GopherContext),
    //  .flags          = URL_PROTOCOL_FLAG_NETWORK,
};
