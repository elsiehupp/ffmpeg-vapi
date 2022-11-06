/***********************************************************
 Apple HTTP Live Streaming Protocol Handler
 @copyright 2010 Martin Storsjo

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

/**
 @file
 Apple HTTP Live Streaming Protocol Handler
 http://tools.ietf.org/html/draft-pantos-http-live-streaming
***********************************************************/

[CCode (cname="ff_hls_protocol", cheader="")]
public class HLSURLProtocol : URLProtocol {
    //  .name           = "hls",
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext h,
        string url,
        int flags
    );       = hls_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext h,
        uchar[] buf,
        int size
    );       = hls_read,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext h
    );      = hls_close,
    //  .flags          = URL_PROTOCOL_FLAG_NESTED_SCHEME,
    //  .priv_data_size = sizeof(HLSContext),
}
