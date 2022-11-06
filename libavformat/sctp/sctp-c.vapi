/*
 * SCTP protocol
 * Copyright (c) 2012 Luca Barbato
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

/**
 * @file
 *
 * sctp url_protocol
 *
 * url syntax: sctp://host:port[?option=val...]
 * option: 'listen'        : listen for an incoming connection
 *         'max_streams=n' : set the maximum number of streams
 *         'reuse=1'       : enable reusing the socket [TBD]
 *
 * by setting the maximum number of streams the protocol will use the
 * first two bytes of the incoming/outgoing buffer to store the
 * stream number of the packet being read/written.
 * @see sctp_read
 * @see sctp_write
 */

const URLProtocol ff_sctp_protocol = {
    //  .name                = "sctp",
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext h,
        string url,
        int flags
    );            = sctp_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext h,
        uchar[] buf,
        int size
    );            = sctp_read,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext h,
        uchar[] buf,
        int size
    );           = sctp_write,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext h
    );           = sctp_close,
    [CCode (cname="", cheader="")]
    public override int url_get_file_handle (
        URLContext h
    ); = sctp_get_file_handle,
    //  .priv_data_size      = sizeof(SCTPContext),
    //  .flags               = URL_PROTOCOL_FLAG_NETWORK,
    //  .priv_data_class     = &sctp_class,
};
